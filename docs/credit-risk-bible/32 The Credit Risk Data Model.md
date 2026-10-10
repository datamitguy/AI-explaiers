# The Credit Risk Data Model

**Why this matters to you.** Every number a credit risk platform produces (a capital figure, a provision, a limit breach, a line in a regulatory return) comes from joining a handful of things: who the borrower is, which group they belong to, what the bank has promised to lend, how much has actually been borrowed, what security the bank holds, how risky the borrower is thought to be, and which regulatory bucket the loan falls into, all as at a particular date. The **data model** is the agreed shape of those things and the links between them. If you know data but not credit, this note turns credit vocabulary into entities, keys and relationships you can reason about. [[22 Credit Risk Data, Systems and BCBS 239]] described the systems, golden sources and quality rules; this note goes one level down, into the entities themselves, how they relate, how time works, and how one wrong link moves capital or provisions. When a regulator asks you to reproduce last March's numbers, or finance asks why capital rose 40 million overnight, the answer is almost always somewhere in this model.

## Table of contents

1. [The library version](#the-library-version)
2. [What a data model is](#what-a-data-model-is)
3. [The big picture: entities and relationships](#the-big-picture-entities-and-relationships)
4. [Parties and counterparties](#parties-and-counterparties)
5. [Group hierarchies and connected parties](#group-hierarchies-and-connected-parties)
6. [Facilities and limits](#facilities-and-limits)
7. [Exposures, transactions and drawdowns](#exposures-transactions-and-drawdowns)
8. [Collateral and the many-to-many allocation](#collateral-and-the-many-to-many-allocation)
9. [Guarantees and credit protection](#guarantees-and-credit-protection)
10. [Ratings and risk parameters](#ratings-and-risk-parameters)
11. [Financial statements and covenants](#financial-statements-and-covenants)
12. [Provisions, stages, write-offs and recoveries](#provisions-stages-write-offs-and-recoveries)
13. [Regulatory classification fields](#regulatory-classification-fields)
14. [Reference data](#reference-data)
15. [The time dimension](#the-time-dimension)
16. [Keys, identifiers and the mapping pain](#keys-identifiers-and-the-mapping-pain)
17. [Granularity: facility, exposure or account](#granularity-facility-exposure-or-account)
18. [Critical data elements and their quality checks](#critical-data-elements-and-their-quality-checks)
19. [Worked example: one loan from source to risk-weighted assets](#worked-example-one-loan-from-source-to-risk-weighted-assets)
20. [Common data problems and what they do to the numbers](#common-data-problems-and-what-they-do-to-the-numbers)
21. [Common mistakes and misunderstandings](#common-mistakes-and-misunderstandings)
22. [What a platform lead needs to know about this](#what-a-platform-lead-needs-to-know-about-this)
23. [Related notes](#related-notes)

## The library version

Think of a school library. To run it you need several lists that point at each other:

- **Members**, each with a library card number.
- Which members are in the same **family**, because one family may borrow at most 20 books at once.
- Each member's **allowance**: Year 7 can take 3 books, teachers 10, and some have a separate DVD allowance.
- The **loans**: which book, which member, when due back, how many days overdue.
- **Deposits**: one parent has left a single 20 pound deposit to cover all three of her children.
- A **trust score** for members who always return books late.
- A **snapshot** at the end of each term, so the head teacher can see in May how many books were out on 31 March.

Now imagine two brothers with different surnames on their cards are never linked, so the family rule is broken unnoticed. Or the 20 pound deposit is counted in full against each child, so the library thinks it holds 60 pounds. Or the end-of-term snapshot is regenerated in May and quietly includes a book lent on 2 April. None of these are arithmetic mistakes. They are **model** mistakes: the wrong link, the wrong count, the wrong date. A bank's credit data model is this library with borrowers for members, facilities for allowances, collateral for deposits and ratings for trust scores.

## What a data model is

A **data model** describes the things (**entities**) an organisation keeps track of, the facts about them (**attributes**) and the links between them (**relationships**). It exists at three levels: **conceptual** (what things exist: "a counterparty has many facilities"), **logical** (attributes, keys and rules: "committed amount must not be negative") and **physical** (tables, columns, partitions by as-of date). This note works at the first two.

Most banks have no single physical model. Each source system has its own, and the risk data platform (see [[33 Platform Architecture and Vendor Landscape]]) builds a **conformed** model on top into which every source is translated. Vendor engines ship their own input models, and some regulators publish granular loan-level data dictionaries (the European AnaCredit dataset is one); both are useful checklists even if you never adopt them wholesale.

**Cardinality** means "how many of these go with how many of those":

| Cardinality | Plain meaning | Credit example |
|---|---|---|
| One to one | Each A has exactly one B | Each exposure has one regulatory exposure class per snapshot |
| One to many | Each A has several B; each B belongs to one A | One counterparty, many facilities |
| Many to many | Each A links to several B and vice versa | One property secures three loans; one loan is secured by two properties |

Many-to-many relationships need a **link table** (bridge table) in the middle, and in credit that link table usually carries important numbers of its own.

## The big picture: entities and relationships

![[32-entity-relationships.svg]]
*The core entities of a credit risk data model. The three dark blue boxes (party, facility, exposure) are the spine; everything else hangs off them. Collateral and facilities meet through an allocation table, and every record is stamped with an as-of date from the time dimension.*

The **spine** is three entities: the **party** (who the bank is exposed to), the **facility** (what the bank has agreed to lend) and the **exposure** (what is actually owed now). Around it sit entities that describe risk (ratings, parameters, financial statements, covenants), entities that reduce risk (collateral, guarantees and allocations), entities that record outcomes (provisions, write-offs, recoveries), the regulatory classification, and two cross-cutting layers: **reference data** and **time**.

| Relationship | Cardinality | Why it matters |
|---|---|---|
| Party to group relationship | One party can have one parent and many children | Aggregation for limits and large exposures |
| Party to facility | One to many (occasionally many to many for joint borrowers) | Exposure per borrower |
| Facility to exposure | One to many (several drawdowns or accounts) | Drawn versus undrawn, past due |
| Facility to collateral | Many to many, through an allocation | Loss given default and capital relief |
| Guarantee to facility | One guarantee can cover several facilities | Substituting the guarantor's risk |
| Party to rating | One to many over time, one current at any date | Probability of default |
| Exposure to provision and classification | One per reporting period | Expected credit loss, risk weights, returns |

## Parties and counterparties

**Party** is the generic term for any person or organisation the bank deals with. A **counterparty** is a party to which the bank has credit exposure: a borrower, a guarantor, a derivatives counterparty, a bond issuer. Calling the entity "customer" misleads: a guarantor may never be a customer, and someone with only a deposit is not a credit counterparty.

| Attribute | Example value | Why credit cares |
|---|---|---|
| Internal party identifier | P-0004417 | Joins everything |
| Legal entity identifier (LEI): a global 20-character code for legal entities | 549300XXXXXXXXXXXX12 (illustrative) | Unambiguous identity; required in many regulatory reports |
| Legal name and registration number | Northwind Logistics Ltd, 01234567 | Matching, legal documents |
| Party type | Company (versus individual, bank, public body, special purpose vehicle) | Drives exposure class and model choice |
| Know your customer (KYC) status | Approved, review due 2027-01-31 | No drawdown without valid identity and anti-money laundering checks |
| Industry sector code | NACE (the European classification of economic activities) H49.41, road freight | Sector concentration, climate risk, model selection |
| Country of incorporation | United Kingdom | Legal jurisdiction, reporting |
| Country of risk | United Kingdom | Country limits; see [[26 Sovereign, Bank and Country Risk]] |
| Size | Turnover 85m | Small and medium-sized enterprise (SME) treatment |
| Default status and date | Not in default | Drives everything from probability of default of 100% to stage 3 |

Two points trip up newcomers. **Country of incorporation versus country of risk**: a Cayman Islands company owning ships run from Greece is legally Cayman but economically Greek shipping. Concentration reports use country of risk; legal reports use incorporation. **Default is mostly a party attribute**: for corporates, if one loan defaults all the borrower's loans are treated as defaulted, whereas for retail many jurisdictions allow default per facility. So the model must hold default status on the party and, where needed, on the exposure. See [[16 Problem Loans, Restructuring and Recovery]].

## Group hierarchies and connected parties

Big borrowers are families of companies. A problem in one member usually spreads to the others, and the rules on **large exposures** and **concentration** (see [[14 Risk Appetite, Limits and Concentration]]) cap lending to a whole group, not one company.

![[32-group-hierarchy.svg]]
*An example group. Northwind Holdings is the ultimate parent. Logistics, Property and (through Logistics) Freight are controlled, so they belong to the connected group. Coastal Packaging has independent owners but depends on Logistics for most of its sales, so it joins through economic dependence. Harbour Fuels is only 30% owned and not controlled, so here it is its own group.*

| Relationship type | Plain meaning | Stored as | Example |
|---|---|---|---|
| Direct parent | The company that owns or controls this one | Parent identifier, ownership %, control flag, effective dates | Logistics is direct parent of Freight |
| Ultimate parent | The top of the chain | Derived by walking up, or stored and refreshed | Holdings, for Logistics, Property and Freight |
| Control | Power to direct the company, usually majority votes but also board rights or agreements | A control flag, not just a percentage | Holdings controls Property at 75%, not Harbour at 30% |
| Economic dependence | If one fails, the other very likely struggles, even without ownership | Relationship record with reason and approver | Coastal depends on Logistics as main customer |
| Guarantor link | One party has guaranteed another's debts | Guarantee record (see below) | Holdings guarantees Property's loan |

The resulting **connected group** is a **graph**, not a tree: Coastal shares no owner with Northwind but is still in the group.

**Worked aggregation.** Suppose Tier 1 capital (the highest quality capital, see [[18 Regulatory Capital and Basel - the Short Version]]) is 90 million and the large exposure limit is 25% of Tier 1, so 22.5 million (25% is the Basel standard for most counterparties; the capital figure is illustrative).

| Group member | Exposure (millions) | Included because |
|---|---|---|
| Northwind Holdings plc | 2.0 | Ultimate parent |
| Northwind Logistics Ltd | 12.0 | Controlled, 100% |
| Northwind Property Ltd | 5.0 | Controlled, 75% |
| Northwind Freight GmbH | 3.0 | Controlled through Logistics |
| Coastal Packaging Ltd | 1.5 | Economic dependence |
| **Connected group total** | **23.5** | Above the 22.5 limit: a breach |
| Harbour Fuels Ltd | 4.0 | Not included |

Now suppose Coastal's dependence record was never entered: the total is 22.0 million and the system reports compliance. Or Freight was set up in the German booking system with no parent link: 20.5 million. One missing row in a relationship table hides a regulatory breach. Hierarchies change with acquisitions and disposals, so links need effective dates. External data providers sell ownership trees, and the global LEI system publishes parent relationships for entities that report them, but neither captures economic dependence, which is a credit officer's judgement and must be recorded with a reason and an approver.

## Facilities and limits

A **facility** is the contract under which the bank agrees to lend: "up to 10 million, in sterling, for five years, on these terms". It is the library allowance. A **limit** is the approved maximum; often the same as the facility amount, but limits also sit above facilities (borrower and group limits) and inside them (sub-limits). See [[04 Commercial and Corporate Lending]] and [[12 Loan Documentation, Covenants and Conditions]].

| Attribute | Example value | Why it matters |
|---|---|---|
| Facility identifier, borrower | F1, P-0004417 | Joins exposures, collateral, parameters |
| Product code | RCF-CORP-01 (revolving credit facility) | Drives conversion factor, exposure class, accounting |
| Committed or uncommitted | Committed: the bank must lend on request if conditions are met | Committed undrawn amounts attract capital |
| Unconditionally cancellable flag | No | Changes the conversion factor dramatically |
| Limit amount and currency | 10,000,000 pounds sterling (GBP) | Utilisation, undrawn amount |
| Availability end and maturity dates | 2030-06-30 | Tenor (length of the loan) for capital and loss models |
| Repayment profile | Revolving (versus bullet or amortising) | Exposure path for expected credit loss |
| Sub-limits | Up to 2m of the 10m as letters of credit | Different conversion factors per use |
| Parent limit identifier | Group limit L-NW-01 | Limit aggregation |
| Approval reference | CA-2025-0912, credit committee | Audit trail; see [[13 Credit Governance - Committees, Authorities and the Three Lines]] |

**Limit trees** nest like Russian dolls: group limit, borrower limit, facility limit, sub-limit. The model must store the tree and whether a child's usage counts against its parent fully, partially or not at all, or utilisation is double or under counted.

## Exposures, transactions and drawdowns

The **exposure** is what is actually at risk now: the books out on loan, not the allowance. A facility may have several **drawdowns** (tranches drawn at different times or currencies); in retail each card or mortgage is an **account**.

| Attribute | Example value |
|---|---|
| Exposure identifier, facility | DD-778201-03, F1 |
| Outstanding principal (drawn) | 6,000,000 |
| Undrawn amount | 4,000,000 |
| Accrued interest | 50,000 (earned but not yet paid) |
| Fees due | 0 |
| Past due amount and days past due (DPD) | 0, 0 |
| Off-balance sheet type | Undrawn commitment (others: guarantees issued, letters of credit) |
| Accounting classification and carrying amount | Amortised cost; 6,050,000 |
| General ledger account | 141200 Corporate loans |

**Days past due** is the main signal for default (90 days past due on a material amount is the standard backstop, with materiality thresholds varying by jurisdiction) and for staging under IFRS 9 (International Financial Reporting Standard 9), where 30 days past due is a backstop for a significant increase in credit risk. It must survive migrations and restructurings: a counter reset to zero silently cures every arrears case in a portfolio. See [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]].

**Undrawn is not always limit minus drawn.** After the availability period ends, nothing more can be drawn. If the borrower breaches a condition, the bank may not be obliged to lend. Sub-limits may need different conversion factors. Store undrawn as its own derived attribute with a documented rule.

## Collateral and the many-to-many allocation

Collateral is what the bank can take if the borrower does not pay; the concepts are in [[11 Collateral and Security]]. The data difficulty is that collateral and facilities link **many to many**: one property can secure three loans (often under an "all monies" charge), and one loan can be secured by a property, cash and shares. It is the parent's single 20 pound deposit for three children: the library must know how much stands behind each child and never count it three times.

![[32-collateral-allocation.svg]]
*Collateral allocation for one borrower. Three collateral items cover three facilities through seven allocation links. Each item's allocations add up to no more than its value (the warehouse has 2.0m left over), and the cash deposit is split between the revolving facility and the overdraft.*

| Entity | Key attributes | Example |
|---|---|---|
| Collateral item | Identifier, type, provider party, market value, valuation date and method, currency, charge rank, legal perfection status | C2: cash deposit, 2.0m GBP, held at the bank |
| Collateral allocation (link table) | Collateral, facility, allocated amount or %, priority, method, effective dates | C2 to F1: 1.5m; C2 to F3: 0.5m |
| Valuation history | Collateral, value, date, source | C3: 6.0m at 2026-03-31, desktop valuation |

**Allocation methods.** When documents say "all monies", any item could cover any facility, so the bank chooses:

| Method | How it works | Pros and cons |
|---|---|---|
| Fixed by agreement | Follows the legal documents | Accurate but not always possible |
| Pro rata | In proportion to exposure | Simple and neutral |
| Optimised | An engine allocates to minimise capital, for example cash to the highest risk weight | Lowest capital; must be defensible and stable |
| Priority order | First to the facility the collateral was taken for | Matches credit intent |

Whatever the method, three rules must hold, and each is a data quality check: one item's allocations must not exceed its (haircut-adjusted) value; a facility should not be allocated far more collateral than it needs, because the excess could protect something else; and every active collateral item should be allocated somewhere or explained.

**Eligibility is separate from existence.** Under the standardised approach, a debenture over receivables and stock (C1) is real security that reduces expected loss, but it is generally not eligible **credit risk mitigation** (CRM) for capital. Store eligibility per item and per approach. See [[basel-credit-risk-explained-simply]] for eligible types.

## Guarantees and credit protection

A **guarantee** is a third party's promise to pay if the borrower does not; credit derivatives and credit insurance work similarly. Eligible protection usually lets the bank **substitute** the guarantor's risk weight or probability of default on the covered part. See [[08 Trade Finance and Guarantees]] and, for portfolio protection, [[36 Credit Portfolio Management and Risk Transfer]].

| Attribute | Example |
|---|---|
| Protection identifier and type | G-0091, parent company guarantee |
| Provider party | P-0000001 Northwind Holdings plc |
| Covered facilities and amounts | Property's loan, up to 5.0m |
| Cover type, currency, maturity | Full, GBP, to 2029-12-31 |
| Eligibility flags | Intra-group guarantees are often not recognised for capital |

The guarantor is itself a **party** and must be identified and rated. A guarantee from an unrated or unlinked provider gives no capital relief, and never appears in that guarantor's own exposure aggregation.

## Ratings and risk parameters

### Internal ratings

An **internal rating** is the bank's own view of how likely a borrower is to default, as a **grade** mapped to a **probability of default** (PD) over one year. See [[10 Internal Ratings, Scorecards and PD Models]].

| Attribute | Example | Notes |
|---|---|---|
| Rating identifier and rated party | R-2026-118734, P-0004417 | Every rating is a new record, never an update in place |
| Model and version | Corporate Large v4.2 | Essential for reproduction and monitoring |
| Model grade, override grade and reason | 6, then 7: "pending litigation" | Overrides recorded, approved, monitored |
| Final grade and PD | 7, 0.40% | From the master scale valid on that date |
| Rating and approval dates, approver | 2026-02-14, 2026-02-20, credit officer | Stale after policy period (often 12 months) |
| Financial statement used | FS-2025-12-P0004417 | Links to the spread |

### External ratings

Ratings from agencies (an **external credit assessment institution**, ECAI, in Basel language) are stored separately: agency, issuer or issue, long or short term, grade, date. Under the standardised approach they set risk weights through a mapping table. When agencies disagree, Basel takes the worse of two, or the second best of three or more, so store them all, not one "external rating" field.

### Loss given default and exposure at default parameters

**Loss given default** (LGD) is the share of exposure lost if default happens, after recoveries. **Exposure at default** (EAD) is the amount owed at default; for undrawn commitments it uses a **credit conversion factor** (CCF), the share of the undrawn amount expected to be drawn first. Foundation internal ratings-based (IRB) banks take LGD and CCF from regulation; advanced IRB banks estimate them where still permitted.

Store parameters with their **purpose**. Capital PD and LGD (through-the-cycle, downturn) are not the numbers for IFRS 9 expected credit loss (point-in-time, forward-looking) or for stress testing. A single "PD" column shared by every engine is a common and serious design error.

## Financial statements and covenants

**Financial statements** are **spread** by analysts into a standard template (revenue; earnings before interest, tax, depreciation and amortisation, called EBITDA; total debt; equity). The record holds party, period end, statement type (audited, interim, projected), consolidation level, currency and **units** (thousands versus units is a classic error), the spread lines and the template version. See [[09 Credit Analysis - Reading a Borrower]].

**Covenants** are promises in the loan agreement, such as "total debt to EBITDA at most 3.5 times". The record holds facility, definition, threshold, test frequency, next test date, last value (31,000 / 9,800 = 3.16, passed) and waiver or breach status. See [[12 Loan Documentation, Covenants and Conditions]]. Breaches feed early warning and staging, so covenants tested only in a spreadsheet never reach the models.

## Provisions, stages, write-offs and recoveries

**Provisions** are money set aside for expected losses. Under IFRS 9 each exposure is in **stage** 1 (performing, 12-month loss), 2 (significant increase in credit risk, lifetime loss) or 3 (credit-impaired). The United States current expected credit loss standard (CECL) has no stages.

| Entity | Key attributes |
|---|---|
| Provision | Exposure, period, stage and reason, expected credit loss (ECL), scenario weights, model versions, overlay |
| Stage history | Stage, date in, date out, trigger |
| Default event | Party or exposure, default date, trigger (90 days past due or unlikely to pay), cure date |
| Write-off | Exposure, date, amount, full or partial, whether recovery is still pursued |
| Recovery | Exposure, date, amount, source (collateral sale, guarantor, borrower), costs |

Write-offs and recoveries are the raw material for LGD models. Each recovery must link to the defaulted exposure and its default date, with costs, or the bank's loss history (and future LGD estimates) will be wrong for years.

## Regulatory classification fields

These record how each exposure is treated for capital. They are derived, mostly by the capital engine, but stored per exposure and per snapshot so returns and reconciliations can use them.

| Field | Example value |
|---|---|
| Regulatory approach | Standardised (or foundation or advanced IRB) |
| Exposure class | Corporate (others: sovereign, bank, SME, retail, mortgage, real estate, equity) |
| CCF applied | 40% |
| CRM eligibility per item | Cash eligible; debenture not eligible |
| Exposure after CRM | 6,150,000 |
| Rating source used | External agency, A- |
| Risk weight and risk-weighted assets (RWA) | 50%, 3,075,000 |
| Large exposures group | NW-01 |

The decision logic for class and approach is in [[basel-credit-risk-decision-tree]]. Classification combines party, product and collateral attributes, which is why one wrong product code or party type silently moves an exposure into another class.

## Reference data

**Reference data** is the shared code lists every entity uses: the dictionaries of the model.

| Reference set | Contents | Example of trouble |
|---|---|---|
| Products | Codes mapped to exposure class, CCF, accounting treatment | New product mapped to the nearest existing code |
| Currencies | International Organization for Standardization (ISO) 4217 codes | Legacy codes for currencies that no longer exist |
| Foreign exchange (FX) rates | Rate per currency, date and type (closing, average) | Rate for the wrong date; average rate used for balances |
| Countries | ISO 3166 codes, regions, sovereign ratings | Old codes after a country splits |
| Industry codes | NACE, Standard Industrial Classification (SIC), national schemes, mappings between them | Three schemes in use across systems |
| Rating scales | Grade to PD master scale; agency mappings | Master scale recalibrated without versioning |
| Collateral types | Eligibility, haircuts, revaluation frequency | New type with no eligibility rule |
| Bank legal entities and calendars | Booking entity; business days | Exposure in the wrong entity's return |

Reference and mapping tables need the discipline of code: owners, change control, effective dates and versions, because changing a mapping changes capital as surely as changing the engine.

## The time dimension

### As-of dates and snapshots

Credit numbers are always "as at" a date. The **as-of date** is the moment the numbers describe. The simplest history is a **snapshot**: at each month-end, copy everything and stamp it with the as-of date. Most risk warehouses do this. The weakness is that a snapshot records what the bank **believed** on the day, and beliefs change.

### Valid time and knowledge time

On 15 March the credit committee raised Northwind Logistics' revolving facility from 10 million to 12 million. Operations keyed it into the limit system on 8 April. The first quarter capital return, as at 31 March, was produced on 6 April. Two times are now in play:

- **Valid time** (effective or business time): when the fact was true in the world. The limit was 12 million from 15 March.
- **Knowledge time** (transaction or system time): when the bank's systems knew it. From 8 April.

A model storing both is **bitemporal**:

| Facility | Limit | Valid from | Valid to | Recorded from | Recorded to |
|---|---|---|---|---|---|
| F1 | 10,000,000 | 2025-06-30 | 2026-03-14 | 2025-06-30 | (open) |
| F1 | 10,000,000 | 2026-03-15 | (open) | 2025-06-30 | 2026-04-08 |
| F1 | 12,000,000 | 2026-03-15 | (open) | 2026-04-08 | (open) |

| Question | Query | Answer |
|---|---|---|
| What did we report for 31 March? | Valid on 31 March, as known on 6 April | 10,000,000 |
| What was true on 31 March, as we know today? | Valid on 31 March, as known today | 12,000,000 |

The first is what a regulator asks when inspecting a submitted return. The second is what you ask when deciding whether to resubmit. A snapshot answers the first only if never rebuilt; a "current state" table answers neither.

### Why reproducing a past quarter matters

| Who asks | What they want |
|---|---|
| Supervisors | Reproduce a submitted return line by line, with the engine version and configuration used |
| External auditors | Re-perform year-end provisions for a sample of loans |
| Model validators | Backtest: what grade did each defaulter have a year before default? |
| Finance | Explain capital movement between quarters |
| You, after an error | Rerun with corrected data and show the difference without destroying the original |

Rules of thumb: never update history in place, insert a new version; stamp every result with as-of date, run identifier, input snapshot and model and configuration versions; keep data for the regulatory retention period, which varies by jurisdiction. Reproducibility is a design property, not something added after the first inspection.

## Keys, identifiers and the mapping pain

Every entity needs a **key** identifying one record only. In banking, every system has its own:

| System | Identifier for Northwind Logistics |
|---|---|
| Customer master | P-0004417 |
| Core banking | 004417-01 |
| Loan origination | APP-NW-2025-118 |
| Trade finance | NWLOGLTD |
| Derivatives | CPTY-88214 |
| Collateral system | CLT-CUST-5512 |
| Rating engine | OBL-118734 |

The platform keeps **cross-reference tables** from each source key to the master key. Keep the **source key** for lineage, use a **surrogate key** (a meaningless platform-generated identifier) internally, use **natural keys** such as registration numbers for matching, and use the LEI where it exists (individuals and most small companies have none).

Why it hurts:

- **Duplicates and false merges**: one company under two master records understates concentration; two companies wrongly merged attach the wrong ratings.
- **Key reuse**: some old systems recycle account numbers, so history joins to the wrong customer.
- **Migrations**: every key changes, and the old-to-new table must be kept forever.
- **Mergers**: two banks' customer masters must be reconciled record by record.
- **Late mapping**: a new facility arrives before its customer is mapped and sits in an "unmapped" bucket outside group aggregation.

Measure **mapping coverage** (the share of exposure value whose party maps to a master record with a hierarchy) every run, and treat unmapped exposure above a small threshold as blocking.

## Granularity: facility, exposure or account

**Granularity** (the **grain**) is what one row represents.

| Grain | One row is | Used for | Watch out for |
|---|---|---|---|
| Party | One borrower | Ratings, default, aggregation | Loses product detail |
| Facility | One agreement | Limits, undrawn, CCF, collateral allocation | Drawings in several currencies |
| Exposure or drawdown | One drawn tranche | Days past due, ECL, accounting | Undrawn usually exists only at facility level |
| Account | One retail or ledger account | Retail models, ledger reconciliation | One loan split across ledger accounts |
| Allocation | One collateral to facility link | LGD, CRM | Must be capped per collateral item |

The classic error: undrawn sits on the facility, drawn amounts on three drawdowns, someone joins facility to drawdown and sums undrawn, counting it three times. Agree a **calculation grain** per engine and push facility-level values down with an explicit rule.

## Critical data elements and their quality checks

A **critical data element** (CDE) materially affects a regulatory or management number; governance and the six quality dimensions are in [[22 Credit Risk Data, Systems and BCBS 239]]. A practical starter list:

| Critical data element | Example | Main quality checks |
|---|---|---|
| Party identifier | P-0004417 | Every exposure maps to one; no duplicates by registration number or LEI |
| LEI | 549300XXXXXXXXXXXX12 | Valid format and check digits; not lapsed |
| Ultimate parent | P-0000001 | Present for group members; no circular ownership |
| Country of risk | GB | Valid ISO code; differences from incorporation explained |
| Sector code | H49.41 | Valid in current scheme; no generic "other" for large exposures |
| Limit amount | 10,000,000 | Matches approval record; utilisation above 100% only with excess flag |
| Committed and cancellable flags | Committed, not cancellable | Consistent with product; sampled against documents |
| Maturity date | 2030-06-30 | Not in the past for live facilities |
| Drawn balance | 6,000,000 | Reconciles to the general ledger within tolerance |
| Days past due | 0 | Never negative; only falls when a payment is recorded |
| Collateral value and date | 2,000,000, 2026-03-31 | Positive; within revaluation policy for type |
| Allocation amount | 1,500,000 | Sum per collateral not above value; no active item unallocated |
| Grade, PD and rating date | 7, 0.40%, 2026-02-14 | Present; PD matches master scale; within 12 months |
| Model version | v4.2 | Approved and in use on the as-of date |
| External rating | A- | Valid grade; mapping exists |
| LGD and CCF | 45%, 40% | Between 0 and 100%; consistent with approach and product |
| Product code | RCF-CORP-01 | In reference list; mapped to class and accounting |
| Exposure class | Corporate | Consistent with party type and size; changes explained |
| IFRS 9 stage | 1 | Stage 3 if defaulted; at least 2 if over 30 days past due unless rebutted |
| FX rate | 1.0000 | Exists for every currency on the as-of date; within tolerance of prior day |

Cross-field checks (stage against days past due, class against party type) catch more real problems than single-field checks.

## Worked example: one loan from source to risk-weighted assets

Trace facility F1 of Northwind Logistics Ltd to RWA as at 31 March 2026 under the standardised approach. Numbers are illustrative; conversion factors and risk weights below follow the Basel III standardised approach and vary by jurisdiction.

1. **Party.** P-0004417, UK company, turnover 85 million, KYC approved, not in default. A **corporate**, not SME or retail.
2. **Group.** Ultimate parent Northwind Holdings plc; connected group NW-01 (23.5 million). No effect on F1's RWA, but F1 goes into the large exposures return.
3. **Facility.** Committed revolving facility, not unconditionally cancellable. The bitemporal row valid on 31 March as known on 6 April gives a limit of 10.0 million.
4. **Exposure.** Drawn 6,000,000; accrued interest 50,000; undrawn 4,000,000; days past due 0.
5. **CCF.** Committed, non-cancellable: 40%. Off-balance sheet equivalent = 4,000,000 x 40% = **1,600,000**.
6. **Exposure before mitigation.** 6,000,000 + 50,000 + 1,600,000 = **7,650,000**.
7. **Collateral.** F1 has 4.5 million of debenture (not eligible for capital here) and 1.5 million of cash (eligible, same currency, zero haircut). Exposure after CRM = 7,650,000 - 1,500,000 = **6,150,000**.
8. **Risk weight.** External issuer rating A-; the mapping table gives A+ to A- corporates **50%**.
9. **RWA.** 6,150,000 x 50% = **3,075,000**.
10. **Capital.** At the 8% minimum, 3,075,000 x 8% = **246,000**, before buffers.

**Alongside, the provision.** The ECL engine uses its own point-in-time parameters: 12-month PD 0.50% (not the 0.40% capital PD), LGD 40% (the debenture counts here) and exposure 7,650,000. ECL = 0.50% x 40% x 7,650,000 = **15,300**, stage 1. (Whether such provisions reduce standardised exposure depends on local rules; ignored here.)

Eight entities, three reference tables and one as-of date went into one number. Now change one thing at a time.

## Common data problems and what they do to the numbers

| Data problem | What changes | Exposure after CRM | RWA | Effect |
|---|---|---|---|---|
| None | | 6,150,000 | 3,075,000 | |
| Cash over-allocated: full 2.0m to both F1 and F3 | Collateral on F1 2,000,000 | 5,650,000 | 2,825,000 | Understated 250,000; cash counted twice |
| Wrongly flagged unconditionally cancellable | CCF 10%: 400,000 | 4,950,000 | 2,475,000 | Understated 600,000 |
| Snapshot rebuilt from current data after the late limit change | Undrawn 6m x 40% = 2,400,000 | 6,950,000 | 3,475,000 | 400,000 above what was submitted; not reproducible |
| External rating mapping broken | Unrated corporate, 100% | 6,150,000 | 6,150,000 | Doubled |
| Party type wrongly small business, classed retail SME at 75% | Risk weight 75% | 6,150,000 | 4,612,500 | Overstated 1,537,500, wrong row in the return |

Five rows, five different entities (allocation, facility, time, rating, party). Across tens of thousands of facilities these errors do not cancel; they bias the total in whatever direction the broken feed points. Other regulars:

| Problem | Typical cause | Effect |
|---|---|---|
| Duplicate parties | Onboarding without master lookup | Concentration understated; the duplicate may be unrated |
| Missing hierarchy | Manual group maintenance | Large exposure breaches hidden |
| Stale collateral value | No revaluation workflow | LGD and provisions too low |
| Days past due reset | Migration | Defaults and stage 2 cases missed |
| Thousands versus units in spreads | Template units wrong | Ratios off by 1,000; ratings wrong |
| Undrawn summed across drawdowns | Wrong grain in a join | Exposure overstated |
| FX rate joined on load date | Wrong date key | Foreign currency exposures misstated |
| Ratings overwritten in place | No history | Backtesting and reproduction impossible |

## Common mistakes and misunderstandings

- **"Customer and counterparty are the same."** Guarantors, issuers and derivatives counterparties may never be customers. Model the party, then its roles.
- **"The group is a tree."** It is a graph; economic dependence and guarantees add links ownership does not show.
- **"Collateral belongs to a loan."** It belongs to allocations across many facilities, which must never exceed its value.
- **"All collateral reduces capital."** Eligibility depends on approach and type.
- **"Undrawn = limit minus drawn."** Not after availability ends, not for uncommitted lines, not under sub-limits.
- **"One PD per borrower."** There are capital, IFRS 9 and stress PDs, each with a date and model version.
- **"We keep month-end snapshots, so we can reproduce anything."** Only if never rebuilt, and only if engine and configuration versions were kept too.
- **"The LEI solves identity."** Individuals and most small companies lack one, and LEIs lapse.
- **"Mapping tables are low risk."** A product or rating mapping changes capital as much as the engine.
- **"Grain is a technical detail."** The wrong grain double counts undrawn amounts and collateral.

## What a platform lead needs to know about this

**Own the conformed model, not just the pipes.** Someone must own the definitions of party, facility, exposure, allocation and their keys, or every engine will interpret them differently. You are usually the custodian; make sure each entity has a named business owner (see [[22 Credit Risk Data, Systems and BCBS 239]]).

**Know the spine.** Be able to draw how party, facility and exposure link in your bank, which system is golden for each, and where the cross-reference tables live. Most incidents start with a broken join on the spine.

**Make the important things bitemporal.** At least limits, ratings, collateral values, hierarchy links, classifications and reference mappings. Stamp every result with as-of date, run identifier, input snapshot and versions.

**Put four integrity numbers on the run dashboard**: unmapped exposure value, group members without ultimate parent, over-allocated collateral and unallocated collateral. Practical templates are in [[38 Platform Lead Toolkit - Runbooks, Metrics and Templates]].

**Treat reference and mapping tables as code**: versioned, tested against a frozen portfolio, released through the same process as engine changes (see [[34 Delivering Change in a Regulated Risk Platform]]).

**Agree the grain per engine** and document how facility-level values are pushed down.

**Keep parameters apart by purpose**: capital, IFRS 9 and stress.

**Design for extension.** New rules keep adding fields: climate attributes ([[25 Climate, ESG and Emerging Credit Risks]]), settlement and pre-settlement exposures ([[31 Settlement and Pre-Settlement Risk]]), and whatever is next on [[35 Regulatory Landscape and Change Calendar]]. Add attributes to existing entities rather than new silos.

**Who owns what.**

| Thing | Typical owner | Platform role |
|---|---|---|
| Party identity, KYC, hierarchy | Customer data management; credit for economic dependence | Matching, cross-reference, coverage metrics |
| Facilities, limits, exposures | Credit administration and operations | Limit tree checks; ledger reconciliation |
| Collateral and allocations | Credit operations; rules from credit risk and finance | Allocation engine or checks |
| Ratings and parameters | Modelling and credit officers | History with model versions |
| Provisions and write-offs | Finance with credit risk | Results by period with lineage |
| Regulatory classification | Regulatory reporting and capital policy | Run engine; store per snapshot |
| Reference and mapping tables | Named owner per table | Versioning, change process, effective dating |

## Related notes

- [[22 Credit Risk Data, Systems and BCBS 239]] for systems, golden sources, quality dimensions and governance.
- [[33 Platform Architecture and Vendor Landscape]] for where this model lives in the platform.
- [[34 Delivering Change in a Regulated Risk Platform]] for changing the model and its mappings safely.
- [[10 Internal Ratings, Scorecards and PD Models]] for ratings and the master scale.
- [[11 Collateral and Security]] for collateral types and valuation.
- [[14 Risk Appetite, Limits and Concentration]] for limits and connected groups.
- [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]] for stages and expected credit loss.
- [[18 Regulatory Capital and Basel - the Short Version]] for exposure classes and RWA.
- [[19 Counterparty Credit Risk and Derivatives]] and [[31 Settlement and Pre-Settlement Risk]] for exposures needing extra entities such as netting sets.
- [[23 Reporting - Regulatory Returns, Pillar 3 and Management Information]] for where classification fields end up.
- [[36 Credit Portfolio Management and Risk Transfer]] for portfolio protection.
- [[38 Platform Lead Toolkit - Runbooks, Metrics and Templates]] for run metrics and checklists.
- [[basel-credit-risk-explained-simply]] and [[basel-credit-risk-decision-tree]] for the regulatory background.
- [[28 Master Glossary]].
