// layout.typ

// --- Configurations ---
#let config = (
  font: ("Times New Roman", "Libertinus Serif"), // Fallback to Libertinus if Times isn't available
  base_size: 12pt,
  leading: 0.35em, // Global spacing value (vertical rhythm)
  margin: 0.5in,
)

// --- Resume Show Rule (Global Setup) ---
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
    leading: config.leading,
    justify: false,
    spacing: config.leading, // Space between paragraphs
  )

  // Enforce global block spacing for vertical rhythm
  set block(above: config.leading, below: config.leading)
  set list(spacing: config.leading)

  // Hyperlinks should be standard black text
  show link: set text(fill: black)

  content
}
