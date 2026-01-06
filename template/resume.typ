#import "@preview/ttq-classic-resume:1.0.0": (
  entry_block, header_block, key_value_grid, project_entry, resume, section_header, simple_grid,
)

#show: resume

#header_block(
  name: "John Doe",
  contacts: (
    "john.doe@example.com",
    "(555) 123-4567",
    "github.com/johndoe",
    "linkedin.com/in/johndoe",
    "Pittsburgh, PA",
  ),
)

#section_header("Active Certifications")

#simple_grid(
  items: (
    "Offensive Security Certified Professional (OSCP)",
    "GIAC Cyber Threat Intelligence (GCTI)",
    "CompTIA CASP+, CySA+, Sec+, Net+, A+, Proj+",
    "GIAC Machine Learning Engineer (GMLE)",
  ),
  columns: 2,
)

#section_header("Skills")

#key_value_grid(
  items: (
    (key: "Programming", value: "Python, R, JS, C#, Rust, PowerShell, CI/CD"),
    (key: "Data Science", value: "ML/statistics, TensorFlow, AI Engineering"),
    (key: "IT & Cybersecurity", value: "AD DS, Splunk, Metasploit, Wireshark, Nessus"),
    (key: "Cloud", value: "AWS EC2/S3, Helm, Docker, Serverless"),
  ),
  columns: 2,
)

#section_header("Work Experience")

#entry_block(
  headingLeft: "Templar Archives Research Division",
  headingRight: "August 2024 – Present",
  subheadingLeft: "Psionic Research Analyst",
  subheadingRight: "Aiur",
  bullets: (
    "Analyzed Khala disruption patterns following Amon's corruption, developing countermeasures to protect remaining neural link infrastructure.",
    "Building automated threat detection pipelines using Khaydarin crystal arrays to monitor Void energy signatures across the sector.",
  ),
)

#entry_block(
  headingLeft: "Terran Dominion Ghost Academy",
  headingRight: "May 2025 – July 2025",
  subheadingLeft: "Covert Ops Trainee",
  subheadingRight: "Tarsonis (Remote)",
  bullets: (
    "Developed tactical HUD displays for Ghost operatives integrating real-time Zerg hive cluster intelligence.",
    "Created automated target acquisition systems for nuclear launch protocols; involved cloaking field calibration and EMP targeting.",
    "Discovered (and reported) a critical vulnerability in Adjutant defense networks exploitable by Zerg Infestors.",
  ),
)

#entry_block(
  headingLeft: "Abathur's Evolution Pit",
  headingRight: "June 2023 – July 2023",
  subheadingLeft: "Biomass Research Intern",
  subheadingRight: "Char",
  bullets: (
    "Developed tracking algorithms for Overlord surveillance networks; supported pattern-of-life analysis for Terran outpost elimination.",
    "Prototyped a creep tumor optimization tool featuring swarm pathfinding, resource node mapping, and hatchery placement recommendations.",
  ),
)

#entry_block(
  headingLeft: "Raynor's Raiders",
  headingRight: "January 2018 – June 2020",
  subheadingLeft: "Combat Engineer",
  subheadingRight: "Mar Sara",
  bullets: (
    "Administered Hyperion shipboard systems, SCV maintenance protocols, and bunker defense automation for 30,000+ colonists.",
    "Developed siege tank targeting scripts, delivered Zerg threat briefs, and integrated supply depot optimization procedures.",
    "Achieved Distinguished Graduate honors at the Mar Sara Militia Academy.",
    "Awarded the Raynor's Star and Mar Sara Defense Medal for meritorious service against the Swarm.",
  ),
)

#section_header("Education")

#entry_block(
  headingLeft: "Carnegie Mellon University",
  headingRight: "December 2025",
  subheadingLeft: "Master of Information Technology Strategy",
  subheadingRight: "Pittsburgh, PA",
  bullets: (),
)

#entry_block(
  headingLeft: "United States Air Force Academy",
  headingRight: "May 2024",
  subheadingLeft: "BS, Data Science",
  subheadingRight: "Colorado Springs, CO",
  bullets: (
    "Distinguished Graduate (top 10%); Chinese language minor (L2+/R1 on DLPT).",
    "Delogrand deputy captain, cyber combat lead, and web exploit SME.",
    "Professor Bradley A. Warner Data Science Catalyst and Top Cadet in Computer Networks.",
  ),
)

