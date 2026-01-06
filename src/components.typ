// components.typ
#import "layout.typ": config, vgap

// --- Utility Functions ---

// Horizontal Rule
#let hrule = line(length: 100%, stroke: 0.75pt)

// --- Component Exports ---

// Header Block
#let header_block(name: "", contacts: ()) = {
  set align(left)

  // Name
  block(text(size: 18pt, weight: "bold", name))

  set text(size: config.base_size, weight: "regular")

  // Contacts
  // Separator: ' ❖ '
  let separator = " " + "❖" + " "
  let contact_text = contacts.join(separator)

  vgap(config.entry_spacing)
  block(contact_text)
  vgap(config.entry_spacing)
}


// Section Header
#let section_header(title, extra: none) = {
  vgap(config.section_spacing)
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
  vgap(config.entry_spacing)
  block(breakable: false, {
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
        marker: box(fill: black, width: 3.5pt, height: 3.5pt, radius: 0pt, baseline: .5em),
        body-indent: 0.8em,
        indent: 0em,
        ..bullets,
      )
    }
  })
}

// Key-Value Grid (Skills)
#let key_value_grid(items: (), columns: 2) = {
  vgap(config.entry_spacing)
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
    row-gutter: config.leading + config.entry_spacing,
    column-gutter: 1em,
    ..items.map(cell)
  )
}

// Simple Grid (Certifications)
#let simple_grid(items: (), columns: 2) = {
  vgap(config.entry_spacing)
  grid(
    columns: (1fr,) * columns,
    row-gutter: config.leading,
    column-gutter: 1em,
    ..items // items are just content/strings
  )
}

// Project Entry (PROJECTS section)
#let project_entry(
  name: "",
  url: none,
  bullets: none,
) = {
  vgap(config.entry_spacing)
  block(breakable: false, {
    // Header Grid
    grid(
      columns: (1fr, auto),
      row-gutter: config.leading,
      align(left, text(weight: "bold", name)),
      align(right, {
        if url != none {
          // Only hyperlink if it looks like a URL
          if url.starts-with("http") {
            text(size: 8pt, font: "Courier New", link(url)[#url])
          } else {
            text(size: 8pt, font: "Courier New", url)
          }
        }
      }),
    )

    // Bullets (Optional)
    if bullets != none {
      list(
        marker: box(fill: black, width: 3.5pt, height: 3.5pt, radius: 0pt, baseline: .5em),
        body-indent: 0.8em,
        indent: 0em,
        ..bullets,
      )
    }
  })
}
