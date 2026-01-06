This specification document defines the visual structure, typography, and layout logic for the "Carnegie Classic" resume template. This guide is intended for implementation in any typesetting system (LaTeX, HTML/CSS, Microsoft Word, InDesign, etc.).

---

### 1. Global Layout & Geometry

* **Page Size:** US Letter (8.5" x 11") or A4.
* **Margins:**
* Top/Bottom: 0.5".
* Left/Right: 0.5".
* *Note:* The design prioritizes information density; whitespace is functional, not decorative.

* **Grid:** Single-column primary layout.
* **Alignment:**
* Headers: Centered.
* Section Titles: Left-aligned.
* Body Content: Left-aligned.
* Metadata (Dates/Locations): Right-aligned.


### 2. Typography Strategy

* **Font Family:** Traditional Serif (Examples: Times New Roman, Garamond, Cambria, or LaTeX Computer Modern).
* **Base Font Size:** 11pt.
* **Line Height (Leading):** Tight (1.2).
* **Visual Hierarchy:**
1. **Name:** Largest size (~24pt), Bold.
2. **Section Headers:** Base size, Bold.
3. **Organization Names:** Base size, Bold.
4. **Roles/Degrees:** Base size, Italic.
5. **Body Text:** Base size, Regular weight.


### 3. Component Specifications

#### A. The Header Block

* **Name Element:**
* Text: Full Name (Optionally with "Nickname" in quotes).
* Style: Bold, Serif.
* Spacing: Bottom padding ~4pt.


* **Contact Info Element:**
* Layout: Single line (wrapping only if necessary).
* Separator: A filled diamond glyph (`❖` or `♦`) surrounded by spaces.
* Content flow: Email `♦` Phone `♦` GitHub/Portfolio `♦` LinkedIn `♦` Location.
* Style: Base font size, Regular weight.



#### B. The Section Divider

* **Structure:**
1. **Title:** Uppercase, Bold, Left-aligned.
2. **Rule:** A solid horizontal line immediately below the title text.


* **Stroke Weight:** Fine/Hairline (0.5pt to 1px).
* **Width:** 100% of the text block.
* **Spacing:** Small margin before the title; minimal margin between title and line; small margin between line and content.

#### C. The Experience/Education Entry (The "Quad" Block)

This component uses a "four-corner" alignment strategy to maximize space.

* **Row 1 (Primary Info):**
* **Left Anchor:** Organization/School Name.
* *Style:* **Bold**.


* **Right Anchor:** Date Range (e.g., "May 2025 – July 2025").
* *Style:* **Bold**.
* *Alignment:* Right-justified against the margin.




* **Row 2 (Secondary Info):**
* **Left Anchor:** Job Title / Degree Name.
* *Style:* *Italic*.


* **Right Anchor:** Location (City, State).
* *Style:* *Italic*.
* *Alignment:* Right-justified against the margin.




* **Row 3 (Content):**
* **List Style:** Bulleted list.
* **Bullet Character:** Small square (`▪`) or standard disk (`•`). The image uses a small square style.
* **Indentation:** Hanging indent. Bullets align flush with the left text margin or slightly indented; text wraps cleanly.



#### D. The Skills/Certifications Block

This section differs from the standard narrative block. It utilizes a labeled list format or a 2-column invisible grid.

* **Format:** Key-Value Pair.
* **Key (Category):**
* Example: "Programming", "Cloud", "IT & Cybersecurity".
* Style: **Bold**.


* **Value (List):**
* Example: "Python, R, JS, C#..."
* Style: Regular.


* **Layout:**
* If items are short: Display as 2 columns (Left column categories aligned left; Right column categories aligned to center-point).
* If items are long: Display as stacked single lines.



### 4. Spacing Logic (Vertical Rhythm)

To achieve the "Elegant/Dense" look, use the following relative spacing units:

| Element Relationship | Spacing |
| --- | --- |
| Between Header and First Section | 2.0x Line Height |
| Between Section Title and Horizontal Rule | 0.2x Line Height |
| Between Horizontal Rule and Section Content | 0.5x Line Height |
| Between Experience Entries | 1.0x Line Height |
| Between Bullet Points | 0.0x to 0.2x (Minimal extra padding) |
| Between Sections | 1.5x Line Height |

### 5. Special Elements

* **Hyperlinks:** Text should appear standard (black) but function as links. No blue text or underlines to maintain the print-ready aesthetic.
* **Sub-text in Headers:** (Seen in "WORK EXPERIENCE" section).
* Text inside parentheses next to the Section Header (e.g., "TS/SCI with CI Poly...").
* Style: Mixed case, bold (inherits header weight), or slightly lighter depending on preference.