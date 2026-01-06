#import "lib.typ": entry_block, header_block, key_value_grid, resume, section_header, simple_grid

#show: resume

#header_block(
  name: "ALEXANDER HAMILTON",
  contacts: (
    "alexander.hamilton@example.com",
    "(555) 123-4567",
    "github.com/ahamilton",
    "New York, NY",
  ),
)

#section_header("Education")

#entry_block(
  headingLeft: "King's College (Columbia University)",
  headingRight: "New York, NY",
  subheadingLeft: "Bachelor of Arts",
  subheadingRight: "1774",
  bullets: (
    "Studied mathematics, government, and classics.",
    "Founded a volunteer military company called the 'Corsicans'.",
  ),
)

#section_header("Experience")

#entry_block(
  headingLeft: "United States Department of the Treasury",
  headingRight: "Philadelphia, PA",
  subheadingLeft: "Secretary of the Treasury",
  subheadingRight: "1789 – 1795",
  bullets: (
    "Established the First Bank of the United States.",
    "Authored the Reports on Public Credit.",
    "Advocated for a strong central government and industrial economy.",
  ),
)

#entry_block(
  headingLeft: "Continental Army",
  headingRight: "Various Locations",
  subheadingLeft: "Lieutenant Colonel / Aide-de-Camp",
  subheadingRight: "1777 – 1781",
  bullets: (
    "Served as chief staff aide to General George Washington.",
    "Drafted critical correspondence and managed headquarters operations.",
    "Commanded an infantry battalion at the Battle of Yorktown.",
  ),
)

#section_header("Skills")

#key_value_grid(
  items: (
    (key: "Languages", value: "English, French"),
    (key: "Government", value: "Federalism, Constitutional Law, Public Finance"),
    (key: "Writing", value: "The Federalist Papers, Official Reports, Correspondence"),
    (key: "Military", value: "Strategy, Logistics, Artillery Command"),
  ),
  columns: 2,
)

#section_header("Certifications")

#simple_grid(
  items: (
    "Admitted to the Bar (New York)",
    "Honorary Degree from Dartmouth College",
    "Member of the American Philosophical Society",
  ),
  columns: 2,
)
