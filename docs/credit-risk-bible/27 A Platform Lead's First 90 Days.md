# A Platform Lead's First 90 Days

**Why this matters to you.** You have been hired to run the technology platform for a credit risk team, and you do not yet know what credit risk is. That is more common than it sounds. Banks hire engineers and delivery leads for their platform skills and expect them to pick up the domain on the job, except nobody writes the domain down in plain words. This note is the plan for your first three months: what to learn, who to meet, what to look at, and what to deliver so that by day 90 the risk and finance people trust you with their numbers. Every other note in this vault is a reference you can dip into; this one is the route through them.

## Table of contents

1. [What a platform lead in credit risk actually does](#what-a-platform-lead-in-credit-risk-actually-does)
2. [The mental model to hold from day one](#the-mental-model-to-hold-from-day-one)
3. [Days 1 to 30: learn and listen](#days-1-to-30-learn-and-listen)
4. [Days 31 to 60: diagnose and prioritise](#days-31-to-60-diagnose-and-prioritise)
5. [Days 61 to 90: deliver one thing well](#days-61-to-90-deliver-one-thing-well)
6. [The calendar you are now living on](#the-calendar-you-are-now-living-on)
7. [The questions to ask in every meeting](#the-questions-to-ask-in-every-meeting)
8. [How to read a regulatory finding](#how-to-read-a-regulatory-finding)
9. [Working with modellers, credit officers and finance](#working-with-modellers-credit-officers-and-finance)
10. [Controls you are personally accountable for](#controls-you-are-personally-accountable-for)
11. [Common mistakes new platform leads make](#common-mistakes-new-platform-leads-make)
12. [A reading order through this vault](#a-reading-order-through-this-vault)
13. [Related notes](#related-notes)

---

## What a platform lead in credit risk actually does

Think of a school. The teachers decide what to teach and mark the exams. The head teacher sets the rules. The school office keeps the register, the timetable, the exam results and the reports to the inspectors. If the register is wrong, a child goes missing from the attendance figures and the inspector asks why. If the results spreadsheet breaks the night before reports go out, every teacher's work is wasted.

You run the school office for credit risk. Specifically, you own the systems and data pipelines that:

- Take every loan, promise, derivative and piece of collateral the bank has (see [[03 The Credit Lifecycle]] for where these come from) and bring them into one place.
- Attach the right rating, probability of default, loss given default and exposure to each one (see [[10 Internal Ratings, Scorecards and PD Models]]).
- Run the calculations that turn those into risk-weighted assets and capital (see [[18 Regulatory Capital and Basel - the Short Version]]), expected credit loss provisions (see [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]]), stress test results (see [[20 Stress Testing and ICAAP]]) and limit utilisation (see [[14 Risk Appetite, Limits and Concentration]]).
- Produce the reports that go to the regulator, the public and the board (see [[23 Reporting - Regulatory Returns, Pillar 3 and Management Information]]).
- Keep an audit trail that proves every number can be traced back to its source (see [[22 Credit Risk Data, Systems and BCBS 239]]).

You do not decide whether a loan is approved. You do not build the statistical models. You do not sign the regulatory return. But if your platform is late, wrong or untraceable, the people who do those things cannot do their jobs, and the regulator will ask them, and then they will ask you.

The job is roughly one third engineering leadership, one third data and controls, and one third translation between people who speak different languages: modellers who think in probabilities, credit officers who think in borrowers, finance people who think in ledgers, and regulators who think in rules.

---

## The mental model to hold from day one

If you remember nothing else from this vault, remember this chain:

> A borrower gets a loan. The loan is an **exposure**. The bank estimates how likely the borrower is to fail (**probability of default**), how much it would lose if they did (**loss given default**) and how much would be owed at that moment (**exposure at default**). Those three numbers, through a formula set by the Basel rules, produce **risk-weighted assets**. The bank must hold **capital** equal to a percentage of risk-weighted assets. Separately, the same three numbers produce the **expected credit loss** that accountants make the bank set aside as a **provision**. Every report you produce is some slice of that chain, and every data problem you will ever have is a break somewhere along it.

![[27-stakeholder-map.svg]]
*Where you sit: data flows in from the front office, operations and reference data; the rules and models come from your peers in risk; your outputs go to finance, regulatory reporting, committees and auditors.*

Three things make this harder than an ordinary data platform:

1. **The numbers are legally binding.** A regulatory return is signed by a senior executive who is personally accountable. If the number is wrong, the bank can be fined and the executive can be sanctioned. So "roughly right" is not acceptable, and every change needs evidence.
2. **The rules change on a schedule you do not control.** The Basel III final reforms are being phased in through 2028 in most countries. Accounting standards get reinterpreted. Your roadmap is partly written by regulators.
3. **The data comes from everywhere.** Loans live in a core banking system, derivatives in a trading system, collateral in a collateral system, ratings in a rating engine, customer hierarchies in a reference data system, and none of them were designed to agree with each other.

---

## Days 1 to 30: learn and listen

![[27-ninety-day-plan.svg]]
*The three phases: learn the domain and the landscape, diagnose and rank the problems, then deliver one visible fix and a roadmap.*

The goal of the first month is to be able to draw, on a whiteboard, how a loan becomes a number on a regulatory return, and to know the name of every person who touches it on the way. Do not try to fix anything yet.

### Week 1: read

Read in this order, and keep a list of terms you do not understand so you can ask about them later:

1. [[01 What a Bank Is and How It Makes Money]], so you know what the business is.
2. [[02 What Credit Risk Is]], so you know what the team is protecting against.
3. [[03 The Credit Lifecycle]], so you know the stages and who owns each.
4. [[basel-credit-risk-explained-simply]], the long walk through the capital rules, followed by [[18 Regulatory Capital and Basel - the Short Version]] as the summary to keep open.
5. [[22 Credit Risk Data, Systems and BCBS 239]], which is the closest thing to your job description.

Then skim the rest so you know what exists.

### Weeks 2 to 3: meet

Book 45 minutes with each of these, and ask the same core questions (listed in the section below). Take notes on what they complain about; that is your backlog.

| Who | Why they matter to you | What to ask for |
|---|---|---|
| Head of credit risk (or the chief credit officer) | Your main customer. Owns credit policy and approvals. | What keeps them up at night. What the regulator last criticised. |
| Head of risk modelling | Owns the PD, LGD, EAD, expected credit loss and stress models that run on your platform. | The model inventory. Which models are due for change. How models are deployed today. |
| Head of model validation | Independent reviewer of those models. Will ask you for evidence that production matches what was validated. | Their open findings about implementation. |
| Head of regulatory reporting | Produces the returns from your outputs. Lives on deadlines. | The reporting calendar. The reconciliation breaks they chase every quarter. |
| Finance controller for impairment and capital | Books provisions and capital in the ledger. Must reconcile to your numbers. | The month-end timetable. Where your numbers and theirs disagree. |
| Credit operations lead | Runs the loan systems that feed you. | Data quality issues they know about. Upcoming system changes. |
| Collateral operations | Maintains collateral records. Collateral is the most common source of capital errors. | How valuations are updated. Whether every collateral item is linked to a facility. |
| Data governance lead | Owns the data dictionary, the data owners and the BCBS 239 programme. | The list of critical data elements. Known gaps. |
| Internal audit (credit and technology) | Will audit you. Better to know them first. | Open audit points on the platform. |
| Treasury or markets risk contact | Source of derivatives and repo exposures. | How counterparty exposures reach you. |
| Your own team | Obviously. | What they are proud of, what they are ashamed of, what they would fix first. |

### Week 4: watch

Three things to observe in person before you form opinions:

- **A credit committee.** See [[13 Credit Governance - Committees, Authorities and the Three Lines]]. Watch a real loan get approved. Notice what data the committee looks at and where it comes from. Notice how long the credit paper took to prepare and how much of it was manual.
- **A month-end or quarter-end run.** Sit with the team through the night if that is when it happens. Note every manual step, every re-run, every spreadsheet, every phone call to fix a data problem. This is where your platform's real quality shows.
- **A reconciliation review.** Ask finance or reporting to walk you through how they prove your numbers agree with the ledger. See [[23 Reporting - Regulatory Returns, Pillar 3 and Management Information]].

By the end of the month you should have a hand-drawn diagram of the systems landscape and a list of fifteen to thirty pain points with a name attached to each.

---

## Days 31 to 60: diagnose and prioritise

Now turn the pain list into a ranked plan.

### Draw the current state properly

Turn the whiteboard sketch into a real architecture diagram and a data lineage map for the three or four most important outputs: total risk-weighted assets, total expected credit loss, the large exposures return, and the board credit dashboard. For each, trace back to source systems and mark every point where data is transformed, enriched, adjusted by hand, or reconciled. See [[22 Credit Risk Data, Systems and BCBS 239]] for what good lineage looks like.

### Score the pain points

Use a simple scoring table. Illustrative example:

| Pain point | Regulatory risk (1 to 5) | Effort (1 to 5, low is easy) | Value to users (1 to 5) | Depends on | Score |
|---|---|---|---|---|---|
| Collateral valuations older than 12 months not flagged | 5 | 2 | 4 | Collateral system feed | High |
| Quarter-end RWA run takes 14 hours with 3 manual restarts | 4 | 4 | 5 | Engine vendor | High |
| Customer group hierarchies maintained in a spreadsheet | 5 | 3 | 4 | Reference data team | High |
| Dashboard uses a different definition of "non-performing" from the regulatory return | 4 | 2 | 3 | Agreement on definition | High |
| Stress testing scenarios loaded by hand | 3 | 3 | 3 | Modelling team | Medium |
| Model version in production not recorded automatically | 4 | 2 | 2 | Validation team | Medium |

The pattern you are looking for: items with high regulatory risk and low effort go first. Items with a regulatory deadline attached go before items without one.

### Agree definitions of done

The most frequent cause of failed deliveries in this domain is that two teams used the same word for different things. "Exposure" means something different under accounting rules, capital rules and limit rules. "Default" has a regulatory definition (see [[02 What Credit Risk Is]]), an accounting definition (stage 3 under IFRS 9, see [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]]) and often an operational one. Before you build anything, write down the definition, get the risk owner and the finance owner to agree it in writing, and put it in the data dictionary.

### Check the controls

Walk through the control framework with internal audit's list in hand. The minimum set you need to be able to evidence:

- Every input file is checked for completeness (record counts, totals) before processing.
- Every calculation run is reproducible: same inputs plus same model version plus same configuration gives the same output.
- Every manual adjustment is logged with who, when, why and approval.
- Outputs reconcile to the general ledger and to the previous period, with explained variances.
- Access to production is restricted and logged.
- Changes go through a change board with testing evidence.

Where any of these is missing, it goes to the top of the plan regardless of score.

---

## Days 61 to 90: deliver one thing well

Credibility in a bank comes from one visible, finished, well-controlled delivery, not from a slide deck. Pick one item from the top of your list that can be finished in four weeks and that someone senior will notice. Good candidates:

- Automate a reconciliation that is done by hand and send the break report to the owner every morning.
- Remove one manual restart from the quarter-end run.
- Put an automated check on stale collateral valuations and route the exceptions to collateral operations.
- Replace a spreadsheet-maintained reference list with a governed table.

Ship it properly: tests, documentation, a runbook, a sign-off from the business owner, and a note to the change board. Then announce it in one paragraph to the stakeholders you met in month one.

In parallel, publish two things:

**A 12-month roadmap** tied to dates you do not control: regulatory go-live dates for the Basel final reforms in your jurisdiction, the annual stress test timetable, the model recalibration schedule, audit commitments, and vendor upgrade windows. See [[20 Stress Testing and ICAAP]] and [[21 Model Risk Management and Validation]] for the recurring cycles.

**An operating rhythm**: the run calendar (daily, month-end, quarter-end, year-end), an incident process with severity levels tied to reporting deadlines, a weekly data quality review with the data owners, and a change board that meets on a fixed cadence.

---

## The calendar you are now living on

Credit risk platforms run on a calendar dictated by accounting and regulation. Learn it early.

| Cadence | What happens | Your platform's role |
|---|---|---|
| Daily | Limit utilisation, counterparty exposure, early warning triggers, overnight batch. | Overnight loads; exposure engine; trigger engine. See [[15 Monitoring, Early Warning and Watchlist]]. |
| Weekly | Watchlist meetings, data quality review. | Watchlist reports; data quality dashboard. |
| Monthly | Management information pack, provisions estimate, limit reports. | Full run of expected credit loss and risk-weighted assets, reconciliations. |
| Quarterly | Regulatory capital return, financial statements, Pillar 3, large exposures return, impairment committee. | The big run. Sign-off evidence. Resubmissions if needed. |
| Annually | Stress test submission, internal capital adequacy assessment, model reviews, annual credit reviews, audit. | Scenario runs; model deployments; evidence packs. |
| Ad hoc | Regulator data requests, thematic reviews, new product launches, acquisitions. | Fast, traceable extracts. |

The quarter-end is the pressure point. A delay of one day in your platform can mean a missed regulatory deadline, which gets reported to the board and the regulator. Plan the year around the four quarter-ends.

---

## The questions to ask in every meeting

Use the same questions with everyone. The differences in their answers are the most useful information you will get.

1. What numbers do you produce or consume, and who signs them off?
2. Where does the data come from, and how do you know it is complete?
3. What do you do by hand that you wish you did not?
4. When was the last time a number was wrong, how did you find out, and what happened?
5. What did the regulator or audit last say about your area?
6. What is changing in the next twelve months that will affect you?
7. If you could fix one thing on the platform, what would it be?
8. Who else should I talk to?

Write the answers down in the same format for everyone. Patterns will jump out: the same spreadsheet named by three teams, the same reconciliation break blamed on three different causes.

---

## How to read a regulatory finding

At some point someone will hand you a letter from the regulator or an internal audit report with findings about data or systems. They follow a pattern:

- **The observation**: what they saw. "The bank could not evidence that collateral values used in the capital calculation were less than twelve months old."
- **The requirement**: the rule it breaks, usually a reference to a Basel chapter, a national rulebook paragraph, or a BCBS 239 principle.
- **The risk**: why it matters. "Capital may be understated."
- **The action**: what the bank promised to do, by when, and who owns it.

Your job on a finding that touches the platform is to: confirm the observation is correct (sometimes it is not), find the root cause rather than the symptom, propose a fix with a date you can actually hit, and build the evidence that it is fixed so it can be closed. Regulators care more about a credible plan honestly delivered than about speed. Missing a date you set yourself is worse than setting a later date.

See [[13 Credit Governance - Committees, Authorities and the Three Lines]] for how findings flow through the governance structure.

---

## Working with modellers, credit officers and finance

**Modellers** build the PD, LGD, EAD and expected credit loss models (see [[10 Internal Ratings, Scorecards and PD Models]] and [[21 Model Risk Management and Validation]]). They often develop in a statistics environment and hand you something to put in production. The classic failure is that the production implementation drifts from the validated model. Your ask of them: a specification that can be tested, test cases with expected outputs, and a version number. Your promise to them: a deployment process that is fast enough that they do not build workarounds.

**Credit officers** approve loans and manage the watchlist (see [[13 Credit Governance - Committees, Authorities and the Three Lines]] and [[15 Monitoring, Early Warning and Watchlist]]). They care about individual borrowers and will notice if a single large customer's exposure is wrong. They are your best source of truth for whether a number "looks right." Your ask of them: time to explain what they look at and why. Your promise: tools that show them a borrower's full picture without six logins.

**Finance** books provisions and capital and signs the accounts (see [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]]). They care about reconciliation to the ledger and about period-on-period movements being explainable. Your ask: their reconciliation rules in writing. Your promise: numbers that tie, delivered on the timetable, with a variance analysis.

**Regulatory reporting** turns your outputs into returns (see [[23 Reporting - Regulatory Returns, Pillar 3 and Management Information]]). They care about mapping every field correctly and about resubmissions. Your ask: the mapping from your data model to the return templates. Your promise: stable data definitions and advance notice of changes.

---

## Controls you are personally accountable for

In most banks, the platform lead is named as the control owner for a handful of controls. Find out which, and make sure you can evidence them on demand. Typical ones:

| Control | What you must be able to show |
|---|---|
| Input completeness | Record counts and totals from every source match what was loaded, every run. |
| Calculation integrity | The engine version, model versions and configuration used for each run are recorded; re-running gives the same answer. |
| Manual adjustment governance | Every adjustment has a reason, an approver and an expiry; adjustments are reported to the committee. |
| Reconciliation | Outputs reconcile to the general ledger and to the previous period within agreed tolerances; breaks are tracked to closure. |
| Access management | Production access is role-based, reviewed periodically, and logged. |
| Change management | Every change has a ticket, testing evidence, business sign-off and a rollback plan. |
| Data lineage | For any number on a return, you can trace it to source within a working day. |
| Business continuity | The quarter-end run can be completed if the primary environment fails. |

If any of these cannot be evidenced today, that is your first roadmap item.

---

## Common mistakes new platform leads make

- **Rebuilding before understanding.** Announcing a new platform in month one, before knowing why the old one has the manual steps it has. Most manual steps exist because a rule changed faster than the system could.
- **Treating definitions as a detail.** Building a beautiful pipeline on a definition of "exposure" that finance does not use, then discovering it at reconciliation.
- **Ignoring the calendar.** Scheduling a major release in the week before quarter-end.
- **Letting modellers deploy their own code to production** because it is quicker. It is, until validation asks for evidence.
- **Measuring success by features.** The business measures you by whether the quarter-end run finished on time and reconciled. Everything else is secondary.
- **Not reading the findings.** The regulator's and audit's open findings are the most precise statement of what the bank wants from you.
- **Assuming the vendor engine is right.** Risk-weighted asset and expected credit loss engines are configured, and the configuration is where errors live. Own the configuration.
- **Underestimating reference data.** Customer hierarchies, product codes, country codes and rating mappings cause more capital errors than any calculation bug.

---

## A reading order through this vault

If you have one hour: [[01 What a Bank Is and How It Makes Money]], [[02 What Credit Risk Is]], [[18 Regulatory Capital and Basel - the Short Version]].

If you have one day: add [[03 The Credit Lifecycle]], [[22 Credit Risk Data, Systems and BCBS 239]], [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]], [[23 Reporting - Regulatory Returns, Pillar 3 and Management Information]].

If you have one week: read everything in number order, and keep [[28 Master Glossary]] open in a side pane.

Before a meeting with a specific team, read the note that matches their world: trade finance people live in [[08 Trade Finance and Guarantees]], the workout team in [[16 Problem Loans, Restructuring and Recovery]], the leveraged finance desk in [[07 Leveraged and Acquisition Finance]], the derivatives risk team in [[19 Counterparty Credit Risk and Derivatives]], and so on.

---

## Related notes

- [[38 Platform Lead Toolkit - Runbooks, Metrics and Templates]] for copy-ready runbooks, templates and metrics.
- [[34 Delivering Change in a Regulated Risk Platform]] for how to deliver change safely.
- [[35 Regulatory Landscape and Change Calendar]] for the regulatory calendar behind your roadmap.
- [[30 Operational Risk]] for the controls, incidents and resilience you will personally own.
- [[00 Start Here]]
- [[22 Credit Risk Data, Systems and BCBS 239]]
- [[23 Reporting - Regulatory Returns, Pillar 3 and Management Information]]
- [[21 Model Risk Management and Validation]]
- [[13 Credit Governance - Committees, Authorities and the Three Lines]]
- [[18 Regulatory Capital and Basel - the Short Version]]
- [[basel-credit-risk-explained-simply]]
- [[28 Master Glossary]]
