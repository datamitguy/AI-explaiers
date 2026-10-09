# Monitoring, Early Warning and Watchlist

**Why this matters to you.** Here is the uncomfortable fact at the centre of credit risk: most of the money a bank loses is lost on loans that looked perfectly fine on the day they were approved. The borrower was sound, the analysis was careful, the committee said yes, and then the world changed. The difference between a bank that loses a little and a bank that loses a lot is how quickly it notices the change and acts. That is monitoring. It is the least glamorous part of credit and the part most dependent on systems: thousands of borrowers, hundreds of signals, daily data, and a process that has to turn all of it into a short list of names that need attention this week. If your platform does one thing well, make it this.

## Table of contents

1. Why monitoring matters
2. The monitoring calendar: annual and interim reviews
3. Covenant monitoring and financial statement spreading
4. Early warning indicators
5. Early warning systems and triggers
6. The watchlist process and its categories
7. Forbearance
8. Watchlist versus non-performing
9. How monitoring feeds the IFRS 9 stage 2 assessment
10. Who does what: relationship managers, credit and the monitoring team
11. Data and system needs
12. What good management information looks like
13. A worked example
14. Common mistakes and misunderstandings
15. What a platform lead needs to know about this
16. Related notes

## 1. Why monitoring matters

Think about lending your bike to a classmate for a term. On day one you checked they were sensible, they had somewhere to keep it, and they promised to look after it. Good decision. But over the term things can change: they start leaving it unlocked, they lend it to their cousin, they stop coming to school. If you only find out at the end of term that the bike is gone, you have lost a bike. If you noticed in week three that it was being left unlocked, you could have said something, or taken it back.

Banking is the same, with a twist: the loan is often for five years, and the bank has thousands of them. [[03 The Credit Lifecycle]] shows that approval is a single moment and monitoring is everything after it until repayment. Studies of bank losses consistently find that the majority of problem loans were performing and acceptably rated at origination; the deterioration came later from business failure, sector downturns, fraud, over-expansion, loss of a key customer, or simply bad luck. The loans that were bad from the start are a minority and are usually small, because the approval process catches the obvious ones.

Monitoring matters for three reasons:

1. **Time is money.** A bank that spots trouble early can reduce exposure (stop new drawings, let a facility amortise), strengthen its position (take more security, tighten covenants), or sit down with management while there is still a business to save. A bank that finds out at default has none of these options and is one of a crowd of creditors.
2. **Provisions and capital depend on it.** The expected credit loss rules ([[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]]) require the bank to recognise a lifetime loss allowance as soon as a loan's credit risk has increased significantly, long before default. If the bank cannot see deterioration, its provisions are wrong and its accounts are wrong.
3. **Regulators require it.** Supervisors expect a documented, evidenced monitoring process with early warning indicators, a watchlist, and a clear link to classification. A bank that cannot show it is a bank with a Pillar 2 capital add-on ([[18 Regulatory Capital and Basel - the Short Version]]).

## 2. The monitoring calendar: annual and interim reviews

The backbone of corporate credit monitoring is the **annual review**. Once a year, every facility is re-examined as if it were a new proposal: updated financial analysis ([[09 Credit Analysis - Reading a Borrower]]), a re-run of the internal rating ([[10 Internal Ratings, Scorecards and PD Models]]), a check that covenants have been met, a re-check of security and valuations ([[11 Collateral and Security]]), a review of the relationship (account conduct, profitability, other products), an update on the sector, confirmation that the facilities still fit policy and limits ([[14 Risk Appetite, Limits and Concentration]]), and a recommendation: renew as is, amend, reduce, or exit. The review goes to the appropriate approval authority ([[13 Credit Governance - Committees, Authorities and the Three Lines]]), which for an unchanged, well-performing facility may be a lower level than the original approval.

