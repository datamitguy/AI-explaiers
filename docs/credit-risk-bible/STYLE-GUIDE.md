# Style guide for the Credit Risk Bible

This vault is written for someone who has just joined a bank as a platform lead for a credit risk team and knows nothing about banking. Every note must be readable by a bright 12-year-old. The model for tone and depth is `../basel-credit-risk-explained-simply.md`. Read it before writing.

## Rules

1. **Spell out every acronym** the first time it appears in each note, even if another note already did. Readers jump around in Obsidian.
2. **Use analogies** from everyday life (lemonade stands, pocket money, borrowing a bike, school) to introduce every new idea, then give the real banking version.
3. **Be exhaustive, not shallow.** Each note should be 3,000 to 6,000 words. Cover every sub-topic a practitioner would expect, with the practical "how it actually works in a bank" angle, not just textbook definitions.
4. **Worked examples with numbers** in every note. Made-up but realistic.
5. **Tables** for anything list-like with attributes: types, comparisons, ratios.
6. **Structure**: start with a one-paragraph "why this matters to you," then a table of contents, then sections, then a "common mistakes and misunderstandings" section, then "what a platform lead needs to know about this" (data, systems, controls, who owns what), then "related notes."
7. **Obsidian wikilinks**. Link to other notes with `[[NN Title]]` using the exact filenames in the index below, without the `.md` extension. Link generously: every time you mention a concept that has its own note, link it on first mention in each section. Link to the existing files with `[[basel-credit-risk-explained-simply]]` and `[[basel-credit-risk-decision-tree]]`.
8. **No em-dashes.** Use commas, full stops, or parentheses.
9. **Headings**: `#` for the title (same as filename without number), `##` for sections, `###` for sub-sections.
10. Prefer British spelling (securitisation, standardised), matching the Basel text.
11. Say when something varies by country or bank, and do not invent specific regulatory numbers you are not sure of. Where a number is illustrative, say so.
12. Do not reference the tools or conversations used to draft the notes.

## Index of notes (exact filenames)

```
00 Start Here
01 What a Bank Is and How It Makes Money
02 What Credit Risk Is
03 The Credit Lifecycle
04 Commercial and Corporate Lending
05 Retail Lending
06 Specialised Finance - Project, Object, Commodities, Real Estate
07 Leveraged and Acquisition Finance
08 Trade Finance and Guarantees
09 Credit Analysis - Reading a Borrower
10 Internal Ratings, Scorecards and PD Models
11 Collateral and Security
12 Loan Documentation, Covenants and Conditions
13 Credit Governance - Committees, Authorities and the Three Lines
14 Risk Appetite, Limits and Concentration
15 Monitoring, Early Warning and Watchlist
16 Problem Loans, Restructuring and Recovery
17 Provisioning and Expected Credit Loss - IFRS 9 and CECL
18 Regulatory Capital and Basel - the Short Version
19 Counterparty Credit Risk and Derivatives
20 Stress Testing and ICAAP
21 Model Risk Management and Validation
22 Credit Risk Data, Systems and BCBS 239
23 Reporting - Regulatory Returns, Pillar 3 and Management Information
24 Pricing, RAROC and Return on Capital
25 Climate, ESG and Emerging Credit Risks
26 Sovereign, Bank and Country Risk
27 A Platform Lead's First 90 Days
28 Master Glossary
```

## Diagrams (SVG)

Every note must include at least two supporting diagrams, more where a process, structure or flow is being explained. Rules:

1. Author each diagram as a Graphviz file at `diagrams/NN-short-name.dot` (NN = the note number, e.g. `diagrams/03-credit-lifecycle.dot`). Use the same visual language as `../basel-credit-risk-decision-tree.dot`: `rankdir=TB` or `LR`, rounded filled boxes (`fillcolor="#eef2ff", color="#6366f1"`), diamonds for decisions (`fillcolor="#fef3c7", color="#d97706"`), dark boxes for start/end (`fillcolor="#1f2937", fontcolor="white"`), grey for out-of-scope, green `#065f46` / red `#991b1b` for good/bad outcomes, dashed clusters for groupings, `fontname="Helvetica"`, explicit `\n` line breaks so labels never exceed about 45 characters per line, `splines=true`.
2. Render with `diagrams/render.sh diagrams/NN-short-name.dot`, which writes `diagrams/NN-short-name.svg` with a responsive width. Check the render succeeds and look at the output with `dot -Tpng -Gdpi=72` plus the Read tool if the layout is complex; fix anything that overlaps or wraps badly.
3. Embed in the note with Obsidian syntax on its own line: `![[NN-short-name.svg]]`, followed by one italic caption line explaining what the diagram shows. Place each diagram right where the concept it illustrates is introduced.
4. Good diagram subjects: process flows (lifecycle, approval escalation, waterfall), structures (syndicate, project finance SPV, three lines of defence, document hierarchy), decision trees (which approach, which limit), timelines (delinquency buckets, covenant testing), comparisons (senior vs mezzanine capital stack as stacked boxes).
5. Keep diagrams to roughly 10 to 30 nodes so they are readable at pane width. Split into two diagrams rather than make one enormous one.
