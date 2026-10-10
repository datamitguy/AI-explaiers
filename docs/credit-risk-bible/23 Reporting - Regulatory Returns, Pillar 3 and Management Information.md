# Reporting - Regulatory Returns, Pillar 3 and Management Information

**Why this matters to you.** Everything the credit risk function measures ends up in a report, and the reports go to three very different audiences: the regulator, who can fine the bank for getting them wrong; the public, who use them to decide whether to invest in or lend to the bank; and the board and management, who use them to run the business. The same underlying data must produce all three, consistently, on a strict calendar, with an audit trail. Most of the pain in a credit risk function at quarter-end is reporting pain, and most of that pain is data and systems pain. As platform lead you will own the pipeline that feeds every one of these reports, the controls that prove the numbers are right, and the tooling that gets them out of the door on time.

---

## Table of contents

1. [The three audiences](#1-the-three-audiences)
2. [Regulatory returns, generically](#2-regulatory-returns-generically)
3. [Frequencies and deadlines](#3-frequencies-and-deadlines)
4. [The production process](#4-the-production-process)
5. [Pillar 3 disclosures](#5-pillar-3-disclosures)
6. [Management information for credit](#6-management-information-for-credit)
7. [What a good credit risk dashboard looks like](#7-what-a-good-credit-risk-dashboard-looks-like)
8. [The board risk report](#8-the-board-risk-report)
9. [Reconciliations and controls](#9-reconciliations-and-controls)
10. [Common failure modes](#10-common-failure-modes)
11. [Regulatory attention to reporting accuracy](#11-regulatory-attention-to-reporting-accuracy)
12. [Common mistakes and misunderstandings](#12-common-mistakes-and-misunderstandings)
13. [What a platform lead needs to know about this](#13-what-a-platform-lead-needs-to-know-about-this)
14. [Related notes](#14-related-notes)

---

## 1. The three audiences

Think of a school again. The same set of exam marks is reported three ways. The exam board gets a formal return in a fixed format, on a deadline, and checks it. Parents get a published league table so they can compare schools. The head teacher gets a detailed breakdown by class and subject to decide where to put extra teaching. Same marks, three audiences, three formats, and if the numbers disagree between them somebody has a very awkward meeting.

A bank's credit risk reporting has exactly these three audiences.

| Audience | Report family | Purpose | Format | What happens if it is wrong |
|---|---|---|---|---|
| Regulators and supervisors | Regulatory returns | Check the bank meets capital, liquidity and concentration rules; monitor the system | Fixed templates, electronic submission, validation rules | Resubmission, supervisory findings, capital add-ons, fines, public censure |
| The public (investors, analysts, rating agencies, journalists) | Pillar 3 disclosures and the annual report | Market discipline: let outsiders judge the bank's risk | Standard tables published on the bank's website, usually alongside financial results | Loss of credibility, share price and funding cost effects, regulatory action |
| Management and the board | Management information (MI) and the board risk report | Run the business: set limits, price, allocate capital, spot trouble | Dashboards, packs, commentary; the bank's own design | Bad decisions, missed warnings, and (if the board was misinformed) governance findings |

![[23-three-audiences.svg]]
*One reconciled data set feeds three audiences. The regulatory returns and Pillar 3 are externally mandated; the management information is the bank's own, but it is the one that actually drives decisions.*

The single most important design principle is that all three come from **one set of reconciled data**. A bank whose Pillar 3 RWA differs from its regulatory return RWA, or whose board pack shows a different non-performing loan ratio from its published accounts, has a control failure, not a formatting problem.

---

## 2. Regulatory returns, generically

Every country's regulator has its own templates, and they change often, so this section describes the families generically rather than reciting any one rulebook.

**Capital returns (COREP-style).** In the European Union and the United Kingdom the capital return family is called **COREP** (common reporting). It reports own funds (how much capital the bank has, by tier), the capital requirements by risk type, and for credit risk a detailed breakdown: exposure by exposure class, by approach (standardised, foundation IRB, advanced IRB), by risk weight band, with credit risk mitigation effects, defaulted exposures, and for IRB banks, exposures by PD grade with the PD, LGD and maturity used. It is the return that tells the supervisor whether the capital ratios in [[18 Regulatory Capital and Basel - the Short Version]] are met. Related templates cover the leverage ratio and the output floor.

**Financial returns (FINREP-style).** **FINREP** (financial reporting) is the accounting cousin: balance sheet, profit and loss, and detailed breakdowns of loans and advances by counterparty sector, by product, by country, with impairment stages, provisions, **non-performing exposures** (NPE), **forbearance** (concessions given to struggling borrowers, see [[16 Problem Loans, Restructuring and Recovery]]) and collateral received. It must tie to the published accounts.

**Large exposures returns.** A list of the bank's biggest exposures, by connected-client group, before and after credit risk mitigation, against the limit of 25% of Tier 1 capital described in [[14 Risk Appetite, Limits and Concentration]]. Typically the top exposures above a size threshold, plus all those above 10% of capital.

**Non-performing loan templates.** Supervisors in many jurisdictions require detailed NPL reporting: stock, flows (new defaults, cures, write-offs, sales), ageing, collateral coverage, and progress against NPL reduction plans where the bank has one.

**United States: the call report and FR Y-14 style schedules.** United States banks file a quarterly **call report** (formally the Consolidated Reports of Condition and Income) covering balance sheet, income, loan categories, past-due and non-accrual loans, and charge-offs. Large bank holding companies file **FR Y-14** schedules to the Federal Reserve, which for credit include loan-level data on corporate and commercial real estate loans and detailed retail portfolio data, used for the annual stress test described in [[20 Stress Testing and ICAAP]]. The loan-level granularity makes these among the most demanding returns anywhere.

**Other common returns.** Country exposure returns (see [[26 Sovereign, Bank and Country Risk]]), credit register submissions (several countries run a central database of loans above a threshold, fed by every bank, and loan-level), interest rate risk, liquidity (not credit, but sharing the same data), statistical returns to the central bank, and ad hoc data requests during supervisory reviews.

| Return family | What it answers | Granularity | Typical frequency |
|---|---|---|---|
| Capital (COREP-style) | Does the bank have enough capital for its risk? | Aggregated by class, approach, risk weight or PD band | Quarterly |
| Financial (FINREP-style) | What does the balance sheet look like, and how impaired is it? | Aggregated by sector, product, country, stage | Quarterly |
| Large exposures | Is the bank too concentrated on anyone? | Per connected group | Quarterly |
| NPL templates | How big is the bad book and is it shrinking? | Aggregated with flows | Quarterly or semi-annual |
| Call report (US) | Condition and income of the bank | Aggregated | Quarterly |
| FR Y-14 (US large banks) | Loan-level data for stress testing | Loan level | Monthly, quarterly, annual schedules |
| Credit register | Who has lent what to whom | Loan level | Monthly |

---

## 3. Frequencies and deadlines

Most prudential returns are quarterly, with the submission deadline somewhere between roughly four and six weeks after the quarter-end, varying by return and country. Some are monthly (credit registers, liquidity), some semi-annual or annual (certain disclosure and stress test submissions). Supervisors can shorten deadlines in stress or ask for ad hoc returns at days' notice.

The deadline that matters most inside the bank is not the regulator's but the **internal timetable** that backs into it: the data must be closed by day N, the engines run by day N plus 5, validation done by day N plus 12, attestation by day N plus 18, submission by day N plus 20, leaving a buffer. The buffer is what gets eaten when something goes wrong, and when it is gone the bank is choosing between submitting late and submitting wrong.

---

## 4. The production process

The production of a regulatory return is a factory process with a fixed sequence, and it is the part of reporting most dependent on the platform.

![[23-reporting-production.svg]]
*The quarter-end production line for a regulatory return, from data close to submission, with the loops that run when checks fail or errors are found after submission.*

**Data.** Source systems close; snapshots load to the warehouse; the data quality rules from [[22 Credit Risk Data, Systems and BCBS 239]] run; breaches are triaged and adjustments logged.

**Calculation.** The capital engine, the provisioning engine and the large exposures calculation run on the closed data. Each run is versioned: which data snapshot, which engine version, which parameter set.

**Validation checks.** Three kinds. **Template validation rules** are the regulator's own checks, published with the templates (for example: the sum of exposures across risk weight bands must equal the total; cells that must be positive; cross-template consistency between the capital return and the financial return). The submission portal rejects a file that fails them. **Internal checks** are the bank's own: reconciliations to the ledger and between engines, completeness checks against the entity list, plausibility ranges. **Variance analysis** compares every material cell to the prior period and explains the movement: "RWA for corporates up 1.2 billion, of which 0.9 billion new lending, 0.4 billion rating migration, minus 0.1 billion repayments." An unexplained movement is treated as an error until proven otherwise.

**Attestation.** Senior individuals sign that the return is complete and accurate to the best of their knowledge, having reviewed the controls. In the United Kingdom this maps to named senior managers with personal accountability; in the United States the call report carries officer and director attestations. The sign-off pack contains the reconciliations, the variance commentary, the open issues and the adjustments register.

**Submission.** The file is transmitted via the regulator's portal, in the required taxonomy (often an XBRL format, a machine-readable standard where every cell has a defined meaning). An acknowledgement is retained.

**Resubmission.** If an error is found after submission, the bank must correct and resubmit, usually with an explanation of the cause, the size of the error, and the control fix. A pattern of resubmissions is a supervisory red flag in itself, because it signals weak controls regardless of the size of any one error.

---

## 5. Pillar 3 disclosures

The Basel framework's third pillar (see [[basel-credit-risk-explained-simply]]) is **public disclosure**. The idea is market discipline: if investors and analysts can see a bank's risk in a standard format and compare it to its peers, they will reward prudence and punish recklessness through the share price and the cost of funding. Pillar 3 reports are published on the bank's website, usually quarterly for the key tables and annually in full, alongside the financial results.

The Basel Committee prescribes the tables, and national regulators adopt them with local variations. For credit risk the main ones, described generically:

| Table (generic name) | What it shows | Why readers care |
|---|---|---|
| Overview of RWA | RWA and capital requirement by risk type, this quarter and last | The headline: how much risk, and is it growing |
| Credit quality of assets | Defaulted and non-defaulted exposures, provisions, write-offs, net values, by exposure type | How bad is the book and how well covered |
| Changes in stock of defaulted exposures | Flows in and out of default during the period | Is the bad book growing or shrinking |
| Credit risk mitigation techniques | Exposures secured by collateral, guarantees and credit derivatives | How much of the book is protected and by what |
| Standardised approach: exposures by asset class and risk weight | The SA book laid out as the risk weight table | Whether the bank's SA risk weights look like its peers' |
| IRB: exposures by portfolio and PD range | For each IRB portfolio, exposure, average PD, average LGD, RWA and RWA density by PD band, with number of obligors | The single most scrutinised table: analysts compare RWA density and average PD across banks for the same portfolio types |
| RWA flow statement for IRB credit risk | How IRB RWA moved: asset size, asset quality, model updates, methodology, acquisitions, currency | Explains whether RWA changes reflect business or model changes |
| Backtesting of PD per portfolio | Predicted PD versus actual default rate, by portfolio and band | Whether the bank's models are honest |
| Specialised lending and equities | Slotting categories and exposures | Transparency on the opaque corners |
| Counterparty credit risk tables | Exposures by approach, netting and collateral effects, CVA capital, exposures to central counterparties | See [[19 Counterparty Credit Risk and Derivatives]] |
| Securitisation tables | Exposures as originator, sponsor, investor; by tranche quality | Who holds what in the slices |

**RWA density** (RWA divided by exposure) is the number analysts love. If two banks have mortgage books with similar loan-to-value and arrears profiles but one shows an RWA density of 12% and the other 25%, questions follow. This is exactly the comparison that pushed regulators towards the output floor.

Pillar 3 must reconcile to the regulatory returns and to the published accounts, with a formal reconciliation between the accounting balance sheet and the regulatory exposure measure included in the disclosure itself. It is subject to a formal internal control and sign-off process similar to the returns, and increasingly to external assurance.

---

## 6. Management information for credit

The regulator's templates are not designed to run a bank. Management information (**MI**) is the bank's own reporting, built to support decisions. For credit risk the standard contents:

| Area | Typical content | Decision it supports |
|---|---|---|
| Portfolio composition | Exposure by business line, product, sector, country, rating grade, maturity, secured versus unsecured; trends | Strategy, appetite, capital planning |
| Concentrations | Top 20 groups, sector shares, country shares, single-name and sector limit utilisation, correlation clusters | [[14 Risk Appetite, Limits and Concentration]] |
| Rating migration | Matrix of grade movements over the period; upgrades versus downgrades; net migration by sector | Early signal of deterioration; model monitoring |
| Watchlist and early warning | Number and exposure on watchlist, additions and removals, triggers fired, time on list | [[15 Monitoring, Early Warning and Watchlist]] |
| Arrears and delinquency | Exposure by days-past-due bucket, roll rates between buckets, cure rates, by product and vintage | Collections strategy, provisioning, underwriting feedback |
| Provisions and expected credit loss | Stock, charge for the period, coverage ratios, stage distribution and movements, overlays, scenario weights | [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]] |
| Non-performing loans | Stock and flows, coverage, collateral, workout pipeline, recoveries | [[16 Problem Loans, Restructuring and Recovery]] |
| RWA and capital | Credit RWA by portfolio and approach, RWA density, movement analysis, output floor headroom, capital consumption against allocation | [[18 Regulatory Capital and Basel - the Short Version]] |
| Limit utilisation and excesses | Utilisation of counterparty, country, sector limits; excesses, their ageing and approval status | Limit management, escalation |
| New business quality | Volumes, average PD and LGD of new lending, pricing achieved versus hurdle, exceptions to policy, approvals by authority level | Underwriting standards, [[24 Pricing, RAROC and Return on Capital]] |
| Model performance | Summary of monitoring results and triggers | [[21 Model Risk Management and Validation]] |
| Stress and forward-looking | Latest stress test results, sensitivity of provisions and RWA to scenario shifts | [[20 Stress Testing and ICAAP]] |

Good MI has a few properties. It is **actionable**: every page answers "so what should we do?" It is **comparative**: against last period, against appetite, against plan, against peers where possible. It is **consistent** with the regulatory numbers (the NPL ratio on the dashboard is the one in FINREP, or the difference is explained in a footnote). And it is **layered**: a one-page summary, a deck of a dozen pages, and the ability to drill down to a counterparty.

---

## 7. What a good credit risk dashboard looks like

A dashboard is the top layer of MI, built for a monthly glance by the chief risk officer and the credit committee. A good one fits on one or two screens and follows a hierarchy.

**Top band: the headline numbers against appetite.** Perhaps eight tiles, each with current value, prior value, appetite limit, and a red-amber-green status: total credit exposure, credit RWA, expected credit loss stock and charge, NPL ratio, cost of risk (annualised credit losses divided by average loans), largest single-name as a percentage of capital, largest sector share, and watchlist exposure.

**Second band: movement and trend.** Twelve-month trend lines for the headline numbers; an RWA movement bridge (opening, new business, repayments, migration, model and methodology, foreign exchange, closing); a provisions bridge in the same shape.

**Third band: where the risk is.** Heat maps by sector and country, with exposure as size and rating migration or arrears as colour; a top 20 groups table with exposure, rating, limit utilisation and trend; a stage distribution for expected credit loss.

**Fourth band: what is happening at the edges.** New lending quality this month (volume, average PD, share of exceptions); limit excesses outstanding and ageing; early warning triggers fired; model monitoring breaches; data quality status (open critical issues, adjustments count and value).

**Behind every tile: drill-down.** Click the sector and see the counterparties; click the counterparty and see the facilities, ratings and collateral. This is only possible if the dashboard sits on the reconciled warehouse, not on a copied extract.

A worked illustration. Suppose a bank's dashboard shows: credit RWA 48.2 billion, up 1.4 billion on the quarter. The bridge shows new business plus 1.1, repayments minus 0.6, migration plus 0.7, model update plus 0.3, foreign exchange minus 0.1. The migration bar is the one to click: it reveals that the plus 0.7 is concentrated in commercial real estate, where 14 counterparties were downgraded. The sector heat map confirms commercial real estate has turned amber on arrears. The watchlist tile shows 6 new commercial real estate additions. In about four clicks the chief risk officer has a story and a question for the head of real estate lending. That is what MI is for.

---

## 8. The board risk report

The board (and its risk committee, see [[13 Credit Governance - Committees, Authorities and the Three Lines]]) is the final internal audience. Directors are not credit specialists and have perhaps an hour for credit among many topics. The board risk report is therefore short, narrative, and organised around the **risk appetite statement**: for each appetite measure, the current position, the trend, whether it is within limits, and what management is doing about anything amber or red.

A typical credit section of a board risk report contains:

1. A one-paragraph executive summary written in plain words ("Credit quality deteriorated modestly in the quarter, driven by commercial real estate; all appetite measures remain within limits except sector concentration in real estate, which is amber; management has paused new lending above 60% loan-to-value in that sector").
2. The appetite dashboard: measures, limits, status, trend arrows.
3. Top risks and emerging risks, with the actions being taken (this is where [[25 Climate, ESG and Emerging Credit Risks]] usually appears).
4. Key portfolio metrics with brief commentary.
5. Limit excesses and policy exceptions requiring board attention.
6. Regulatory matters: findings, resubmissions, upcoming rule changes.
7. Model and data matters of board significance.

The regulatory expectation (BCBS 239 Principle 9 in [[22 Credit Risk Data, Systems and BCBS 239]]) is that the board report is accurate, reconciled, and clear enough that directors can challenge management. Minutes should show that they did.

---

## 9. Reconciliations and controls

Reporting controls prove that the number on the page is the number in the data. The core set:

| Control | What it checks | Evidence |
|---|---|---|
| Source-to-warehouse completeness | Every account in source systems is in the warehouse | Record counts and balance totals by system, signed off |
| Warehouse-to-general ledger reconciliation | Exposure totals agree with the accounting books within tolerance | Reconciliation report with explained differences |
| Inter-engine reconciliation | RWA exposure equals ECL exposure equals large exposures exposure | Reconciliation by portfolio |
| Inter-return consistency | Capital return ties to financial return ties to Pillar 3 | Cross-check matrix, usually automated in the submission tool |
| Template validation rules | The regulator's arithmetic and consistency rules pass | Validation log from the submission tool |
| Variance analysis | Every material movement is explained | Commentary pack reviewed by a second person |
| Adjustments review | Every manual adjustment is approved, explained and still needed | Adjustments register signed off |
| Access and change control | Only authorised people changed mappings and code; changes were tested | Change records, access reviews |
| Attestation | Accountable individuals have reviewed and signed | Signed attestation with supporting pack |
| Post-submission review | Lessons learned, issues logged, remediation tracked | Issues log |

The mantra: **a number without a reconciliation is an opinion.**

---

## 10. Common failure modes

**Manual spreadsheets in the critical path.** The engine output goes into a spreadsheet where an analyst applies "known adjustments," re-maps a few codes, and pastes the result into the template. The spreadsheet has no version control, formulas that reference the wrong row after a sort, and one person who understands it. This is the single most common finding in reporting reviews.

**Late data.** One source system misses the close; the run goes ahead with last month's data for that system; the adjustment is forgotten when the real data arrives.

**Inconsistent numbers across reports.** The board pack says NPL ratio 2.8%; FINREP says 3.1%; Pillar 3 says 2.9%. Each used a slightly different definition or cut-off date. Each may be defensible alone; together they destroy confidence.

**Mapping drift.** Product codes, sector codes and exposure class mappings change in one place and not another. A new product is mapped to the wrong class for three quarters.

**Unexplained variances accepted under time pressure.** "It is probably FX" is written in the commentary at 11pm before the deadline.

**Key-person dependency.** The one analyst who knows how the large exposures return is really produced leaves, and the next quarter is chaos.

**Resubmission culture.** The bank submits on time knowing there are errors, planning to resubmit. Regulators notice the pattern.

**Over-reliance on vendor validation.** The submission tool says the template passes the regulator's rules, so it must be right. The rules only test arithmetic consistency, not whether the data is correct.

---

## 11. Regulatory attention to reporting accuracy

Supervisors treat regulatory reporting as a control in its own right, and the consequences of getting it wrong have grown sharply.

- Regulators in the United Kingdom have imposed substantial fines on large banks specifically for inaccurate regulatory returns, including capital and liquidity returns, over multi-year periods, and have published the findings in detail. The common threads were manual processes, poor governance of models and data feeding the returns, and inadequate review.
- Supervisors have conducted thematic reviews of regulatory reporting across many firms and written publicly that the quality was below expectations, that senior management attention was insufficient, and that firms should treat reporting with the same rigour as financial reporting.
- Resubmission statistics are tracked and discussed in supervisory meetings. A bank with frequent resubmissions can expect a deep-dive review, which in turn consumes months of the team's time.
- In the United States, call report accuracy carries officer attestations, and restatements draw regulatory and sometimes public attention.
- BCBS 239 reviews, described in [[22 Credit Risk Data, Systems and BCBS 239]], have led to formal remediation programmes with board-level accountability at many of the largest banks.
- The direction of travel is towards more granular, loan-level reporting (credit registers, FR Y-14 style schedules, and projects in Europe to integrate reporting around a single granular data model), which removes the hiding places that aggregated templates allowed.

The practical message: reporting accuracy is a prudential matter and a personal accountability matter for the executives who sign, which means the platform's evidence of control is what protects them.

---

## 12. Common mistakes and misunderstandings

- **"Reporting is a finance job."** The credit numbers in every return come from credit risk data and models. Finance may own the submission; credit risk owns the content.
- **"If the template validates, it is correct."** Validation rules check arithmetic and cross-references, not truth.
- **"Pillar 3 is a marketing document."** It is a regulated disclosure with the same accuracy obligations as the returns, and analysts read it more carefully than the bank's own management does.
- **"MI can use different definitions from regulatory reporting because it is internal."** It can add views the regulator does not ask for, but where the same measure exists in both, it must be the same number or the difference must be explained.
- **"A small error does not need a resubmission."** Materiality thresholds exist, but the pattern matters as much as the size, and hiding a known error is far worse than resubmitting it.
- **"The dashboard is the data."** The dashboard is a view. If it is built on a manual extract, it is a spreadsheet with better colours.
- **"The board wants more detail."** The board wants clarity and the ability to challenge. Detail belongs in the drill-down.
- **"Variance analysis is a formality."** It is the single most effective detective control, because errors usually appear as movements nobody can explain.
- **"Automation removes the need for review."** Automation removes keying errors. Review catches logic errors, mapping drift and bad data.

---

## 13. What a platform lead needs to know about this

**Own the production line.** The sequence in section 4 is a pipeline with steps, dependencies, run times and re-run capability. It should be orchestrated, logged and monitored like any production system, with a timetable published to all teams and a dashboard of where each run is. If today the "pipeline" is a chain of emails and spreadsheets, that is the first thing to replace.

**Kill the spreadsheets in the critical path, in order of risk.** Inventory every spreadsheet between engine output and submission. For each, ask what it does (mapping, adjustment, aggregation, formatting) and move that function into controlled tooling: mappings into reference data tables, adjustments into the adjustments register, aggregation into the reporting layer, formatting into the submission tool.

**Make reconciliation automatic and visible.** Source-to-warehouse, warehouse-to-ledger, engine-to-engine and return-to-return reconciliations should run as part of the pipeline and produce a report that reviewers read, not a task reviewers perform by hand.

**Version everything that touches a number.** Data snapshot, engine version, parameter set, mapping tables, adjustment register state, template version, taxonomy version. A regulator asking about a cell from six quarters ago should get an answer in a day.

**Build the variance analysis tooling.** Period-over-period comparison at cell level, with drill-down to the records that drove the movement, is the tool reviewers need most and usually lack.

**Support the sign-off.** The attestation pack (reconciliations, variances, open issues, adjustments, validation logs) should be generated by the platform, not assembled by hand the night before.

**Know the taxonomies.** Regulatory templates arrive as structured taxonomies with versions and validation rules. Changes in those taxonomies are change events for the platform, often several times a year, and need the same testing discipline as internal changes.

**Who owns what.**

| Thing | Owner | Platform role |
|---|---|---|
| Regulatory return content (credit) | Credit risk and risk reporting | Produce the data and calculations, evidence the controls |
| Submission and liaison with the regulator | Regulatory reporting (often in finance) | Operate the submission tooling and the taxonomy updates |
| Pillar 3 | Finance and risk jointly, with investor relations | Produce the tables from the same reconciled data as the returns |
| Management information and dashboards | Risk reporting, for the chief risk officer | Build and run the reporting layer, the drill-down, the data model |
| Board risk report | Chief risk officer | Provide the numbers, with reconciliation evidence |
| Reconciliations | Finance (ledger) and risk reporting (engines) | Automate and evidence |
| Adjustments register | Risk reporting | Tooling, expiry enforcement, reporting of totals |
| Attestation | Named senior executives | The evidence pack |
| Timetable and run orchestration | Platform | Own fully |

---

## 14. Related notes

- [[35 Regulatory Landscape and Change Calendar]] for upcoming reporting changes.
- [[38 Platform Lead Toolkit - Runbooks, Metrics and Templates]] for reporting runbooks and checklists.
- [[13 Credit Governance - Committees, Authorities and the Three Lines]]: the committees and board that consume the MI.
- [[14 Risk Appetite, Limits and Concentration]]: the appetite measures the dashboard and board report are built around.
- [[16 Problem Loans, Restructuring and Recovery]] and [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]]: the NPL and provisioning numbers in FINREP-style returns.
- [[18 Regulatory Capital and Basel - the Short Version]]: the capital numbers in COREP-style returns and Pillar 3.
- [[20 Stress Testing and ICAAP]]: the stress submissions and loan-level schedules.
- [[21 Model Risk Management and Validation]]: model monitoring results that appear in MI and Pillar 3 backtesting.
- [[22 Credit Risk Data, Systems and BCBS 239]]: the pipeline and controls under every report.
- [[26 Sovereign, Bank and Country Risk]]: country exposure reporting.
- [[27 A Platform Lead's First 90 Days]] and [[28 Master Glossary]].
- [[basel-credit-risk-explained-simply]] and [[basel-credit-risk-decision-tree]]: the three pillars and the capital calculation.