Reviews are due on a fixed date (often the anniversary of the facility, or a date aligned to the borrower's financial year so that audited accounts are available). The **review overdue** report, listing every facility whose annual review is past its due date, is one of the oldest and most important controls in credit, and a growing backlog of overdue reviews is a classic sign of a credit function under strain. Regulators look at it.

**Interim reviews** happen between annual reviews when something triggers them: a covenant breach, a rating downgrade, a large new request, an early warning signal, a sector event, or a watchlist placement. Interim reviews are shorter and focused on the trigger.

For retail portfolios ([[05 Retail Lending]]), individual annual reviews are replaced by **behavioural scoring**: a monthly automated rescoring of every account from its own payment and usage data, with portfolio-level reviews of the results. The principles are the same; the mechanism is statistical.

## 3. Covenant monitoring and financial statement spreading

[[12 Loan Documentation, Covenants and Conditions]] explains covenants in full. For monitoring purposes, the key activities are:

- Tracking the delivery of accounts and compliance certificates against their due dates. Late accounts are a signal in themselves.
- Recalculating each financial covenant from the agreement's definitions when the figures arrive, recording pass, fail and headroom.
- Routing breaches and shrinking headroom into the early warning process.

**Financial statement spreading** is the process of taking a borrower's accounts (which come in every imaginable format) and entering them into a standard template, the **spread**, so that ratios can be calculated consistently and compared across years and across borrowers. The spread normally holds the income statement, balance sheet and cash flow for three to five years, with the bank's own adjustments (for example, treating operating leases as debt, or stripping out exceptional items). The ratios computed from the spread feed the rating model, the covenant tests, and the early warning indicators.

Spreading is labour-intensive and error-prone when done by hand, which is why banks invest in spreading tools with document extraction and in standard chart-of-accounts mappings. Whatever the tool, the spread for each borrower-year should be stored as structured data with a link to the source document, the analyst who spread it, the date, and whether it was audited, management or forecast information. The monitoring process cannot run on PDFs.

## 4. Early warning indicators

An **early warning indicator** (EWI) is an observable fact that, from experience, tends to appear before a borrower defaults. No single indicator is conclusive; the art is in combining them. They fall into three families.

### Financial indicators (from the borrower's accounts)

| Indicator | What it suggests |
|---|---|
| Declining revenue, especially against budget | Losing customers or market |
| Declining gross or operating margins | Price pressure, cost inflation, loss of control |
| Rising leverage (debt to EBITDA) | Debt growing faster than profit, or profit shrinking |
| Falling interest cover | The interest bill is eating the profit |
| Negative operating cash flow with positive accounting profit | Profit is on paper; cash is not arriving (often rising receivables or stock) |
| Stretched working capital: debtor days up, creditor days up | Customers paying slowly, and the borrower paying its own suppliers slowly to compensate |
| Covenant headroom shrinking | Approaching the tripwire |
| Late accounts, qualified audit opinions, change of auditor | Something the borrower would rather not show, or disagreement with the auditor |
| Dividends or owner drawings exceeding profit | Owners taking cash out of a weakening business |
| Large one-off or exceptional items, repeatedly | Normal costs being dressed as unusual |

### Behavioural indicators (from the bank's own account data)

These are the most valuable because the bank sees them daily, long before the next set of accounts.

| Indicator | What it suggests |
|---|---|
| Overdraft excesses, or the account hugging its limit for weeks | Cash is tight |
| Requests for temporary limit increases, especially near month end | Cash is tight and the borrower is managing to the payroll date |
| Missed or late loan instalments | The most direct signal |
| Bounced cheques, returned direct debits, failed standing orders | The borrower is prioritising who to pay |
| Falling account turnover (credits through the account) | Sales are falling, or the borrower has moved business to another bank |
| Round-sum transfers to and from related parties | Cash being shuffled around a group |
| Unusual transactions: large cash withdrawals, payments to unknown parties | Possible fraud or a change in business |
| Increased drawings on revolving facilities with no seasonal explanation | Working capital stress |
| Requests to defer payments, or to restructure | The borrower knows before the bank does |

### External indicators (from outside)

| Indicator | What it suggests |
|---|---|
| External rating downgrade or negative outlook (where rated) | Agencies see deterioration |
| Credit bureau alerts: county court judgements, new charges registered by other lenders, late payment data from suppliers | Other creditors are seeing problems |
| News: profit warnings, loss of a major contract, litigation, regulatory action, management departures, redundancy announcements | Events that will hit the accounts later |
| Sector stress: commodity price falls, regulatory change, a major competitor's collapse | The borrower's market is in trouble |
| Credit default swap spreads widening (for large companies with traded CDS) | The market is pricing in default risk |
| Share price falling sharply, or falling relative to the sector | The market expects trouble |
| Bond yields rising | Same |
| Country or sovereign events ([[26 Sovereign, Bank and Country Risk]]) | Transfer risk, currency devaluation |
| Climate or physical events affecting the borrower's assets ([[25 Climate, ESG and Emerging Credit Risks]]) | Damage to collateral or operations |

**Credit default swap** (CDS) spreads deserve a word, because they confuse people. A CDS is insurance against a company defaulting; the spread is the annual premium, in basis points. If the five-year CDS on a company goes from 100 basis points (1% a year) to 400, the market now thinks default is four times as likely. For large listed borrowers the CDS spread is often the fastest-moving signal there is, well ahead of ratings. For the vast majority of borrowers no CDS exists, and the signal is not available.

## 5. Early warning systems and triggers

An **early warning system** (EWS) is the machinery that collects indicators, applies rules or scores to them, and raises a flag that a human must act on. The components:

1. **Data feeds.** Daily account data from the core banking system (balances, limits, excesses, turnover, returned items, missed payments), spread financial data, covenant results, internal rating changes, external data (bureau, ratings, news, market prices), collateral revaluations.
2. **Trigger rules.** Each indicator has a threshold and, often, a weight. Examples: "overdraft excess of more than 10% of limit for more than 5 consecutive days," "instalment unpaid 15 days after due date," "account turnover down more than 30% versus the same quarter last year," "internal rating downgraded by two or more notches," "covenant headroom below 10%," "accounts more than 30 days overdue," "share price down more than 40% in 90 days." Some banks use a points system: each trigger scores points, and the total determines the response.
3. **Scoring models.** Larger banks build a statistical early warning score, trained on which combinations of indicators preceded past defaults, producing a monthly probability of deterioration per borrower. This is essentially a behavioural model and sits under model governance ([[21 Model Risk Management and Validation]]).
4. **Case management.** When a trigger fires, a case is created and assigned to the relationship manager and the credit officer with a deadline (often five to ten business days) to assess it and record an outcome: false alarm (with a reason), monitor (keep an eye on it), or escalate to the watchlist.
5. **Audit trail.** Every trigger, every assessment, every outcome, every date. Regulators and auditors sample these to check that triggers were actually followed up.

The design tension is between sensitivity and noise. Triggers set too tight produce hundreds of false alarms, the relationship managers stop taking them seriously, and real signals are lost. Triggers set too loose miss the deterioration. Good practice is to calibrate the triggers against past defaults (what did the defaulted borrowers look like twelve months before?) and to review the false alarm rate quarterly. A trigger that has fired 500 times and led to zero watchlist placements is either useless or being ignored; either way it needs attention.

![[15-early-warning-engine.svg]]
*The early warning signal sources, financial, behavioural and external, feeding a trigger engine, which creates cases for assessment and, where deterioration is real, places the borrower on the watchlist and feeds the IFRS 9 staging assessment.*

## 6. The watchlist process and its categories

The **watchlist** is the list of borrowers that are still performing (paying, not in default) but about which the bank is worried enough to manage them more closely. Being on the watchlist is a management status, not an accounting or regulatory one, though it drives both.

The process:

1. **Entry.** A borrower is proposed for the watchlist by the relationship manager, the credit officer, the early warning system, or the monitoring team, with a short paper: what happened, how serious, what the plan is. Entry is approved by a credit authority. Some triggers (a covenant breach, two or more notch downgrade, missed payment) mandate entry unless a credit officer records a reason not to.
2. **Categorisation.** Most banks have two to four watch categories, reflecting severity and intensity of management.
3. **Action plan.** Each watchlist name has a written strategy and actions with owners and dates: obtain monthly accounts, revalue security, reduce the facility, tighten covenants, require an equity injection, consider exit.
4. **Review.** Watchlist names are reviewed at a regular **watchlist committee** or **watchlist review meeting**, monthly for the serious categories and quarterly for the mild one, attended by credit, the business and, for the severe category, the workout team. Each review updates the strategy and decides whether the name moves up, down or off.
5. **Exit.** A name leaves the watchlist upward (returned to normal, usually after a period of clean performance, say two consecutive quarters with no triggers) or downward (into default and the problem loan process, [[16 Problem Loans, Restructuring and Recovery]]).

An illustrative categorisation (names and numbers vary by bank):

| Category | Meaning | Review frequency | Typical actions | Likely IFRS 9 stage |
|---|---|---|---|---|
| Watch 1 ("monitor", "amber") | Early signs; manageable; relationship manager leads | Quarterly | Closer information, interim review, note on file | Stage 1, sometimes 2 |
| Watch 2 ("concern", "substandard") | Clear deterioration; credit leads jointly with the business; rating downgraded | Monthly | Reduce exposure, strengthen security, covenant reset, monthly accounts, forbearance considered | Stage 2 |
| Watch 3 ("intensive care", "pre-workout") | Serious; default a real possibility; workout team involved; exit or restructuring strategy | Monthly or more | Restructuring, standstill, exit planning, specific provision considered | Stage 2 or 3 |

Some banks collapse the watchlist into their internal rating scale (the bottom performing grades are the watchlist by definition); others keep it as a separate flag. Either way the flag needs to be in the system, with its history, because "when did the bank first know" is the question every post-mortem asks.

## 7. Forbearance

**Forbearance** is when the bank grants a concession to a borrower who is in, or about to be in, financial difficulty, that it would not grant to a healthy borrower. Examples: extending the maturity, reducing the interest rate, allowing an interest-only period, capitalising arrears, waiving or resetting a covenant, accepting a reduced payment, refinancing on easier terms.

Two conditions must both be present: the borrower is in financial difficulty, and the bank has made a concession. Extending a loan for a healthy borrower who wants more time for commercial reasons is not forbearance. Waiving a covenant for a borrower that cannot meet it is.

Forbearance is a regulatory classification in most jurisdictions (the European Banking Authority's definitions are widely used; other regulators have similar concepts), and it matters because:

- Forborne exposures must be reported separately to the regulator and in disclosures ([[23 Reporting - Regulatory Returns, Pillar 3 and Management Information]]).
- A forborne exposure is strong evidence of a significant increase in credit risk, so at least stage 2 under IFRS 9.
- A forborne exposure that was non-performing when the concession was granted stays non-performing for a probation period (often at least twelve months) and must then perform through a further probation period (often two years) before the forbearance flag can be removed. These periods are set by the applicable regulation and vary.
- Repeated forbearance on the same loan is a sign that the bank is hiding a default rather than solving a problem, which supervisors watch for closely.

The watchlist process is where forbearance decisions get made, and the system must record the forbearance flag, its date, the type of concession, whether the exposure was performing or non-performing at the time, and the probation clock.

## 8. Watchlist versus non-performing

These get confused constantly, so here is the distinction.

| | Watchlist | Non-performing |
|---|---|---|
| What it is | A management status: the bank is worried | A regulatory and accounting status: the loan has gone bad |
| Trigger | Early warning signals, judgement | 90 days past due, or the bank judges the borrower unlikely to pay in full without enforcing security ([[02 What Credit Risk Is]]) |
| Is the borrower paying? | Yes, generally | No, or not expected to |
| Who manages | Relationship manager and credit, with workout for severe cases | Workout or recovery team |
| Accounting | Stage 1 or 2, twelve-month or lifetime expected loss | Stage 3, lifetime expected loss, interest recognised on the net amount |
| Regulatory capital | Normal risk weight (through the rating) | Defaulted exposure class, higher risk weight, or LGD-based under IRB |
| Reported to | Credit committees | Regulator, in disclosures |

The sequence is normally performing, then watchlist, then non-performing (default), then either cure or loss. But not always: fraud and sudden shocks can take a borrower straight from performing to default. And a borrower can be on the watchlist for years without defaulting; most watchlist names, in fact, recover.

The term **non-performing exposure** (NPE) is the regulatory version (used in Europe) and is slightly broader than the Basel default definition in some details; **non-performing loan** (NPL) is the general term. [[16 Problem Loans, Restructuring and Recovery]] covers what happens after default.

![[15-watchlist-state-machine.svg]]
*The state machine from performing through the watchlist categories to forbearance, non-performing status, and the two exits: cure back to performing after probation, or loss.*

## 9. How monitoring feeds the IFRS 9 stage 2 assessment

The international accounting standard **IFRS 9** (and its United States cousin, **CECL**, current expected credit loss) requires the bank to hold a loss allowance on every loan from day one: twelve months of expected loss for loans whose credit risk has not increased significantly since origination (**stage 1**), and lifetime expected loss for those where it has (**stage 2**), and for those in default (**stage 3**). [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]] explains the mechanics. The point here is that the decision "has credit risk increased significantly" (**SICR**, significant increase in credit risk) is a monitoring question.

Banks assess SICR using a combination of:

- **Quantitative criteria**: the probability of default has risen by more than a threshold since origination (for example, the lifetime PD has doubled and increased by at least a set number of basis points; or the internal rating has fallen by a set number of notches).
- **Qualitative criteria**: the borrower is on the watchlist (in the more serious categories), is forborne, has breached a covenant, has had a trigger of a specified kind.
- **Backstop**: more than 30 days past due is presumed to be stage 2 unless rebutted.

So the watchlist flag, the forbearance flag, the covenant results and the days-past-due counter are direct inputs to the staging engine. If the monitoring process is slow, staging is late, provisions are understated, and the bank's profit is overstated. Auditors test this link specifically: they take a sample of stage 1 loans with early warning triggers and ask why they are not stage 2. Platform leads should make sure the watchlist and early warning data flow into the provisioning system with the right timing (watchlist decisions taken in the month should be in that month's provisioning run) and that the mapping from watch category to staging criterion is documented and consistent with the accounting policy.

