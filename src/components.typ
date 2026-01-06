// components.typ
#import "layout.typ": config

// --- Utility Functions ---

// Horizontal Rule
#let hrule = line(length: 100%, stroke: 0.75pt)

// --- Component Exports ---

// Header Block
#let header_block(name: "", contacts: ()) = {
  set align(left)

  // Name
  block(below: 2pt, text(size: 24pt, weight: "bold", name))

  set text(size: config.base_size, weight: "regular")

  // Contacts
  // Separator: ' ❖ '
  let separator = " " + str(sym.diamond.filled) + " "
  let contact_text = contacts.join(separator)

  block(below: 0pt, contact_text)
}


// Section Header
#let section_header(title, extra: none) = {
  // Spacing before section: 1.5x line height (1.5 * 14.4pt = 21.6pt)
  v(12pt) // Tuned down from 21.6pt based on visual density

  set align(left)

  // Title
  block(below: 2pt, {
    text(weight: "bold", upper(title))
    if extra != none {
      text(weight: "bold", " " + extra)
    }
  })

  hrule

  // Margin between line and content: 0.3x line height (4.32pt)
  v(4.32pt)
}

// Entry Block
#let entry_block(
  headingLeft: "",
  headingRight: "",
  subheadingLeft: none,
  subheadingRight: none,
  bullets: none,
) = {
  // Spacing between entries: 0.8x line height = 11.52pt
  block(below: 11.52pt, breakable: true, {
    // Header Grid (combined for alignment and spacing)
    let cells = (
      align(left, text(weight: "bold", headingLeft)),
      align(right, text(weight: "bold", headingRight)),
    )

    if subheadingLeft != none or subheadingRight != none {
      cells.push(align(left, text(style: "italic", subheadingLeft)))
      cells.push(align(right, text(style: "italic", subheadingRight)))
    }

    grid(
      columns: (1fr, auto),
      row-gutter: config.leading, // Use global vertical rhythm
      ..cells
    )

    // Bullets (Optional)
    if bullets != none {
      // Intentionally tight spacing for refined "dense" look
      list(
        marker: box(fill: black, width: 3.5pt, height: 3.5pt, radius: 0pt, baseline: 20%),
        body-indent: 0.5em,
        indent: 0em,
        ..bullets,
      )
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
