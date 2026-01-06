// components.typ
#import "layout.typ": config

// --- Utility Functions ---

// Horizontal Rule
#let hrule = line(length: 100%, stroke: 0.5pt)

// --- Component Exports ---

// Header Block
#let header_block(name: "", contacts: ()) = {
  set align(left)
  set text(size: 24pt, weight: "bold")

  // Name
  block(below: 5pt, name)

  set text(size: config.base_size, weight: "regular")

  // Contacts
  // Separator: ' ❖ '
  let separator = " ❖ "
  let contact_text = contacts.join(separator)

  block(below: 5pt, contact_text) // 1.5x line height (approx 18pt) below header
}


// Section Header
#let section_header(title) = {
  // "Significant gap before the title" -> specs say 1.2x line height between sections.
  // We'll handle 'between sections' spacing via the user placing standard breaks or blocks,
  // but a section header itself should enforce some top/bottom spacing.

  // 1.2x line height ~= 14.4pt.
  v(5pt)

  set align(left)
  set text(weight: "bold")
  upper(title)

  v(5pt) // "minimal margin between title and line" (~0.1x line height ~= 1.2pt)

  hrule

  v(5pt) // "small margin between line and content" (~0.3x line height ~= 3.6pt)
}

// Entry Block
#let entry_block(
  headingLeft: "",
  headingRight: "",
  subheadingLeft: none,
  subheadingRight: none,
  bullets: none,
) = {
  // Spacing between entries: 0.8x line height ~= 9.6pt
  block(below: 5pt, breakable: true, {
    // Row 1
    grid(
      columns: (1fr, auto),
      align(left, text(weight: "bold", headingLeft)), align(right, text(weight: "bold", headingRight)),
    )

    // Row 2 (Optional)
    if subheadingLeft != none or subheadingRight != none {
      grid(
        columns: (1fr, auto),
        align(left, text(style: "italic", subheadingLeft)), align(right, text(style: "italic", subheadingRight)),
      )
    }

    // Bullets (Optional)
    if bullets != none {
      for item in bullets {
        // Custom bullet styling
        // "Small square" -> specs say '▪' (U+25AA)
        // Indentation: Hanging indent. Typst 'list' does this well.
        // Spacing between bullets: 0.0x
        list(marker: [▪], body-indent: 0.5em, item)
      }
    }
  })
}

// Key-Value Grid (Skills)
#let key_value_grid(items: (), columns: 2) = {
  // items is array of (key: "...", value: "...") dictionary

  let cell(item) = {
    block({
      text(weight: "bold", item.key)
      linebreak()
      item.value
    })
  }

  grid(
    columns: (1fr,) * columns,
    row-gutter: 5pt,
    column-gutter: 1em,
    ..items.map(cell)
  )
}

// Simple Grid (Certifications)
#let simple_grid(items: (), columns: 2) = {
  grid(
    columns: (1fr,) * columns,
    row-gutter: 5pt,
    column-gutter: 1em,
    ..items // items are just content/strings
  )
}
