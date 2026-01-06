// layout.typ

// --- Configurations ---
#let config = (
  font: ("Times New Roman", "Liberation Serif"), // Fallback to Liberation if Times isn't available
  base_size: 12pt,
  line_height: 1.2em,
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
    leading: 0.2em, // 1em + 0.2em = 1.2em line height approx is standard logic
    justify: false,
  )

  // Disable default paragraph spacing to control it manually as per "dense" specs
  set par(spacing: 0pt)
  set block(above: 0pt, below: 0pt)
  set list(spacing: 0pt)

  content
}
