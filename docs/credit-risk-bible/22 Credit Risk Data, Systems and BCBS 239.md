# Credit Risk Data, Systems and BCBS 239

**Why this matters to you.** A credit risk function is, underneath the finance vocabulary, a data pipeline. Loans are booked in one system, collateral in another, ratings in a third, and once a month everything is pulled together, cleaned, calculated, reconciled and reported. When the numbers are wrong it is almost never because the formula was wrong; it is because a customer was duplicated, a group link was missing, a collateral value was three years stale, or a spreadsheet adjustment nobody remembers was applied at month-end. After the 2008 crisis regulators discovered that some of the world's largest banks could not tell them, within days, how much they were exposed to a single failing counterparty. The response was a set of principles called BCBS 239, which is now the yardstick supervisors use to judge whether a bank's risk data can be trusted. This note is the map of that pipeline, the ways it breaks, and the standard it is held to. As platform lead, it is your home ground.

---

## Table of contents

1. [The systems landscape and how data flows](#1-the-systems-landscape-and-how-data-flows)
2. [The key data domains](#2-the-key-data-domains)
3. [Golden sources and data lineage](#3-golden-sources-and-data-lineage)
4. [Data quality dimensions, with credit examples](#4-data-quality-dimensions-with-credit-examples)
5. [Reconciliation to the general ledger](#5-reconciliation-to-the-general-ledger)
6. [BCBS 239 in plain words](#6-bcbs-239-in-plain-words)
7. [Data governance roles](#7-data-governance-roles)
8. [Common data problems in credit](#8-common-data-problems-in-credit)
9. [Batch versus real-time, and the month-end run](#9-batch-versus-real-time-and-the-month-end-run)
10. [Change management and testing in a regulated environment](#10-change-management-and-testing-in-a-regulated-environment)
11. [Cloud and vendor platforms](#11-cloud-and-vendor-platforms)
12. [What good looks like](#12-what-good-looks-like)
13. [Common mistakes and misunderstandings](#13-common-mistakes-and-misunderstandings)
14. [What a platform lead needs to know about this](#14-what-a-platform-lead-needs-to-know-about-this)
15. [Related notes](#15-related-notes)

---

## 1. The systems landscape and how data flows

Imagine a school that keeps its records in several places. The office has the list of pupils. Each teacher has a mark book. The sports department has its own list of who plays what. The library has a list of who borrowed which book. At the end of term, somebody has to produce one report card per pupil, which means collecting from every list, matching names (is "Sam Jones" in the mark book the same as "Samuel Jones" in the library?), and chasing missing entries. If the office spelled a name differently from the sports department, Sam gets two report cards or none.

A bank's credit risk data is that school multiplied by a few million customers and a few dozen systems. The main ones:

| System | What it holds | Who owns it | Typical role in the flow |
|---|---|---|---|
| Loan origination system (LOS) | Applications, credit assessments, approvals, conditions, documents | Front office and credit operations | Where a loan is born; see [[03 The Credit Lifecycle]] |
| Core banking and loan servicing | Account balances, interest, repayments, arrears, maturities | Operations and technology | The **system of record** for what is owed |
| Collateral management | Security taken, valuations, legal charges, haircuts, links to facilities | Credit operations | Feeds LGD and [[11 Collateral and Security]] |
| Limits management | Approved limits by customer and product, utilisation, excesses | Credit risk | Enforces [[14 Risk Appetite, Limits and Concentration]] |
| Rating and scoring engines | PD, LGD and EAD models, grades, overrides, model versions | Credit risk modelling | Produces the inputs described in [[10 Internal Ratings, Scorecards and PD Models]] |
| Customer or counterparty master | Legal entity identifiers, names, addresses, sector, country, group hierarchy | Data management or operations | The spine every other record hangs off |
| Treasury and trading systems | Derivatives, repos, bonds, their market values and collateral | Markets and treasury | Feeds [[19 Counterparty Credit Risk and Derivatives]] |
| Data warehouse or data lake | Month-end snapshots of everything above, reference data, derived fields | Data or finance technology | The place where data is integrated |
| Capital (RWA) engine | Exposure classification, risk weights, IRB formula, output floor | Finance or risk | See [[18 Regulatory Capital and Basel - the Short Version]] |
| Provisioning (ECL) engine | Staging, lifetime PD curves, scenarios, expected credit loss | Finance and risk | See [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]] |
| Stress testing engine | Scenario projections of PD, LGD, RWA, losses over several years | Risk | See [[20 Stress Testing and ICAAP]] |
| General ledger | The accounting books: balances, provisions, income | Finance | The number everyone must reconcile to |
| Reporting layer | Dashboards, management information, reconciliation tools, adjustment logs | Risk reporting and finance | See [[23 Reporting - Regulatory Returns, Pillar 3 and Management Information]] |
| Regulatory submission tools | Template population, validation rules, sign-off workflow, transmission | Regulatory reporting | The last mile to the supervisor |

![[22-systems-landscape.svg]]
*A typical credit risk systems landscape. Operational systems feed a warehouse, the warehouse feeds calculation engines, the engines feed reporting, and everything reconciles to the general ledger.*

The flow is left to right in time. A loan is approved in the origination system, booked in core banking, its collateral recorded, its limit loaded, and its rating assigned. Every month the warehouse takes a snapshot of all of it as at the last day of the month, joins the pieces together by customer and facility identifiers, applies data quality checks, and hands the result to the engines. The engines produce RWA, expected credit loss and stress projections. The reporting layer turns those into returns, disclosures and dashboards, after reconciling totals back to the ledger.

Real banks are messier than the diagram. There are often several core banking systems (one per country, or one inherited from each past merger), several origination systems (one for mortgages, one for corporate), and a tangle of point-to-point feeds that bypass the warehouse. The messier the landscape, the harder the rest of this note becomes.

---

## 2. The key data domains

A **data domain** is a family of related data with one meaning and, ideally, one owner. Credit risk relies on about ten.

| Domain | What it describes | Key fields | Example problem if wrong |
|---|---|---|---|
| Customer or counterparty | Who the bank is exposed to | Unique identifier, legal name, legal entity identifier, country of incorporation and of risk, industry sector, size (turnover) | Same company twice under two spellings: concentration understated |
| Hierarchy and group structures | Who owns whom, who guarantees whom | Parent identifier, ultimate parent, ownership percentage, connected-client group | Subsidiary not linked to parent: large exposure limit breached unnoticed |
| Facility | The contract to lend | Facility identifier, product type, limit, currency, start and maturity dates, committed or uncommitted, cancellability | Wrong cancellability flag: wrong credit conversion factor, wrong EAD |
| Exposure | The amount at risk now | Drawn balance, undrawn amount, accrued interest, off-balance sheet amount, as-at date | Balance taken from a different date than the limit: utilisation over 100% |
| Collateral | What secures the facility | Collateral identifier, type, valuation, valuation date, currency, legal charge rank, allocation to facilities | Stale valuation: LGD too low, provisions too low |
| Ratings | How risky the counterparty and facility are | PD grade, PD value, LGD, EAD, model version, rating date, override flag | Rating older than 12 months: regulator treats as unrated |
| Financials | The borrower's accounts | Revenue, profit, debt, equity, statement date, audited flag | Statement from 2021 used in 2026: PD model inputs stale |
| Transactions and performance | Payments and behaviour | Payment history, days past due, default date, cure date, write-off | Days past due reset by a system migration: default missed |
| Product | What kind of loan | Product code, Basel exposure class mapping, accounting classification | Wrong product code: mortgage classed as corporate, wrong risk weight |
| Reference data | The shared dictionaries | Country codes, currency rates, sector codes, rating scale mappings, calendars | Two sector code lists in use: reports disagree |

Each domain lives mostly in one source system but is used everywhere. The customer domain is the hardest, because a large corporate customer appears in the corporate lending system, the trade finance system, the derivatives system and the cash management system, often with four different identifiers.

---

## 3. Golden sources and data lineage

Back to the school. The sensible fix is to declare that the office list is **the** list of pupils. Every other department must use the office's pupil number, and if the sports department thinks a name is spelled differently, it tells the office rather than keeping its own version. The office list is the **golden source** for pupil identity.

In a bank, a golden source (also called the authoritative source or system of record) is the single system that is declared to hold the true value of a data element. Core banking is golden for balances. Collateral management is golden for collateral values. The customer master is golden for identity and hierarchy. The rating engine is golden for ratings. Nobody else may overwrite those values; they may only consume them.

Why it matters: when two reports disagree about a customer's exposure, the golden source tells you which is right and which has a broken feed. Without one, every disagreement is an argument.

**Data lineage** is the recorded path a data element takes from golden source to final report: which tables, which transformations, which filters, which joins, which calculations. Think of it as the ingredients list and recipe for every number on the report card. Regulators ask for it in two directions:

- **Backwards (forward-to-source)**: "This RWA number is 42 billion. Show me how it was built." Lineage traces it back through the engine, the warehouse, and the source systems.
- **Forwards (impact analysis)**: "This collateral feed was wrong for three months. Which reports, models and decisions were affected?"

In practice lineage is documented in a **data catalogue** or metadata tool, with each **critical data element** (a field that materially affects a regulatory or management number) mapped from source to report. Banks typically identify a few hundred critical data elements for credit risk and treat them with special care: defined, owned, quality-checked, and lineage-documented.

---

## 4. Data quality dimensions, with credit examples

Data quality is measured along a standard set of dimensions. Here they are with a credit example and a typical check for each.

| Dimension | Plain meaning | Credit example | Typical rule |
|---|---|---|---|
| Completeness | Nothing is missing that should be there | Every facility has a rating, a country, a product code, a maturity date | Percentage of facilities with null rating, by portfolio; target under 0.5% |
| Accuracy | The value is correct | The collateral value matches the latest valuation report; the balance matches the statement | Sample test against source documents; automated comparison to independent feed |
| Timeliness | The data is fresh enough | Financial statements under 18 months old; collateral revalued within policy frequency; ratings refreshed within 12 months | Count of records older than the policy threshold |
| Consistency | The same thing has the same value everywhere | Total exposure in the risk warehouse equals the general ledger within tolerance; the customer's country is the same in every system | Reconciliation differences by entity, by product |
| Uniqueness | Each real-world thing appears exactly once | One customer record per legal entity; one facility record per contract | Duplicate detection on name, registration number, address |
| Validity | The value is in the allowed set and format | Product code is in the product reference list; country code is a valid ISO code; PD between 0 and 1 | Referential integrity checks against reference data |

Worked example of why timeliness matters. A bank has a 20 million loan to a shipping company secured on a vessel. The vessel was valued at 30 million in 2022, giving a comfortable loan-to-value of 67% and a modelled LGD of 15%. Ship values have since fallen 40%; the vessel is now worth 18 million. With the stale value the bank's expected loss (PD 3%) is 3% x 15% x 20 million = 90,000. With the true value the loan is under-secured, LGD rises to perhaps 45%, and expected loss is 3% x 45% x 20 million = 270,000. The provision, the RWA and the price are all wrong by a factor of three, and nobody's formula was at fault. A timeliness rule ("vessel valuations no older than 12 months") would have flagged it.

![[22-data-quality-flow.svg]]
*The month-end data quality flow. Technical checks first, then rules by dimension, then a decision on whether breaches are tolerable, then logged adjustments and reconciliation before sign-off.*

Each rule has a **threshold** and an **owner**. A breach above threshold is logged as a data quality issue, assigned, and tracked to closure. The aggregate picture (how many rules, how many breaches, how long they take to fix) goes to a data governance committee and, for the critical elements, to the board risk committee as part of BCBS 239 reporting.

---

## 5. Reconciliation to the general ledger

The **general ledger** (GL) is the bank's official accounting record: the set of balances that produce the published balance sheet and profit and loss. Finance owns it, auditors audit it, and investors rely on it. Any risk number that describes "how much we have lent" must agree with the ledger, because the ledger is what the bank has told the world.

A reconciliation takes the total credit exposure in the risk warehouse (by legal entity, by product, by currency) and compares it to the corresponding ledger balances. Differences are classified:

| Type of difference | Example | Treatment |
|---|---|---|
| Timing | Risk snapshot taken at end of day, ledger posted next morning with late transactions | Explain and accept within tolerance |
| Scope | Ledger includes accrued interest; risk exposure excludes it (or vice versa) | Document as a known, expected difference ("reconciling item") |
| Classification | A product mapped to "corporate" in risk and "retail" in finance | Fix the mapping, re-run |
| Missing data | A new system's loans not yet feeding the warehouse | Critical: fix the feed, apply a logged adjustment meanwhile |
| Error | A feed duplicated a file, doubling one portfolio | Critical: fix, re-run, root cause |

Tolerances are set in policy (for example, 0.1% of the portfolio or a fixed monetary amount, whichever is lower; illustrative) and anything above tolerance must be explained before the numbers are released. A reconciliation that is "mostly fine" with an unexplained 200 million gap is not fine.

Reconciliation also runs in the other direction, between engines: RWA exposure must equal provisioning exposure must equal the exposure reported in large exposures. Regulators compare these returns against each other and ask about every difference.

---

## 6. BCBS 239 in plain words

In January 2013 the Basel Committee on Banking Supervision (the club of regulators described in [[basel-credit-risk-explained-simply]]) published its 239th paper, titled "Principles for effective risk data aggregation and risk reporting." Everyone calls it **BCBS 239**. It was aimed first at global systemically important banks (**G-SIBs**) with a deadline of 2016, then extended by national regulators to domestic systemically important banks and in practice to any large bank.

The origin story is simple. During the 2008 crisis, supervisors asked banks "what is your total exposure to Lehman Brothers?" and some could not answer for days or weeks, because Lehman had hundreds of legal entities, the bank dealt with them from dozens of systems, and nobody had a single aggregated view. Decisions had to be made blind. BCBS 239 says: never again.

**Risk data aggregation** means collecting, combining and summing up risk data across the whole group so that a risk can be measured at any level: one counterparty, one country, one sector, one legal entity, the whole bank. **Risk reporting** means presenting that aggregated data to the people who make decisions, accurately and on time.

The fourteen principles fall into four groups.

![[22-bcbs239-principles.svg]]
*The fourteen BCBS 239 principles. Governance and infrastructure underpin aggregation; aggregation feeds reporting; supervisors review all of it.*

**I. Overarching governance and infrastructure.**
1. **Governance.** The board and senior management own the quality of risk data. It is not an IT problem.
2. **Data architecture and IT infrastructure.** The bank must design and maintain systems that support aggregation and reporting in normal times and, critically, in a crisis.

**II. Risk data aggregation capabilities.**
3. **Accuracy and integrity.** Data should be aggregated largely automatically, reconciled, with manual intervention minimised and documented.
4. **Completeness.** All material risk, across all business lines, legal entities, asset types and regions, must be captured and aggregable.
5. **Timeliness.** Data must be available fast enough for the decision at hand. In a crisis, faster.
6. **Adaptability.** The bank must be able to answer ad hoc questions ("show me everything exposed to this country, split by maturity") and handle new requirements without rebuilding everything.

**III. Risk reporting practices.**
7. **Accuracy.** Reports must be reconciled and validated.
8. **Comprehensiveness.** Reports must cover all material risks.
9. **Clarity and usefulness.** The right level of detail for the reader; a board report is not a data dump.
10. **Frequency.** Set by the need; capable of being produced more often in stress.
11. **Distribution.** The right people get the report, and it is kept confidential.

**IV. Supervisory review.**
12 to 14. Supervisors assess compliance, can require remediation (including capital add-ons or restrictions), and cooperate across borders.

Why regulators enforce it hard: self-assessments and supervisory reviews a decade after publication found that most large banks were still not fully compliant. The European Central Bank made it a supervisory priority, inspected banks, and has used its powers to require remediation plans with board accountability. The underlying logic is that capital and liquidity rules are useless if the numbers behind them cannot be trusted. A bank that cannot aggregate its exposures cannot manage its concentrations, cannot stress test, and cannot be resolved in a crisis.

| Principle (plain version) | What a credit platform must demonstrate |
|---|---|
| Owned at the top | Named executive accountable for credit data; data quality metrics at the board risk committee |
| Built to last | Documented architecture, golden sources, no critical dependence on one person's spreadsheet |
| Mostly automated | Count and value of manual adjustments tracked and falling |
| Everything in | Every entity and product in the warehouse; a list of known gaps with closure dates |
| Fast enough | Month-end credit data within the agreed number of business days; a documented ability to produce key views within days in a crisis |
| Flexible | Ability to slice by any dimension (counterparty group, country, sector, product, rating) without a project |
| Reconciled | GL reconciliation and inter-engine reconciliation evidenced every period |

---

## 7. Data governance roles

Governance means deciding who is allowed to define, change and fix data, and who is responsible when it is wrong. The standard roles:

| Role | Who, typically | Responsibilities | Lemonade version |
|---|---|---|---|
| Data owner | A senior business executive (head of corporate credit for the corporate rating domain; chief financial officer for the ledger) | Accountable for the definition, quality and appropriate use of a domain; approves changes; signs off quality at reporting dates | The stand's owner, who decides what counts as a sale |
| Data steward | A subject-matter expert in the owner's team | Day-to-day: writes definitions, sets quality rules and thresholds, triages issues, maintains the catalogue entry | The person who keeps the sales notebook tidy and chases missing entries |
| Data custodian | Technology or the platform team | Stores, moves, secures and transforms the data as the owner specifies; operates the controls; does not decide what the data means | The one who looks after the notebook and the pens |
| Data consumer | Anyone using the data: modellers, reporters, credit officers | Uses data for its approved purpose; reports problems; does not create private copies | Everyone who reads the notebook |
| Chief data officer | A group-wide executive | Owns the framework, policy, tooling and the overall BCBS 239 programme | The headteacher who sets school-wide rules |
| Data governance committee | Owners, stewards, chief data officer, risk, audit | Approves standards, prioritises remediation, reviews quality dashboards | The staff meeting |

The platform lead is nearly always a **custodian** for most credit data and sometimes the **owner** of derived data (the warehouse's calculated fields, for instance). The distinction matters in a dispute: the custodian can say "the feed delivered what the source sent," and the owner has to decide whether what the source sent is right.

---

## 8. Common data problems in credit

These come up in every bank. Each has a typical cause and a typical fix.

**Duplicate customers.** "ACME Holdings Ltd", "Acme Holdings Limited" and "ACME HOLDINGS" set up by three relationship managers in three systems. Exposure to Acme looks like three small customers, each within limit, while the real total breaches the limit. Cause: no mandatory lookup against the customer master at onboarding. Fix: single customer master with a unique identifier, matching rules at creation, periodic de-duplication, and the legal entity identifier (a global 20-character code for legal entities) as a key where available.

**Missing group links.** Acme's subsidiary in another country is a separate customer with no parent link. The connected-client group that [[14 Risk Appetite, Limits and Concentration]] and the large exposures rule depend on is incomplete. Cause: hierarchy maintained manually from annual reports, or not at all for small customers. Fix: hierarchy as part of the golden customer master, sourced from external corporate data providers where possible, reviewed at annual credit review.

**Stale collateral.** Property last valued five years ago; vessel not revalued since purchase; shares pledged with a price from the day of the pledge. Cause: no revaluation workflow; valuation held as a free-text field. Fix: valuation date as a mandatory field, policy-driven revaluation schedules, automated indexation for residential property, timeliness rules with owners.

**Unrated counterparties.** Facilities with no PD grade, or a grade more than a year old. Under the capital rules an expired rating pushes the exposure into a conservative treatment, and under IFRS 9 it makes staging unreliable. Cause: annual review backlog; new customers booked before rating completed. Fix: a block on drawdown without a current rating, and a monitoring report of expiring ratings sixty days ahead.

**Wrong product codes.** A new product is launched and mapped to the nearest existing code. A buy-to-let mortgage classed as owner-occupied; a revolving facility classed as term; a guarantee classed as a loan. Every downstream classification (exposure class, CCF, accounting treatment) is then wrong. Cause: product launch process does not include risk data mapping sign-off. Fix: product reference data owned jointly by product, finance and risk, with a mapping table that is itself change-controlled.

**Manual adjustments.** At month-end an analyst notices the warehouse exposure for one portfolio is missing 300 million, adds it in a spreadsheet, and the report goes out. Next month the feed is fixed and the adjustment is still applied, doubling the portfolio. Cause: no adjustment log; no expiry. Fix: an **adjustments register** inside the reporting layer: every adjustment has a reason, an owner, an approver, an expected expiry, and appears in a monthly report of all adjustments with their total value. BCBS 239 Principle 3 is almost entirely about this.

**Other regulars:** days past due counters reset by migrations; currency conversion at the wrong rate or date; facilities with maturity dates in the past still showing as live; off-balance sheet items with no undrawn amount captured; sector codes from three different classification schemes; and the eternal mismatch between the risk view (by counterparty) and the finance view (by account).

---

## 9. Batch versus real-time, and the month-end run

Most credit risk data moves in **batch**: once a day, or once a month, a job extracts a snapshot of a system and loads it to the warehouse. This is cheap, robust and perfectly adequate for regulatory capital, which is measured at quarter-ends, and for provisions, which are booked monthly.

Some things need to be closer to **real-time**: limit checks at the moment a trade is booked (so the trader is stopped before the breach, not told about it next month), counterparty exposure on derivatives (which moves with the market every minute), early warning triggers in [[15 Monitoring, Early Warning and Watchlist]], and fraud. These run on event-driven feeds or intraday calculation, usually in the operational systems rather than the warehouse.

The **month-end run** is the heartbeat of the credit data world. A typical timetable, which varies enormously by bank (illustrative):

| Business day after month-end | Activity |
|---|---|
| Day 0 (last calendar day) | Source systems close; snapshots taken overnight |
| Day 1 to 2 | Warehouse loads; technical checks (files arrived, row counts, schema) |
| Day 2 to 4 | Data quality rules run; issues triaged; adjustments logged |
| Day 4 to 6 | Rating refresh and model runs; provisioning engine runs; GL reconciliation |
| Day 6 to 8 | Capital engine runs; inter-engine reconciliation; variance analysis |
| Day 8 to 10 | Management information published; adjustments reviewed |
| Quarter-end plus 20 to 45 days | Regulatory returns validated, attested and submitted (deadlines vary by return and country) |

**Quarter-end** is the month-end that also feeds regulatory returns and published accounts, so it has more checks, more sign-offs and far less tolerance for error. Year-end adds the external audit. A platform must be able to **re-run** any step for a prior period, because errors found on day 7 require the engines to go again, and errors found after submission require a restated run with full lineage.

---

## 10. Change management and testing in a regulated environment

In a lemonade stand you can change your recipe whenever you like. In a bank, a change to a data feed, a mapping table or an engine can change the regulatory capital number, and regulators want to know that every such change was intended, tested, approved and recorded.

The standard controls:

- **Separate environments**: development, system testing, user acceptance testing (UAT, where the business confirms the change does what they asked), pre-production (a copy of production for final checks), and production. Code moves forward only through an approved release.
- **Segregation of duties**: the person who writes a change does not approve it, and does not deploy it to production.
- **Change classification**: standard (pre-approved, low risk, such as adding a reference code), normal (reviewed by a change advisory board), emergency (deployed fast with retrospective review and extra scrutiny).
- **Regression testing**: a golden test set of inputs with known outputs, re-run after every change, with any difference explained. For a capital engine this means a frozen portfolio whose RWA must not move unless the change was supposed to move it.
- **Parallel runs** for material changes: old and new in parallel for one or more periods, with differences reconciled to the item level.
- **Impact analysis using lineage**: before changing a field, list every report, model and return that consumes it.
- **Evidence retention**: test plans, results and approvals kept for the regulatory retention period, because inspectors ask "show me the testing for the change you made in March 2024."
- **Release freezes** around quarter-end and year-end, because a broken deployment on the day of the capital run is a very bad day.

Regulators also expect **vendor changes** to go through the same discipline. A rating engine's annual upgrade from the vendor is a change; so is a cloud provider's update to a managed database.

---

## 11. Cloud and vendor platforms

Twenty years ago a bank built nearly everything itself. Today much of the landscape in section 1 is bought: origination systems, collateral systems, capital and provisioning engines, regulatory reporting tools, data catalogues, and the infrastructure under all of them from cloud providers.

The regulatory lens, generically (details vary by country and are changing):

- **Outsourcing rules.** A bank remains fully responsible for anything it outsources. It must assess the vendor, document the arrangement, have exit plans, be able to audit the vendor (or rely on recognised audit reports), and notify or seek approval from the regulator for material outsourcing of critical functions.
- **Operational resilience.** Regulators ask what happens if the vendor or cloud region fails. The bank must identify important business services (producing regulatory capital numbers is one), set tolerances for disruption, and test them.
- **Data location and access.** Rules on where customer data may be stored and who may access it differ by country. Credit data often includes personal data (retail borrowers) and so sits under data protection law as well as banking law.
- **Concentration.** Supervisors worry that many banks depend on the same few cloud providers, and in the European Union a regime for the direct oversight of critical technology providers has been introduced.

For the platform, the practical implications are: understand which parts of the pipeline are vendor-run and what evidence you can obtain from them; keep lineage and reconciliation working across the boundary (a vendor engine is a black box to a regulator unless you can show inputs, parameters and outputs); keep an exit option credible; and do not assume a vendor's "regulatory compliant" label means the configuration you deployed is compliant.

---

## 12. What good looks like

A credit risk data platform in good shape has these properties, which also serve as a checklist for a new platform lead:

1. **One customer master** with unique identifiers and group hierarchy, used by every lending system, with external identifiers where available.
2. **Declared golden sources** for every critical data element, documented in a catalogue with definitions, owners, stewards and quality rules.
3. **End-to-end lineage** from source to regulatory return for every critical data element, queryable both backwards and forwards.
4. **Automated data quality** rules across all six dimensions, with thresholds, owners, a tracked issues log, and a trend that improves.
5. **An adjustments register** in which every manual intervention is visible, approved, explained and expiring, with the total falling period by period.
6. **Reconciliation** to the general ledger and between engines, every period, with differences explained before release.
7. **Re-runnable, versioned month-end** so that any period can be reproduced with the data, code and parameters of the time (the same reproducibility demand as in [[21 Model Risk Management and Validation]]).
8. **Flexible aggregation** so that a question like "all exposure to counterparties in this sector in these three countries, by maturity bucket, ultimate risk basis" takes hours, not weeks.
9. **A crisis playbook** that shows how key views can be produced within days if a major counterparty or country fails.
10. **Board-level visibility** of data quality metrics, with a named accountable executive.

---

## 13. Common mistakes and misunderstandings

- **"Data quality is an IT problem."** BCBS 239 Principle 1 says the opposite: the business owns the meaning and quality of its data; technology is the custodian.
- **"We will fix the data in the warehouse."** Fixing downstream creates a second version of the truth. Fix at the golden source and let the fix flow.
- **"The spreadsheet adjustment is temporary."** They never are, unless they have an expiry date and someone is measured on removing them.
- **"We reconcile to the ledger, so the data is right."** Reconciliation proves the totals agree. It does not prove the ratings, the collateral values or the group links are right. Totals can be perfect while every attribute is wrong.
- **"Real-time is always better."** For regulatory capital and provisions it adds cost and fragility without benefit. Match the latency to the decision.
- **"BCBS 239 only applies to the biggest banks."** Formally, yes at first. In practice supervisors apply its logic to everyone, and it is the standard any inspection is measured against.
- **"The vendor is responsible for the engine."** The bank is responsible. The vendor is a supplier.
- **"Lineage is a document."** A lineage document written once is wrong within a quarter. Lineage must be maintained, ideally generated from the pipeline itself.
- **"More data quality rules is better."** Thousands of rules with no owners and no thresholds produce noise. A few hundred rules on critical elements, each with an owner, produce action.
- **"The month-end run is a finance thing."** Credit risk data is the input to everything finance produces. If the run is late or wrong, it is a credit risk problem first.

---

## 14. What a platform lead needs to know about this

This whole note is your territory, so this section is about priorities and ownership rather than new content.

**Know the landscape before changing it.** Draw the real version of the diagram in section 1 for your bank: every system, every feed, every manual step, every spreadsheet that sits in the path to a regulatory number. The manual steps and spreadsheets are where the risk is. This map is also the first thing a BCBS 239 inspection asks for.

**Identify the critical data elements and their owners.** If the bank has done this, get the list and check it against reality. If it has not, start with the fields that drive RWA, expected credit loss and large exposures: identifiers, hierarchy, exposure, product, rating, collateral value and date, country, sector, default status.

**Measure before you remediate.** Put the six quality dimensions on a dashboard with the current breach counts, the adjustments register with its total value, and the reconciliation differences. Trends are what the board and the regulator will watch.

**Own the custodian controls fully.** Access control, environment separation, change management, segregation of duties, backup, evidence retention, and the ability to re-run any period. These are the controls that audit and the regulator will test directly on the platform.

**Build lineage into the pipeline.** Metadata captured by the pipeline as it runs (which job read which table and wrote which output, with which code version) stays correct. Documents do not.

**Design for the crisis question.** Ask yourself: if a major counterparty failed on Tuesday, could the bank say by Thursday what its exposure was, on an ultimate risk basis, including derivatives, across every entity? If not, that is a BCBS 239 gap and probably the most valuable project you could run.

**Who owns what.**

| Thing | Owner | Platform role |
|---|---|---|
| Meaning and quality of customer, facility, collateral, rating data | Business data owners (credit, operations) | Custodian: store, move, check, report |
| Data quality rules and thresholds | Data stewards in owner teams | Implement, run, report breaches |
| Golden source designation and catalogue | Chief data officer and governance committee | Maintain the catalogue tooling and lineage capture |
| Month-end run and re-runs | Platform (with finance and risk reporting) | Own fully, including the timetable and evidence |
| GL reconciliation | Finance (with risk reporting) | Provide the data and the reconciliation tooling |
| Adjustments register | Risk reporting | Provide the tooling, enforce expiry, report totals |
| Change and release management | Platform and technology governance | Own fully |
| Vendor and cloud arrangements | Technology with procurement and outsourcing governance | Operate within the rules, keep lineage across the boundary |
| BCBS 239 self-assessment and remediation | Chief data officer and chief risk officer | Provide evidence; deliver the technical remediation |

---

## 15. Related notes

- [[03 The Credit Lifecycle]]: where each piece of data is created.
- [[10 Internal Ratings, Scorecards and PD Models]], [[11 Collateral and Security]] and [[14 Risk Appetite, Limits and Concentration]]: the three domains that cause the most data problems.
- [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]], [[18 Regulatory Capital and Basel - the Short Version]] and [[20 Stress Testing and ICAAP]]: the engines that consume the data.
- [[19 Counterparty Credit Risk and Derivatives]]: the part of the landscape that needs intraday data.
- [[21 Model Risk Management and Validation]]: the same lineage and reproducibility demands from the model side.
- [[23 Reporting - Regulatory Returns, Pillar 3 and Management Information]]: what the pipeline ultimately produces.
- [[26 Sovereign, Bank and Country Risk]]: country exposure aggregation as a worked case of the crisis question.
- [[27 A Platform Lead's First 90 Days]] and [[28 Master Glossary]].
- [[basel-credit-risk-explained-simply]] and [[basel-credit-risk-decision-tree]]: the regulatory background.