## 10. Who does what: relationship managers, credit and the monitoring team

The division of labour varies by bank, but the tensions are universal.

**Relationship managers** (first line) know the customer best, see them regularly, and are usually the first to hear bad news. They are also the people with the strongest incentive to believe the customer's reassurances and to delay bad news, because a watchlist placement means more work, a worse rating, harder pricing conversations, and possibly a smaller bonus. Good banks make the relationship manager responsible for raising concerns promptly, and make failure to do so a serious matter.

**Credit officers** (second line) assess the signals independently, decide on watchlist placement and category, approve action plans, and own the rating. They see many borrowers and recognise patterns the relationship manager may not.

A **dedicated credit monitoring team** (sometimes "portfolio monitoring," "credit surveillance," "early warning unit"), usually in the second line, runs the early warning system, chases overdue accounts and reviews, performs the covenant tests, maintains the watchlist, prepares the committee packs, and acts as a check on both the business's optimism and the credit officers' workload. In retail, this role is played by the collections and behavioural scoring teams. The monitoring team is the natural owner of the data quality of everything in this note.

The **workout team** ([[16 Problem Loans, Restructuring and Recovery]]) joins for the severe watch category and takes over at default. The timing of the handover is a policy decision: too early wastes specialist resource, too late loses value.

**Internal audit** ([[13 Credit Governance - Committees, Authorities and the Three Lines]]) tests that triggers fired were acted on, that watchlist decisions were documented, that reviews were done on time, and that staging followed the policy.

