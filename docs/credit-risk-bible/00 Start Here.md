# Start Here

**What this is.** A plain-language reference for credit risk management in a bank, written for someone who has just joined with no banking background. Every note explains its subject from scratch, spells out every acronym, uses everyday analogies, and ends with what a platform or technology lead needs to know about it. The notes link to each other in Obsidian style; follow the links as you need them.

**Who it is for.** The original reader is a platform lead who has just taken over the technology for a credit risk team. It works equally for a new analyst, a product manager, an auditor, or anyone who keeps hearing words like "RWA", "IFRS 9" and "SA-CCR" in meetings and would like to know what they mean.

**How to use it.** If you are new, read notes 01 to 03 in order, then jump to [[27 A Platform Lead's First 90 Days]] for a guided route through the rest. If you are looking something up, start at [[28 Master Glossary]] and follow the link from the term.

![[00-vault-map.svg]]
*The map of the vault. Arrows show the suggested reading order; groups show which notes belong together.*

---

## The one-paragraph version of everything

A bank lends out money that mostly belongs to its depositors. Some borrowers will not pay it back; that chance is **credit risk**. To decide whether to lend, the bank analyses the borrower, takes security, writes a contract with conditions, and gets the decision approved by someone independent of the salesperson. After lending, it watches for trouble and acts early when it appears. To make sure the bank survives when borrowers fail, accounting rules make it set aside money against expected losses (**provisions**) and the Basel rules make it hold a cushion of its own money (**capital**) sized to how risky its loans are (**risk-weighted assets**). All of this runs on data and systems that must be accurate, traceable and on time, because the numbers go to regulators and the public. That is the whole subject; the notes below are the detail.

---

## The notes

### Foundations

| Note | What you will learn |
|---|---|
| [[01 What a Bank Is and How It Makes Money]] | Deposits, loans, interest margin, the balance sheet, why banks are regulated, where credit risk sits in the organisation. |
| [[02 What Credit Risk Is]] | Default, expected and unexpected loss, the three ingredients (probability of default, loss given default, exposure at default), how credit risk differs from market and other risks. |
| [[03 The Credit Lifecycle]] | Every stage from a customer walking in to a loan being repaid or written off, with who does what and what data each stage creates. |

### Products and lending

| Note | What you will learn |
|---|---|
| [[04 Commercial and Corporate Lending]] | Overdrafts, term loans, revolving facilities, asset-based lending, syndicated loans, and how each is assessed. |
| [[05 Retail Lending]] | Mortgages, cards, personal loans, scoring, decision engines, delinquency buckets, collections. |
| [[06 Specialised Finance - Project, Object, Commodities, Real Estate]] | Lending repaid by a single project or asset: project finance structures, ships and aircraft, commodities, property development. |
| [[07 Leveraged and Acquisition Finance]] | Buyouts, the capital stack from senior debt to equity, leverage multiples, why regulators watch these loans. |
| [[08 Trade Finance and Guarantees]] | Letters of credit step by step, guarantees and bonds, supply chain finance, why trade finance rarely loses money. |

### Assessing and securing

| Note | What you will learn |
|---|---|
| [[09 Credit Analysis - Reading a Borrower]] | The three financial statements, the key ratios, cash flow, qualitative analysis, what a credit paper looks like. |
| [[10 Internal Ratings, Scorecards and PD Models]] | Rating scales, how corporate rating models and retail scorecards are built, calibration, overrides, how ratings feed capital. |
| [[11 Collateral and Security]] | Types of collateral, legal forms, valuation, haircuts, the Basel eligibility rules, what a collateral system must hold. |
| [[12 Loan Documentation, Covenants and Conditions]] | Facility agreements, conditions precedent, financial and negative covenants, events of default, waivers. |

### Governing and watching

| Note | What you will learn |
|---|---|
| [[13 Credit Governance - Committees, Authorities and the Three Lines]] | The three lines of defence, committees, delegated authority, policies, independence. |
| [[14 Risk Appetite, Limits and Concentration]] | Risk appetite statements, limit types, concentration, large exposures, how limits run in systems. |
| [[15 Monitoring, Early Warning and Watchlist]] | Annual reviews, early warning indicators, the watchlist process, the link to accounting stages. |
| [[16 Problem Loans, Restructuring and Recovery]] | Workout strategies, forbearance, restructuring tools, insolvency basics, enforcement, recovery rates. |

### Measuring: accounting and capital

| Note | What you will learn |
|---|---|
| [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]] | The three stages, significant increase in credit risk, scenarios and overlays, how a provisioning engine works. |
| [[18 Regulatory Capital and Basel - the Short Version]] | The condensed guide to risk-weighted assets, the three approaches, ratios and buffers, and how the quarterly calculation runs. |
| [[basel-credit-risk-explained-simply]] | The long walk through the Basel credit risk framework, box by box. |
| [[basel-credit-risk-decision-tree]] | The decision tree diagram itself, with the Graphviz source. |
| [[19 Counterparty Credit Risk and Derivatives]] | Derivatives from scratch, netting, collateral, central clearing, the SA-CCR formula, repos. |
| [[20 Stress Testing and ICAAP]] | Scenarios, how macro shocks become credit losses, the internal capital adequacy process, what a stress platform needs. |

### Running the platform

| Note | What you will learn |
|---|---|
| [[21 Model Risk Management and Validation]] | The model lifecycle, validation, performance statistics, change control, implementation risk. |
| [[22 Credit Risk Data, Systems and BCBS 239]] | The systems landscape, data domains, lineage, data quality, the regulatory principles for risk data. |
| [[23 Reporting - Regulatory Returns, Pillar 3 and Management Information]] | Regulatory returns, public disclosures, board reporting, the production process and its controls. |
| [[24 Pricing, RAROC and Return on Capital]] | How a loan is priced, risk-adjusted return on capital, why capital cost drives business decisions. |

### Wider risks

| Note | What you will learn |
|---|---|
| [[25 Climate, ESG and Emerging Credit Risks]] | Physical and transition climate risk, environmental and social scoring, other emerging risks. |
| [[26 Sovereign, Bank and Country Risk]] | Lending to governments and banks, country limits, transfer risk, bail-in, correspondent banking. |

### Orientation and reference

| Note | What you will learn |
|---|---|
| [[27 A Platform Lead's First 90 Days]] | A guided plan: what to read, who to meet, what to diagnose, what to deliver first. |
| [[28 Master Glossary]] | Every term and acronym in the vault, each linked to the note that explains it. |

---

## Conventions used in every note

- **Acronyms** are spelled out on first use in each note, because you will arrive from anywhere.
- **Numbers in examples** are made up but realistic, and say so.
- **Country differences** are flagged where they matter. The Basel rules are a shared recipe; each country seasons it differently.
- **Diagrams** are Graphviz-rendered SVG files in the `diagrams` folder, embedded with `![[name.svg]]`. The `.dot` sources sit next to them so you can edit and re-render with `diagrams/render.sh`.
- **"What a platform lead needs to know"** closes every note: the data, systems, controls and ownership questions that follow from the topic.

## Keeping it up to date

The regulatory numbers (buffers, floors, phase-in dates) move. When you learn that something has changed in your jurisdiction, edit the note and add a line at the bottom saying what changed and when. A living vault that is slightly wrong and corrected is more useful than a perfect one nobody maintains.
