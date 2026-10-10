# Platform Architecture and Vendor Landscape

**Why this matters to you.** A credit risk platform is not one system. It is a chain of sources, pipes, stores, engines, schedulers, reports and controls, some built by the bank, some bought from vendors, some running in the bank's own data centres and some in the cloud. As platform lead you will be asked to keep that chain running every month-end, to change it every time a regulation or model changes, to decide what to build and what to buy, and to explain all of it to auditors, supervisors and the people paying for it. [[22 Credit Risk Data, Systems and BCBS 239]] mapped the systems and the data quality standard they are held to; [[32 The Credit Risk Data Model]] described the data that flows through them. This note gives you a **reference architecture**: a layered picture of what a good platform contains, how the month-end batch hangs together, which environments it needs, what kinds of vendors exist, how cloud changes the picture, what the non-functional requirements really are, what drives cost, and how to plan a path from where your bank is to where it should be.

## Table of contents

1. [The school kitchen version](#the-school-kitchen-version)
2. [The reference architecture in layers](#the-reference-architecture-in-layers)
3. [The layers one by one](#the-layers-one-by-one)
4. [The month-end batch dependency chain](#the-month-end-batch-dependency-chain)
5. [API versus batch integration](#api-versus-batch-integration)
6. [Build versus buy](#build-versus-buy)
7. [The vendor landscape](#the-vendor-landscape)
8. [Cloud versus on-premise](#cloud-versus-on-premise)
9. [Environments and the promotion path](#environments-and-the-promotion-path)
10. [Non-functional requirements](#non-functional-requirements)
11. [Vendor management](#vendor-management)
12. [Cost drivers](#cost-drivers)
13. [An example target-state roadmap](#an-example-target-state-roadmap)
14. [Common mistakes and misunderstandings](#common-mistakes-and-misunderstandings)
15. [What a platform lead needs to know about this](#what-a-platform-lead-needs-to-know-about-this)
16. [Related notes](#related-notes)

## The school kitchen version

Picture the kitchen that cooks lunch for a large school. Deliveries arrive from several suppliers each morning (vegetables from one, bread from another, milk from a third). Someone checks each delivery against the order: right number of crates, nothing rotten, labels readable. Ingredients go into the **store room**, first as they arrived, then washed, chopped and labelled in standard containers so any cook can use them. A **recipe book** and a **list of approved ingredients** say what everything is called and how it may be used. Then several **cooking stations** work in a fixed order: soup must be ready before the main course goes out, and the pudding station needs the oven after the roast comes out. A **timetable** on the wall says who starts what and when. Cooked food goes onto the **serving counter**, and from there onto plates. Throughout, a **health inspector's checklist** is followed: fridge temperatures logged, allergens recorded, who touched what written down.

A credit risk platform is that kitchen. Suppliers are **source systems**, deliveries are **ingestion**, the store room is the **data platform**, the recipe book is **reference and master data**, the cooking stations are **calculation engines**, the timetable is **orchestration**, the serving counter is the **results store**, the plates are **reports and regulatory returns**, and the inspector's checklist is the **controls layer**. And like a kitchen, it must also cope with the day the inspector arrives (an audit), the day twice as many pupils turn up (quarter-end and stress tests), and the day the oven breaks (disaster recovery).

## The reference architecture in layers

![[33-reference-architecture.svg]]
*A layered reference architecture for a credit risk platform. Data flows from sources through ingestion into raw, conformed and curated zones, picks up keys and codes from reference and master data, feeds the calculation engines on a schedule set by orchestration, and lands in a versioned results store that feeds reporting. The controls layer checks every layer.*

| Layer | Purpose | Typical technology | What goes wrong |
|---|---|---|---|
| 1. Sources | Systems of record for loans, collateral, limits, trades, ledger, external data | Core banking, loan origination, collateral and limit systems, trading platforms, general ledger, data vendors | Late or partial extracts; silent changes to file layouts |
| 2. Ingestion | Move data in, check it arrived complete | File transfer, change data capture, application programming interfaces (APIs), message queues | Missing files go unnoticed; duplicate loads |
| 3. Data platform | Store, integrate and freeze data for each as-of date | Data warehouse, data lake or "lakehouse", on-premise or cloud | Business logic scattered across hundreds of scripts |
| 4. Reference and master data | One set of codes and identities | Customer master, product catalogue, foreign exchange (FX) rates, country and sector lists, hierarchy | Several versions of the same list |
| 5. Calculation engines | Turn data into risk numbers | Rating, exposure, limit, risk-weighted assets, expected credit loss and stress engines | Black-box vendor engines; unversioned configuration |
| 6. Orchestration | Run everything in the right order, on time | Enterprise scheduler or workflow tool | Hidden manual steps; dependencies only in someone's head |
| 7. Results store | Keep every output by date and run, reproducibly | Database or warehouse schema with run metadata | Results overwritten on rerun |
| 8. Reporting and submission | Management information (MI), regulatory returns, disclosures | Business intelligence tools, regulatory reporting software | Spreadsheet adjustments after the results store |
| 9. Controls | Reconciliation, data quality, lineage, audit trail, access | Data quality and lineage tools, reconciliation tools, identity management, logging | Controls that exist on paper but leave no evidence |

The architecture is a **reference**, not a blueprint. Real banks have several of each box (one origination system per business, two warehouses after a merger), and the job of the architecture is to say where each one belongs and which arrows should exist, so that the ones that should not (a spreadsheet feeding a regulatory return directly from a source system) stand out.

## The layers one by one

### 1. Sources

Sources are the systems that **create** credit data: the loan origination system (LOS) where applications are approved, core banking where balances live, collateral and limit systems, treasury and trading platforms for derivatives and securities, the general ledger (GL), and external providers of ratings, corporate hierarchies and market data. The platform does not own them, but it depends on them completely. The most valuable thing you can have with each source owner is an **interface agreement**: what is sent, in what format, by when, with what control totals, and who is called when it is late.

### 2. Ingestion

Ingestion moves data from sources into the platform and proves that it arrived whole.

| Pattern | How it works | Good for |
|---|---|---|
| Batch file extract | Source writes a file at end of day; platform picks it up | Most month-end credit data |
| Change data capture (CDC) | Platform reads the source database's change log and copies every insert, update and delete | Keeping a near-current copy without heavy extracts |
| API pull | Platform calls the source's application programming interface | Small, on-demand lookups (a rating, a customer record) |
| Event streaming | Source publishes events (a drawdown, a payment) to a message stream | Intraday limits and early warning |

Whatever the pattern, **landing checks** come first: did every expected file arrive, does the row count match the control total sent by the source, do the balances sum to the source's own total, is the layout as agreed? A missing file that nobody notices is the most common cause of a wrong month-end.

### 3. Data platform: raw, conformed and curated zones

Modern platforms separate data into **zones**, like the store room's "as delivered", "washed and chopped" and "ready for the cooks" shelves.

| Zone | Also called | Contents | Rules |
|---|---|---|---|
| Raw | Landing, bronze | Exact copy of what each source sent, stamped with load time | Never changed; kept for lineage and reprocessing |
| Conformed | Integrated, silver | Data mapped into the bank's common model: master keys, standard codes, one currency convention | Business rules applied here, once, in versioned code |
| Curated | Presentation, gold | Frozen month-end snapshots in the exact shape each engine and report needs | Immutable once signed off; corrections create new versions |

The conformed zone is where the entities of [[32 The Credit Risk Data Model]] live. The curated zone is what an engine reads and what a regulator asks you to reproduce.

### 4. Reference and master data

**Master data** is about identities (who is this party, which group are they in); **reference data** is code lists (products, currencies, countries, sectors, rating scales) and market data such as FX rates. Both need a single managed home, with owners, effective dates and change control, because every engine depends on them. A product mapping change can move capital more than an engine upgrade.

### 5. Calculation engines

| Engine | Main inputs | Main outputs | Typical frequency | See |
|---|---|---|---|---|
| Ratings and scoring | Financial statements, behaviour, qualitative answers | Grade, probability of default (PD), override log | On event and at annual review; retail monthly | [[10 Internal Ratings, Scorecards and PD Models]] |
| Exposure | Trades, netting and collateral agreements, market data | Current and potential future exposure for derivatives and securities financing | Daily or intraday | [[19 Counterparty Credit Risk and Derivatives]], [[31 Settlement and Pre-Settlement Risk]] |
| Limits | Limits, exposures, hierarchy | Utilisation, excesses, large exposures | Real time to daily | [[14 Risk Appetite, Limits and Concentration]] |
| Expected credit loss (ECL) | Exposures, PD, loss given default (LGD), scenarios, staging rules | Stage, provisions, overlays | Monthly | [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]] |
| Risk-weighted assets (RWA) | Exposures, ratings, collateral, classification rules, provisions | Exposure classes, risk weights, RWA, capital | Monthly or quarterly | [[18 Regulatory Capital and Basel - the Short Version]] |
| Stress testing | Curated data, scenario paths, model sets | Projected losses, RWA, capital over several years | Annual and ad hoc | [[20 Stress Testing and ICAAP]] |

Two design principles matter more than any product choice. **Engines read from the curated zone and write to the results store**, never to each other directly through private files. And **configuration is code**: risk weight tables, staging thresholds, scenario weights and model parameters are versioned and released like software, because they change the numbers.

### 6. Orchestration and batch scheduling

Orchestration is the timetable on the kitchen wall. An enterprise **scheduler** knows every job, what it depends on, when it may start, how long it should take, and who to alert if it fails. Good orchestration holds the dependency graph explicitly (job C waits for A and B), supports reruns of one step without rerunning everything, records each run with its inputs and versions, and shows a live view of the month-end. Bad orchestration is a list of times ("start ECL at 02:00, it is usually ready") and a person who knows which jobs to rerun by hand.

### 7. Results store

Every engine output is written with its **as-of date**, **run identifier**, **input snapshot identifier** and the **versions** of code, models and configuration used. Reruns add new runs; they never overwrite. One run per as-of date is marked **official** once signed off. This is what makes a past quarter reproducible and differences between runs explainable.

### 8. Reporting and regulatory submission

Reports read from the results store: dashboards and MI for management, regulatory returns (capital, large exposures, loan-level data), Pillar 3 public disclosures. Regulatory reporting tools map results into the supervisor's templates, apply validation rules, often produce files in XBRL (eXtensible Business Reporting Language, a format for tagged financial data), and manage sign-off and submission. See [[23 Reporting - Regulatory Returns, Pillar 3 and Management Information]]. Any adjustment made here must be logged in an **adjustments register**, as [[22 Credit Risk Data, Systems and BCBS 239]] explains.

### 9. Controls layer

| Control | What it proves | Where it runs |
|---|---|---|
| Completeness and control totals | Every feed arrived whole | Ingestion |
| Data quality rules | Critical fields are complete, valid, consistent, timely | Conformed zone, before snapshot sign-off |
| Reconciliation | Platform agrees with the ledger, and engines agree with each other | After snapshot and after engines |
| Lineage | Any reported number can be traced back to source records | Captured automatically by pipeline and engines |
| Audit trail | Who changed what data, configuration or code, and when | Everywhere |
| Access control and segregation of duties | Only authorised people can change data, code or results, and no one can both make and approve a change | Everywhere |

The controls layer is drawn as a side box because it touches every other layer. Auditors and supervisors will test it directly, so it must leave **evidence**: reports, logs and sign-offs kept for the retention period.

## The month-end batch dependency chain

![[33-month-end-batch.svg]]
*A typical month-end chain. Feeds land and are checked, conformed and quality-tested before a frozen snapshot is taken. Ratings and parameters come next, then ECL, then RWA (which needs provisions), while exposure and limit calculations run in parallel. Reconciliations and sign-off come before any output leaves the platform. Day numbers are illustrative business days after month-end.*

Notice that the **RWA engine waits for the ECL engine**. Under the standardised approach, exposures are measured net of specific provisions; under the internal ratings-based (IRB) approach, provisions are compared with regulatory expected loss (EL) and any **expected loss shortfall** is deducted from capital. A change that delays ECL therefore delays capital too.

### Worked example: finding the critical path

Machine run times for a mid-sized bank's month-end (illustrative):

| Job | Depends on | Duration (hours) |
|---|---|---|
| A. Source extracts | Month-end close | 6.0 |
| B. Landing checks | A | 1.0 |
| C. Conform and map | B | 3.0 |
| D. Data quality and GL reconciliation | C | 2.0 |
| E. Freeze snapshot | D | 0.5 |
| F. Ratings and parameters | E | 2.0 |
| G. ECL engine | F | 4.0 |
| H. Exposure, limits and large exposures | E | 3.0 |
| I. RWA engine | G | 3.0 |
| J. Reconciliations and variance analysis | H and I | 2.0 |

The **critical path** is the longest chain of dependent jobs: A, B, C, D, E, F, G, I, J = 6 + 1 + 3 + 2 + 0.5 + 2 + 4 + 3 + 2 = **23.5 hours**. The other route, through H, is A to E (12.5 hours) plus H (3) plus J (2) = **17.5 hours**, so H has **6 hours of slack**. Making H twice as fast changes nothing. Cutting the ECL engine from 4 to 2 hours shortens month-end by 2 hours. Spend performance money on the critical path only.

In practice the calendar is set less by machine time than by **human time**: waiting for a late feed, triaging data quality breaches, agreeing adjustments, getting sign-offs. That is why the illustrative timetable in the diagram stretches over many business days while the machines run for one. The biggest gains usually come from fewer breaks, not faster servers.

## API versus batch integration

**The analogy.** Batch is the weekly supermarket shop: efficient, planned, everything arrives at once. An API is popping to the corner shop for one pint of milk when you need it: quick for one item, ruinous if you buy your whole week that way.

| | Batch | API (request and response) | Event streaming |
|---|---|---|---|
| Latency | Hours to a day | Seconds | Seconds |
| Volume per call | Millions of records | One to a few records | Continuous flow |
| Completeness proof | Easy: file, row count, control total | Hard: each call is separate | Needs sequence checks and replay |
| Reproducibility | Natural: the file is the snapshot | Needs the response to be stored | Needs the stream to be stored |
| Typical credit use | Month-end capital, provisions, returns | Rating lookup at origination; limit check before booking | Intraday exposure, early warning triggers |
| Failure mode | Late or missing file | Timeouts, partial data | Lost or duplicated events |

The rule of thumb from [[22 Credit Risk Data, Systems and BCBS 239]] holds: match latency to the decision. Regulatory numbers are calculated as at a date, so they want a complete, frozen, reproducible batch. Decisions at the point of lending (can this drawdown go ahead?) want an API. Many platforms need both: event or API feeds keep operational views current during the month, and a batch snapshot is still frozen at month-end for the official numbers.

## Build versus buy

**The analogy.** You can bake your own birthday cake or buy one. Baking costs less per cake if you bake often, lets you choose every ingredient, and teaches you how cakes work, but it takes time and skill and is your fault if it collapses. Buying is quick and reliable, but you get the flavours the shop offers, and if the shop closes you need a new plan.

| Factor | Favours building | Favours buying |
|---|---|---|
| Regulatory rule engines (capital, large exposures) | Unusual business the vendor does not cover | Standard rules that change for every bank at once; the vendor spreads that cost across clients |
| Models (PD, LGD, ECL methodology) | Models are the bank's own intellectual property and differentiate it | Small banks without modelling teams |
| Data platform and pipelines | Usually built (or assembled) because sources are unique to each bank | Managed cloud services reduce infrastructure work |
| Speed to deliver | Slow first release | Faster, if the bank accepts the vendor's model |
| Control and transparency | Full | Depends on the vendor's documentation and audit access |
| Skills needed | Engineers, quants, regulatory experts in house | Configuration and vendor management skills |
| Exit | No vendor to exit | Exit plan required; migration costs |

A common pattern is **buy the rules, build the models, assemble the data**: buy a capital engine because Basel rules are the same for everyone, build or own the PD, LGD and ECL methodology because that is the bank's judgement, and build the data platform around the bank's unique sources.

### Worked example: five-year total cost of ownership

A bank compares buying a vendor RWA engine with building its own. Figures are illustrative, in millions.

| Cost item | Buy | Build |
|---|---|---|
| One-off implementation or build | 4.0 | 6.0 |
| Annual licence or subscription | 0.90 | 0 |
| Annual internal team (4 people versus 9, at 0.12 each) | 0.48 | 1.08 |
| Annual regulatory change effort | 0.20 (vendor ships rule updates; bank tests) | 0.50 |
| Annual infrastructure | included | 0.30 |
| **Annual running cost** | **1.58** | **1.88** |
| **Five-year total** (one-off + 5 x annual) | 4.0 + 7.9 = **11.9** | 6.0 + 9.4 = **15.4** |

On these numbers buying is 3.5 million cheaper over five years. But the decision also depends on things the table cannot price: whether the vendor's engine handles the bank's unusual products, how long a later exit would take, how transparent the engine is to validators and supervisors, and whether the vendor will still exist and invest in ten years. Cost is an input to the decision, not the decision.

## The vendor landscape

Vendors change names and owners often through acquisitions, so treat the examples below as **examples, not endorsements**, and check current offerings. Most large vendors sell several categories, and most banks use a mix of vendors and in-house builds.

| Category | What it does | Examples (illustrative, not endorsements) |
|---|---|---|
| Regulatory calculation engines | Exposure classification, risk weights, IRB formulas, output floor, large exposures | Moody's, Wolters Kluwer, SAS, Oracle Financial Services |
| ECL engines | Staging, lifetime PD curves, scenario weighting, provisions | Moody's, SAS, Oracle; often built in house on general analytics platforms |
| Loan origination systems | Applications, credit workflow, approvals, documents | nCino, Finastra, Temenos; credit analysis and financial spreading tools such as Moody's CreditLens |
| Collateral management | Collateral register, valuations, allocation, margin calls | Often a module of the lending platform; for derivatives margin, tools such as CloudMargin or modules of trading platforms |
| Limit and exposure systems | Real-time limit checks, potential future exposure | Modules of trading platforms such as Murex and Calypso; FIS |
| Data quality, catalogue and lineage | Rules, dashboards, glossary, automated lineage | Collibra, Informatica, Ataccama, Alation, Solidatus |
| Regulatory reporting | Template mapping, validation, XBRL, submission workflow | Regnology, Wolters Kluwer, AxiomSL |
| Data platforms | Storage and processing at scale | Snowflake, Databricks, warehouses from the major cloud providers; on-premise databases such as Oracle or Teradata |
| Orchestration and scheduling | Job dependencies, calendars, alerts | Control-M, AutoSys, Apache Airflow |
| External data | Agency ratings, corporate hierarchies, LEIs, market data | S&P Global, Moody's, Fitch; Dun & Bradstreet; the Global Legal Entity Identifier Foundation (GLEIF) for legal entity identifiers |
| Stress testing and scenario tools | Scenario projection, model management | SAS, Moody's; frequently in house |

When reading vendor material, separate three things: the **product** (what the software does), the **content** (regulatory rules or models the vendor maintains), and the **service** (implementation, hosting, support). A strong product with thin regulatory content for your jurisdiction will leave you writing rules yourself.

## Cloud versus on-premise

**The analogy.** Owning a car versus using a car club. Owning means it is always in your drive, you control maintenance, and you pay for it even when parked. The club gives you a bigger car for the weekend you need one and nothing in between, but you depend on the club, and if it shuts you need another way to get to school.

Credit risk workloads suit cloud in one obvious way: they are **spiky**. Month-end, quarter-end and stress tests need a lot of compute for a few days, then very little. On-premise you size for the peak and the machines sit idle most of the month.

| Consideration | On-premise | Cloud |
|---|---|---|
| Capacity for peaks | Sized for peak; idle the rest of the time | Scale up for month-end and stress, down afterwards |
| Cost model | Capital spending, depreciated; predictable | Operating spending, usage-based; can surprise if not governed |
| Data residency | Data stays in the bank's own buildings | Must choose regions; some countries require certain data (often personal data) to stay in country |
| Regulatory outsourcing rules | Usually not outsourcing | Usually a material outsourcing of a critical function, with notification and contract requirements |
| Concentration risk | Bank-specific | Supervisors worry many banks depend on the same few providers |
| Resilience | Bank's own disaster recovery sites | Multiple zones and regions, but provider-wide outages are possible |
| Security responsibility | All the bank's | Shared: provider secures the infrastructure, bank secures its configuration, data and access |
| Exit | Not applicable | Credible, tested exit plan required |

**Regulator expectations**, generically (details vary by country and keep evolving): banks remain fully responsible for outsourced functions; must assess providers before contracting; need contracts with audit and access rights, data location terms, security, incident notification and termination support; must notify or seek approval from the supervisor for material outsourcing; and must have **exit plans** that are documented and, for critical services, tested. Examples of the rule books include the European Banking Authority (EBA) guidelines on outsourcing, the European Union Digital Operational Resilience Act (DORA, applying from January 2025), which also brings critical technology providers under direct oversight, and the United Kingdom's supervisory rules on outsourcing, third-party risk and critical third parties.

**Exit plans** answer "if we had to leave this provider, how would we, and how long would it take?" A credible plan names the alternative (another provider, or back on-premise), the data export format, the time needed, the people, and the cost, and keeps the platform **portable** enough (containers, open file formats, infrastructure defined as code, avoiding provider-specific services where it matters) for the plan to be real. See [[30 Operational Risk]] for third-party risk and resilience.

## Environments and the promotion path

![[33-environment-promotion.svg]]
*How a change moves to production. Each environment is a gate: development, system integration testing on a frozen regression portfolio, user acceptance by risk, finance and model owners, then a parallel run on real month-end data. Only explained and signed-off differences pass to change approval and production, which is replicated to a disaster recovery site.*

| Environment | Purpose | Data | Who uses it |
|---|---|---|---|
| Development | Build and unit-test changes | Synthetic or masked (personal data scrambled) | Engineers, model developers |
| System integration test (SIT) | Run the whole batch end to end; regression pack on a frozen portfolio | Masked copy of a past month-end | Platform test team |
| User acceptance test (UAT) | Business confirms the change does what was asked | Masked or controlled real data | Risk, finance, model owners |
| Parallel run or pre-production | Old and new side by side on live month-end data; differences explained to the item level | Production copy, production-like controls | Platform, risk, finance, validators |
| Production | Official runs, submissions | Live | Operations, restricted access |
| Disaster recovery (DR) | Take over if production fails | Replicated from production | Operations, tested at least yearly |

Two numbers define disaster recovery: the **recovery time objective** (RTO, how long until the service is back) and the **recovery point objective** (RPO, how much data you can afford to lose, as a time). A month-end capital run might have an RTO of one business day and an RPO of zero for the frozen snapshot. Change discipline (release freezes, segregation of duties, evidence) is covered in [[34 Delivering Change in a Regulated Risk Platform]].

## Non-functional requirements

**Non-functional requirements** describe how well the platform must work, rather than what it calculates. In a regulated platform they are as important as the formulas.

| Requirement | What it means | Example target (illustrative) |
|---|---|---|
| Run time window | Each run finishes within its slot | Month-end engines complete by business day 5 |
| Scalability | Handles peaks without missing windows | Quarter-end volume plus 30% headroom; stress runs without disturbing production |
| Reproducibility | Any past official run can be recreated exactly | Rerun any quarter in the last seven years with identical results |
| Versioning | Data, code, models and configuration versioned together | Every result traceable to a release, model version and configuration version |
| Availability | Interactive services available when needed | 99.5% in business hours for limit checks |
| Recoverability | RTO and RPO met in tested failover | RTO 1 business day for capital run |
| Security | Confidentiality and integrity of data | Encryption at rest and in transit; least-privilege access |
| Segregation of duties | No one both makes and approves a change, or both changes data and signs it off | Enforced by tooling, reviewed quarterly |
| Auditability | Who did what, when, is logged and kept | Logs retained for the regulatory retention period |
| Observability | Operators can see run status, data volumes and errors | Live run dashboard with alerts |

### Worked example: sizing for quarter-end and stress

An ECL engine processes 3,000,000 accounts. On average each needs 60 monthly periods projected over its lifetime, so one scenario is 3,000,000 x 60 = **180 million account-periods**. Month-end uses 4 scenarios: 720 million account-periods. At an illustrative throughput of 200,000 account-periods per second per compute node, that is 720,000,000 / 200,000 = 3,600 seconds, or **1 hour on one node**.

Now the annual stress test: 3 scenarios, each requiring a full ECL calculation at 12 quarterly projection points, so 36 runs of 180 million = **6,480 million account-periods**. On one node: 6,480,000,000 / 200,000 = 32,400 seconds = **9 hours**. On 6 nodes, assuming the work splits evenly, **1.5 hours**.

On-premise, those 6 nodes must be bought and kept all year for a few days of peak use; in the cloud they can be rented for the hours needed. Either way, the requirement must be written down early, because "the stress test takes three days" is often discovered during the stress test.

## Vendor management

A vendor engine is a supplier, not a responsibility transfer. The lifecycle:

| Stage | Key activities |
|---|---|
| Selection | Requirements including non-functional ones; regulatory coverage for your jurisdictions; proof of concept on your own data; reference calls; financial health of the vendor |
| Due diligence | Security, resilience, subcontractors, data location, regulatory outsourcing assessment |
| Contract | Service levels, support hours around month-end, regulatory update commitments, audit and access rights, escrow or source access where appropriate, exit and transition support, price caps |
| Implementation | Configuration documented and versioned; independent validation of calculations; parallel run against the old engine |
| Ongoing oversight | Service reviews, incident and service level reporting, release notes reviewed for impact, annual risk reassessment |
| Upgrades | Treated as changes: regression and parallel testing; vendor's rule updates checked against the regulation itself |
| Exit | Plan maintained and periodically tested; data and configuration exportable |

Two lessons new platform leads often learn the hard way. First, a vendor's "compliant with Basel" claim covers the product, not **your configuration** of it; you must evidence that the configuration matches your regulator's rules. Second, vendor upgrades are not optional forever: falling several versions behind leaves you on unsupported software with regulatory updates you cannot install.

## Cost drivers

| Driver | Why it costs | How to manage |
|---|---|---|
| Licences and subscriptions | Often priced by assets, exposures, entities, users or cores | Negotiate on growth; avoid paying for unused modules |
| People | The largest cost in most platforms: engineers, analysts, testers, support | Automate testing and reconciliation; reduce manual month-end effort |
| Regulatory change | Every new rule touches data, engines and reports | Shared vendor content; a regulatory change calendar ([[35 Regulatory Landscape and Change Calendar]]) |
| Compute and storage | Peaks, long history retention, duplicate copies | Elastic compute; tiered storage; one copy per zone, not per team |
| Environments | Each needs infrastructure, data, licences | Rebuild environments on demand; mask data once |
| Parallel running | Two systems for months during migrations | Plan exit criteria in advance |
| Remediation | Fixing data or findings after audit or supervisory review | Invest in controls and quality early |
| Technical debt | Old systems and point-to-point feeds that are expensive to change | Decommission as part of every programme |

## An example target-state roadmap

An illustrative three-year path for a bank starting from multiple warehouses, spreadsheets in the reporting chain and an ageing on-premise capital engine. Timings are indicative; real programmes overlap phases.

| Phase | Timing | Goals | Key deliverables | Exit criteria |
|---|---|---|---|---|
| 0. Discover and stabilise | Months 0 to 6 | Know what exists; stop the bleeding | Real architecture map; critical data element list; end-user computing inventory; run dashboard; top ten breaks fixed | Month-end on time three months running |
| 1. Data foundation | Months 6 to 18 | One conformed model and curated snapshots | Raw, conformed and curated zones; customer master integration; bitemporal history for key entities; automated data quality and lineage | All engines read from curated zone |
| 2. Engine modernisation | Months 12 to 24 | Replace or upgrade engines on the new foundation | New capital engine (bought); ECL engine on common data; configuration under version control; parallel runs | Two quarter-ends in parallel with explained differences; regulator informed |
| 3. Decommission and scale | Months 24 to 36 | Remove old systems; elastic compute for peaks | Old warehouses and spreadsheets retired; stress testing on the same platform; self-service analytics on curated data | Legacy switched off; cost per run falling |

Every phase delivers something the business can see, and every phase removes something old. Roadmaps that only add new systems leave the bank paying for both.

## Common mistakes and misunderstandings

- **"Architecture is a diagram."** It is a set of decisions about which arrows are allowed. The diagram only helps if someone enforces it.
- **"Buy the engine and the problem is solved."** Most effort in a credit platform is data, not formulas. A vendor engine fed bad data produces bad numbers faster.
- **"Cloud is cheaper."** Only if workloads are elastic and usage is governed. Lifting an always-on platform unchanged into the cloud often costs more.
- **"Cloud means we are not responsible for resilience."** The bank stays accountable, needs its own recovery plans and a tested exit plan.
- **"Real time is modern; batch is legacy."** Batch is the right tool for regulatory numbers at a date. Use APIs and events where decisions need them.
- **"Engines can pass files to each other."** Private hand-offs break lineage and reproducibility. Route through the curated zone and results store.
- **"Configuration is not code."** A risk weight table or staging threshold changes the numbers just like code, and needs the same versioning and testing.
- **"A rerun replaces the old results."** Overwriting destroys the ability to reproduce what was submitted. Add runs; mark one official.
- **"UAT is enough."** For regulatory numbers, a parallel run on real data with item-level explanations is what gives finance, validators and supervisors confidence.
- **"Non-functional requirements can wait."** Run windows, reproducibility and segregation of duties are hard to retrofit and are what auditors test first.
- **"The exit plan is a document for procurement."** If it has never been tested and the platform is full of provider-specific services, it is not a plan.

## What a platform lead needs to know about this

**Draw the real architecture against the reference one.** Map every source, feed, store, engine, scheduler, report and spreadsheet in your bank onto the nine layers. The gaps and the forbidden arrows (spreadsheets between engine and return, engines feeding each other, reports reading raw data) are your first remediation list.

**Own the critical path.** Know the month-end dependency chain, its critical path, which jobs have slack, and where human waiting time goes. Publish a run dashboard; it is the single most useful thing for credibility with finance and risk.

**Make reproducibility a non-negotiable requirement.** Curated snapshots frozen and versioned; results stamped with run, input and version metadata; reruns never overwrite; configuration under version control. You will be asked to reproduce a past quarter, probably at short notice.

**Run build versus buy as a structured decision.** Include total cost over five years, regulatory content coverage, transparency to validators, exit cost and vendor viability. Default to buying standard rules, owning models and building data around your sources.

**Treat vendors and cloud as outsourcing.** Know which arrangements are material, what the contracts say about audit, service levels, data location and exit, and whether the exit plan has been tested. A vendor's outage at quarter-end is your incident.

**Write non-functional requirements down, with numbers.** Run windows, peak volumes, rerun times, RTO and RPO, retention, and segregation of duties. Test them before go-live, not during the first stress test.

**Plan roadmaps that decommission.** Every phase should retire something. Keep the regulator informed of material changes to how capital and provisions are produced; see [[34 Delivering Change in a Regulated Risk Platform]] and [[35 Regulatory Landscape and Change Calendar]].

**Who owns what.**

| Area | Typical owner | Platform role |
|---|---|---|
| Target architecture and standards | Enterprise and risk architecture | Propose, implement, keep current |
| Source systems and interface agreements | Business and operations system owners | Agree and monitor the interfaces |
| Data platform, orchestration, results store | Platform team | Own fully |
| Engine methodology and configuration content | Credit risk modelling, finance, regulatory policy | Version, test, deploy, run |
| Vendor contracts and outsourcing assessments | Procurement, third-party risk management | Provide requirements; run day-to-day oversight |
| Cloud security and resilience standards | Chief information security officer, technology risk | Implement and evidence |
| Controls evidence | Platform team as first line | Produce and retain |
| Funding and roadmap priorities | Chief risk officer, chief financial officer, change portfolio board | Build the case; deliver |

Templates for run dashboards, vendor reviews and roadmap tracking are in [[38 Platform Lead Toolkit - Runbooks, Metrics and Templates]], and the first steps are in [[27 A Platform Lead's First 90 Days]].

## Related notes

- [[22 Credit Risk Data, Systems and BCBS 239]] for the systems landscape, golden sources and data quality.
- [[32 The Credit Risk Data Model]] for the entities that flow through this architecture.
- [[34 Delivering Change in a Regulated Risk Platform]] for releases, testing and parallel runs.
- [[35 Regulatory Landscape and Change Calendar]] for the rule changes the platform must absorb.
- [[38 Platform Lead Toolkit - Runbooks, Metrics and Templates]] for runbooks and metrics.
- [[30 Operational Risk]] for third-party risk, resilience and change risk.
- [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]], [[18 Regulatory Capital and Basel - the Short Version]] and [[20 Stress Testing and ICAAP]] for the engines.
- [[19 Counterparty Credit Risk and Derivatives]] and [[31 Settlement and Pre-Settlement Risk]] for the exposure engines.
- [[23 Reporting - Regulatory Returns, Pillar 3 and Management Information]] for the reporting layer.
- [[21 Model Risk Management and Validation]] for model versioning and validation evidence.
- [[37 Liquidity Risk and Funding]] for a neighbouring platform that often shares the same data foundation.
- [[27 A Platform Lead's First 90 Days]] and [[28 Master Glossary]].
- [[basel-credit-risk-explained-simply]] and [[basel-credit-risk-decision-tree]] for the regulatory background.
