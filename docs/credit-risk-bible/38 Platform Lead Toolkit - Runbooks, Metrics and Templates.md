# Platform Lead Toolkit - Runbooks, Metrics and Templates

**Why this matters to you.** The other notes in this vault explain what credit risk is. This one is the drawer of tools you open on a Monday morning. [[27 A Platform Lead's First 90 Days]] told you to set up an operating rhythm, an incident process tied to reporting deadlines, a weekly data quality review and a change board. Here are the actual templates, including a RACI chart (who is responsible, accountable, consulted and informed), each with a few lines on why it exists, ready to copy into your own wiki. All numbers, times and thresholds are illustrative: adjust them to your bank's calendar, policies and regulators.

## Table of contents

1. [How to use this toolkit](#how-to-use-this-toolkit)
2. [The operating rhythm](#the-operating-rhythm)
3. [Quarter-end run runbook and checklist](#quarter-end-run-runbook-and-checklist)
4. [Incident severity matrix](#incident-severity-matrix)
5. [Incident escalation and the incident report](#incident-escalation-and-the-incident-report)
6. [Data quality scorecard](#data-quality-scorecard)
7. [Reconciliation break log](#reconciliation-break-log)
8. [RACI for the main credit risk processes](#raci-for-the-main-credit-risk-processes)
9. [Service level objectives and key metrics](#service-level-objectives-and-key-metrics)
10. [Weekly status update](#weekly-status-update)
11. [Monthly steering committee pack](#monthly-steering-committee-pack)
12. [Vendor review](#vendor-review)
13. [End-user computing inventory](#end-user-computing-inventory)
14. [Change request with regulatory impact](#change-request-with-regulatory-impact)
15. [Meeting map](#meeting-map)
16. [Questions to ask for any new initiative](#questions-to-ask-for-any-new-initiative)
17. [Reading list of primary sources](#reading-list-of-primary-sources)
18. [Common mistakes and misunderstandings](#common-mistakes-and-misunderstandings)
19. [What a platform lead needs to know about this](#what-a-platform-lead-needs-to-know-about-this)
20. [Related notes](#related-notes)

## How to use this toolkit

Airline pilots are highly skilled, and they still read a checklist before every take-off. Tired, busy people skip steps, and skipped steps cause accidents. A quarter-end run at two in the morning is your take-off.

Three rules for using these templates:

1. **Copy, then cut.** Each template is deliberately complete. Delete what does not apply rather than adding what you forgot.
2. **Evidence by default.** Every template produces a record. Internal audit and the regulator will ask "show me", and a filled-in template is the answer (see [[30 Operational Risk]] on control evidence).
3. **Same format every time.** The value of a weekly update or a scorecard is that people can compare this week with last. Change the format rarely and on purpose.

## The operating rhythm

Your year runs on a calendar set by accounting and regulation (see [[27 A Platform Lead's First 90 Days]]). The diagram shows the recurring beats; the table maps templates to them.

![[38-operating-rhythm.svg]]
*The operating rhythm: daily run checks feed weekly reviews, which feed the monthly steering pack, which builds towards the quarter-end run and the annual cycle of stress tests, model reviews, audit and planning.*

| Cadence | What you run | Templates used |
|---|---|---|
| Daily | Batch checks, feeds, incident triage | Severity matrix, incident report, break log |
| Weekly | Data quality review, change board, stakeholder update | Data quality scorecard, change request, weekly status |
| Monthly | Month-end runs of expected credit loss (ECL) and risk-weighted assets (RWA), steering committee | Metrics set, steering pack, vendor review |
| Quarterly | The big run, regulatory returns, attestations | Quarter-end runbook, RACI chart, end-user computing (EUC) inventory |
| Annual | Stress test and internal capital adequacy assessment process (ICAAP) runs, audit, budget, roadmap | Reading list, questions checklist, vendor review |

## Quarter-end run runbook and checklist

### Why it exists

The quarter-end run produces the numbers that go into the published accounts and the regulatory capital returns (see [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]], [[18 Regulatory Capital and Basel - the Short Version]] and [[23 Reporting - Regulatory Returns, Pillar 3 and Management Information]]). It touches dozens of feeds and several teams. A runbook turns it from a heroic effort into a repeatable process.

**Timeline convention.** T is the reporting date (the last day of the quarter). T-5 means five working days before; T+3 means three working days after. Exact days depend on your finance close timetable and your regulators' submission deadlines, which differ by country.

### The template

**Quarter-end runbook: [Quarter, year]**

| Field | Entry |
|---|---|
| Run owner (platform) | |
| Business owners (credit risk, finance, regulatory reporting) | |
| Reporting date (T) | |
| Finance close deadline for ECL and RWA | T+[ ] |
| Regulatory submission deadline(s) | |
| Change freeze window | T-5 to T+10 (illustrative) |
| Run bridge or call details | |
| Escalation contacts (see severity matrix) | |

**Before the quarter end**

| Day | Task | Owner | Done | Evidence |
|---|---|---|---|---|
| T-15 | Confirm the close calendar with finance and regulatory reporting; publish it | Platform lead | [ ] | Calendar published |
| T-15 | Confirm vendor support cover for the run window | Vendor manager | [ ] | Vendor confirmation |
| T-10 | Confirm staffing and on-call rota, including nights and weekends | Platform lead | [ ] | Rota |
| T-10 | Agree which changes, if any, are exempt from the freeze; record approvals | Change advisory board | [ ] | Board minutes |
| T-5 | Change freeze starts on all in-scope systems | Release manager | [ ] | Freeze notice |
| T-5 | Confirm model versions, parameters and configuration to be used; compare with model inventory | Model owner and platform | [ ] | Signed configuration list |
| T-5 | Macroeconomic scenarios and weights for ECL approved and loaded | Credit risk methodology | [ ] | Approval record, load log |
| T-5 | Dry run on the previous month-end data; check run times and storage | Platform team | [ ] | Dry run report |
| T-3 | Cut-off for rating overrides, watchlist changes and staging overrides | Credit risk | [ ] | Cut-off notice |
| T-3 | Collateral revaluations due this quarter loaded | Collateral operations | [ ] | Exception list of stale valuations |
| T-1 | Environment health check: disk, database, job scheduler, interfaces | Platform team | [ ] | Health check output |
| T-1 | Reference data snapshot (hierarchies, product mappings, country codes) taken | Data owners | [ ] | Snapshot number |

**After the quarter end**

| Day | Task | Owner | Done | Evidence |
|---|---|---|---|---|
| T+1 | Source system end-of-day completed; feeds received | Platform team | [ ] | Feed arrival log |
| T+1 | Completeness checks: record counts and balance totals against source and general ledger (GL) | Platform team | [ ] | Control totals report |
| T+1 | Foreign exchange (FX) rates and market data loaded and checked | Platform team | [ ] | Rate check |
| T+2 | Data quality rules run on critical data elements; exceptions to owners | Data owners | [ ] | Data quality scorecard |
| T+2 | First full ECL and RWA runs | Platform team | [ ] | Run log with versions |
| T+3 | Reconciliations to GL and to previous quarter; variance analysis drafted | Finance and credit risk | [ ] | Reconciliation pack, break log |
| T+4 | Post-model adjustments and manual adjustments proposed, approved and logged | Credit risk methodology | [ ] | Adjustments register |
| T+4 | Re-run if adjustments or fixes require it; record why | Platform team | [ ] | Re-run log |
| T+5 | ECL and RWA results delivered to finance for close | Platform lead | [ ] | Delivery note |
| T+6 | Impairment committee pack drafted | Credit risk | [ ] | Draft pack |
| T+7 | Regulatory return templates populated; validation rules run | Regulatory reporting | [ ] | Validation report |
| T+8 | Sign-offs: credit risk, finance, regulatory reporting | Named signatories | [ ] | Sign-off record |
| T+10 | Results locked; evidence pack archived; freeze lifted | Platform lead | [ ] | Archive reference |
| T+10 | Run retrospective: what broke, what was manual, what to fix | Platform lead | [ ] | Retrospective notes, actions |

**Go or no-go checkpoints.** Hold a 15-minute call at T+1 (are the inputs complete?), T+3 (do the numbers reconcile?) and T+5 (can we deliver to finance?). At each, the answer is go, go with known issues (listed), or no-go (escalate under the severity matrix).

## Incident severity matrix

### Why it exists

Ordinary information technology (IT) severity scales measure how many users are affected. In a credit risk platform the real question is **how close the problem is to a deadline that matters**: a regulatory submission, the published accounts or a daily limit report. A small batch failure on T+4 can be more serious than a large one in mid-quarter. Tie severity to deadlines and to the correctness of reported numbers.

### The template

| Severity | Definition | Deadline or number impact | Examples | Response | Who is told | Update cadence |
|---|---|---|---|---|---|---|
| 1 Critical | A regulatory submission, published financial figure or daily limit control will be missed or wrong without immediate action | Deadline at risk within 2 working days, or a submitted or published number found materially wrong | Quarter-end ECL run cannot complete on T+4; wrong mapping found in a submitted capital return | Major incident bridge within 30 minutes; work continues around the clock | Platform lead, head of credit risk, finance controller, head of regulatory reporting; chief risk officer (CRO) and chief financial officer (CFO) informed; compliance assesses regulator notification | Every 2 hours |
| 2 High | A key output is late or at risk, but within buffer; or a material number may be wrong but is not yet used | Deadline at risk within 5 working days, or a material error in internal management information (MI) | Daily limit feed late beyond 09:00; default flag errors in a monthly run | Fix team within 2 hours in business hours | Platform lead, business owner of the output | Twice a day |
| 3 Medium | Degraded service or a non-material error with a workaround | No deadline at risk | A secondary report fails | Next business day | Platform team lead, affected users | Daily |
| 4 Low | Cosmetic issue or minor inconvenience | None | Formatting error in a dashboard; slow screen | Planned backlog | Ticket only | On resolution |

**Escalation rules**

- During the quarter-end window (T-5 to T+10), raise any incident affecting in-scope systems by one level.
- If unsure between two levels, choose the higher; downgrade later with a note.
- Any incident where a number already submitted to a regulator or published may be wrong is severity 1, regardless of size, until materiality is assessed.
- Every severity 1 and 2 incident is assessed for logging as an operational risk event (see [[30 Operational Risk]]).

## Incident escalation and the incident report

### The flow

![[38-incident-escalation.svg]]
*Incident escalation: triage by severity and deadline proximity, contain, notify the right owners, decide with compliance whether the regulator must be told, fix and verify, then review and log the event with operational risk.*

### Why a written report

Memory fades within days and the next audit is months away. A short, factual report written within a few days of every severity 1 and 2 incident is the evidence that the incident was handled, that its root cause was found and that actions exist. Write it in plain words: a finance controller should understand it.

### The template

**Incident report: [Incident number]**

| Field | Entry |
|---|---|
| Title (one line, plain words) | |
| Severity (initial and final) | |
| Status | Open / Contained / Resolved / Closed |
| Date and time occurred | |
| Date and time detected, and how | |
| Date and time contained | |
| Date and time resolved | |
| Systems affected | |
| Outputs affected (reports, returns, runs, limits) | |
| Deadlines affected and outcome (met / missed / at risk) | |
| Customers affected (yes / no, how many) | |
| Financial impact (estimate, direct cost and any misstatement of reported figures) | |
| Was any submitted or published number wrong? If yes, by how much and is a resubmission needed? | |
| Regulator notification required? Decision by and date | |
| Operational risk event logged? Reference | |

**What happened** (factual timeline)

| Time | Event |
|---|---|
| | |

**Root cause.** Ask "why" until you reach something that can be fixed. "Human error" is not a root cause; why did the process allow the error?

**Contributing factors.** For example: no automated check, a late change, an unclear handover, vendor response.

**Actions**

| Action | Type (fix / prevent / detect) | Owner | Due date | Status |
|---|---|---|---|---|
| | | | | |

**Sign-off.** Platform lead, business owner of the affected output, and operational risk partner for severity 1.

## Data quality scorecard

### Why it exists

Data problems cause most wrong numbers (see [[22 Credit Risk Data, Systems and BCBS 239]]). A **critical data element** (CDE) is a field whose error would materially change a reported number or decision. A scorecard measures each CDE every run against agreed rules and thresholds, so the weekly data quality meeting discusses facts, not anecdotes. Think of a school report card: one line per subject, a grade, a comment, and the same format every term.

**Dimensions** commonly used: **completeness** (is it filled?), **validity** (is it an allowed value?), **accuracy** (does it match the source of truth?), **consistency** (does it agree across systems?), **timeliness** (is it up to date?) and **uniqueness** (no duplicates).

### Worked example and template

In the table, IFRS 9 means the International Financial Reporting Standard on financial instruments described in [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]]. Month-end scorecard, illustrative thresholds and results. Pass rate = records passing all rules for that CDE / records tested.

| Critical data element | Main rule | Dimension | Owner | Green | Amber | Red | This month | Last month | Status | Comment |
|---|---|---|---|---|---|---|---|---|---|---|
| Counterparty identifier | Present and unique | Completeness, uniqueness | Customer data | 100% | 99.9% to 100% | below 99.9% | 100.00% | 100.00% | Green | |
| Legal entity identifier (corporates) | Present and valid format | Completeness, validity | Customer data | 99.5% or more | 98% to 99.5% | below 98% | 98.70% | 98.50% | Amber | 61 new counterparties onboarded without it |
| Counterparty sector / exposure class | Valid mapping exists | Validity | Credit risk reporting | 99.9% or more | 99.5% to 99.9% | below 99.5% | 99.95% | 99.92% | Green | |
| Country of risk | Present, valid code | Completeness, validity | Customer data | 99.9% or more | 99.5% to 99.9% | below 99.5% | 99.80% | 99.85% | Amber | |
| Facility limit | Present and positive for committed facilities | Completeness | Credit operations | 99.9% or more | 99.5% to 99.9% | below 99.5% | 99.97% | 99.96% | Green | |
| Drawn balance | Matches core banking to 1 unit | Accuracy | Credit operations | 100% | 99.95% to 100% | below 99.95% | 100.00% | 99.98% | Green | |
| Undrawn committed amount | Limit minus drawn, not negative | Consistency | Credit operations | 99.9% or more | 99.5% to 99.9% | below 99.5% | 99.10% | 99.70% | Red | Overdrawn facilities showing negative undrawn; also feeds liquidity |
| Days past due | Present for all loans, consistent with arrears system | Completeness, consistency | Collections | 99.9% or more | 99.5% to 99.9% | below 99.5% | 99.93% | 99.94% | Green | |
| Default flag | Consistent with days past due and unlikeliness-to-pay list | Consistency | Credit risk | 100% | 99.98% to 100% | below 99.98% | 100.00% | 100.00% | Green | |
| Probability of default (PD) or rating | Present, from approved model version | Completeness, validity | Credit risk modelling | 99.5% or more | 99% to 99.5% | below 99% | 99.60% | 99.40% | Green | |
| Collateral value | Present where collateral is linked | Completeness | Collateral operations | 99.5% or more | 98% to 99.5% | below 98% | 99.20% | 99.10% | Amber | |
| Collateral valuation date | Within policy age (for example 12 months for property) | Timeliness | Collateral operations | 98% or more | 95% to 98% | below 95% | 94.20% | 95.10% | Red | Commercial property revaluations behind schedule |
| Maturity date | Present, after start date | Validity | Credit operations | 99.9% or more | 99.5% to 99.9% | below 99.5% | 99.99% | 99.99% | Green | |
| IFRS 9 stage | Present and consistent with staging rules | Consistency | Credit risk (impairment) | 100% | 99.95% to 100% | below 99.95% | 100.00% | 100.00% | Green | |

**Summary line for the steering pack:** 14 CDEs: 9 green, 3 amber, 2 red (undrawn amount consistency, collateral valuation timeliness). Both reds have owners and actions.

**Rules for the scorecard**

- Thresholds are agreed with the data owner and the consuming team, and recorded.
- Two consecutive reds escalate to the data governance forum; three to the steering committee.

## Reconciliation break log

### Why it exists

A **reconciliation** proves that two sets of numbers that should agree do agree: your exposure total and the general ledger, your undrawn amounts and the liquidity team's, this quarter and last quarter after explained movements. A **break** is a difference above tolerance. The log makes every break visible, owned and aged, rather than fixed quietly each quarter and forgotten.

### Worked example and template

| Break number | Date raised | Reconciliation | Source A (value) | Source B (value) | Difference | Tolerance | Material? | Root cause category | Owner | Target date | Age (days) | Status | Resolution |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| RB-0412 | T+3 | Drawn balance: risk platform vs GL, corporate loans | 18,452.6m | 18,449.1m | 3.5m | 1.0m | Yes | Timing: late booking after cut-off | Credit operations | T+5 | 2 | Resolved | Adjusted in GL; cut-off rule tightened |
| RB-0413 | T+3 | ECL: impairment engine vs GL provision account | 412.8m | 409.3m | 3.5m | 0.5m | Yes | Manual overlay not posted | Finance | T+4 | 1 | Resolved | Overlay journal posted |
| RB-0414 | T+3 | Undrawn commitments: credit platform vs liquidity extract | 2,240m | 2,200m | 40m | 5m | Yes | Definition: different cut-off time and treatment of overdrawn facilities | Platform lead | Next quarter | 2 | Open | Agree one definition; single governed dataset |
| RB-0415 | T+4 | Count of defaulted counterparties: platform vs collections | 1,204 | 1,201 | 3 | 0 | Yes | Data: three cures not yet reflected | Collections | T+6 | 1 | In progress | |

**Root cause categories** (use the same list every time, so trends show): timing or cut-off; definition or scope; mapping or reference data; missing or duplicate records; manual adjustment; system defect; FX or rounding; unknown (must not stay unknown).

**Rules.** Every break has an owner and a target date. Breaks open at quarter-end sign-off are listed in the sign-off with an estimated impact. Repeat breaks with the same root cause become a problem ticket and a roadmap item.

## RACI for the main credit risk processes

### Why it exists

A **RACI** chart says, for each activity, who is **Responsible** (does the work), **Accountable** (owns the outcome and signs; exactly one per row), **Consulted** (asked before) and **Informed** (told after). The school version: for the school play, the drama teacher is accountable, the pupils are responsible for performing, the music teacher is consulted on songs, and parents are informed of the date. Most disputes in credit risk ("whose problem is this break?") are settled faster with a RACI on the wall.

### The template

Roles: **PL** platform lead and team; **CRM** credit risk methodology (owns calculation rules); **MOD** model owners and developers; **VAL** independent model validation; **FIN** finance; **RR** regulatory reporting; **DO** data owners and credit operations; **CRO** chief risk officer or delegated committee. Internal audit reviews everything independently and is not shown.

| Process and activity | PL | CRM | MOD | VAL | FIN | RR | DO | CRO |
|---|---|---|---|---|---|---|---|---|
| **RWA run:** calculation rules and configuration | R | A | C | I | C | C | I | I |
| RWA run: execution and run evidence | A | I | I | I | I | I | C | I |
| RWA run: input data quality | C | I | I | I | I | I | A | I |
| RWA run: results sign-off | C | A | I | I | C | C | I | I |
| **ECL run:** scenarios and weights | I | R | C | C | C | I | I | A |
| ECL run: execution and run evidence | A | C | C | I | I | I | C | I |
| ECL run: post-model adjustments | I | A | C | C | C | I | I | I |
| ECL run: booking and reconciliation to GL | C | C | I | I | A | I | I | I |
| **Limits:** limit setting and approval | I | C | I | I | I | I | I | A |
| Limits: limit data and monitoring system | A | C | I | I | I | I | R | I |
| Limits: excess escalation | I | R | I | I | I | I | I | A |
| **Regulatory returns:** mapping and production | C | C | I | I | C | A | I | I |
| Regulatory returns: data delivery from platform | A | C | I | I | I | C | C | I |
| Regulatory returns: final sign-off and submission | I | C | I | I | C | R | I | A |
| **Model deployment:** model specification and test cases | C | C | A | C | I | I | I | I |
| Model deployment: independent validation and approval | I | I | C | A | I | I | I | I |
| Model deployment: implementation and testing in production | A | C | C | C | I | I | I | I |
| Model deployment: post-implementation check | R | I | C | A | I | I | I | I |

Final regulatory sign-off often sits with the CFO or a named senior manager instead. Adjust, but keep one A per row.

## Service level objectives and key metrics

### Why they exist

A **service level objective** (SLO) is a target for how well a service performs, agreed with its users; a **service level indicator** (SLI) is the measurement behind it. **Key performance indicators** (KPIs) show whether you are delivering; **key risk indicators** (KRIs), explained in [[30 Operational Risk]], warn of trouble ahead. The business does not care about server uptime; it cares whether the numbers were on time, right and controlled. So start from those outcomes and work down.

![[38-metrics-tree.svg]]
*A metrics tree: the business outcome at the top splits into timely, accurate, controlled and adaptable, and each of those is measured by a small set of platform metrics the team can act on.*

### The metric set

| Metric | Definition | Formula | Target (illustrative) | Frequency | Owner |
|---|---|---|---|---|---|
| Run completion time | Time the run finished against its deadline | Actual completion vs scheduled deadline | Daily limits by 07:00 on 98% of days; quarter-end ECL and RWA delivered by T+5 every quarter | Per run | Platform lead |
| First-time-right rate | Runs needing no unplanned re-run | Runs without unplanned re-run / total runs | 90% or more for month-end runs | Monthly | Platform lead |
| Open reconciliation breaks | Breaks above tolerance not yet resolved, and their age | Count; count older than 5 days | Zero material breaks open at sign-off | Weekly and quarter-end | Platform lead with finance |
| Manual adjustments | Number and value of manual adjustments applied to outputs | Count; total absolute value | Falling trend; every one approved and logged | Monthly | Credit risk methodology |
| Data quality pass rate | Share of CDE checks passing thresholds | Green CDEs / total CDEs; and records passing / records tested | 90% of CDEs green, no red for more than two months | Every run | Data owners |
| Change failure rate | Share of production changes causing an incident or rollback | Failed changes / total changes | Below 5% | Monthly | Platform lead |
| Mean time to restore | Average time to restore service after severity 1 or 2 incidents | Sum of restore times / number of incidents | Under 4 hours | Monthly | Platform lead |
| Regulatory submissions on time | Submissions made by deadline without platform-caused delay | On-time / total | 100% | Quarterly | Regulatory reporting |
| Open audit and regulatory findings | Findings on the platform not closed, and how many are overdue | Count open; count overdue | Zero overdue | Monthly | Platform lead |

### Worked example: one quarter's metrics

| Metric | Data | Result | Against target |
|---|---|---|---|
| First-time-right | 3 month-end runs; 1 needed an unplanned re-run after a late collateral file | 2 / 3 = 66.7% | Below 90%: action |
| Change failure rate | 52 production changes; 3 caused incidents, 1 was rolled back | 4 / 52 = 7.7% | Above 5%: action |
| Mean time to restore | 3 incidents restored in 2, 3 and 7 hours | 12 / 3 = 4.0 hours | At the limit |
| Data quality pass rate | 9 of 14 CDEs green | 9 / 14 = 64% | Below 90%: action |
| Manual adjustments | 11 adjustments, total absolute value 86m (last quarter 14, 120m) | Falling | On track |
| Open findings | 6 open, 1 overdue | 1 overdue | Off target |

Show the trend for at least four periods; one quarter alone says little.

## Weekly status update

### Why it exists

Stakeholders want to know: is anything going to hurt me, what do you need from me, and is the plan on track? A one-screen update in the same shape every week answers that and saves a dozen meetings.

### The template

**Credit risk platform: weekly update, week ending [date]**

**Overall status:** Green / Amber / Red (one sentence why)

| Area | Status | Comment |
|---|---|---|
| Daily runs and service | | |
| Month-end or quarter-end readiness | | |
| Data quality | | |
| Key deliveries | | |
| Audit and regulatory findings | | |

**Highlights (up to three)**
- 

**Issues and incidents this week**
- [Severity, one line, status, owner]

**Decisions or help needed** (name the person and the date needed by)
- 

**Next week**
- 

**Key dates ahead**
| Date | Event |
|---|---|
| | |

**Metrics snapshot:** first-time-right [ ], open material breaks [ ], CDEs red [ ], changes this week [ ] (failed [ ]).

Rule: red or amber always comes with a recovery plan and a date.

## Monthly steering committee pack

### Why it exists

The steering committee is where the people who fund and depend on your platform (typically the head of credit risk, a finance director, the head of regulatory reporting, a technology executive and a risk control partner) make decisions. The pack should drive decisions, not recount activity. Aim for 10 to 12 pages including appendices; send it at least two working days before the meeting.

### The outline

| Section | Content | Length |
|---|---|---|
| 1. Decisions requested | Each decision with options, recommendation, cost and risk of each option | 1 page |
| 2. Executive summary | Overall status, top three messages | Half a page |
| 3. Service performance | Metrics set with four-period trends; run completion against deadlines; incidents of severity 1 and 2 | 1 page |
| 4. Data quality | Scorecard summary; reds and their actions | 1 page |
| 5. Controls and findings | Open audit and regulatory findings, overdue actions, end-user computing status, manual adjustments trend | 1 page |
| 6. Delivery portfolio | Projects with status, milestones, budget; regulatory deadlines | 1 to 2 pages |
| 7. Risks and issues | Top risks with likelihood, impact, owner, mitigation | 1 page |
| 8. Regulatory and change horizon | Upcoming rule changes and their platform impact (see [[35 Regulatory Landscape and Change Calendar]]) | Half a page |
| 9. Vendors | Service performance of critical vendors, contract events | Half a page |
| 10. Financials | Run and change spend against budget | Half a page |
| Appendix | Detailed metrics, minutes and action log from last meeting | As needed |

**Action log format**

| Action | Raised | Owner | Due | Status | Comment |
|---|---|---|---|---|---|
| | | | | | |

## Vendor review

### Why it exists

A vendor takes the work, not the responsibility (see [[30 Operational Risk]] and [[33 Platform Architecture and Vendor Landscape]]). Rating engines, ECL and RWA calculators, data providers and cloud services need a regular, written review: monthly for critical vendors on service, annually in full. The full review is also evidence for third-party risk management.

### The template

**Vendor review: [Vendor, service], [period]**

| Field | Entry |
|---|---|
| Service provided | |
| Business processes dependent on it | |
| Criticality (critical / important / standard) and whether it supports an important business service | |
| Contract start, renewal and notice dates | |
| Annual cost | |
| Relationship owner and contract owner | |

**Service performance**

| Service level | Target | Actual this period | Trend | Breaches |
|---|---|---|---|---|
| Availability during run windows | | | | |
| Incident response (severity 1) | | | | |
| Defect fix times | | | | |
| Regulatory update delivery (for example rule changes in the engine) | | | | |

**Incidents and problems:** list, with root causes and vendor actions.

**Risk and control**

| Check | Status | Evidence |
|---|---|---|
| Security assessment or certification current | | |
| Independent control report received and reviewed | | |
| Data location and privacy terms met | | |
| Business continuity test results received | | |
| Exit plan documented and last tested | | |
| Concentration: other critical services from this vendor | | |

**Roadmap and regulation:** does the vendor's roadmap support known rule changes on time? Version support end dates?

**Overall rating:** Satisfactory / Needs improvement / Unsatisfactory

**Actions**

| Action | Owner (bank or vendor) | Due | Status |
|---|---|---|---|
| | | | |

## End-user computing inventory

### Why it exists

An **end-user computing** (EUC) tool is a spreadsheet, database, script or report built by users rather than IT. Many credit risk numbers pass through one: an overlay calculation, a mapping table, a manual return template. They are not banned, but critical ones must be known and controlled. The inventory is the register; the risk rating decides how much control each needs.

### The template

| EUC number | Name and location | Owner | Purpose | Outputs used for | Criticality | Complexity | Users | Version control | Access restricted | Logic documented | Independent review (last date) | Change log | Replacement plan and date |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| EUC-031 | Post-model adjustment calculator, shared drive | Head of impairment methodology | Calculates sector overlays to ECL | Published ECL, impairment committee | High | High (macros, 12 tabs) | 4 | Yes | Yes | Partly | [date] | Yes | Move to engine overlay module, next year |
| EUC-047 | Exposure class mapping table | Credit risk reporting | Maps product codes to Basel exposure classes | RWA, capital returns | High | Low | 2 | No | No | Yes | Never | No | Move into governed reference data, this quarter |
| | | | | | | | | | | | | | |

**Criticality rating (illustrative)**

| Criticality | Rule |
|---|---|
| High | Feeds regulatory returns, published financials, capital, provisions or credit decisions directly |
| Medium | Feeds internal MI used for management decisions, or high-criticality tools indirectly |
| Low | Personal or team productivity only |

**Minimum controls for high criticality:** named owner and backup; version control; restricted edit access; documented logic; input and output checks; independent review at least annually; change log; listed in the quarterly attestation; replacement plan considered.

## Change request with regulatory impact

### Why it exists

A normal change request asks "will it break?" In a regulated risk platform you must also ask "will it move a reported number, and does someone need to approve that before it happens?" A change to a mapping table can move capital by millions. These fields force the question at the start rather than at quarter-end. See [[34 Delivering Change in a Regulated Risk Platform]] for the wider delivery approach.

### The template

**Change request: [change request number]**

| Field | Entry |
|---|---|
| Title | |
| Requested by / business owner | |
| Description (what and why, in plain words) | |
| Systems and components changed | |
| Type: standard / normal / emergency | |
| Planned implementation date and time | |
| Inside a freeze window? If yes, exemption approval | |

**Regulatory and financial impact**

| Question | Answer |
|---|---|
| Does it change any calculation, data mapping, classification or reference data used in reported figures? | Yes / No |
| Which outputs are affected? (RWA, ECL, large exposures, liquidity returns, Pillar 3, MI) | |
| Estimated impact on key figures (RWA, ECL, capital ratio), from parallel or test run | |
| Is it a model change? Classification under model risk policy (material / non-material) | |
| Validation required or completed? Reference | |
| Does it require prior regulator approval or notification (for example a material change to an internal model)? Who decided? | |
| Does it implement a regulatory requirement? Which rule and effective date? | |
| Does it change data used by other teams (liquidity, finance, stress testing)? Have they been consulted? | |

**Testing and evidence**

| Item | Status | Reference |
|---|---|---|
| Unit and system testing | | |
| User acceptance testing by business owner | | |
| Parallel run against current production, differences explained | | |
| Reconciliation impact assessed | | |
| Rollback plan tested | | |
| Runbook and documentation updated | | |

**Approvals**

| Role | Name | Date |
|---|---|---|
| Business owner | | |
| Credit risk methodology (if calculation affected) | | |
| Model validation (if model affected) | | |
| Finance (if reported figures affected) | | |
| Regulatory reporting (if returns affected) | | |
| Change advisory board | | |

**Post-implementation check:** first production run reviewed by [name] on [date]; differences as expected? Yes / No.

## Meeting map

### Why it exists

A bank runs on committees (see [[13 Credit Governance - Committees, Authorities and the Three Lines]]). Knowing which forums exist, when they meet and what they expect from you saves you from missing a decision that affects your platform, or from arriving with the wrong material. Names and cadences vary by bank; this map is a starting point to fill in.

### The template

| Forum | Cadence (typical) | Chair (typical) | Your role | What to bring |
|---|---|---|---|---|
| Board risk committee | Quarterly | Non-executive director | Rarely attend; supply data | Data for risk reports; Basel Committee on Banking Supervision (BCBS) 239 data principles status if asked |
| Executive risk committee | Monthly | CRO | Occasionally present | Major incidents, critical findings, resilience status |
| Asset and liability committee (ALCO) | Monthly | CFO or chief executive | Data supplier | Facility, undrawn and collateral data quality (see [[37 Liquidity Risk and Funding]]) |
| Credit risk committee | Monthly | Chief credit officer | Attend for platform items | Data quality issues affecting portfolio reporting |
| Impairment or provisions committee | Quarterly (plus monthly in some banks) | CFO or CRO | Attend at quarter-end | Run status, adjustments register, breaks open |
| Model risk committee | Monthly | Head of model risk | Attend for deployments | Implementation evidence, post-implementation checks |
| Data governance council | Monthly | Chief data officer | Member | Data quality scorecard, lineage gaps |
| Regulatory reporting sign-off | Quarterly | Head of regulatory reporting or CFO | Attend | Run evidence, open breaks, known limitations |
| Operational risk committee | Monthly or quarterly | Head of operational risk | Attend when platform items appear | Incidents, KRIs, EUC inventory, control testing results |
| Change advisory board | Weekly | Head of change or release | Member | Change requests with regulatory impact fields |
| Platform steering committee | Monthly | Head of credit risk or sponsor | Run it | Steering pack |
| Quarter-end run calls | Daily during window | You | Run them | Runbook status, go or no-go |
| Audit and regulator meetings | As scheduled | Audit or supervisor | Attend when platform in scope | Evidence packs, action status |

## Questions to ask for any new initiative

### Why it exists

Every new project arrives with enthusiasm and a deadline. These questions, asked on day one, find the hidden costs and dependencies before they find you. Print it, keep it to one page, and do not start until most boxes are answered.

### The checklist

**Purpose and ownership**
- [ ] What problem does this solve, and for whom?
- [ ] Who is the accountable business owner, and who signs off "done"?
- [ ] What happens if we do nothing?

**Regulation and deadlines**
- [ ] Is there a regulatory or audit driver? Which rule, finding or commitment?
- [ ] Is the deadline set by a regulator, by the accounts, or by us?
- [ ] Does it change any reported number? Which returns, by roughly how much?
- [ ] Does it need regulator approval or notification?

**Data**
- [ ] Which data does it need, from which golden sources, and who owns them?
- [ ] Are new critical data elements created? Who will own their quality?
- [ ] Do definitions match finance, regulatory reporting and liquidity?

**Models and calculations**
- [ ] Does it introduce or change a model? Has model risk been told?
- [ ] Will a parallel run be needed, and for how long?

**Controls**
- [ ] Which controls change, and who will own the new ones?
- [ ] Does it add or remove spreadsheets or manual steps?
- [ ] How will we reconcile its outputs?

**Delivery and run**
- [ ] Does the plan avoid quarter-end freezes?
- [ ] Which vendors are involved, and are contracts and support in place?
- [ ] What will it cost to run each year, and who pays?
- [ ] What will be switched off when it goes live, and when?
- [ ] Who will support it at two in the morning on T+2?

## Reading list of primary sources

### Why it exists

Notes like these are a map; the primary sources are the territory. When a regulator, auditor or modeller quotes a rule, you should be able to find and read the paragraph.

| Source | What it is | Why you would read it |
|---|---|---|
| The consolidated Basel Framework | The Basel Committee on Banking Supervision (BCBS) standards gathered into one online framework, organised by chapter (risk-based capital, credit risk, counterparty risk, operational risk, liquidity, large exposures, disclosure) | To check what an international standard actually says; chapter references appear in findings |
| BCBS 239, the principles for effective risk data aggregation and risk reporting | The data and reporting principles (see [[22 Credit Risk Data, Systems and BCBS 239]]) | The yardstick for your platform |
| The Basel III final reforms package | The post-crisis revisions to credit, operational risk and the output floor | Drives much of the current change portfolio |
| Basel liquidity standards (the liquidity coverage ratio, the net stable funding ratio and the intraday monitoring tools) and the principles for sound liquidity risk management | Liquidity rules described in [[37 Liquidity Risk and Funding]] | Shared data with treasury |
| BCBS principles on operational resilience and on operational risk management | Resilience and control expectations | Your control and resilience obligations |
| IFRS 9 Financial Instruments, issued by the International Accounting Standards Board | The accounting standard for classification, measurement and expected credit loss impairment | Staging and ECL rules |
| Current expected credit loss (CECL) standard, issued by the Financial Accounting Standards Board in the United States | The United States impairment standard | If your bank reports under United States accounting |
| National rulebooks and supervisory guides | Each jurisdiction's legally binding version of Basel (for example European Union capital legislation with European Banking Authority technical standards, the United Kingdom regulator's rulebook, United States agency rules), plus supervisors' published guides | What actually binds your bank; details and dates differ from Basel |
| Your own bank's documents | Credit policy, model inventory and documentation, control library, data dictionary, audit reports, regulatory correspondence | The most specific source of all |

## Common mistakes and misunderstandings

- **"Templates are bureaucracy."** They are memory and evidence. The cost is minutes; the cost of not having them is a finding.
- **"Severity is about how many users are affected."** In this platform it is about deadlines and the correctness of reported numbers.
- **"Green metrics mean all is well."** If metrics are green while incidents and adjustments pile up, the metrics are measuring the wrong thing.
- **"More metrics are better."** Ten good metrics with trends beat fifty without.
- **"A RACI with two As is fine."** Two accountable people means none.
- **"Change requests only matter for code."** Reference data, mappings and configuration changes move capital too.

## What a platform lead needs to know about this

Set up these templates in your first 90 days, starting with the quarter-end runbook, the severity matrix and the break log, because those protect the deadlines. Store them in one place with version history. Review them after every quarter-end retrospective and every severity 1 incident. Make each template produce evidence that audit can sample without asking you. And keep the meeting map current: the fastest way to lose influence is to miss the forum where your platform's future was decided.

## Related notes

- [[27 A Platform Lead's First 90 Days]] for the plan these tools support.
- [[30 Operational Risk]] for incidents, KRIs, EUC and control evidence.
- [[22 Credit Risk Data, Systems and BCBS 239]] for data quality, lineage and reconciliations.
- [[23 Reporting - Regulatory Returns, Pillar 3 and Management Information]] for submission deadlines.
- [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]] and [[18 Regulatory Capital and Basel - the Short Version]] for the runs.
- [[21 Model Risk Management and Validation]] for model deployment controls.
- [[13 Credit Governance - Committees, Authorities and the Three Lines]] for committees.
- [[32 The Credit Risk Data Model]] for critical data elements in context.
- [[33 Platform Architecture and Vendor Landscape]] for vendors and systems.
- [[34 Delivering Change in a Regulated Risk Platform]] for delivery practice.
- [[35 Regulatory Landscape and Change Calendar]] for the regulatory horizon.
- [[37 Liquidity Risk and Funding]] for the treasury data you supply.
- [[28 Master Glossary]]