#entry_block(
  headingLeft: "Western Governors University",
  headingRight: "April 2022",
  subheadingLeft: "BS, Cybersecurity and Information Assurance",
  subheadingRight: "Remote",
)

#entry_block(
  headingLeft: "Community College of the Air Force",
  headingRight: "February 2019",
  subheadingLeft: "AS, Information Systems Technology",
  subheadingRight: "Remote",
)

#section_header("Cyber Competition")

#entry_block(
  headingLeft: "1st in SANS Academy Cup 2024",
  bullets: (
    "Competed as the Delogrand Web Exploit SME, solving SQLi, API, and HTTP packet crafting problems.",
    "Also placed first in SANS Core Netwars competition.",
  ),
)

#entry_block(
  headingLeft: "1st in NCX 2023",
  bullets: (
    "Developed strategies, defensive scripts, and exploits for the Cyber Combat event.",
    "Analyzed logs with Bash and Python for the Data Analysis event.",
  ),
)

#entry_block(
  headingLeft: "1st in SANS Academy Cup 2023",
  bullets: (
    "Competed as the Delogrand Web Exploit SME, solving XSS, XXE, SQLi, and HTTP crafting problems.",
    "Took first place against rival Army, Navy, and Coast Guard service academy teams.",
  ),
)

#entry_block(
  headingLeft: "1st in RMCS 2023",
  bullets: (
    "Competed as the Delogrand Web Exploit SME, solving obfuscated JS, Wasm, XSS, and SQLi problems.",
  ),
)

#entry_block(
  headingLeft: "1st in NCX 2022",
  bullets: (
    "Trained and strategized teams for the Cyber Combat event.",
  ),
)

#section_header("Projects")

#project_entry(
  name: "TongueToQuill",
  url: "https://tonguetoquill.com",
  bullets: (
    "Rich markdown editor for perfectly formatted USAF and USSF documents with Claude MCP integration.",
  ),
)

#project_entry(
  name: "Quillmark",
  url: "https://github.com/nibsbin/quillmark",
  bullets: (
    "Parameterization engine for generating arbitrarily typesetted documents from markdown content.",
  ),
)

#project_entry(
  name: "RoboRA",
  url: "https://github.com/nibsbin/RoboRA",
  bullets: (
    "AI research automation framework for Dr. Nadiya Kostyuk's research on global cyber policy.",
  ),
)

#project_entry(
  name: "Scraipe",
  url: "https://pypi.org/project/scraipe/",
  bullets: (
    "An asynchronous scraping and enrichment library to automate cybersecurity research.",
  ),
)

#project_entry(
  name: "Quandry",
  url: "https://quandry.streamlit.app/",
  bullets: (
    "LLM Expectation Engine to automate security and behavior evaluation of LLM models.",
    "Awarded 1st place out of 11 teams in CMU's Fall 2024 Information Security, Privacy, and Policy poster fair.",
  ),
)

#project_entry(
  name: "Streamlit Scroll Navigation",
  url: "https://pypi.org/project/streamlit-scroll-navigation/",
  bullets: (
    "Published a Streamlit-featured PyPI package to help data scientists create fluid single-page applications.",
  ),
)

#project_entry(
  name: "ADSBLookup",
  url: "<closed source>",
  bullets: (
    "Reversed the internal API of a popular ADSB web service to pull comprehensive live ADSB datasets; ported and exposed attributes in a user-friendly, Pandas-compatible Python library for data scientists.",
  ),
)

#project_entry(
  name: "OSCP LaTeX Report Template",
  url: "https://github.com/SnpM/oscp-latex-report-template",
  bullets: (
    "Published a report template that features custom commands for streamlined penetration test documentation.",
  ),
)

#project_entry(
  name: "Lockstep Framework",
  url: "https://github.com/SnpM/LockstepFramework",
  bullets: (
    "As a budding programmer, I created a popular RTS engine with custom-built deterministic physics.",
  ),
)
