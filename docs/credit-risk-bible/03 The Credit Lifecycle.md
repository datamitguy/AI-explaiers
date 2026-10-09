# The Credit Lifecycle

**Why this matters to you.** A loan is not an event; it is a story that runs for months or decades, with a different team, a different system and a different set of controls at every chapter. Most of the systems your platform connects to exist to serve one chapter of that story, and most of the data problems you will meet come from hand-offs between chapters. If you can picture the whole lifecycle, from the first conversation with a customer to the day the loss is written off, you will know where every field came from, who owns it, and what breaks when it is wrong.

## Table of contents

1. [The library book version](#the-library-book-version)
2. [The lifecycle at a glance](#the-lifecycle-at-a-glance)
3. [Stage 1: Origination](#stage-1-origination)
4. [Stage 2: Know your customer and anti-money laundering checks](#stage-2-know-your-customer-and-anti-money-laundering-checks)
5. [Stage 3: Application](#stage-3-application)
6. [Stage 4: Credit assessment and underwriting](#stage-4-credit-assessment-and-underwriting)
7. [Stage 5: Approval and the escalation path](#stage-5-approval-and-the-escalation-path)
8. [Stage 6: Documentation and conditions precedent](#stage-6-documentation-and-conditions-precedent)
9. [Stage 7: Disbursement and drawdown](#stage-7-disbursement-and-drawdown)
10. [Stage 8: Ongoing monitoring](#stage-8-ongoing-monitoring)
11. [Stage 9: Annual review and renewal](#stage-9-annual-review-and-renewal)
12. [Stage 10: Repayment](#stage-10-repayment)
13. [Stage 11: Collections](#stage-11-collections)
14. [Stage 12: Impairment](#stage-12-impairment)
15. [Stage 13: Recovery](#stage-13-recovery)
16. [Stage 14: Write-off](#stage-14-write-off)
17. [The swimlane: stage versus team](#the-swimlane-stage-versus-team)
18. [A worked example: one loan, start to finish](#a-worked-example-one-loan-start-to-finish)
19. [Common mistakes and misunderstandings](#common-mistakes-and-misunderstandings)
20. [What a platform lead needs to know about this](#what-a-platform-lead-needs-to-know-about-this)
21. [Related notes](#related-notes)

## The library book version

Think of a school library. The librarian checks you are a pupil and makes you a card (identity checking). You ask for a book and say when you will return it (application). The librarian decides whether to trust you with the expensive atlas or only a paperback (assessment and approval). You sign the slip (documentation) and walk out with the book (disbursement). The librarian keeps a list of who has what and when it is due (monitoring). If you are late: a reminder, a sterner letter, a fine, a letter to your parents (collections). If the book never comes back, the library writes it off (write-off) and remembers not to lend you the atlas again (data for the next decision).

A bank loan goes through the same chapters, with more paperwork and more money.

## The lifecycle at a glance

![[03-credit-lifecycle.svg]]
*The end-to-end credit lifecycle. The top half is origination through approval and drawdown. The middle is the long, quiet life of the loan with annual reviews. The bottom right is the problem-loan path, which most loans never enter.*

The sections that follow take each of the fourteen stages in turn, and for each one answer the same five questions: who does it, what data is created, what systems touch it, what controls exist, and what can go wrong. The swimlane table near the end shows which teams are active at every stage.

The lifecycle is not perfectly linear. Most loans go round the monitor-review loop for years and exit through repayment. A minority enter collections, and most of those cure. A smaller number reach impairment, recovery and write-off. In retail the proportions are predictable; in corporate they are lumpy.

## Stage 1: Origination

**What it is.** Origination is everything that happens before there is a formal application: the customer walks into a branch, clicks "apply" in an app, is introduced by a broker, or is sold a facility by a relationship manager who has known them for years. In corporate banking it also includes **pre-screening**: an informal check with credit risk that the deal is worth working on before anyone writes a proposal.

**Who, data, systems.** The first line: digital channels, branches and mortgage brokers in retail; relationship managers (**RMs**, also called coverage bankers) in commercial and corporate banking, whose targets are based on lending volume and income. That incentive is the central tension of the lifecycle: the person who finds the deal wants it approved. Systems: customer relationship management (**CRM**), digital origination platforms, broker portals, and in corporates often email and spreadsheets. Data created: customer identity or a link to an existing record, product, rough amount and purpose, channel, introducer, marketing consent, and for corporates a draft term sheet and pre-screen memo.

**Controls and what can go wrong.** Product eligibility rules, sales conduct rules, channel authentication, advertising and advice rules in some countries. Failures: mis-selling; duplicate customer records because the channel did not find the existing one; wrong product or purpose coded, which distorts risk reporting later; broker fraud; and corporate deals too far down the road to be declined gracefully because nobody pre-screened.

## Stage 2: Know your customer and anti-money laundering checks

**What it is.** Before lending, the bank must know who it is dealing with. **Know your customer** (**KYC**) means verifying identity and understanding the customer's business and ownership. **Anti-money laundering** (**AML**) means checking that the customer and their money are not connected to crime, terrorism or sanctioned persons or countries. For companies this includes identifying the **ultimate beneficial owners** (the real humans who own or control the company, through however many layers), and checking for **politically exposed persons** (senior officials and their families, who need extra scrutiny). The checks are repeated periodically (**ongoing due diligence**) and when something changes.

**Who, data, systems.** Onboarding teams in operations, financial crime compliance for harder cases, the relationship manager gathering documents. Systems: identity verification services, sanctions screening engines, KYC workflow tools, company registry feeds, the customer master. Retail KYC is often automated in seconds; corporate KYC can take weeks. Data created: verified identity and address, company and ownership documents, screening results, a financial crime risk rating, source of wealth and funds for higher-risk customers, and the review date.

**Controls and what can go wrong.** Four-eyes checks on high-risk customers, independent screening, escalation to compliance, record keeping (typically five years or more after the relationship ends), suspicious activity reporting. Failures: lending to a sanctioned party (large fines); ownership structures that hide the real borrower, which also matters for credit because connected borrowers must be aggregated into one exposure; KYC expiring without renewal and blocking drawdowns; and inconsistent customer identifiers between KYC and lending systems, so the "same" customer is two records.

KYC is not strictly a credit risk activity, but credit risk depends on it: you cannot aggregate exposure to a group or check a guarantor's identity if KYC has not established who they are.

## Stage 3: Application

**What it is.** The formal request. The customer (or the RM on their behalf) provides the information the bank needs to decide.

**Who does it.** The customer and the front line. In retail, an online form. In commercial lending, the RM assembles a pack of financial statements, forecasts, management accounts, bank statements, details of existing debt, and details of the security offered.

**Data created.** This is the richest data-creation moment in the lifecycle. For retail: income, employment, residential status, existing commitments, requested amount and term, and consent to pull a credit bureau report. For commercial and corporate: three years of audited financial statements, current management accounts, cash flow forecasts, the purpose of the loan, the proposed structure, existing lenders and their security, group structure, and collateral details with valuations. [[09 Credit Analysis - Reading a Borrower]] explains what is done with it.

**Systems.** Loan origination systems (**LOS**), which in retail feed a decision engine directly and in corporates feed a credit proposal workflow; document management; financial spreading tools that convert PDF accounts into standardised data.

**Controls and what can go wrong.** Mandatory field validation, document completeness checklists, income verification (payslips, bank statements, open banking data), and anti-fraud checks such as application velocity (the same person applying to many lenders at once). Failures: missing or stale financials, income inflated by applicant or broker, accounts keyed in wrongly, and applications that are "complete" in the system but built from documents nobody read.

## Stage 4: Credit assessment and underwriting

**What it is.** The analysis: can and will this borrower repay, and on what terms? The words **assessment**, **analysis** and **underwriting** are used slightly differently from bank to bank, but together they mean: gather the evidence, grade the borrower, structure the deal, and write it up.

For retail, the assessment is a scorecard plus policy rules plus an affordability calculation, done in seconds by a decision engine, with a human underwriter only for referrals. For commercial and corporate, it is a credit analyst (sometimes the RM, often a dedicated analyst) producing a written **credit proposal** or **credit memo** of anything from five to fifty pages, covering the business, the industry, the management, the financials, the ratios, the structure, the security, the rating, and a recommendation. The analyst runs the rating model to get an internal rating and therefore a **probability of default** (**PD**), works out the **loss given default** (**LGD**) from the security, and calculates the exposure.

**Who, data, systems.** Retail: the decision engine, then underwriters for referrals. Commercial and corporate: credit analysts in the first line, with second-line credit officers as reviewers (in some banks the second line does the analysis itself). Systems: rating engines (corporate), scoring and decision engines (retail), spreading tools, pricing tools that calculate return on capital ([[24 Pricing, RAROC and Return on Capital]]), proposal workflow and collateral valuation systems; [[10 Internal Ratings, Scorecards and PD Models]] covers the models. Data created: rating and PD, LGD and exposure estimates, financial ratios, the proposed structure (amount, tenor, repayment profile, pricing, covenants, security), the recommendation, and for retail the score, policy rule outcomes and affordability result. All of this is "decision data" that must be stored for audit and model development.

**Controls and what can go wrong.** Model governance (only approved models and versions), mandatory rating before approval, override controls (overrides justified and tracked), policy exceptions flagged, independent collateral valuation, segregation between proposer and approver. Failures: over-optimistic forecasts accepted without challenge; overrides used to force deals through; ratios on stale accounts; structure that does not match purpose (a five-year loan funding a 15-year asset); and retail scorecards that have drifted so the score no longer predicts.

## Stage 5: Approval and the escalation path

**What it is.** Somebody, or some engine, with the right authority says yes, no, or yes with conditions. Banks organise this as a ladder of **delegated authorities**: each person or committee can approve up to a certain size and risk, and anything bigger or riskier goes up a rung. The ladder is designed so that bigger risks get more and more senior eyes, and so that the first line never approves its own large deals alone.

![[03-approval-escalation.svg]]
*The approval escalation path. Small, standard decisions are automated or taken by the first line within its authority; larger or riskier proposals climb through credit officers and committees. At every rung the approver can decline or attach conditions.*

A typical ladder (the names and thresholds vary enormously by bank; these are illustrative):

| Rung | Who | Typical scope |
|---|---|---|
| Automated | Decision engine running an approved strategy | Retail and micro-business, within policy, below a value threshold |
| First line authority | Relationship manager or branch manager | Small, low-risk, standard products, often with a sampling review afterwards |
| Credit officer | Named second-line sanctioner with a personal authority (a grid of amount versus rating) | Most commercial lending |
| Senior credit officer or regional committee | Two or more senior sanctioners | Larger or weaker-rated corporate deals |
| Divisional or group credit committee | A formal, minuted committee including the Chief Risk Officer or deputies | The largest exposures, policy exceptions, new products |
| Board risk committee | Non-executive directors | Exposures above a percentage of capital, connected lending to directors, matters of risk appetite |

Approval is often a **joint** decision: the first line sponsor signs and a second-line credit officer independently sanctions. Dual approval is one of the most important controls in the bank. The conditions attached to approvals are as important as the yes: lower amount, more security, a guarantor, tighter covenants, higher price, shorter tenor, or a requirement to reduce other exposure. [[13 Credit Governance - Committees, Authorities and the Three Lines]] goes into the governance.

**Data and systems.** The decision, date, approvers and their authority level, approved terms (which may differ from what was proposed), conditions, the approval's expiry date (approvals lapse, typically after a few months, if not drawn), and policy exceptions; for retail, the strategy version, score, cut-off and reason codes. Systems: credit workflow tools with authority matrices, committee management tools, decision engines. Many banks still run committee papers through email and shared drives.

**Controls and what can go wrong.** The authority matrix enforced by the system, dual approval, conflict of interest declarations, minutes, and periodic review of authorities when people change roles; regulators and internal audit sample approvals. Failures: approvals outside authority; "salami slicing" a large exposure into smaller pieces to stay below a threshold; conditions approved but never tracked; lapsed approvals drawn anyway; committee papers that differ from what the system recorded.

## Stage 6: Documentation and conditions precedent

**What it is.** A decision is not a loan. The approved terms must be turned into legally enforceable documents: the **facility agreement** (or loan agreement), the **security documents** (mortgage deed, charge over assets, pledge of shares), **guarantees**, and any intercreditor agreements with other lenders. The agreement will list **conditions precedent** (**CPs**): things that must be true or delivered before the bank will lend, such as evidence that the security is registered, the insurance is in place, the board of the borrower has authorised the loan, legal opinions have been delivered, and KYC is complete. There may also be **conditions subsequent** that must be met after drawdown by a deadline. [[12 Loan Documentation, Covenants and Conditions]] has the full detail.

For retail, documentation is standardised and often electronic: a credit agreement, a mortgage deed, and the regulatory disclosures. For corporate deals it is bespoke, negotiated between the bank's lawyers and the borrower's, and the gap between approval and signing can be weeks or months.

**Who, data, systems.** Legal (in-house or external), loan documentation teams and operations CP checkers, with the RM managing the borrower side, using document generation and management, e-signature, the collateral register, the limits system and a covenant tracking tool if one exists. Data created: the executed documents, the key terms extracted into the lending system (amount, tenor, rate, margin, fees, schedule, covenants and test dates, security references), security register entries, and the CP checklist with evidence. Extraction of terms into systems is frequently manual, frequently wrong, and a favourite target for automation.

**Controls and what can go wrong.** Legal review, CP checklist signed off before funds are released, verification that system terms match the signed document, security perfection checks (the charge registered at the right registry within the legal deadline), document custody. Failures: security never perfected and therefore worthless in an insolvency; terms in the system that differ from the contract (2% margin in the document, 1.2% in the system); CPs waived informally to hit a deadline; covenants impossible to test from the borrower's actual reporting; lost documents.

## Stage 7: Disbursement and drawdown

**What it is.** Money moves. For a term loan, the bank pays the funds to the borrower (or directly to the seller of the asset being financed). For a revolving facility, the borrower sends **drawdown requests** (also called utilisation requests) over the life of the facility, each of which is checked against the available limit and any conditions. The loan is **booked**: a record is created in the core banking system with its balance, rate, schedule and links to the customer, the facility, the security and the approval.

**Who, data, systems.** Operations (loan servicing), with treasury funding and payments teams moving the cash, through core banking, the limits system, payment systems and the general ledger. Data created: the booked loan (account number, facility reference, drawdown date, amount, currency, rate basis, schedule, maturity, fees), updated limit utilisation and ledger entries. From this moment the exposure exists on the balance sheet and in every risk report.

**Controls and what can go wrong.** CP sign-off before release, limit availability check, dual authorisation of the payment, payee account verification, reconciliation of the booked loan to the approved terms and to the ledger. Failures: funds released before CPs are met; drawdowns exceeding the limit because limits and servicing systems disagree; the loan booked against the wrong facility, product code or customer, which corrupts every downstream report; payment fraud; and revolving drawdowns not checked against the agreement's conditions.

## Stage 8: Ongoing monitoring

**What it is.** The long, quiet middle of the story. The bank watches the borrower and the loan for signs of trouble. For retail it is almost entirely automated: payment behaviour, bureau updates, transaction patterns, and monthly **behavioural scores**. For corporate lending it is a mix of regular financial reporting from the borrower (quarterly or annual accounts, compliance certificates), **covenant testing** (checking the borrower's ratios against the limits in the agreement), news and market signals (rating changes, credit spreads, share price), and the RM's own contact. Anything worrying triggers an **early warning** flag and, if serious, the loan goes on a **watchlist** for closer attention. [[15 Monitoring, Early Warning and Watchlist]] covers this in depth.

**Who, data, systems.** The RM day to day (first line), credit risk portfolio management across the book (second line), and specialist early-warning teams in some banks, using core banking (payments and arrears), covenant monitoring tools, early warning systems, rating and behavioural scoring engines, and the watchlist workflow. Data created: days past due, covenant test results, updated financials, ratios, ratings and scores, early warning indicators, watchlist status and commentary, collateral revaluations, limit utilisation over time.

**Controls and what can go wrong.** Mandatory covenant testing on the agreement's dates, mandatory re-rating when new accounts arrive, escalation rules for early warning triggers, watchlist review meetings, collateral revaluation cycles. Failures: covenant tests missed because dates were never entered in a system; accounts received but never spread, so the rating is two years stale; early warning signals that fire so often they are ignored; and RMs who delay flagging a problem to protect a relationship. Delay is the enemy: recovery rates fall sharply the later a problem is recognised.

## Stage 9: Annual review and renewal

**What it is.** At least once a year (more often for weaker borrowers), each corporate facility is formally re-examined: the borrower is re-rated on the latest accounts, the security is revalued, the terms are checked against policy, and the facility is re-approved, amended, reduced or exited. For facilities with a fixed expiry (overdrafts, revolving lines), this is also the **renewal** decision. For retail, there is no individual review; the portfolio is managed through strategies (limit increases and decreases, re-pricing) driven by behavioural scores.

**Who, data, systems.** The RM prepares and credit risk sanctions, as at origination but with a lighter paper, using the same workflow and rating tools plus a scheduling function so reviews are not missed. Data created: refreshed rating, PD and LGD, a new approval record with its own expiry, changed terms, the renewal decision.

**Controls and what can go wrong.** Overdue review reporting (a standard risk report that regulators ask about), escalation of overdue reviews, independent sanction of renewals. Failures: reviews done late or on old numbers, "evergreen" facilities renewed year after year without real challenge, and renewals that quietly expand the exposure.

## Stage 10: Repayment

**What it is.** The happy ending. The borrower pays interest and principal on schedule. Term loans amortise (the balance falls each period) or are repaid in a lump at maturity (a bullet); revolving facilities are drawn and repaid repeatedly and cancelled at expiry. After the last payment the security is released, the limit cancelled and the facility closed. [[04 Commercial and Corporate Lending]] describes the repayment profiles.

**Who, data, systems.** Operations, automatically, through core banking, payments, the security register, the limits system and the ledger. Data created: payment records, falling balances, interest accruals, prepayments, closure date, security release.

**Controls and what can go wrong.** Reconciliation of payments to amounts due, interest calculation checks, and security release only after full repayment is confirmed. Classic failures: payments applied to the wrong account, interest on the wrong day-count basis, security released early, and repaid facilities left open on the system, inflating reported exposure.

## Stage 11: Collections

**What it is.** The borrower misses a payment. **Collections** (arrears management) gets them back on track: reminders, calls, letters, repayment plans, and, where the customer is in genuine difficulty, **forbearance** (a payment holiday, reduced payments, a longer term). In retail this is an industrial process organised by **delinquency bucket** (1 to 30 days late, 31 to 60, 61 to 90, and so on), covered in [[05 Retail Lending]]. In corporate lending the first conversation is between the RM and the finance director, and the words are "restructuring" and "waiver" rather than "collections".

Many countries have detailed **conduct rules** about collections (contact frequency, treatment of vulnerable customers, forbearance that must be offered). Breaching them can cost more than the loan.

**Who, data, systems.** Collections teams (often large call centres, sometimes outsourced) with vulnerability specialists, on collections platforms with dialler integration and strategy engines; for corporates, the RM with credit risk and, as things worsen, workout. Data created: days past due, contact history, promises to pay and whether kept, forbearance type and dates, vulnerability flags, strategy applied. This feeds behavioural scoring, IFRS 9 staging (forbearance is often a trigger for a significant increase in credit risk) and the regulatory default definition.

**Controls and what can go wrong.** Contact frequency limits, scripts and call recording, forbearance approval rules, vulnerability procedures, quality assurance sampling. Failures: days past due calculated differently in collections and risk systems; forbearance granted but not flagged, so the loan looks healthy and stays in stage 1; aggressive practices leading to regulatory sanction; stale strategies chasing the wrong accounts.

## Stage 12: Impairment

**What it is.** Recognising the loss in the accounts. Under **IFRS 9** (most of the world) and **CECL** (current expected credit loss, United States), a provision is booked from day one for every loan, increased when credit risk rises significantly (stage 2 under IFRS 9), and set to lifetime expected loss when the loan is credit-impaired, which in practice aligns with default (stage 3). The accounting word **impairment** and the regulatory word **default** are close cousins and most banks align them. The provision sits on the balance sheet; its change each period is the impairment charge on the income statement. [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]] has the mechanics. Impairment is really a calculation run every reporting period rather than a stage passed through once, but the moment a loan becomes credit-impaired changes who manages it and how it is reported.

**Who, data, systems.** Credit risk (models, staging rules, individual assessments of large defaulted loans) and finance (booking, disclosure) jointly, with an impairment committee signing off each quarter. The impairment engine, fed from the data warehouse, rating, scoring and collateral systems and macroeconomic scenarios, produces stage, PD, LGD, EAD and expected credit loss per loan per period, reconciled to the general ledger.

**Controls and what can go wrong.** Model validation, population reconciliation to the ledger, independent review of individual assessments, committee sign-off and external audit. Failures: forborne or defaulted loans not staged correctly because flags did not flow, engine outputs that cannot be reconciled to the ledger, late quarter-end data, and undocumented judgemental overlays.

## Stage 13: Recovery

**What it is.** Once a loan has defaulted, the bank tries to get as much back as it can. For retail: continued collections, debt sale (to a specialist buyer for a fraction of face value), and for mortgages, repossession and sale. For corporates, a **workout** team takes over: restructure the debt (extend, reduce, convert to equity), enforce security (appoint a receiver, sell assets), negotiate a settlement, or support an insolvency. [[16 Problem Loans, Restructuring and Recovery]] walks through the options and the creditor waterfall that decides who is paid first.

**Who, data, systems.** Workout, restructuring or "special situations" teams in credit risk, recoveries and litigation teams, external lawyers, receivers and insolvency practitioners, and debt purchasers, working through case management, collateral and enforcement tracking, and core banking for applying recoveries. Data created: recovery cash flows (amount, date, source), costs, strategy, sale proceeds versus last valuation, time to resolution and final outcome. This is the raw material of every LGD model, so its quality matters for years.

**Controls and what can go wrong.** Strategy approval per case, independent valuation before sale, authority limits on settlements and write-downs, recovery cost tracking. Failures: recoveries applied to the wrong loan or not linked to the original default (corrupting LGD data), unenforceable collateral, settlements outside authority, and cases that drift for years with no strategy.

## Stage 14: Write-off

**What it is.** The bank accepts that it will not recover the remaining balance and removes it from the balance sheet. The loss is final. Write-off may be partial (the bank keeps pursuing the rest) or full. The timing is set by policy: retail unsecured debt is often written off at around 180 days past due or on debt sale; corporate loans are written off when the recovery process is complete or the remaining balance is judged uncollectable. Write-off is an accounting action; the bank may still pursue the borrower legally, and any later recovery is booked as income.

**Who, data, systems.** Finance, on the recommendation of credit risk or recoveries, within an authority matrix. Data created: write-off date, amount, reason, authority, cumulative recovery and final LGD; the customer record is flagged for future applications and, where bureaus exist, the default is reported. The loan's full history must be preserved in the data warehouse for model development even though it has left the balance sheet.

**Controls and what can go wrong.** Authority limits, reconciliation of write-offs to provisions already held (a write-off should rarely be a surprise if provisioning was right), and record retention. Failures: written-off loans vanishing from the warehouse so LGD models lose their worst cases, write-offs used to hide problems, and inconsistent write-off timing between portfolios, which makes loss rates incomparable.

## The swimlane: stage versus team

This table shows which teams are active at each stage. "Lead" means they own the stage; "support" means they contribute; blank means not involved. Bank structures vary, so treat it as the usual pattern rather than a rule.

| Stage | Front line (RM, branch, digital) | Onboarding and financial crime | Credit analysts and underwriters | Credit risk officers and committees | Legal and documentation | Operations (servicing, payments) | Collections and workout | Finance | Technology and data |
|---|---|---|---|---|---|---|---|---|---|
| 1. Origination | Lead | | | Support (pre-screen) | | | | | Support (channels) |
| 2. KYC and AML | Support | Lead | | | | | | | Support (screening) |
| 3. Application | Lead | | Support | | | | | | Support (LOS) |
| 4. Assessment and underwriting | Support | | Lead | Support (review) | | | | | Support (rating, scoring engines) |
| 5. Approval | Support (sponsor) | | Support | Lead | | | | | Support (workflow, decision engine) |
| 6. Documentation and CPs | Support | Support (KYC complete) | | Support (approve waivers) | Lead | Support (CP check) | | | Support (document systems) |
| 7. Disbursement | Support | | | | | Lead | | Support (ledger) | Support (core banking) |
| 8. Monitoring | Lead (day to day) | Support (ongoing due diligence) | Support | Lead (portfolio) | | Support (arrears data) | | | Support (early warning) |
| 9. Annual review | Lead (prepare) | | Support | Lead (sanction) | | | | | Support |
| 10. Repayment | | | | | Support (security release) | Lead | | Support | Support |
| 11. Collections | Support (corporate) | | | Support | | Support | Lead | | Support (collections platform) |
| 12. Impairment | | | | Lead (models, staging) | | | Support | Lead (booking) | Support (impairment engine) |
| 13. Recovery | Support | | | Support | Support | Support | Lead | Support | Support (case management) |
| 14. Write-off | | | | Support | | Support | Support | Lead | Support (retention) |

Two things stand out. Technology and data touch every stage, which is why the platform lead ends up in every argument. And the hand-offs between stages are where ownership is least clear and data is most often lost or re-keyed.

## A worked example: one loan, start to finish

**Origination (January).** A relationship manager at a commercial bank meets the finance director of a 30 million-revenue food manufacturer, who wants 4 million over five years to build a new production line. The RM pre-screens with a credit officer: the sector is within appetite, the company has banked with them for eight years, and there are no early warning flags. Go ahead.

**KYC (January).** The company's KYC was renewed six months ago. The ultimate beneficial owners are two founding siblings. No sanctions or politically exposed person hits. Financial crime rating: low. Nothing to do except confirm the review is current.

**Application (February).** The RM collects three years of audited accounts, the latest management accounts, a five-year forecast, the equipment supplier's quote, and a valuation of the factory the company owns outright, which it offers as security. The spreading team keys the accounts into the financial analysis tool.

**Assessment (February to March).** The analyst notes revenue growth of 8% a year, operating margin of 9% and existing debt of 2 million. Pro forma debt of 6 million against earnings before interest, tax, depreciation and amortisation (**EBITDA**) of 3.5 million gives leverage of 1.7 times, comfortable for the sector; debt service cover is forecast at 1.8 times. The rating model produces grade 7 on the bank's 20-point scale, a one-year PD of 0.9%. The factory, valued at 5 million, gives an LGD estimate of 25% after haircuts. The analyst proposes a 4 million amortising term loan over five years, floating rate at base plus 2.75%, a 1% arrangement fee, covenants of maximum leverage 3.0 times and minimum debt service cover 1.25 times tested quarterly, secured by a first charge over the factory. The pricing tool shows a return above the bank's hurdle.

**Approval (March).** Total group exposure after the loan would be 6 million at grade 7. The authority grid says that needs a senior credit officer. She reviews the proposal, queries the forecast's assumption that the new line reaches full output in year one, and approves on condition that the leverage covenant is tightened to 2.75 times and that a 500,000 equity contribution from the owners is a condition precedent. Approval expires in 90 days.

**Documentation (April to May).** External lawyers draft the facility agreement and the legal charge. The CPs include the equity contribution, insurance over the factory naming the bank, a board resolution, and registration of the charge. The loan documentation team extracts the terms into the lending system: amount, margin, fee, schedule, covenant definitions and test dates. A checker confirms they match the signed document.

**Disbursement (June).** The borrower sends a drawdown request. Operations confirms all CPs are evidenced, the limit is available and the approval has not expired. Treasury funds the loan; 4 million is paid directly to the equipment supplier. The loan is booked; limit utilisation shows 6 million of 6 million.

**Monitoring and review (June onwards).** Quarterly accounts arrive and are spread; covenants are tested. In the third quarter of year two a quality problem on the new line dips EBITDA; leverage tests at 2.6 times, inside the 2.75 covenant but close. The early warning system flags the trend, the RM speaks to the finance director, and the loan goes on the watchlist. By the next quarter the problem is fixed. Each June the rating is refreshed (grade 8 in the difficult year, back to 7 after) and the credit officer re-approves.

**Repayment (year five).** The final instalment is paid; operations releases the charge, cancels the limit and closes the facility. The bank earned around 600,000 in interest and fees, lost nothing, and has five years of covenant and rating data to feed its models.

**The alternative ending.** Suppose the quality problem had not been fixed. Covenants would have been breached in year three; the bank would probably have negotiated a waiver and tighter monitoring rather than demanding repayment. If sales had collapsed and instalments been missed, the loan would have been classified as defaulted at 90 days (or earlier on unlikeliness to pay), moved to IFRS 9 stage 3 with a provision based on the factory's forced-sale value, and handed to workout. In an administration, a factory sale of 2 million net against a balance of 2.8 million would mean a write-off of 800,000, a realised LGD of about 29%, which becomes a data point in the next LGD model.

## Common mistakes and misunderstandings

- **"Approval is the end of the process."** It is roughly the middle. Documentation, CPs and booking are where approved terms get lost, and monitoring is where most value is protected or destroyed.
- **"The loan is in the system, so the data is right."** The booked loan is only as good as the extraction from the signed document. Margin, covenant definitions and security links are routinely wrong.
- **"Monitoring is the RM's job."** The RM is the first line and has a relationship to protect. Independent monitoring by the second line is a control, not a duplication.
- **"Collections is where bad loans go."** Most loans in early arrears cure. Collections is primarily a cure process; recovery is the loss process.
- **"Write-off is when the loss happens."** The loss happened when the borrower failed. Write-off is when the accounts stop pretending otherwise; most of it should already be covered by provisions.
- **"Retail and corporate have the same lifecycle."** The stages are the same but the mechanics are opposite: retail is automated, statistical and portfolio-driven; corporate is manual, judgemental and deal-driven. [[05 Retail Lending]] and [[04 Commercial and Corporate Lending]] explain the difference.

## What a platform lead needs to know about this

**The lifecycle is the data model.** Each stage creates data that later stages depend on: approved terms feed documentation, documented terms feed booking, the booked loan feeds monitoring and impairment, recoveries feed LGD models. The identifiers that link them (customer, facility, loan, collateral, approval) must survive every hand-off. Find out what the keys are, where they break, and who re-keys data by hand. Most reconciliation breaks trace back to a hand-off.

**Systems by stage.** Expect a loan origination system for retail and a proposal workflow for corporate; decision and rating engines; document management; one or more core banking systems; a limits system; a collateral register; a covenant tool (often a spreadsheet); a collections platform; an impairment engine; workout case management; and a data warehouse trying to hold it together. Learn which is the golden source for which fields.

**Controls the platform must support.** Authority matrices enforced in workflow; dual approval; CP sign-off gating disbursement; term verification between document and system; covenant test scheduling; override logging; a single, consistent default flag; reconciliation at every hand-off; audit trails on every decision. These are what auditors and regulators sample.

**Timing.** Origination must be fast (retail decisions in seconds, corporate approvals before the deal goes elsewhere); monitoring and impairment must be right on a quarter-end date; collections must be up every working day. An outage in the decision engine is lost business; an outage in the impairment engine at quarter-end is a reporting failure.

**Who owns what.** Front line: the customer relationship and application data. Financial crime: KYC. Credit risk: the rating, approval record, policy and impairment methodology. Legal: the documents. Operations: the booked loan, collateral register and payments. Finance: the ledger. Collections and workout: arrears and recovery data. Technology: the systems and integrations. When you need a data definition changed, that list tells you whom to ask.

**Where to start.** Map one real loan through every system, as in the worked example, and record which system holds each fact and how it got there. It is the most useful exercise in [[27 A Platform Lead's First 90 Days]].

## Related notes

- [[00 Start Here]]
- [[01 What a Bank Is and How It Makes Money]]
- [[02 What Credit Risk Is]]
- [[04 Commercial and Corporate Lending]]
- [[05 Retail Lending]]
- [[09 Credit Analysis - Reading a Borrower]]
- [[10 Internal Ratings, Scorecards and PD Models]]
- [[11 Collateral and Security]]
- [[12 Loan Documentation, Covenants and Conditions]]
- [[13 Credit Governance - Committees, Authorities and the Three Lines]]
- [[15 Monitoring, Early Warning and Watchlist]]
- [[16 Problem Loans, Restructuring and Recovery]]
- [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]]
- [[22 Credit Risk Data, Systems and BCBS 239]]
- [[24 Pricing, RAROC and Return on Capital]]
- [[27 A Platform Lead's First 90 Days]]
- [[28 Master Glossary]]
- [[basel-credit-risk-explained-simply]]
- [[basel-credit-risk-decision-tree]]
