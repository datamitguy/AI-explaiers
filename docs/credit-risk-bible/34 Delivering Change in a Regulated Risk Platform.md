# Delivering Change in a Regulated Risk Platform

**Why this matters to you.** In most technology jobs, a change is finished when it works. On a credit risk platform, a change is finished when you can *prove* it works, to people who were not in the room, possibly years later. The outputs are regulatory numbers: risk-weighted assets (RWA) that set the bank's capital, expected credit loss (ECL) that lands in the published accounts, limits that stop lenders lending. A wrong number is not a bug report; it is a misstatement to a regulator, signed by an executive who is personally accountable. This note explains how change actually gets delivered under those conditions: where change comes from, how a paragraph of rule text becomes a line of code you can trace back to it, how you test a calculation system, how parallel runs and cutovers work, how release management and evidence packs keep auditors satisfied, and how to run agile delivery without breaking any of that. [[22 Credit Risk Data, Systems and BCBS 239]] lists the standard change controls; this note shows how they fit together on a real piece of work.

## Table of contents

1. [The school exam version](#the-school-exam-version)
2. [Where change comes from](#where-change-comes-from)
3. [Turning a rule into requirements](#turning-a-rule-into-requirements)
4. [Who signs off an interpretation](#who-signs-off-an-interpretation)
5. [Impact analysis before you build](#impact-analysis-before-you-build)
6. [Testing a calculation system](#testing-a-calculation-system)
7. [Golden test portfolios and expected results](#golden-test-portfolios-and-expected-results)
8. [Parallel runs and cutover](#parallel-runs-and-cutover)
9. [Release management, change boards and segregation of duties](#release-management-change-boards-and-segregation-of-duties)
10. [Evidence packs](#evidence-packs)
11. [Agile delivery in a regulated setting](#agile-delivery-in-a-regulated-setting)
12. [Data migration and decommissioning](#data-migration-and-decommissioning)
13. [Post-implementation review](#post-implementation-review)
14. [Delivery metrics](#delivery-metrics)
15. [Worked example: a new credit conversion factor rule, from text to production](#worked-example-a-new-credit-conversion-factor-rule-from-text-to-production)
16. [Common mistakes and misunderstandings](#common-mistakes-and-misunderstandings)
17. [What a platform lead needs to know about this](#what-a-platform-lead-needs-to-know-about-this)
18. [Related notes](#related-notes)

## The school exam version

Imagine the exam board changes the marking scheme for maths: from next year, showing your working earns half the marks even if the final answer is wrong. Your school has a computer program that marks practice papers. Someone has to:

- **Read** the exam board's letter and decide what it really means ("does 'working' include a diagram?").
- **Agree** that reading with the head of maths, because if the school guesses wrong, every pupil's predicted grade is wrong.
- **Estimate** how much predicted grades will move, so parents are not surprised.
- **Change** the program.
- **Test** it on a stack of old papers where the right mark is already known.
- **Run** the old and new programs side by side for a few weeks and explain every difference.
- **Keep** the paperwork, because the inspector will ask "how do you know your marking is right?"

That is regulated change delivery; the banking version just has more zeros and a regulator instead of an inspector.

## Where change comes from

A credit risk platform rarely changes because the team had a good idea. Change arrives from five directions, each with its own urgency and its own evidence expectations.

| Source | Examples | Who drives it | Deadline nature | Typical evidence expected |
|---|---|---|---|---|
| **Regulation** | New capital rules, new reporting templates, revised default definition, output floor phase-in (see [[35 Regulatory Landscape and Change Calendar]]) | Regulatory policy, finance, risk | Fixed by law; cannot move | Interpretation memo, traceability to paragraphs, parallel run, attestation |
| **Model changes** | Recalibrated probability of default (PD) model, new loss given default (LGD) model, new ECL overlay methodology (see [[21 Model Risk Management and Validation]]) | Modelling team, model risk | Set by model approval and, for internal ratings-based (IRB) models, often by regulator permission | Validation report, implementation test, approval minutes |
| **Audit and regulator findings** | "Collateral older than 12 months used without haircut", "lineage not evidenced for return line 040" | Internal audit, the supervisor | Committed date in an action plan; missing it is a further finding | Closure evidence that the fix works and is sustained |
| **Business products** | A new green mortgage, a new revolving trade facility, entry into a new country | Business lines, product approval committee | Commercial launch date | Product approval, data and calculation readiness sign-off |
| **Technology refresh** | Vendor engine upgrade, database end of life, move to cloud, replacing spreadsheets (see [[33 Platform Architecture and Vendor Landscape]]) | Technology, vendor management | Vendor support end dates; security deadlines | Like-for-like regression, reconciliation, decommissioning evidence |

The categories overlap: a regulatory change often forces a model change, which needs a technology change. And "no change in numbers" work (technology refresh, migration) is not lower risk: a vendor upgrade that quietly moves RWA by 0.3% is *harder* to catch than a rule change everyone is watching.

### Classifying change by its effect on numbers

A useful habit is to label every change by what it is *meant* to do to regulatory outputs:

| Class | Meaning | Example | Testing emphasis |
|---|---|---|---|
| A: Intended number change | The point of the change is to move outputs | New credit conversion factors (CCFs) | Prove the move is right and only where expected |
| B: No intended number change | Outputs must not move at all | Database upgrade, refactoring | Prove nothing moved, to the cent |
| C: Presentation only | Numbers same, layout or format differs | New report column order | Prove figures identical, format correct |
| D: Control or process change | Numbers unaffected, controls altered | New maker-checker on adjustments | Prove the control works and is evidenced |

The class decides the test strategy and the evidence needed.

## Turning a rule into requirements

Regulatory text is written by lawyers and policy experts, not engineers. A paragraph may contain three requirements, one defined term from another chapter and a cross-reference to a technical standard not yet published. Turning it into code is a chain of four documents, each a little more concrete than the last.

![[34-traceability-chain.svg]]
*The traceability chain: rule text becomes a signed interpretation, then business requirements, a functional specification, code, test cases and evidence, and every artefact carries the identifier of the one before so a production number can be traced back up to the paragraph.*

| Stage | Question it answers | Written by | Example content |
|---|---|---|---|
| **Regulatory text** | What does the law say? | The regulator | "Commitments shall receive a credit conversion factor of 40%, except those that are unconditionally cancellable at any time without prior notice, which receive 10%." |
| **Interpretation memo** | What does it mean *for our bank*? | Regulatory policy, with risk and finance | "Our retail overdrafts and credit card limits are unconditionally cancellable under our standard terms; our committed corporate revolving facilities are not, even where the bank can cancel on a covenant breach." |
| **Business requirements** | What must the system do, in business words? | Business analyst with the risk owner | "BR-07: apply 40% to all committed undrawn amounts; 10% to products flagged unconditionally cancellable; default to 40% where the flag is missing." |
| **Functional specification** | Exactly how, in system terms? | Business and technical analysts | "FS-07.2: CCF looked up from table CCF_V3 by product code and cancellability flag; missing flag logged to data quality exception DQ-118." |

### Traceability back to paragraph numbers

Every artefact carries the identifier of the one above it. The requirement cites the memo, the memo cites the paragraph, the test case cites the requirement. Together they form a **traceability matrix**: a table with one row per requirement and columns for source paragraph, interpretation reference, specification, code change, test cases and test result.

| Paragraph | Interpretation | Requirement | Specification | Test cases | Result |
|---|---|---|---|---|---|
| 4.12(a) commitments | REG-INT-031 section 2 | BR-07 | FS-07.2 | TC-07.2.1 to 07.2.4 | Passed |
| 4.12(b) unconditionally cancellable | REG-INT-031 section 3 | BR-08 | FS-07.3 | TC-07.3.1 to 07.3.5 | Passed |
| 4.12(c) trade letters of credit | REG-INT-031 section 4 | BR-09 (no change) | Not applicable | TC-REG-114 (regression) | Passed |

(Paragraph numbers here and throughout the worked example are illustrative.)

The inspector's question is never "did you test?" but "show me how you implemented paragraph 4.12(b)." With a matrix, that takes ten minutes; without one, a fortnight of archaeology. It also works in reverse: when the regulator amends 4.12(b), you know at once which requirements, code and tests are affected.

The matrix should also record **paragraphs deliberately not implemented**, with the reason ("not applicable: we hold no exposures of this type, confirmed by product inventory 2026-03"). Silence looks like an oversight; a recorded decision looks like control.

## Who signs off an interpretation

Interpretation is where the most expensive mistakes are made, because everything downstream faithfully implements whatever the memo says. So the memo needs owners who are accountable for it.

| Role | What they contribute | Typical sign-off |
|---|---|---|
| Regulatory policy (often in finance or risk) | Reading of the rule, consistency with how the bank reads related rules | Author or approver |
| Credit risk methodology owner | Whether the reading makes sense for the bank's products and models | Approver |
| Finance (regulatory reporting) | Whether it can be reported and reconciled | Approver |
| Legal | Meaning of contract terms ("unconditionally cancellable" depends on loan documentation, see [[12 Loan Documentation, Covenants and Conditions]]) | Consulted, sometimes approver |
| Compliance or second-line risk | Challenge of aggressive readings | Reviewer |
| Platform lead | Whether the reading can be implemented with available data | Consulted, not approver |

Note the last row. The platform team should never be the *approver* of an interpretation, even when it understands the rule best. Implementers interpreting the rule they implement is a segregation of duties failure, and it puts you in the firing line if the reading proves wrong. Your job is to flag where the data cannot support a reading ("we have no field for notice period, so we cannot tell cancellable from non-cancellable without a data project").

**When the text is genuinely ambiguous**, banks follow industry practice agreed through trade associations, check the regulator's published questions and answers, ask the regulator directly, or choose the conservative reading (higher capital or provisions) and record it while waiting for clarity.

## Impact analysis before you build

Before a line of code is written, someone senior will ask: "how big is this?" Impact analysis answers that, and also tells you what to test.

**Financial impact.** Estimate the change in the outputs that matter: RWA and capital ratio for capital rules, ECL for provisioning changes, limit utilisation for limit methodology changes. Early estimates are usually done offline, in a controlled spreadsheet or notebook, on a recent month-end snapshot. They are rough, but they tell the board whether this is a 50 million or a 5 billion RWA problem, and they become the **expected result** that the parallel run must later explain.

**Footprint impact.** Using data lineage (see [[22 Credit Risk Data, Systems and BCBS 239]] and [[32 The Credit Risk Data Model]]), list every place the change reaches:

| Impact area | Questions |
|---|---|
| Source data | Do we have every field the rule needs? Who owns it? How good is it? |
| Calculations | Which engines, which modules, which approaches (standardised, IRB, output floor parallel run)? |
| Reports | Which regulatory return lines, Pillar 3 tables, board packs, limit reports? (See [[23 Reporting - Regulatory Returns, Pillar 3 and Management Information]]) |
| Downstream users | Pricing tools, capital planning, stress testing, performance measurement? |
| Controls | Which reconciliations, data quality rules or tolerances must change? |

A good footprint table avoids the classic failure: the engine is right, but a downstream report still hard-codes the old factor.

## Testing a calculation system

Testing a calculation system differs from testing an ordinary application in one way: the outputs are numbers whose correct values are often not obvious. A login screen either logs you in or it does not. An RWA figure of 7,945 million might be right or might be 25 million wrong, and you cannot tell by looking. So testing has to build up evidence in layers, from tiny cases where the right answer is certain to whole portfolios where it can only be explained.

![[34-test-pyramid.svg]]
*The test pyramid adapted to risk calculations: many small precise tests at the bottom, a few large realistic ones at the top. Each layer catches failures the others miss.*

| Layer | What it is | Who runs it | What it catches | Typical volume |
|---|---|---|---|---|
| **Unit tests** | One function or rule, one hand-crafted input, one known answer: "a 1,000 undrawn commitment flagged cancellable gives EAD 100" | Developers, automated on every build | Formula errors, wrong lookups, rounding, edge cases (zero, negative, missing) | Thousands |
| **System integration tests (SIT)** | Feeds, mappings, engine and reports working together end to end | Test team | Broken interfaces, wrong field mappings, truncation, file format changes | Hundreds of scenarios |
| **Regression on full portfolios** | Re-run a whole frozen month-end before and after the change; compare every exposure | Test team, automated | Unintended movements anywhere in the book | Millions of exposures, a few runs |
| **Reconciliation tests** | Totals agree with source systems, the general ledger, and the prior period after known movements | Platform team with finance | Lost or duplicated records, filter errors, currency errors | Every run |
| **Independent model implementation testing** | Model validation (second line) re-implements the calculation independently and compares results exposure by exposure | Model validation | Production code drifting from the approved model or rule | A sample or full portfolio |
| **User acceptance testing (UAT)** | Risk and finance users confirm outputs make business sense and meet the requirements | Business users | Misread requirements, results that are "technically right but wrong" | Dozens of scenarios plus portfolio reviews |
| **Parallel runs** | Old and new production side by side over several real month-ends | Platform, finance, risk | Issues that only appear with real, changing data and real timetables | Two to three month-ends, sometimes more |

Hard-won lessons:

- **Negative testing matters most.** Missing flags, unknown product codes, negative balances, defaulted exposures, currencies with no rate. Production data contains all of them; the happy path does not.
- **Regression must compare at exposure level, not just totals.** Two errors of plus 40 million and minus 40 million produce a perfect total.
- **UAT is not a demonstration.** Users should test against scenarios they wrote, with expected results they calculated, and sign a record of what they tested.
- **Independent means independent.** If validation re-uses the developer's code or specification without challenge, it is not independent testing. See [[21 Model Risk Management and Validation]] on implementation risk.

## Golden test portfolios and expected results

A **golden test portfolio** is a fixed, version-controlled set of exposures, counterparties, collateral and reference data, with an **expected result** for every output, agreed and signed by the business owner. It is the answer key. A bathroom scale is checked with a weight you know is exactly one kilogram; a capital engine is checked with a portfolio whose RWA you know exactly.

Good golden portfolios have three tiers:

| Tier | Content | Size | Expected results come from |
|---|---|---|---|
| **Rule cases** | One or a few exposures per rule branch, including every edge case | Hundreds of exposures | Hand calculation, documented step by step |
| **Synthetic portfolio** | A realistic mix designed to cover every product, approach, exposure class and mitigation type | Thousands of exposures | Independent calculator, reviewed by methodology owner |
| **Frozen production snapshot** | A real month-end, anonymised where needed | Full book | The approved production output for that date |

Rules for keeping them golden:

- **Version them.** When a rule change is *intended* to move results, the expected results are updated in the same release, with the update approved by the business owner. A test suite whose expected answers are quietly edited to match the code is worse than none.
- **Tag every case to requirements**, so coverage gaps show up in the traceability matrix.
- **Protect them.** Store them where developers cannot change expected results without review.
- **Refresh the frozen snapshot** at least annually so that new products appear in regression.

## Parallel runs and cutover

A **parallel run** operates the old and new calculations side by side on the same real data for one or more real reporting periods. Think of a new pilot flying with an instructor: both have controls, the instructor's decisions count, and the trainee takes over only after enough clean flights.

![[34-parallel-run-cutover.svg]]
*The parallel run and cutover decision flow: run both versions on each month-end, explain every variance, fix and restart the count when unexplained variances breach tolerance, then pass a go-live gate and check rollback and freeze windows before cutting over.*

### How a parallel run works in practice

1. **Same inputs.** Both versions read the same frozen snapshot, so differences come only from the change.
2. **Compare at three levels.** Grand total, segment (exposure class, product, legal entity, approach) and individual exposure.
3. **Split every variance** into *expected* (caused by the rule change and matching the impact estimate) and *unexpected* (defects, data issues, timing).
4. **Explain unexpected variances** to a root cause, each with an owner.
5. **Apply tolerances.** Agree in advance how much unexplained difference is acceptable. A common pattern is a small percentage of the affected segment plus an absolute amount per exposure, set by finance and risk, not by the delivery team. Tolerances for "class B, no intended change" work are usually zero or rounding only.
6. **Count clean periods.** Banks often require two or three consecutive month-ends inside tolerance, and a quarter-end among them for regulatory reporting changes, because quarter-end runs have extra steps and data.

### The cutover decision

The go-live gate is a formal meeting or approval where the business owners (credit risk methodology, finance, regulatory reporting), model validation where relevant, and the platform lead confirm in writing that the parallel run met its criteria. The change advisory board then approves the production deployment. Before cutting over, check:

- **Rollback.** Can you return to the old version within the run window if something goes wrong? Has it been rehearsed?
- **Freeze windows.** Most banks forbid production changes around quarter-end and year-end. A regulatory go-live date may force a change *into* a freeze, which then needs explicit approval and extra support.
- **Regulatory date.** Some rules apply from a reporting date (first return as at 31 March), not a calendar date. Make sure the version that produces the official numbers for that reporting date is the new one, even if it is deployed earlier and switched on by configuration.
- **Communication.** Users, regulatory reporting and the finance close team know the date and what will change.

After cutover, keep the old version **read-only** for at least one more period.

## Release management, change boards and segregation of duties

### Release management

Credit risk platforms release on a calendar shaped by the reporting cycle. A typical pattern:

| Period | Release activity |
|---|---|
| Month-end close (first 5 to 10 working days) | Freeze for most changes; emergency only |
| Quarter-end close (about the first 4 to 6 weeks after quarter end) | Strict freeze for anything touching regulatory outputs |
| Mid-month windows | Normal releases, usually fortnightly or monthly |
| Year-end | Longest freeze, often from early December into the following month |

Plan regulatory go-lives backwards from these windows: the parallel run needs real month-ends, and the deployment needs a window that is *not* the reporting date.

### Change advisory boards

A **change advisory board** (CAB) reviews proposed production changes and decides whether they may go ahead. At its best it is a final check that the change is tested, approved, scheduled sensibly and reversible. At its worst it is a rubber stamp or a bottleneck. The CAB should see, for each normal change: the class of number impact, test summary and links to evidence, business sign-off, deployment and rollback plan, timing against freezes, and the risk rating.

### Segregation of duties

**Segregation of duties** means no single person can make a change to regulatory numbers on their own. The person who writes the code does not approve it; the person who approves it does not deploy it; nobody can change production data or configuration without a second person. Modern pipelines enforce this automatically: mandatory peer review on merge, deployment by an automated pipeline rather than a person, production access granted only temporarily with a ticket. Auditors test it by sampling changes and checking that the author, reviewer and deployer were different people.

Configuration deserves special attention: changing a CCF table, a risk weight mapping or a tolerance is a change to regulatory logic and needs the same control as code.

### Emergency changes

Sometimes production is wrong on the night before a submission and must be fixed now. An **emergency change** follows a shortened path: verbal or out-of-hours approval from named approvers, minimum viable testing, deployment, then **retrospective** full review within a few days. Emergency changes are legitimate but should be rare; a rising count is a key risk indicator (see [[30 Operational Risk]]) that the normal process is too slow or planning is poor. Every emergency change to a regulatory calculation should be followed by a check that the numbers it produced were right.

## Evidence packs

An **evidence pack** is the folder that proves a change was done properly, assembled as you go rather than reconstructed afterwards. An auditor should be able to read it without talking to anyone.

| Section | Contents |
|---|---|
| Scope and rationale | Source of change, rule references, change class |
| Interpretation | Signed memo and approvals |
| Requirements and specification | Approved versions, traceability matrix |
| Impact analysis | Estimate, footprint, affected reports |
| Test evidence | Test plan, unit and SIT results, regression comparison, reconciliation results, UAT scripts and sign-off, independent validation report |
| Parallel run | Variance tables per period, explanations, tolerance assessment |
| Approvals | Go-live gate minutes, CAB approval, segregation of duties evidence |
| Deployment | Deployment record, versions deployed, post-deployment checks |
| Post-implementation | Review findings, closed defects, open items with owners |

Keep evidence for the bank's retention period, often several years; supervisors do ask about changes made three years ago.

## Agile delivery in a regulated setting

Agile methods (short iterations, working software early, close contact with users) work well on risk platforms, and many banks use them. The tension is not agility versus regulation; it is "done" versus "provably done".

**Definition of done that includes controls.** The fix is to make the controls part of each item's **definition of done**, the checklist a piece of work must satisfy before it counts as finished:

| Definition of done item | Why |
|---|---|
| Traceability updated: requirement linked to rule paragraph and test cases | No orphan code, no untested requirement |
| Unit tests written and passing; golden cases added for new rule branches | Answer key grows with the code |
| Regression run with variances explained | No silent movements |
| Peer review by someone other than the author | Segregation of duties |
| Data quality rules and reconciliations updated | Controls keep pace with logic |
| Documentation updated: specification, runbook, data dictionary | The next team can understand it |
| Product owner acceptance recorded | Business sign-off is evidenced |
| Evidence stored in the agreed location | Pack builds itself |

**Practical patterns.**

- **Feature toggles** let new logic be deployed dark and switched on by configuration at the regulatory date, which separates deployment risk from go-live risk. The toggle itself is controlled configuration.
- **Product owner from the business**, ideally someone with authority to accept on behalf of credit risk or finance, not a proxy in technology.



## Data migration and decommissioning

Replacing an engine or a data store is a change where every number is meant to stay the same, which makes it the hardest kind to prove.

**Migration.** Treat history as a deliverable. Regulators expect continuity of default histories, prior returns and rating history. A migration plan covers:

| Step | What good looks like |
|---|---|
| Inventory | Every table, field and history period in scope, with owner and retention requirement |
| Mapping | Old to new field mapping with transformation rules, approved by data owners |
| Trial migrations | Several rehearsals, each reconciled by record counts, totals and sampled records |
| Reconciliation | Record-level comparison of migrated data, not just totals |
| Historical re-run | Re-produce a prior period's official numbers from migrated data on the new platform and match them |
| Sign-off | Data owners confirm completeness and accuracy |

**Decommissioning.** Switching off the old system is a change too. Before decommissioning: confirm nothing still reads from it (lineage and access logs), archive data in a readable form for the retention period, keep the ability to reproduce historic official numbers or record why that is no longer required, retire its controls and update the control library, and remove access. Systems that are "switched off" but still feed one forgotten spreadsheet are a common audit finding.

## Post-implementation review

A **post-implementation review** (PIR) takes place after the first live reporting cycle, often four to eight weeks after go-live. It asks:

- Did the change deliver what was required, and is the bank compliant?
- Did actual impact match the estimate? If not, why not?
- Were there incidents, manual workarounds or adjustments?
- Are all defects closed or owned, and are temporary measures (manual overlays, conservative defaults) on a dated plan to remove?
- What should the next change do differently?

The PIR closes the change formally and often feeds the attestation that the bank has implemented a rule (see [[35 Regulatory Landscape and Change Calendar]]).

## Delivery metrics

Measure the delivery system, not just the projects. Illustrative metrics a platform lead might track monthly:

| Metric | What it tells you | Illustrative target |
|---|---|---|
| Changes causing a production incident (%) | Quality of testing and release | Under 2% |
| Emergency changes as % of all changes | Planning and process health | Under 5% |
| Regulatory deliverables on time (%) | Ability to meet fixed dates | 100% |
| Unexplained parallel run variance at go-live | Rigour of cutover | Within tolerance, every time |
| Requirements with full traceability (%) | Audit readiness | 100% for regulatory changes |
| Golden test coverage of rule branches (%) | Strength of the answer key | Above 95% |
| Open post-implementation actions older than 90 days | Follow-through | Zero |
| Evidence pack completeness at CAB | Discipline | 100% |

The trend matters more than any single month.

## Worked example: a new credit conversion factor rule, from text to production

A mid-sized bank must implement revised **credit conversion factors** (CCFs) for off-balance sheet items under the standardised approach, as part of its jurisdiction's adoption of the Basel III final reforms (see [[18 Regulatory Capital and Basel - the Short Version]]). A CCF turns an undrawn promise into an exposure amount: if a customer has an unused 1,000 credit limit and the CCF is 40%, the bank treats 400 as the exposure at default (EAD), on the theory that customers in trouble draw down their limits.

All amounts are in millions, all figures are illustrative, and the rule paragraphs are invented references. The CCF percentages follow the shape of the Basel standards, but your jurisdiction may differ, so check your local rule.

### Step 1: the rule

The final rule replaces the old CCFs:

| Item | Old CCF | New CCF |
|---|---|---|
| Commitments, original maturity up to one year | 20% | 40% |
| Commitments, original maturity over one year | 50% | 40% |
| Unconditionally cancellable commitments | 0% | 10% |
| Short-term self-liquidating trade letters of credit | 20% | 20% |
| Transaction-related contingent items (performance bonds) | 50% | 50% |

### Step 2: interpretation

Regulatory policy writes REG-INT-031, signed by the credit risk methodology owner and the head of regulatory reporting, with legal consulted on cancellability. Key conclusions:

- Maturity no longer matters for commitments, so the maturity field drops out of the CCF logic.
- "Unconditionally cancellable" applies to retail credit cards and overdrafts on standard terms. Corporate revolving facilities cancellable only on an event of default are *not* unconditionally cancellable.
- Where the cancellability flag is missing, apply 40% (conservative) and raise a data quality exception.

### Step 3: impact analysis

Using the last month-end, the team estimates the impact offline. Average risk weights are illustrative portfolio averages.

| Segment | Undrawn amount | Old CCF | Old EAD | New CCF | New EAD | Average risk weight | Old RWA | New RWA | Change in RWA |
|---|---|---|---|---|---|---|---|---|---|
| Commitments up to 1 year | 10,000 | 20% | 2,000 | 40% | 4,000 | 80% | 1,600 | 3,200 | +1,600 |
| Commitments over 1 year | 6,000 | 50% | 3,000 | 40% | 2,400 | 80% | 2,400 | 1,920 | -480 |
| Unconditionally cancellable (retail) | 20,000 | 0% | 0 | 10% | 2,000 | 75% | 0 | 1,500 | +1,500 |
| Trade letters of credit | 1,500 | 20% | 300 | 20% | 300 | 100% | 300 | 300 | 0 |
| Performance bonds | 2,000 | 50% | 1,000 | 50% | 1,000 | 100% | 1,000 | 1,000 | 0 |
| **Total** | **39,500** | | **6,300** | | **9,700** | | **5,300** | **7,920** | **+2,620** |

Check one row: 10,000 x 40% = 4,000 EAD; 4,000 x 80% = 3,200 RWA, against 10,000 x 20% x 80% = 1,600 before.

**What it means for capital.** The bank's total RWA is 49,000 and its Common Equity Tier 1 (CET1) capital is 6,000, a CET1 ratio of 6,000 / 49,000 = 12.2%. Adding 2,620 of RWA takes total RWA to 51,620 and the ratio to 6,000 / 51,620 = 11.6%, a fall of about 0.6 percentage points. At a 12% capital target, the extra RWA needs about 2,620 x 12% = 314 of extra capital. Treasury is told months before go-live, not afterwards.

**Footprint.** The CCF table in the standardised engine; the output floor parallel standardised calculation (which applies to IRB portfolios too); the leverage ratio exposure measure, which also applies conversion factors to off-balance sheet items under its own paragraphs (so it is checked and brought into scope); the capital return off-balance sheet lines; Pillar 3 credit risk tables; the pricing tool's capital charge for undrawn limits (see [[24 Pricing, RAROC and Return on Capital]]); the capital plan.

### Step 4: requirements, specification and build

BR-07 and BR-08 are written, traced to the paragraphs and the memo. The specification replaces a maturity-based lookup with a product and cancellability lookup, adds data quality rule DQ-118 for missing flags, and versions the CCF table as configuration under change control. A feature toggle keyed on reporting date switches the new table on for reporting dates from the go-live date onwards.

### Step 5: testing

Golden rule cases: 24 hand-calculated cases covering each CCF row, missing flags, zero undrawn, negative undrawn (overdrawn accounts), defaulted exposures, and foreign currency limits. Regression on the frozen month-end: every exposure that moved is in an off-balance sheet segment; nothing on-balance sheet moved. Reconciliation: undrawn totals agree with the source facility system. Model validation independently re-computes EAD on the full off-balance sheet book with its own code. UAT: credit risk and regulatory reporting test 30 scenarios they wrote themselves and review the segment movements against the estimate.

### Step 6: parallel run

The new logic runs alongside production for three month-ends. Production uses the old CCFs (the official numbers); the parallel run uses the new ones. Model validation's independent calculation provides a second reference. Tolerance, agreed in advance by finance and risk: unexplained difference between the parallel run and the independent calculation must be under 0.05% of off-balance sheet RWA, with no single unexplained item above 5.

| Month-end | Production RWA (old rules) | Parallel RWA (new rules) | Movement versus production | Independent calculation | Difference | Difference % | Explanation | Within tolerance? |
|---|---|---|---|---|---|---|---|---|
| Month 1 | 5,300 | 7,945 | +2,645 | 7,920 | 25 | 0.32% | 1,040 retail overdrafts (undrawn 110) had no cancellability flag; engine applied the conservative 40%, the independent calculation used the product default of 10%. 110 x 30% x 75% = about 25. Engine followed the memo; the real fix is the missing source data | No: root cause found, data fix raised at source, counter reset |
| Month 2 | 5,350 | 8,010 | +2,660 | 8,002 | 8 | 0.10% | Engine used 5pm foreign exchange rates, independent calculation used ledger close rates; agreed the engine should use ledger close rates, defect fixed | No: explained, but above the 0.05% threshold, so counted as a failed period |
| Month 3 | 5,410 | 8,060 | +2,650 | 8,059 | 1 | 0.01% | Rounding on currency conversion | Yes |
| Month 4 | 5,440 | 8,100 | +2,660 | 8,100 | 0 | 0.00% | None | Yes |
| Month 5 (quarter-end) | 5,480 | 8,150 | +2,670 | 8,149 | 1 | 0.01% | Rounding | Yes |

Two observations. First, the expected movement (about +2,650 a month) matched the impact estimate of +2,620 closely, which confirms the change does what was intended. Second, the plan said three month-ends, but the first two failed tolerance, so the parallel run ran for five, ending with three clean periods including a quarter-end. That slippage is normal; start parallel running early. Note how month 1 was a *data* problem, not a code problem: the engine behaved exactly as specified, and the fix was to populate the flag at source.

### Step 7: go-live and review

The go-live gate signs off; the CAB approves deployment in a mid-month window two weeks before the first reporting date under the new rule; the toggle activates for that reporting date. The post-implementation review after the first quarterly return finds the actual increase was +2,690, within 3% of the estimate, closes all defects, and records one action: retire the conservative default for missing flags once the source data fix has been in place for two quarters.

## Common mistakes and misunderstandings

- **"We tested it, so it is done."** Without traceability and stored evidence, you cannot *show* it was tested. Undocumented testing counts as no testing in an inspection.
- **Letting the delivery team interpret the rule.** Implementers who interpret their own requirements fail segregation of duties and own the consequences if the reading is wrong.
- **Testing totals only.** Offsetting errors hide inside correct totals. Compare at exposure level.
- **Editing expected results to match the code.** The golden portfolio becomes a mirror, not an answer key. Expected result changes need business approval.
- **Treating configuration as not code.** A CCF table edit changes capital as surely as a code change.
- **Planning one parallel run.** Plan for the first one or two to fail. Leave room before the regulatory date.
- **Setting tolerances after seeing the variances.** Tolerances must be agreed in advance by finance and risk, or they lose their meaning.
- **Forgetting downstream consumers.** The engine is updated but the pricing tool, capital plan or Pillar 3 template still uses the old logic.
- **Skipping decommissioning.** Old systems quietly kept alive by one spreadsheet become unowned, uncontrolled sources of regulatory numbers.
- **Treating the post-implementation review as optional.** Temporary workarounds become permanent without it.

## What a platform lead needs to know about this

**You own the delivery system.** Projects come and go; the pipeline, environments, test suites, golden portfolios, evidence store and release calendar are yours permanently. Invest in them, because every future regulatory change runs through them.

**Data.** Every rule change has a data question hiding inside it. In the worked example, the hard part was a cancellability flag, not the CCF table. Ask "which fields does this rule need, do we have them, and how good are they?" in the first week, using lineage from [[22 Credit Risk Data, Systems and BCBS 239]] and the data model in [[32 The Credit Risk Data Model]].

**Systems.** Build the capabilities that make regulated change cheap: automated exposure-level regression on a full frozen month-end, versioned configuration for every regulatory parameter, feature toggles keyed to reporting dates, the ability to run old and new side by side, and fast re-runs. Vendor engines (see [[33 Platform Architecture and Vendor Landscape]]) need the same discipline; their upgrades are your changes.

**Controls.** Traceability matrix for every regulatory change; segregation of duties enforced by tooling; CAB with evidence links; freeze calendar; emergency change process with retrospective review; evidence packs built as you go; post-implementation reviews with tracked actions. These are among the controls you will be named against in the operational risk framework (see [[30 Operational Risk]]).

**Who owns what.**

| Activity | Typical owner |
|---|---|
| Reading and interpreting the rule | Regulatory policy, with credit risk methodology and finance |
| Business requirements and UAT sign-off | Credit risk and finance business owners |
| Specification, build, unit and system tests | Platform team |
| Golden portfolio expected results | Business owner approves; platform maintains |
| Independent implementation testing | Model validation (second line) |
| Tolerances and parallel run acceptance | Finance and credit risk |
| Production change approval | Change advisory board |
| Evidence pack and traceability | Platform team, with inputs from all |
| Attestation of compliance | Accountable senior executive, supported by the above |
| Assurance | Internal audit |

**Questions to ask on any change.** What class of number impact is this? Who signed the interpretation? What is the impact estimate? Which reports are affected? Who set the tolerances? Is there room for a failed parallel run before the deadline? Can we roll back? Where is the evidence pack? Templates are in [[38 Platform Lead Toolkit - Runbooks, Metrics and Templates]].

## Related notes

- [[35 Regulatory Landscape and Change Calendar]] for where regulatory change comes from and how to plan for it.
- [[18 Regulatory Capital and Basel - the Short Version]] for credit conversion factors, RWA and the output floor.
- [[basel-credit-risk-explained-simply]] for the full walk through the capital rules.
- [[basel-credit-risk-decision-tree]] for how exposures branch to approaches.
- [[21 Model Risk Management and Validation]] for model change control and implementation testing.
- [[22 Credit Risk Data, Systems and BCBS 239]] for the baseline change controls and data lineage.
- [[23 Reporting - Regulatory Returns, Pillar 3 and Management Information]] for the reports your changes affect.
- [[30 Operational Risk]] for change risk, incidents and control ownership.
- [[32 The Credit Risk Data Model]] for the fields and links that rules depend on.
- [[33 Platform Architecture and Vendor Landscape]] for the systems you will be changing.
- [[38 Platform Lead Toolkit - Runbooks, Metrics and Templates]] for templates and runbooks.
- [[27 A Platform Lead's First 90 Days]] for where change delivery fits in your first months.
- [[28 Master Glossary]].
