# Proposal: Typst ttq-classic-resume Grid Consolidation

## Summary

Consolidate `category_grid` and `item_grid` into a unified `grid` component that renders structured content based on input shape, supporting the new BODY-centric card design.

---

## Current State

### Existing Components

```typst
// Category Grid - for key/value pairs (skills)
#let category_grid(items: (), columns: 2)
// items: ((key: "Programming", value: "Python, R"), ...)

// Item Grid - for flat lists (certifications)
#let item_grid(items: (), columns: 2)
// items: ("OSCP", "GCTI", ...)
```

### Problems

1. **Redundant APIs** - Both components do grid layout with minor rendering differences
2. **Rigid input shape** - `category_grid` expects exactly `(key, value)` tuples
3. **No content passthrough** - Cannot accept native Typst content from BODY
4. **Caller decides** - plate.typ must choose which component to call

---

## Proposed Design

### Option A: Unified `grid` with Structured Input

A single component that accepts pre-parsed items from the Quillmark engine.

```typst
#let grid(
  items: (),
  columns: 2,
  style: "auto",  // "auto" | "categorized" | "flat"
) = {
  // Detect style from item shape if "auto"
  let resolved_style = if style == "auto" {
    if items.len() > 0 and type(items.at(0)) == dictionary {
      "categorized"
    } else {
      "flat"
    }
  } else {
    style
  }

  vgap(config.entry_spacing)

  let render_cell(item) = {
    if resolved_style == "categorized" {
      block({
        text(weight: "bold", item.key)
        linebreak()
        item.value
      })
    } else {
      item
    }
  }

  grid(
    columns: (1fr,) * columns,
    row-gutter: if resolved_style == "categorized" {
      config.leading + config.entry_spacing
    } else {
      config.leading
    },
    column-gutter: 1em,
    ..items.map(render_cell)
  )
}
```

**Usage from plate.typ:**

```typst
// Quillmark provides _grid_items based on BODY parsing
#grid(
  items: {{ card._grid_items | GridItems }},
  columns: {{ card.columns | Int | default: 2 }},
)
```

**Pros:**
- Single API surface
- Auto-detection reduces plate.typ complexity
- Backwards compatible via explicit `style` parameter

**Cons:**
- Requires Quillmark to pre-parse BODY into `_grid_items`
- Magic auto-detection could surprise users

---

### Option B: Markdown Structure as Semantic Signal

Use **bullet nesting depth** in the BODY to signal grid type. Quillmark preserves full nested structure for Typst-side rendering control.

#### User Authoring

**Categorized Grid (nested bullets):**
```markdown
- Programming
  - Python
  - R
  - SQL
- Cloud
  - AWS
  - Azure
```

**Flat Grid (single-level bullets):**
```markdown
- OSCP
- GCTI
- Security+
```

#### Quillmark Output Structure

**For categorized grid:**
```typst
items: (
  (
    key: [Programming],
    value: ([Python], [R], [SQL])
  ),
  (
    key: [Cloud],
    value: ([AWS], [Azure])
  ),
)
```

**For flat grid:**
```typst
items: ([OSCP], [GCTI], [Security+])
```

#### Detection Logic

```rust
// Pseudocode for GridItems filter
if list.any(item => item.has_children()) {
    // Categorized grid
    items = list.map(item => {
        key: render_content(item.text),
        value: item.children.map(child => render_content(child))
    })
} else {
    // Flat grid  
    items = list.map(item => render_content(item))
}
```

#### Typst Component

```typst
#let grid(items: (), columns: 2) = {
  let is_categorized = (
    items.len() > 0 and 
    type(items.at(0)) == dictionary
  )
  
  let render_cell(item) = {
    if is_categorized {
      block({
        text(weight: "bold", item.key)
        linebreak()
        // Typst decides how to join the value array
        item.value.join(", ")
      })
    } else {
      item
    }
  }
  
  grid(
    columns: (1fr,) * columns,
    ..items.map(render_cell)
  )
}
```

**Pros:**
- ✅ Pure markdown structure drives behavior
- ✅ No frontmatter flags needed
- ✅ Full content preserved (Typst controls rendering)
- ✅ Natural authoring experience
- ✅ One syntax for both grid types

**Cons:**
- Requires Quillmark to parse list depth
- Users must understand 2-level max nesting

---

### Option C: Keep Separate Components, Modernize APIs

Retain `category_grid` and `item_grid` but improve their flexibility.

```typst
// Enhanced category_grid - variable item count, optional values
#let category_grid(
  items: (),
  columns: 2,
  show_keys: true,
) = {
  vgap(config.entry_spacing)

  let cell(item) = {
    block({
      if show_keys and "key" in item {
        text(weight: "bold", item.key)
        linebreak()
      }
      if "value" in item {
        item.value
      } else if "content" in item {
        item.content
      }
    })
  }

  grid(
    columns: (1fr,) * columns,
    row-gutter: config.leading + config.entry_spacing,
    column-gutter: 1em,
    ..items.map(cell)
  )
}

// Enhanced item_grid - accepts content or strings
#let item_grid(
  items: (),
  columns: 2,
  bullet: none,  // Optional bullet prefix
) = {
  vgap(config.entry_spacing)

  let cell(item) = {
    if bullet != none {
      [#bullet #item]
    } else {
      item
    }
  }

  grid(
    columns: (1fr,) * columns,
    row-gutter: config.leading,
    column-gutter: 1em,
    ..items.map(cell)
  )
}
```