## 11. Data and system needs

The monitoring process is the most data-hungry part of credit risk because it runs continuously across the whole book. The needs:

| Need | Detail |
|---|---|
| **Transactional data** | Daily balances, limits, excesses, turnover, returned items, missed and late payments, from every account system, linked to the customer and group. Needs history (at least 24 months) to compute trends. |
| **Facility and covenant data** | Facilities, schedules, covenant definitions and levels, test dates, results, deliverable due dates and receipt dates ([[12 Loan Documentation, Covenants and Conditions]]). |
| **Financial spreads** | Structured accounts with ratios, by period, with source and status. |
| **Ratings** | Current and historical internal ratings, with the drivers and any override, and the origination rating for the SICR comparison. |
| **Collateral** | Values, valuation dates, coverage, LTV ([[11 Collateral and Security]]). |
| **External feeds** | Credit bureau alerts, external ratings, news services (ideally entity-matched), market data (share price, CDS, bond yields) for listed names, registry alerts (new charges, filings), sector indices. Entity matching between external sources and the bank's customer records is a large data problem in itself. |
| **Trigger engine** | A rules engine (and possibly a scoring model) that runs daily or monthly, with versioned rules, thresholds, and a record of every firing. |
| **Case management** | Workflow for triggers and watchlist cases: assignment, deadlines, assessments, outcomes, documents, audit trail. |
| **Watchlist and classification flags** | Watch category with history; forbearance flag, type and probation dates; default flag and date; days past due; IFRS 9 stage. All with effective dates. |
| **Review scheduling** | Annual and interim review due dates, completion dates, approver. |
| **Reporting layer** | Portfolio-level views and drill-down, with trends. |

