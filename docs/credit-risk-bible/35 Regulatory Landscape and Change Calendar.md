# Regulatory Landscape and Change Calendar

**Why this matters to you.** A large share of your platform's roadmap is written by people you will never meet: committees in Basel, supervisors in Frankfurt, London, Washington, Hong Kong or Singapore, and accounting boards. Their decisions arrive as consultation papers, final rules, templates and letters, and each one can mean months of work for your team with a date that cannot move. This note is a map of that world for a non-lawyer. It explains who the regulators are, how a global standard becomes a local rule your bank must follow, how to read a consultation paper and a final rule without a law degree, which big programmes are currently shaping credit risk platforms, and how to build a calendar and a process so that regulatory change arrives as a plan rather than a surprise. [[18 Regulatory Capital and Basel - the Short Version]] explains what the capital rules say; this note explains where they come from and how to keep up. [[34 Delivering Change in a Regulated Risk Platform]] then covers how to build the change once you know it is coming.

## Table of contents

1. [The football rules version](#the-football-rules-version)
2. [Who the regulators are](#who-the-regulators-are)
3. [How a global standard becomes local law](#how-a-global-standard-becomes-local-law)
4. [How to read a consultation paper](#how-to-read-a-consultation-paper)
5. [How to read a final rule](#how-to-read-a-final-rule)
6. [The main programmes affecting a credit risk platform](#the-main-programmes-affecting-a-credit-risk-platform)
7. [A calendar framework](#a-calendar-framework)
8. [The regulatory change management process](#the-regulatory-change-management-process)
9. [Who does what: a RACI for regulatory change](#who-does-what-a-raci-for-regulatory-change)
10. [Worked example: a gap analysis](#worked-example-a-gap-analysis)
11. [Common mistakes and misunderstandings](#common-mistakes-and-misunderstandings)
12. [What a platform lead needs to know about this](#what-a-platform-lead-needs-to-know-about-this)
13. [Related notes](#related-notes)

## The football rules version

Football's laws are written by one international body. Every country's football association then adopts them, sometimes with small local twists (how many substitutes a youth league allows, whether there is video review). Referees in each league enforce the local version. When the international body changes the offside rule, there is a period of discussion, then an announcement, then each league decides when the change starts, often at the beginning of a new season. Clubs that read the announcement early retrain their defenders; clubs that wait until the first match concede goals.

Banking regulation works the same way. A global committee writes the standard; national and regional authorities turn it into law with local twists and their own start dates; supervisors enforce it. Your platform is the club that needs to retrain its defenders before the season starts.

## Who the regulators are

### The global standard setters

| Body | What it is | What it produces | Legal force |
|---|---|---|---|
| **Basel Committee on Banking Supervision** (BCBS) | Committee of bank supervisors and central banks from around 28 jurisdictions, hosted by the Bank for International Settlements (BIS) in Basel, Switzerland | The Basel Framework: capital, leverage, liquidity, large exposures, disclosure; principles such as BCBS 239 on risk data | None directly; members commit to implement it |
| **Financial Stability Board** (FSB) | Set up by the G20 group of large economies after the 2008 crisis; brings together finance ministries, central banks, supervisors and standard setters | Coordination, policy recommendations, peer reviews of how countries implement, the annual list of global systemically important banks (G-SIBs) with the BCBS | None directly; strong political weight |
| **International Accounting Standards Board** (IASB) | Writes International Financial Reporting Standards (IFRS) | IFRS 9, the expected credit loss (ECL) rules (see [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]]) | Binding where adopted by local law |
| **Financial Accounting Standards Board** (FASB) | Writes United States accounting standards | Current expected credit loss (CECL) | Binding in the United States |

Accounting standard setters are not banking regulators, but for a credit risk platform they might as well be: provisioning changes land on the same systems as capital changes.

### Examples of national and regional authorities

There are dozens of authorities worldwide. These examples cover the jurisdictions a platform lead is most likely to meet.

| Jurisdiction | Authority | Role in plain words |
|---|---|---|
| European Union | **European Commission**, **European Parliament** and **Council** | Propose and adopt the main laws: the Capital Requirements Regulation (CRR) and Capital Requirements Directive (CRD) |
| European Union | **European Banking Authority** (EBA) | Writes detailed technical standards, guidelines, reporting templates and published questions and answers; coordinates EU-wide stress tests |
| Euro area | **European Central Bank** (ECB), through the **Single Supervisory Mechanism** (SSM) | Directly supervises the significant banks in the euro area; national authorities supervise smaller ones under its oversight |
| United Kingdom | **Prudential Regulation Authority** (PRA), part of the Bank of England | Writes the prudential rulebook and supervises banks for safety and soundness; the Financial Conduct Authority (FCA) covers conduct |
| United States | **Federal Reserve** (the Fed) | Supervises bank holding companies and many large banks; runs the main supervisory stress tests |
| United States | **Office of the Comptroller of the Currency** (OCC) | Charters and supervises national banks |
| United States | **Federal Deposit Insurance Corporation** (FDIC) | Insures deposits; supervises many state-chartered banks; handles failed banks. The three US agencies usually issue capital rules jointly |
| Hong Kong | **Hong Kong Monetary Authority** (HKMA) | Central banking functions and banking supervision; capital rules set in local legislation and supervisory guidance |
| Singapore | **Monetary Authority of Singapore** (MAS) | Central bank and integrated financial regulator; capital rules set out in MAS notices |

A bank with branches or subsidiaries in several countries answers to several of these at once: the **home** supervisor (where the group is headquartered) and **host** supervisors (where its subsidiaries operate). A subsidiary may need its own local capital calculation under local rules, which is why one platform often runs several rule sets side by side. When someone says "the regulator", always ask "which one?"

### Supervisors, rule-makers and examiners

Inside each authority, different teams do different jobs, and you will meet them in different ways:

| Function | What they do | How you meet them |
|---|---|---|
| Policy | Write the rules and consult on them | Through consultation responses and industry meetings |
| Supervision | Day-to-day relationship with your bank | Data requests, meetings, findings letters |
| On-site inspection or examination | Deep reviews of a topic (internal models, credit risk data, provisioning) | Interviews, evidence requests, demonstrations of your systems |
| Statistics and reporting | Receive and check returns | Validation rule failures, resubmission requests |

## How a global standard becomes local law

![[35-standard-setting-chain.svg]]
*The standard-setting chain: the G20 sets the political direction, the FSB coordinates, the Basel Committee consults and publishes a standard, and each jurisdiction consults again, writes its own rules with local choices and transitional arrangements, and then supervises banks against them.*

The journey usually takes years, and every stage is a signal you can plan on.

| Stage | What happens | Typical duration (illustrative) | What it means for you |
|---|---|---|---|
| 1. Problem identified | A crisis or study shows a weakness (models giving very different risk weights for similar loans, for example) | Variable | Early warning; read the speeches and reports |
| 2. Basel consultation | Consultative document, often with a **quantitative impact study** (QIS) asking banks for data | 3 to 6 months for comments; QIS data requests can recur | Your platform may be asked to produce test calculations |
| 3. Basel final standard | Published with an intended implementation date | Months to years after consultation | Direction is now fairly clear, details are not |
| 4. Local consultation | Each jurisdiction proposes its own rules, with draft legal text and its own questions | Often 1 to 3 years after the Basel standard | First real view of what *your* bank must do |
| 5. Local final rules | Law, regulation or rulebook published, with **local choices** (national discretions) | Months after consultation | Start the gap analysis properly, if not already started |
| 6. Technical standards, templates, questions and answers | Detailed definitions, reporting templates, validation rules, official answers to interpretation questions | Can continue up to and after go-live | Requirements keep moving while you build |
| 7. Go-live with transitional arrangements | Rules apply, with phase-ins | Several years for some elements | Calculations change at each phase-in step |
| 8. Supervision | Returns, inspections, findings | Ongoing | Evidence of compliance is tested |

### Local choices and why they matter

Basel standards contain **national discretions**: places where each jurisdiction may choose, such as the treatment of certain real estate, the use of external ratings, or whether loss history adjusts operational risk capital (see [[30 Operational Risk]]). Jurisdictions also add their own changes or delay some elements. The result is that "Basel III" in one country can differ materially from "Basel III" in another. Platforms serving several countries need parameter tables per jurisdiction, not one global rule.

### Transitional arrangements

**Transitional arrangements** soften the move from old to new. Common types:

| Type | What it does | Platform consequence |
|---|---|---|
| **Phase-in** | A requirement rises in steps over several years | A parameter that changes on fixed dates; must be configurable by reporting date |
| **Grandfathering** | Existing exposures keep the old treatment until they mature | The platform must know each exposure's origination date and apply two rule sets at once |
| **Transitional floors or caps** | Limits on how much a number can change in early years | An extra calculation layer that later disappears |
| **Delayed application** | Some parts start later than others | Different go-live dates within one programme |

The best-known phase-in is the **output floor** in the Basel III final reforms. Under the Basel standard, banks using internal models must hold risk-weighted assets (RWA) of at least a set percentage of what the standardised approach would give, starting at 50% and rising each year to **72.5%**. The Basel schedule runs from 2023 to 2028; local schedules differ, often by several years, so check your regulator's current timetable.

## How to read a consultation paper

A **consultation paper** is a regulator saying "here is what we plan to do; tell us what you think." It is not yet law, but it is the best early guide to what the final rule will contain. Most final rules are recognisably close to their consultations, with targeted changes.

### The usual structure

| Section | What it contains | How much attention a platform lead should give it |
|---|---|---|
| Summary or overview | What is proposed and why | Read fully |
| Scope and application | Which banks, entities and exposures it applies to | Read fully; this decides whether it applies to you |
| Proposals, chapter by chapter | The policy, explained in prose | Read the chapters that touch credit risk calculations, data and reporting |
| Questions for respondents | Numbered questions the regulator wants answered | Scan; data and implementation questions are where your input helps |
| Cost-benefit or impact analysis | Estimated effect on capital and costs | Skim; useful for the scale of change |
| Implementation timeline | Proposed start dates and phase-ins | Read fully and put in the calendar as "proposed" |
| Draft rule text or legal instrument | The actual proposed rules, usually in an appendix | Read the parts your platform implements, slowly |
| Reporting templates and instructions | Draft returns | Read fully if your platform feeds them |
| Response deadline | Date comments are due | Note it; your bank's response is coordinated centrally |

### A reading method for non-lawyers

1. **Read the summary and scope first.** Decide whether it applies at all.
2. **Read the timeline.** Every date is "proposed", but the length of the runway tells you how urgent it is.
3. **Find the draft rule text for your area.** Prose explanations simplify; the rule text is what will be enforced.
4. **Mark every defined term.** Words in capitals, italics or a definitions section have precise meanings that may differ from everyday English or from another rulebook.
5. **List the data each rule needs.** For each requirement, ask "do we have that field, at that granularity, for every exposure?" This is where a platform lead adds most value.
6. **Flag what is unclear.** Ambiguities are worth raising in the bank's response; the regulator may fix them in the final rule.
7. **Estimate roughly.** Order of magnitude effort and capital impact, so the bank can decide how hard to lobby and how early to start.

### Words that matter

| Word or phrase | Meaning |
|---|---|
| "shall" or "must" | Mandatory |
| "should" | Expected; departures need a good, documented reason. In supervisory guidance, treat it as close to mandatory |
| "may" | Permitted, not required; often a choice for the bank or the national authority |
| "where" or "if" | A condition; the requirement applies only in that case |
| "notwithstanding" | This overrides whatever it refers to |
| "subject to" | This is limited by whatever it refers to |
| "at least" or "no less than" | A floor; you can be more conservative |
| "as defined in" | Go and read that other definition; do not assume |

## How to read a final rule

A final rule usually comes in two parts.

**The policy statement or feedback document** explains what changed since the consultation and why, often responding to industry comments by theme. Read this first: it highlights the differences, and those differences are where your earlier impact estimates are now wrong.

**The legal instrument** (the regulation, rulebook amendment or notice) is the binding text. It contains definitions, the operative rules, transitional provisions, a commencement or application date, and annexes such as templates. Some practical habits:

- **Find the application date and the first reporting date.** They are not always the same; a rule may apply from 1 January but first be reported as at 31 March.
- **Read transitional provisions as carefully as the main rules.** They decide what your platform calculates in the first years.
- **Compare to the consultation, paragraph by paragraph,** for the parts you implement. Regulators often publish a marked-up version; ask regulatory policy for it.
- **Keep the version you implemented.** Rules are amended; your evidence must show which version a calculation followed.
- **Watch for follow-on material.** Technical standards, updated templates, validation rules and official questions and answers can arrive months later and change the detail.

Then hand over to the change process: interpretation memo, requirements and traceability, as described in [[34 Delivering Change in a Regulated Risk Platform]].

## The main programmes affecting a credit risk platform

These are described generally, because timetables and details differ by jurisdiction and keep changing. For each, check your own regulator's current publications.

| Programme | What it is in plain words | Why it touches a credit risk platform |
|---|---|---|
| **Basel III final reforms** (also called Basel 3.1, Basel IV or the endgame) | The 2017 completion of Basel III: a revised standardised approach for credit risk, limits on internal models (input floors, restrictions on which portfolios may use advanced models), revised credit conversion factors, a new operational risk method, and the output floor | The largest change to credit risk calculations in over a decade. New data fields (loan-to-value at origination, borrower income currency, cancellability terms), new exposure classes, a full parallel standardised calculation for every modelled exposure |
| **Output floor phase-in** | The floor on modelled RWA rising in steps to 72.5% of standardised RWA | Annual parameter changes; the standardised calculation must be as accurate and controlled as the modelled one. See [[18 Regulatory Capital and Basel - the Short Version]] |
| **Fundamental Review of the Trading Book** (FRTB) | A rewrite of market risk capital, with a revised framework for credit valuation adjustment (CVA) risk | Mainly a market risk change (see [[29 Market Risk]]), but it shares counterparty, rating and reference data with the credit platform, and CVA links to [[19 Counterparty Credit Risk and Derivatives]]. Timetables have been deferred in several places |
| **IFRS 9 and CECL developments** | Post-implementation reviews by accounting standard setters, supervisory focus on management overlays, significant increase in credit risk, forward-looking scenarios and the treatment of new risks such as climate in expected loss | Changes to staging logic, overlay governance, scenario handling and disclosures. See [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]] |
| **BCBS 239 supervisory focus** | Principles for risk data aggregation and risk reporting, issued in 2013; supervisors keep finding gaps and have published more detailed expectations, such as the ECB's 2024 guide | Lineage, data quality, timeliness, and the ability to produce accurate figures quickly in a stress. Directly about your platform. See [[22 Credit Risk Data, Systems and BCBS 239]] |
| **Climate risk expectations** | Principles from the Basel Committee and supervisory expectations in many jurisdictions on managing climate-related financial risks; climate scenario exercises; climate-related disclosures | New data (emissions, property energy ratings, physical risk locations), scenario runs, disclosures. See [[25 Climate, ESG and Emerging Credit Risks]] |
| **Operational resilience** | Rules requiring banks to identify important business services, set impact tolerances and prove they can recover; in the EU, the Digital Operational Resilience Act (DORA) applies from January 2025 | Your platform may support an important business service; recovery times, third-party oversight of vendor engines and testing become regulatory commitments. See [[30 Operational Risk]] |
| **Reporting modernisation** | Moves from template returns to integrated or granular reporting: regulators collecting loan-level data, common data dictionaries, and integrated reporting frameworks that replace overlapping returns (in the euro area, for example, the ECB's integrated reporting work and its granular credit dataset) | The platform may need to deliver granular, well-defined data rather than aggregated templates, with stronger definitions and reconciliation. See [[23 Reporting - Regulatory Returns, Pillar 3 and Management Information]] |

Other topics appear on many platform roadmaps from time to time: revised definitions of default, the treatment of crypto-asset exposures, interest rate risk in the banking book, liquidity rules that use credit data (see [[37 Liquidity Risk and Funding]]), and supervisory reviews of internal models.

### Where the main jurisdictions stand

This changes often, so the honest summary is a template. As a general picture: the Basel Committee's own timetable for the final reforms started in 2023; the European Union began applying most of its credit risk elements in 2025, with some parts deferred and long transitional arrangements; the United Kingdom has deferred its start more than once; and in the United States the 2023 proposals have been subject to significant debate and revision. Hong Kong, Singapore and other jurisdictions have their own schedules. **Check your regulator's current timetable** and fill in a table like this, keeping the source and the date you checked:

| Jurisdiction | Programme element | Status (consulted, final, in force) | Application date | Phase-in steps | Source document and paragraph | Date checked | Owner |
|---|---|---|---|---|---|---|---|
| Home | Basel III final reforms, credit risk | | | | | | |
| Home | Output floor | | | | | | |
| Home | FRTB and CVA | | | | | | |
| Host 1 | Basel III final reforms, credit risk | | | | | | |
| Host 2 | Basel III final reforms, credit risk | | | | | | |
| All | IFRS 9 or CECL amendments | | | | | | |
| All | Reporting template changes | | | | | | |
| All | Climate disclosure | | | | | | |

A table with "date checked" in it is more honest than a slide with confident dates that went stale last quarter.

## A calendar framework

Regulatory work comes in two rhythms: a **recurring annual cycle** that is broadly the same every year, and **multi-year programmes** with milestones. Your calendar needs both on one page.

### The recurring annual cycle

![[35-annual-calendar.svg]]
*An illustrative annual regulatory cycle for a bank with a December year-end. Each quarter has its own peaks; monthly and quarterly runs sit underneath the whole year. Exact months vary by bank and regulator.*

| Activity | What it is | Typical timing (illustrative, December year-end) | Platform involvement |
|---|---|---|---|
| Quarterly regulatory returns | Capital, large exposures, asset quality and other returns | Roughly 4 to 6 weeks after each quarter end | The big quarterly run; reconciliations; resubmissions |
| Year-end accounts and external audit | Published accounts, including expected credit loss | December to March | ECL runs, audit evidence, overlay support |
| Pillar 3 disclosures | Public risk disclosures, annual with interim updates | With or shortly after results | Disclosure tables from platform data |
| Supervisory stress test | Regulator-designed scenarios, where your bank participates | Often launched early in the year, submissions over several months; cycles differ, some are every two years | Scenario runs, data templates, many resubmissions. See [[20 Stress Testing and ICAAP]] |
| Internal capital adequacy assessment process (ICAAP) | The bank's own capital assessment | Drafted early in the year, approved by the board, submitted to the supervisor | Stress and capital projections |
| Supervisory review and evaluation process (SREP) or equivalent | Supervisor's annual assessment, setting Pillar 2 requirements | Feedback often in the second half of the year | Data requests; findings may create work |
| Model recalibrations and annual reviews | Yearly model monitoring and redevelopment | Often aligned to a fixed point in the year | Model deployments under change control. See [[21 Model Risk Management and Validation]] |
| Internal audit plan | Audits of risk, data and technology | Plan set late in the year; audits through the year | Evidence, walkthroughs, actions |
| Budget and capital plan | Financial plan and capital forecast | Second half of the year | Projections, what-if runs |
| Change freezes | No production changes around reporting dates | Month-end, quarter-end, especially year-end | Shapes when you can release |

### Multi-year programme milestones

On top of the annual cycle sit programmes such as the Basel III final reforms, reporting modernisation or a new ECL model suite. Track each with milestones that link to the annual cycle:

| Milestone type | Example | Why it matters |
|---|---|---|
| Consultation response deadline | Bank's comments due | Last chance to influence; need impact estimates |
| Final rule publication | Expected publication | Triggers full gap analysis |
| Template and technical standard publication | Detailed reporting rules | Often late; can force rework |
| Build complete | Code and configuration done | Must leave time for testing |
| Parallel run start | First month-end in parallel | Plan for two or three clean periods, more if the first fail |
| Regulatory dry run | Some regulators ask for test submissions | Fixed date set by the regulator |
| Application date | Rule applies | Cannot move |
| First reporting date | First official return | The real deadline for the numbers |
| Phase-in steps | Annual parameter changes | Recurring small changes for years |
| Attestation | Executive confirms compliance | Needs complete evidence |

### Putting it together

A practical calendar is a single view, by month, for the next 18 to 24 months, showing quarter-ends, freezes, stress test and ICAAP windows, audit fieldwork, and each programme's milestones. Conflicts become visible at once: a parallel run that needs a clean quarter-end during the stress test submission; a go-live inside the year-end freeze; three programmes needing the same regulatory reporting analysts in the same month. Resolve those conflicts on paper, a year ahead, not in the war room.

## The regulatory change management process

Banks run a standing process so that nothing is missed and every change has an owner. The names vary; the shape is consistent.

![[35-reg-change-lifecycle.svg]]
*The regulatory change management lifecycle: scan the horizon, decide whether each item applies, analyse gaps requirement by requirement, set up a programme or route to the normal backlog, deliver, attest compliance with evidence, and then embed and monitor, feeding amendments back into the scan.*

### 1. Horizon scanning

A team (often compliance or regulatory affairs, sometimes a vendor service) monitors publications from standard setters, regulators, accounting boards and trade associations, and logs each item in a **regulatory change inventory** with a summary, source, dates and a provisional owner. Scanning also covers speeches, supervisory priorities letters and published findings from thematic reviews, because these reveal where supervisors will look next.

### 2. Applicability assessment

For each item, decide whether it applies, by legal entity, jurisdiction, business, product and approach. A rule specific to the internal ratings-based (IRB) approach does not apply to a portfolio on the standardised approach; a rule for banks above a size threshold may not apply to a subsidiary. Record the rationale for "not applicable" decisions; supervisors and auditors ask why something was ruled out, and circumstances change.

### 3. Gap analysis

Break the rule into individual requirements and compare each with current state: **compliant**, **partially compliant** or **gap**. For each partial or gap, estimate the change needed in data, systems, models, processes and reporting, and the effort. The worked example below shows the format.

### 4. Programme set-up

Large changes get a programme: an accountable executive sponsor, budget, plan back from the application date, workstreams (often methodology, data, technology, reporting, and business readiness), governance with a steering committee, and a risk and issue log. Small changes go to the normal backlog with a regulatory flag and date.

### 5. Delivery

Interpretation, requirements, build, testing, parallel runs and cutover, following [[34 Delivering Change in a Regulated Risk Platform]]. Status is reported against milestones, with early escalation if the date is at risk.

### 6. Attestation

Many banks, and some regulators, require an **attestation**: a named senior executive confirms in writing that the bank complies, backed by an evidence file. In some regimes senior individuals are personally accountable for areas such as regulatory reporting, so they will want to see the evidence before signing.

### 7. Embed and monitor

Hand over to business as usual: new controls in the control library, procedures updated, training done, a post-implementation review completed. Then keep watching for amendments, technical standards and official answers, which re-enter the cycle at step 1.

## Who does what: a RACI for regulatory change

**RACI** stands for **responsible** (does the work), **accountable** (owns the outcome; one per row), **consulted** (asked for input) and **informed** (kept up to date). Illustrative; titles and splits vary by bank.

| Activity | Regulatory policy or compliance | Accountable executive (for example chief risk officer or chief financial officer) | Credit risk methodology | Finance and regulatory reporting | Platform lead and technology | Model risk and validation | Internal audit |
|---|---|---|---|---|---|---|---|
| Horizon scanning and inventory | A, R | I | C | C | I | I | I |
| Applicability assessment | A, R | I | C | C | C | C | I |
| Interpretation of rules | R | A | R | R | C | C | I |
| Gap analysis | R | A | R | R | R (data and systems) | C | I |
| Programme set-up and funding | C | A | C | C | R (technology plan) | I | I |
| Requirements and design | C | I | A, R | R | R | C | I |
| Build and technical testing | I | I | C | C | A, R | I | I |
| Independent implementation testing | I | I | C | I | C | A, R | I |
| User acceptance and parallel run sign-off | I | I | A, R | R | R | C | I |
| Regulatory reporting of the new numbers | C | A | C | R | C | I | I |
| Attestation of compliance | R (prepares) | A | C | C | C (evidence) | C | I |
| Independent assurance | I | I | I | I | I | I | A, R |

Two things stand out for a platform lead. You are **responsible** for much of the work and accountable for the build, but **not accountable** for interpretation or compliance. And you are consulted on interpretation for a reason: you are the person who knows whether the data exists.

## Worked example: a gap analysis

A mid-sized bank's home regulator publishes final rules implementing the revised standardised approach for credit risk. The platform lead joins regulatory policy, credit risk methodology and regulatory reporting to analyse the gaps. Paragraph references and effort figures are illustrative, and the requirements follow the general shape of the Basel standard rather than any one jurisdiction's text.

| Ref | Requirement in brief | Current state | Status | Data and system impact | Effort (person-days) | Owner |
|---|---|---|---|---|---|---|
| 2.4 | Due diligence on external ratings for bank and corporate exposures; use a higher risk weight where the bank's own analysis shows more risk | External ratings applied mechanically | Gap | New due diligence process; field to record outcome and override; engine logic to apply higher weight | 60 | Credit risk methodology |
| 3.1 | Real estate split into general and income-producing, with loan-to-value (LTV) based on value at origination | Split exists; LTV uses current valuation | Partial | Capture and store origination value; recalculate LTV; new risk weight tables | 120 | Collateral operations and platform |
| 3.6 | Currency mismatch multiplier (1.5 times, capped) for retail and residential real estate where loan currency differs from borrower income currency | Not captured | Gap | New borrower income currency field at origination; back-fill for existing book; engine multiplier | 90 | Retail credit and platform |
| 4.12 | Revised credit conversion factors for off-balance sheet items | Old factors by maturity | Gap | CCF table by product and cancellability; new cancellability flag (see the worked example in [[34 Delivering Change in a Regulated Risk Platform]]) | 80 | Platform |
| 5.2 | Small and medium-sized enterprise (SME) definition by annual turnover threshold | Implemented with group turnover from the customer master | Compliant | Confirm threshold value in local currency | 0 | Credit risk methodology |
| 5.8 | Specialised lending sub-classes (project, object, commodities finance) under the standardised approach | Flagged for internal ratings-based portfolios only | Partial | Extend flag to standardised portfolios; new risk weights. See [[06 Specialised Finance - Project, Object, Commodities, Real Estate]] | 40 | Corporate credit and platform |
| 6.3 | Revised risk weights for subordinated debt and equity | Treated, but categories differ | Partial | Remap instrument types | 15 | Finance |
| 7.1 | Defaulted exposure risk weights depending on provision coverage | Implemented | Compliant | None | 0 | Not applicable |
| 9.4 | Output floor: standardised RWA for every modelled exposure, reported | Parallel standardised run excludes two smaller portfolios | Partial | Bring remaining portfolios into the standardised run; floor reporting | 100 | Platform and regulatory reporting |

**Summary.** Nine requirements: 2 compliant, 4 partial, 3 gaps. Total effort 60 + 120 + 90 + 80 + 0 + 40 + 15 + 0 + 100 = **505 person-days**, before testing contingency and parallel runs.

**What the table tells you.**

- **The hard items are data, not formulas.** Origination values, borrower income currency and cancellability flags must be captured at source and back-filled for loans already on the book. Back-filling from paper files can take longer than any build, so those items start first.
- **Some items have long lead times outside your team.** The due diligence process (2.4) needs credit officers to change how they work; the platform piece is small, the business change is not.
- **Conservative fallbacks buy time.** Where back-fill cannot finish before the application date, a documented conservative treatment (for example, assume a currency mismatch where income currency is unknown, applying the higher weight) keeps the bank compliant while data improves. It costs capital, so it is a business decision with an expiry date.
- **"Compliant" still needs evidence.** The two compliant items need test cases and a line in the traceability matrix showing *why* they are compliant.

The analysis feeds the programme plan: a data workstream starting immediately, a build plan sequenced around the parallel run start, and an impact estimate so that treasury can update the capital plan (see [[18 Regulatory Capital and Basel - the Short Version]]).

## Common mistakes and misunderstandings

- **"Basel says" means "our rule says".** Basel standards have no legal force on their own. Your bank follows its local implementation, with local choices and dates. Always cite the local text.
- **Waiting for the final rule.** Final rules are usually close to consultations. Data gaps take years to fix; start them at consultation stage.
- **Treating dates as certain.** Application dates are frequently deferred, and occasionally brought forward in parts. Keep a dated, sourced timetable and recheck it.
- **Ignoring host regulators.** Subsidiaries may need local calculations under different rules and dates.
- **Reading only the summary.** Prose explanations simplify; the legal text, definitions and transitional provisions decide what you build.
- **Forgetting follow-on material.** Technical standards, templates, validation rules and official questions and answers keep arriving after the final rule and can change requirements late.
- **Not recording "not applicable".** An undocumented decision that a rule does not apply looks like an oversight to an auditor.
- **Treating the calendar as a reporting calendar only.** Stress tests, ICAAP, audits, model cycles and freezes all compete for the same people and systems.
- **Accounting is someone else's problem.** IFRS 9 and CECL changes land on the same data and engines as capital changes.
- **The platform team as interpreter.** You inform interpretation with data facts; others sign it.

## What a platform lead needs to know about this

**Keep your own view of the regulatory horizon.** Get on the distribution list for the regulatory change inventory. For every item that might touch credit risk calculations, data or reporting, ask for a platform impact assessment early. Maintain the jurisdiction timetable template above, with sources and "date checked".

**Data is the long pole.** Most new rules need fields nobody captured before. Ask, at consultation stage: which fields, for which exposures, at what granularity, from which source, and how far back? See [[32 The Credit Risk Data Model]] and [[22 Credit Risk Data, Systems and BCBS 239]].

**Build for regulatory change as a permanent feature.** Parameters by jurisdiction and by reporting date; versioned rule configuration; the ability to run two rule sets at once for transitional periods, grandfathering and parallel runs; full standardised calculations alongside modelled ones; granular data outputs for modern reporting. See [[33 Platform Architecture and Vendor Landscape]].

**Own the platform calendar.** One page, 18 to 24 months, showing quarter-ends, freezes, the annual cycle and every programme milestone. Review it monthly with regulatory reporting, finance and risk. Many delivery failures are calendar failures.

**Controls and evidence.** A traceability matrix for every regulatory change, applicability decisions recorded, gap analyses version-controlled, and evidence ready for the attestation. If senior executives are personally accountable for areas your platform feeds, they will want to understand your controls; offer a walkthrough before they ask.

**Who owns what.**

| Area | Owner |
|---|---|
| Horizon scanning and the change inventory | Compliance or regulatory affairs |
| Interpretation and applicability | Regulatory policy, with credit risk and finance |
| Gap analysis | Joint; platform owns data and systems gaps |
| Programme sponsorship | Accountable senior executive |
| Build, test and platform evidence | You |
| Attestation | Accountable senior executive |
| Relationship with the supervisor | Regulatory affairs and senior management; you support with evidence and demonstrations |

**Questions to ask early.** Which jurisdictions and legal entities does our platform calculate for? Which programmes are in flight, and what are their milestones? Which open regulatory findings touch our platform? Where is the regulatory change inventory, and who decides what is applicable? When is the next supervisory stress test, and does it overlap a go-live? For templates and runbooks, see [[38 Platform Lead Toolkit - Runbooks, Metrics and Templates]].

## Related notes

- [[34 Delivering Change in a Regulated Risk Platform]] for how to build, test and cut over a regulatory change.
- [[18 Regulatory Capital and Basel - the Short Version]] for what the capital rules say.
- [[basel-credit-risk-explained-simply]] for the full walk through the Basel framework.
- [[basel-credit-risk-decision-tree]] for how exposures branch to approaches.
- [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]] for accounting rules and their changes.
- [[20 Stress Testing and ICAAP]] for the annual stress and capital cycle.
- [[21 Model Risk Management and Validation]] for model cycles and approvals.
- [[22 Credit Risk Data, Systems and BCBS 239]] for risk data principles and supervisory focus.
- [[23 Reporting - Regulatory Returns, Pillar 3 and Management Information]] for returns, deadlines and disclosures.
- [[25 Climate, ESG and Emerging Credit Risks]] for climate expectations.
- [[29 Market Risk]] for FRTB.
- [[30 Operational Risk]] for operational resilience and the operational risk capital method.
- [[33 Platform Architecture and Vendor Landscape]] for building a platform that absorbs rule changes.
- [[37 Liquidity Risk and Funding]] for liquidity rules that draw on credit data.
- [[27 A Platform Lead's First 90 Days]] for the calendar you live on and how to read a finding.
- [[28 Master Glossary]].