**Pros:**
- Explicit, no magic
- Easier to understand and debug
- plate.typ logic remains clear

**Cons:**
- Two components to maintain
- plate.typ still needs conditional logic

---

## Recommendation

**Option B (Markdown Structure)** with bullet nesting as the semantic signal.

This approach gives us:

1. **Content-driven design** - The markdown structure IS the config
2. **No ambiguity** - Nesting depth unambiguously signals grid type
3. **Maximum flexibility** - Typst gets full structure to render as needed
4. **Simple plate.typ** - No conditional logic, just pass through items
5. **Natural authoring** - Users think in bullet lists, not frontmatter flags

The Quillmark `GridItems` filter handles all the parsing complexity, outputting either:
- `((key: content, value: (content, ...)), ...)` for categorized
- `(content, content, ...)` for flat

Typst auto-detects based on item shape and renders appropriately.


---

## Implementation Changes

### File: `src/components.typ`

```typst
// --- Grid Components ---

// Unified grid for categorized and flat content
// Input from Quillmark GridItems filter determines structure:
//   Categorized: ((key: content, value: (content, ...)), ...)
//   Flat: (content, content, ...)
#let grid(
  items: (),
  columns: 2,
) = {
  if items.len() == 0 { return }

  // Auto-detect from item shape
  let is_categorized = (
    type(items.at(0)) == dictionary and 
    "key" in items.at(0)
  )

  vgap(config.entry_spacing)

  let render_cell(item) = {
    if is_categorized {
      block({
        text(weight: "bold", item.key)
        linebreak()
        // Join nested content array
        // User controls separator via markdown authoring
        item.value.join(", ")
      })
    } else {
      item
    }
  }

  grid(
    columns: (1fr,) * columns,
    row-gutter: if is_categorized {
      config.leading + config.entry_spacing
    } else {
      config.leading
    },
    column-gutter: 1em,
    ..items.map(render_cell)
  )
}

// Deprecation shims (remove in next major version)
#let category_grid(items: (), columns: 2) = {
  // Convert old API to new structure
  let new_items = items.map(it => (
    key: it.key,
    value: (it.value,)  // Wrap in array
  ))
  grid(items: new_items, columns: columns)
}

#let item_grid(items: (), columns: 2) = {
  grid(items: items, columns: columns)
}
```

### File: `plate.typ` (Quill Template)

```typst
// Simple passthrough - Quillmark handles all parsing
#grid(
  items: {{ card._grid_items | GridItems }},
  columns: {{ card.columns | Int | default: 2 }},
)
```

### Quillmark GridItems Filter (Pseudocode)

```rust
// In crates/backends/typst/src/filters.rs

fn grid_items_filter(body: &Content) -> Result<String> {
    let list = extract_list(body)?;
    
    // Check if any item has nested children
    let has_nesting = list.items.iter().any(|item| !item.children.is_empty());
    
    if has_nesting {
        // Categorized grid
        let items = list.items.iter().map(|item| {
            let key = render_typst_content(&item.content);
            let values = item.children.iter()
                .map(|child| render_typst_content(&child.content))
                .collect::<Vec<_>>();
            format!("(key: {}, value: ({}))", key, values.join(", "))
        }).collect::<Vec<_>>();
        
        Ok(format!("({})", items.join(", ")))
    } else {
        // Flat grid
        let items = list.items.iter()
            .map(|item| render_typst_content(&item.content))
            .collect::<Vec<_>>();
        
        Ok(format!("({})", items.join(", ")))
    }
}
```


### File: `src/lib.typ`

```typst
#import "components.typ": (
  resume_header,
  section_header,
  timeline_entry,
  project_entry,
  grid,
  // Deprecated but exported for backwards compatibility
  category_grid,
  item_grid,
)
```

---

## Migration Path

1. **v0.1.x** - Add `grid`, keep `category_grid`/`item_grid` as shims
2. **v0.2.0** - Deprecation warnings in documentation
3. **v0.3.0** - Remove shims, `grid` only

---

## Testing Checklist

- [ ] `grid` with categorized items renders correctly
- [ ] `grid` with flat items renders correctly
- [ ] `style: "auto"` correctly detects item shape
- [ ] Empty items array renders nothing (no crash)
- [ ] Columns parameter works for 1, 2, 3, 4 column layouts
- [ ] Deprecation shims produce identical output to new component
- [ ] Rich content (links, emphasis) renders in values

---

## Open Questions

1. **Should `style` support additional values?** e.g., `"compact"` for tighter spacing
2. **Should we support mixed items?** (some categorized, some flat in same grid)
3. **Column responsiveness?** Should columns auto-adjust based on content width?