The systems involved typically include the core banking system (transactions), the loan servicing system (facilities, arrears), the credit workflow system (reviews, memos, watchlist papers), a spreading tool, a covenant tool, an early warning engine (which may be a vendor product, a module of the credit workflow system, or a home-built rules layer on a data warehouse), external data subscriptions, and the provisioning engine as a downstream consumer. The integration challenge is to get all of these to agree on who the customer is and which facilities belong to them ([[22 Credit Risk Data, Systems and BCBS 239]]).

## 12. What good management information looks like

Monitoring produces a lot of data; **management information** (MI) is the part that lets a committee act. A good monthly monitoring pack for a credit committee contains:

- **Watchlist summary**: number and exposure of names in each category, movements in (new), up, down and out during the month, and the trend over twelve months. A rising watchlist with falling exits is the picture of a portfolio deteriorating.
- **Top watchlist names**: the largest and most serious, each with a one-paragraph status, the strategy, the exposure trend, the rating, collateral coverage and the provision held.
- **Early warning statistics**: triggers fired by type, cases open, cases overdue for assessment, false alarm rate, time from trigger to decision.
- **Overdue items**: annual reviews overdue (by age bucket), accounts overdue, covenant certificates overdue, collateral revaluations overdue.
- **Covenant results**: tests run, passes, breaches, waivers granted, headroom distribution.
- **Forbearance**: exposures newly forborne, total forborne, performing versus non-performing forborne, names approaching the end of probation.
- **Flow to default**: names that went from watchlist to default this month, and how long they were on the watchlist first (if the answer is often "zero months," the early warning process is not working).
- **Sector and portfolio heat map**: which sectors are generating triggers.
- **Staging**: stage 2 exposure and its link to the watchlist, with exceptions (stage 1 names on the watchlist, stage 2 names not on it) explained.

