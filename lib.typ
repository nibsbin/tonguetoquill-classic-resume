// lib.typ
// "Carnegie Classic" Resume Template Logic

// --- Configurations ---
#let config = (
  font: ("Times New Roman", "Liberation Serif"), // Fallback to Liberation if Times isn't available
  base_size: 12pt,
  line_height: 1.2em,
  margin: 0.5in,
)

// --- Utility Functions ---

// Horizontal Rule
#let hrule = line(length: 100%, stroke: 0.5pt)

// --- Component Exports ---

// 1. Resume Show Rule (Global Setup)
#let resume(content) = {
  set page(
    paper: "us-letter",
    margin: config.margin,
  )

  set text(
    font: config.font,
    size: config.base_size,
  )

  set par(
    leading: 0.2em, // 1em + 0.2em = 1.2em line height approx is standard logic, but let's stick to simple first.
    justify: false,
  )

  // Disable default paragraph spacing to control it manually as per "dense" specs
  set par(spacing: 0.5em)

  content
}

// 2. Header Block
#let header_block(name: "", contacts: ()) = {
  set align(left)
  set text(size: 24pt, weight: "bold")

  // Name
  block(below: 2pt, name)

  set text(size: config.base_size, weight: "regular")

  // Contacts
  // Separator: ' ❖ '
  let separator = " ❖ "
  let contact_text = contacts.join(separator)

  block(below: 18pt, contact_text) // 1.5x line height (approx 18pt) below header
}


// 3. Section Header
#let section_header(title) = {
  // "Significant gap before the title" -> specs say 1.2x line height between sections.
  // We'll handle 'between sections' spacing via the user placing standard breaks or blocks,
  // but a section header itself should enforce some top/bottom spacing.

  // 1.2x line height ~= 14.4pt.
  v(14.4pt)

  set align(left)
  set text(weight: "bold")
  upper(title)

  v(2pt) // "minimal margin between title and line" (~0.1x line height ~= 1.2pt)

  hrule

  v(4pt) // "small margin between line and content" (~0.3x line height ~= 3.6pt)
}

// 4. Entry Block
#let entry_block(
  headingLeft: "",
  headingRight: "",
  subheadingLeft: none,
  subheadingRight: none,
  bullets: none,
) = {
  // Spacing between entries: 0.8x line height ~= 9.6pt
  block(below: 9.6pt, breakable: true, {
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

// 5. Key-Value Grid (Skills)
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
    row-gutter: 1em,
    column-gutter: 1em,
    ..items.map(cell)
  )
}

// 6. Simple Grid (Certifications)
#let simple_grid(items: (), columns: 2) = {
  grid(
    columns: (1fr,) * columns,
    row-gutter: 0.5em,
    column-gutter: 1em,
    ..items // items are just content/strings
  )
}
