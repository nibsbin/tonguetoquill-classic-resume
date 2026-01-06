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
  block(text(size: 24pt, weight: "bold", name))

  set text(size: config.base_size, weight: "regular")

  // Contacts
  // Separator: ' ❖ '
  let separator = " " + str(sym.diamond.filled) + " "
  let contact_text = contacts.join(separator)

  block(contact_text)
}


// Section Header
#let section_header(title, extra: none) = {
  v(5pt)
  set align(left)

  // Title
  block({
    text(weight: "bold", upper(title))
    if extra != none {
      text(weight: "bold", " " + extra)
    }
  })

  hrule
}

// Entry Block
#let entry_block(
  headingLeft: "",
  headingRight: "",
  subheadingLeft: none,
  subheadingRight: none,
  bullets: none,
) = {
  block(breakable: true, {
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
    row-gutter: config.leading,
    column-gutter: 1em,
    ..items.map(cell)
  )
}

// Simple Grid (Certifications)
#let simple_grid(items: (), columns: 2) = {
  grid(
    columns: (1fr,) * columns,
    row-gutter: config.leading,
    column-gutter: 1em,
    ..items // items are just content/strings
  )
}