The quality test for MI is whether it changes decisions. A pack that is the same every month and generates no actions is wallpaper.

## 13. A worked example

A bank has a 25 million term loan and a 5 million overdraft with a regional construction company, rated grade 5 of 10 (average), reviewed annually each March, with quarterly covenants (leverage not more than 3.0x) and audited accounts due by 30 June.

- **April.** The early warning engine fires: overdraft utilisation has been above 90% for 22 of the last 30 days, versus an average of 55% over the previous year. A case is created. The relationship manager speaks to the finance director, who explains that a large customer is paying 60 days late and the company is waiting on a final-account settlement of 2 million. The credit officer records "monitor; re-check in 30 days."
- **May.** Two triggers: a direct debit to a materials supplier is returned unpaid, and the credit bureau reports a new charge registered by an equipment finance company. The credit officer now proposes Watch 1, approved by the regional head of credit. Actions: monthly management accounts to be provided, security (a charge over the company's yard, last valued three years ago at 8 million) to be revalued, overdraft reduced to 4 million as the June receipts come in.
- **July.** Audited accounts arrive on 10 July, ten days late, with the audit opinion clean but an "emphasis of matter" note about a contract dispute. The spread shows EBITDA down from 9 to 6.5 million. Leverage at 30 June: net debt 24 million divided by 6.5 million = 3.7x. Covenant breach. The company's compliance certificate had shown 2.9x, by excluding the overdraft from debt, which the definitions do not permit. Reservation of rights letter issued. Interim review conducted; rating downgraded to grade 7. Moved to Watch 2. Under the bank's SICR criteria (two-notch downgrade plus Watch 2 plus covenant breach), the exposure moves to IFRS 9 stage 2 in the July provisioning run; the lifetime expected loss raises the provision from 90,000 to 1.1 million.
- **August.** Revaluation of the yard comes in at 5.5 million. Collateral coverage of the 29 million exposure falls from an assumed 28% to 19%. The company requests a covenant reset and a six-month interest-only period on the term loan. The credit committee agrees a reset to 4.0x stepping down, interest-only for six months, a 0.5% margin increase, an equity injection of 1.5 million from the owners, monthly accounts, and a personal guarantee from the principal shareholder. This is a concession to a borrower in financial difficulty: the facility is flagged forborne (performing forborne) and the probation clock starts.
- **Following March.** The dispute settles for 1.4 million, the new contracts are performing, leverage is 3.3x against the reset covenant of 3.75x, and the overdraft has run at 60%. The watchlist committee moves the name to Watch 1. It stays stage 2 and forborne until the probation period completes.
- **Eighteen months later.** Two years of clean performance, leverage back under 3.0x, rating grade 6. Off the watchlist, forbearance flag removed at the end of probation, back to stage 1.

Had the bank waited for the annual review the following March, it would have found a company with 3.7x leverage, an unpaid direct debit, a new secured creditor ahead of it on the equipment, and a yard worth two thirds of what it thought, with no reservation of rights and eight months of lost negotiating position. The overdraft excess trigger in April was the whole difference.

## 14. Common mistakes and misunderstandings

- **"The loan was fine when we approved it, so monitoring is a formality."** Most losses come from loans that were fine at approval. That is the reason for monitoring, not an excuse to skip it.
- **Waiting for the accounts.** Audited accounts arrive six to twelve months after the period they describe. The bank's own transaction data is daily. Behavioural signals beat financial ones on timing every time.
- **Confusing watchlist with non-performing.** Watchlist is management attention on a performing loan. Non-performing is default.
- **Treating watchlist placement as punishment.** Relationship managers avoid raising names if the culture treats a watchlist placement as a failure. It should be treated as the system working.
- **Triggers that nobody follows up.** A fired trigger with no recorded assessment is worse than no trigger: it is evidence the bank knew and did nothing.
- **Trigger thresholds never recalibrated.** Thresholds set years ago, never tested against actual defaults, drift into either noise or silence.
- **Forgetting that a waiver may be forbearance.** If the borrower is in difficulty and the bank made a concession, it is forborne whatever it is called internally.
- **Staging disconnected from the watchlist.** If stage 2 is computed only from the PD model while the watchlist lives in a separate system, the auditor will find stage 1 loans on the watchlist and ask why.
- **Reviews marked complete that were rubber stamps.** A review that copies last year's paper and changes the dates is not monitoring.
- **No history on the flags.** Without effective-dated history, the bank cannot answer "when did we first know," cannot back-test triggers, and cannot prove to the regulator that its process works.

## 15. What a platform lead needs to know about this

**Data.** The monitoring data model needs daily account-level behavioural data with history, structured spreads, covenant results, ratings history including the origination rating, collateral values with dates, external feed data matched to internal customer identifiers, trigger firings with rule version and outcome, case records with assessments and dates, and the classification flags (watch category, forbearance with type and dates, days past due, default, IFRS 9 stage) as effective-dated history. The two things most often missing are the origination rating (needed for SICR) and effective dates on flags. The entity-matching problem between external sources and internal customer records is a project in itself and worth starting early.

**Systems.** Expect a mix: core banking for transactions, servicing for arrears, a credit workflow tool for reviews and watchlist papers, a spreading tool, possibly a vendor early warning product, external data subscriptions, and the provisioning engine downstream. The architecture that works is a credit data mart that receives daily feeds, a rules engine on top of it, and a case management workflow that writes its outcomes back to the data mart so that the provisioning engine and the reporting layer see them. The failure mode is five tools with five customer identifiers and a monthly spreadsheet reconciling them.

**Controls.** Completeness of daily feeds (every account, every day, with a check). Rules under version control with an approval for every threshold change and a quarterly back-test of trigger performance against defaults. Case deadlines with escalation when missed. Mandatory outcome and reason codes on every case. Watchlist placement and category changes requiring an approval reference. Automatic staging consequences from watch category and forbearance, with override only by credit with a reason. Review due date reporting with ageing. Reconciliation between the watchlist, the forbearance register, the default register and the provisioning engine's stage flags each month, with exceptions explained. Full audit trail.

**Who owns what.** Relationship managers own prompt escalation of concerns and the action plan delivery for their names. Credit officers own watchlist decisions, ratings and action plan approval. The monitoring team owns the early warning engine, the trigger rules (with credit policy), the overdue chasing, the covenant tests, the watchlist register and the monthly pack. Credit policy owns the watchlist and forbearance policies. Finance and the provisioning team own the staging engine and its accounting policy, consuming the monitoring flags. The workout team owns severe watch names jointly and defaulted names outright. The platform lead owns the data mart, the feeds, the rules engine implementation, the case workflow, the flag history, the reconciliations and the MI ([[22 Credit Risk Data, Systems and BCBS 239]], [[23 Reporting - Regulatory Returns, Pillar 3 and Management Information]]).

**Questions to ask in your first month.** How many annual reviews are overdue, and for how long? Which early warning triggers exist, when were the thresholds last reviewed, and what is the false alarm rate? Of the names that defaulted last year, how many were on the watchlist beforehand and for how long? Is the watch category stored with history? Does the provisioning engine receive the watchlist and forbearance flags, and when? How are external news and bureau alerts matched to customers? Does anyone look at daily account behaviour for corporate customers, or only arrears?

## 16. Related notes

- [[02 What Credit Risk Is]] for the default definition.
- [[03 The Credit Lifecycle]] for where monitoring sits.
- [[05 Retail Lending]] for behavioural scoring and collections.
- [[09 Credit Analysis - Reading a Borrower]] for spreading and ratios.
- [[10 Internal Ratings, Scorecards and PD Models]] for ratings and downgrades.
- [[11 Collateral and Security]] for collateral triggers and revaluation.
- [[12 Loan Documentation, Covenants and Conditions]] for covenant tests and waivers.
- [[13 Credit Governance - Committees, Authorities and the Three Lines]] for watchlist governance and audit.
- [[14 Risk Appetite, Limits and Concentration]] for limit signals and sector stress.
- [[16 Problem Loans, Restructuring and Recovery]] for what happens after default.
- [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]] for staging and SICR.
- [[18 Regulatory Capital and Basel - the Short Version]] for defaulted exposures and Pillar 2.
- [[21 Model Risk Management and Validation]] for early warning scoring models.
- [[22 Credit Risk Data, Systems and BCBS 239]] for the data architecture.
- [[23 Reporting - Regulatory Returns, Pillar 3 and Management Information]] for forbearance and NPE reporting.
- [[25 Climate, ESG and Emerging Credit Risks]] and [[26 Sovereign, Bank and Country Risk]] for external signal sources.
- [[basel-credit-risk-explained-simply]] section 3 for the 90-day default trigger.
- [[28 Master Glossary]] for terms.
