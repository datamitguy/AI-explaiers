# Loan Documentation, Covenants and Conditions

**Why this matters to you.** Every number in a credit risk system is, in the end, a number about a contract. The loan agreement says how much can be borrowed, when it must be repaid, what the borrower has promised to do and not do, and what the bank may do if those promises are broken. When a risk manager asks your platform "which borrowers breached a covenant last quarter," "which facilities have a change-of-control clause," or "what conditions are still outstanding on this deal," they are asking you to read the contract back to them. Most banks cannot do this from a system; the answers live in 200-page PDFs and a credit officer's memory. Understanding the shape of these documents is the first step to fixing that.

## Table of contents

1. What a facility agreement is
2. The Loan Market Association standard forms
3. From term sheet to commitment letter to final agreement
4. The key sections of a facility agreement
5. Conditions precedent and conditions subsequent
6. Financial covenants: the ratios and how they are tested
7. Non-financial and negative covenants
8. Information covenants
9. Events of default and what the bank can actually do
10. Waivers, amendments and the process around them
11. Security documents and intercreditor agreements
12. The role of lawyers and the legal review
13. How covenants are monitored in practice
14. A worked example
15. Common mistakes and misunderstandings
16. What a platform lead needs to know about this
17. Related notes

## 1. What a facility agreement is

Think about lending a friend some money for a school trip. If it is a small amount you just hand it over. If it is a big amount you might write down: how much, when they pay it back, whether they pay a bit extra, what they can spend it on, and what happens if they do not pay. If you are sensible you both sign it. That piece of paper is a loan agreement.

A **facility agreement** (also called a loan agreement, credit agreement, or in the United States a credit agreement) is the bank's version. "Facility" is banker-speak for an arrangement under which a customer may borrow. The agreement is the contract between the lender (or a group of lenders) and the borrower (and often guarantors) that sets out all the terms. It is the legal source of the bank's rights. If something is not in the agreement, the bank generally cannot do it.

For a retail customer (see [[05 Retail Lending]]) the agreement is short and standardised, often a few pages, with most of the protection coming from consumer law and the bank's standard terms. For a corporate borrower ([[04 Commercial and Corporate Lending]]) it is a negotiated document that can run to hundreds of pages, and for a leveraged buyout ([[07 Leveraged and Acquisition Finance]]) or a project financing ([[06 Specialised Finance - Project, Object, Commodities, Real Estate]]) the full document set can fill a shelf. This note is about the corporate end, because that is where covenants and conditions do the real work.

## 2. The Loan Market Association standard forms

Writing a 200-page contract from scratch for every loan would be absurdly expensive, so the market has standard forms. In Europe, the Middle East and Africa, and much of Asia, the standard is published by the **Loan Market Association** (LMA), a trade body of banks, law firms and investors. In the United States the **Loan Syndications and Trading Association** (LSTA) plays a similar role, and in Asia Pacific there is the **Asia Pacific Loan Market Association** (APLMA).

The LMA publishes template agreements for different situations: investment grade borrowers, leveraged finance, real estate finance, developing markets, and so on. Lawyers start from the template and negotiate changes. The point is that everyone knows the baseline. When a lawyer says "this is LMA standard" it means "this clause is the one everybody accepts; do not waste time arguing about it." When they say "this is off-market" it means the borrower is asking for something unusual, and the credit committee ([[13 Credit Governance - Committees, Authorities and the Three Lines]]) should look at it.

For a platform lead, the practical consequence is good news: because most corporate agreements follow the LMA structure, the sections, clause numbering and even many definitions are broadly consistent, which makes it feasible to extract data from them in a structured way.

## 3. From term sheet to commitment letter to final agreement

A loan does not spring into existence as a 200-page document. It goes through stages, and it is important to know which stage is binding.

| Document | Length | When | Is the bank bound? |
|---|---|---|---|
| **Term sheet** (or heads of terms, or indicative terms) | 2 to 10 pages | Early discussion | Usually not. Headed "indicative" and "subject to credit approval, documentation and due diligence." It is the sketch. |
| **Commitment letter** (or mandate letter, in syndicated deals together with the term sheet attached) | 5 to 20 pages | After credit approval, before the full agreement | Yes, subject to the conditions it lists. The bank has committed to lend on those terms if the conditions are met. Walking away now may have consequences, including reputational. In an acquisition the buyer relies on this letter to sign the purchase. |
| **Facility agreement** | 100 to 300 pages | Signing | Yes. The full contract. It replaces the earlier documents. |
| **Security documents, guarantees, intercreditor agreement** | Tens of pages each | Signing, alongside the facility agreement | Yes. |
| **Conditions precedent satisfaction letter** | A few pages | Before the first drawing | Confirms the conditions have been met and the borrower may borrow. |

The risk team cares about this because exposure begins earlier than people think. Once a commitment letter is signed, the bank has a contractual obligation and therefore an off-balance sheet exposure ([[basel-credit-risk-explained-simply]] section 9), even though no money has moved. In underwriting a syndicated deal the bank may be committed to the whole amount before it has found other lenders to share it. The limit system ([[14 Risk Appetite, Limits and Concentration]]) should capture the commitment at the commitment letter stage, not at signing.

![[12-document-hierarchy.svg]]
*The document hierarchy: the term sheet and commitment letter come before approval and the binding facility agreement; security documents and the intercreditor agreement hang off the facility agreement, and compliance certificates and waivers keep it alive during the loan.*

## 4. The key sections of a facility agreement

An LMA-style agreement follows a predictable order. Here is the map, with what each section does and why the risk team cares.

| Section | What it contains | Why risk cares |
|---|---|---|
| **Definitions and interpretation** | Fifty or more pages defining every capitalised term: "Borrower," "EBITDA," "Material Adverse Effect," "Permitted Disposal," "Financial Indebtedness." | The covenants mean nothing without the definitions. "EBITDA" in one agreement can differ from "EBITDA" in another by 20% because of what is added back. |
| **The facility** | How much, in what currency, term loan or revolving, how drawings are requested, the availability period, the purpose. | The source of the facility record: limit, currency, tenor, product type. |
| **Purpose** | What the money may be used for. | Misuse of funds is a default; it is also an early warning. |
| **Conditions precedent** | The list of things that must be delivered before the first drawing. | See section 5. |
| **Repayment, prepayment and cancellation** | The repayment schedule, voluntary prepayment rights, mandatory prepayment on events like change of control or asset sales. | The amortisation schedule is what the system uses to project exposure. |
| **Interest, fees and costs** | Margin over a benchmark rate, margin ratchets tied to leverage, commitment fees, arrangement fees, default interest. | Pricing ([[24 Pricing, RAROC and Return on Capital]]) and the data for income forecasts. |
| **Tax, increased costs, illegality** | Protects the bank from changes in law and tax. | Mostly legal; relevant to capital because an "increased costs" clause can pass regulatory capital increases to the borrower. |
| **Representations and warranties** | Statements of fact the borrower makes on signing and repeats on each drawing: it is properly incorporated, has authority, is not in default, its accounts are true, there is no litigation. | If a representation is false, that is an event of default. They are also the bank's due diligence in contract form. |
| **Undertakings (covenants)** | Promises about future behaviour: information covenants, financial covenants, general undertakings. | The heart of monitoring. Sections 6 to 8. |
| **Events of default** | The list of things that let the bank act. | Section 9. |
| **Changes to the parties** | Whether lenders can transfer their share (usually yes, with conditions) and whether the borrower can (usually no). | Determines whether the bank can sell the loan ([[16 Problem Loans, Restructuring and Recovery]]). |
| **The agent and the finance parties** | In a syndicated loan, the agent bank administers the loan on behalf of all lenders; this section sets its duties and the voting rules (majority lenders, usually two thirds by commitment; unanimous for key changes). | Who the bank must talk to, and what it can do alone. |
| **Administration** | Notices, calculations, set-off, governing law, jurisdiction. | Governing law matters for enforceability and for the Basel legal certainty test ([[11 Collateral and Security]]). |
| **Schedules** | The original parties, conditions precedent list, form of utilisation request, form of compliance certificate, timetables. | The compliance certificate template is the thing your system should mirror. |

## 5. Conditions precedent and conditions subsequent

A **condition precedent** (CP) is something that must happen before the bank is obliged to lend. The bike analogy: "I will lend you the bike once you show me you have a helmet." No helmet, no bike. The agreement is signed, but the money does not move until the CPs are satisfied.

Typical CPs for a corporate loan:

- Constitutional documents of the borrower and guarantors, and board resolutions approving the loan.
- Signed security documents and evidence of registration (or an undertaking to register within the deadline).
- Legal opinions from the bank's lawyers (and sometimes the borrower's) confirming the documents are valid and enforceable.
- The latest audited accounts and a financial model.
- Evidence of insurance.
- Know-your-customer documentation.
- Evidence that any fees have been paid.
- For an acquisition: the signed purchase agreement and evidence that the equity has been paid in.
- A certificate that no default is continuing and the representations are true.

Satisfying CPs is a checklist exercise run by the lawyers and the bank's loan administration team, and it is a control: the system should not allow a drawing until the CP checklist is complete or a waiver has been approved.

A **condition subsequent** (CS) is something that must happen after the first drawing, by a deadline. It is used when something cannot be done in time for signing but the deal needs to close. Example: "the borrower shall deliver the registered mortgage over the Spanish property within 60 days of the first utilisation date." Conditions subsequent are riskier than conditions precedent because the money has already gone, and the only leverage the bank has is that failure to meet the CS is an event of default. Conditions subsequent that are never chased are a classic audit finding.

Worked example. A 20 million acquisition facility signs on 1 March. CPs include a share pledge over the target company; this is delivered and the loan is drawn on 3 March. A CS requires a charge over the target's factory to be registered within 90 days. The system records the CS with a due date of 1 June and an owner. On 15 May a report shows it is still open; the credit officer chases the lawyers, the registration completes on 28 May. Without the system record, this item would depend on someone remembering.

## 6. Financial covenants: the ratios and how they are tested

A **financial covenant** is a promise that the borrower's finances will stay within certain limits, tested at regular dates. It is the bank's tripwire: if the business deteriorates, the covenant trips before the borrower actually misses a payment, and the bank gets a seat at the table while there is still something to protect.

The lemonade stand version: your parent lends you 50 to buy supplies and says "as long as you are making at least 5 a week in profit, fine; if profit drops below 5, we sit down and talk." You have not missed a repayment, but the warning light is on.

The main financial covenants:

| Covenant | Formula (typical) | What it tests | Typical level (illustrative) |
|---|---|---|---|
| **Leverage** | Total net debt divided by EBITDA (earnings before interest, tax, depreciation and amortisation, a rough measure of cash profit) | How many years of cash profit it would take to repay the debt | Not more than 3.0x for an ordinary corporate; 5.0x to 7.0x in leveraged deals, stepping down over time |
| **Interest cover** | EBITDA (or EBIT) divided by net interest expense | Whether profit comfortably covers the interest bill | At least 3.0x to 4.0x |
| **Cash flow cover** or **debt service cover** | Cash flow available for debt service divided by scheduled principal plus interest | Whether actual cash covers the actual payments due | At least 1.1x to 1.3x |
| **Minimum net worth** (or tangible net worth) | Shareholders' equity, often excluding intangibles | That the owners' cushion has not been eroded by losses or dividends | A fixed amount, or a percentage of total assets |
| **Capital expenditure limit** | Capex spent in the year | Stops the borrower spending the bank's money on expansion instead of repayment | A fixed cap per year, often with carry-forward |
| **Loan-to-value** | Loan divided by property value | Property deals (see [[11 Collateral and Security]]) | Not more than 60% to 75% |
| **Minimum liquidity** | Cash plus undrawn committed facilities | Common in leveraged deals and in downturns | A fixed amount |

**How they are tested.** The agreement sets test dates (usually each quarter end, sometimes semi-annual or annual for smaller borrowers), the period over which figures are measured (usually the last twelve months, "LTM," so that seasonality is smoothed), and the exact definitions. Within a set number of days after the test date (often 45 for quarterly management accounts, 90 or 120 for audited annual accounts) the borrower must deliver a **compliance certificate** signed by a director, showing the calculation of each ratio and confirming compliance. The bank then checks the calculation itself.

**Headroom** is the gap between the actual ratio and the covenant level. If leverage is 2.4x against a 3.0x covenant, headroom is 0.6x, or 20% of EBITDA (because EBITDA could fall 20% before the covenant trips). Credit officers obsess over headroom because it is the real measure of how close the tripwire is. When covenants are set at the start, the bank usually wants 20% to 30% headroom against the borrower's own forecast, so that a modest miss does not cause a technical default but a serious miss does.

**Covenant-lite.** In the leveraged loan market many deals now have no maintenance financial covenants at all, only "incurrence" covenants that are tested when the borrower does something specific (raises new debt, pays a dividend). The bank loses its early tripwire. [[07 Leveraged and Acquisition Finance]] covers the consequences.

## 7. Non-financial and negative covenants

**Negative covenants** are promises not to do things. **Positive** (or affirmative) undertakings are promises to do things. Together they are the general undertakings, and they protect the bank's position rather than measuring performance.

| Covenant | Promise | Why it exists |
|---|---|---|
| **Negative pledge** | Not to grant security over any assets to anyone else (with permitted exceptions). | Stops another lender jumping ahead of the bank in the queue. The single most important negative covenant for an unsecured lender. |
| **Restrictions on disposals** | Not to sell assets other than in the ordinary course of business or within agreed limits. | Stops the borrower selling the assets that generate the cash to repay, or the collateral itself. |
| **Restrictions on financial indebtedness** | Not to borrow more from others beyond permitted baskets. | More debt means more claims on the same cash. |
| **Restrictions on acquisitions, joint ventures, loans out** | Not to buy companies or lend money without consent. | Stops cash leaking out of the group the bank has lent to. |
| **Dividend and distribution restrictions** | Limits on paying cash to shareholders, often tied to leverage. | Keeps the owners' money in the business. |
| **Change of control** | If the ownership of the borrower changes, the bank may cancel and demand repayment. | The bank lent to this owner and this management; a new owner is a new credit decision. |
| **Pari passu** | The loan will rank at least equally with all the borrower's other unsecured debt. | Stops the borrower creating a class of creditor who gets paid before the bank. ("Pari passu" is Latin for "with equal step.") |
| **Cross-default** | It is a default under this agreement if the borrower defaults on any other debt above a threshold. | So the bank is not the last creditor at the table when something goes wrong elsewhere. A softer version is **cross-acceleration**: only triggered if the other lender actually accelerates. |
| **Material adverse change** (MAC) | A default if something happens that has a material adverse effect on the borrower's business, assets or ability to pay. | A catch-all. In practice banks are reluctant to rely on it alone because "material" is argued over in court; it is used as a backstop and as leverage in negotiation. |
| **Compliance with laws, sanctions, anti-corruption** | To comply with laws, not to use funds in breach of sanctions. | Regulatory and reputational protection. |
| **Insurance, maintenance of assets, intellectual property** | To keep the business insured and in good order. | Protects the value of the collateral and the business. |
| **Ownership of subsidiaries, guarantor coverage** | Material subsidiaries must become guarantors; guarantors must represent, say, 80% of group EBITDA and assets. | Ensures the bank's claims reach where the value actually is. |

All of these come with **permitted baskets**: amounts or categories that are allowed without consent. The negotiation of baskets is where much of the lawyers' time goes.

## 8. Information covenants

The borrower promises to deliver information. This is the raw material for monitoring ([[15 Monitoring, Early Warning and Watchlist]]) and for the financial statement spreading that feeds the internal rating ([[09 Credit Analysis - Reading a Borrower]], [[10 Internal Ratings, Scorecards and PD Models]]).

Typical information undertakings:

- Audited annual consolidated accounts within 120 (or 150, or 180) days of year end.
- Quarterly (or monthly) management accounts within 30 to 45 days.
- An annual budget before the start of each financial year.
- The compliance certificate with each set of accounts.
- Notice of any default, promptly on becoming aware of it.
- Notice of litigation, regulatory investigations, or anything that might cause a material adverse change.
- Any information the bank reasonably requests.
- Know-your-customer updates.

Late accounts are themselves an early warning signal, so the due dates for each deliverable should be in the system with an owner and an ageing report. "Accounts overdue by more than 30 days" is one of the oldest and most reliable triggers there is.

## 9. Events of default and what the bank can actually do

An **event of default** is a defined event that gives the bank the right to take action. The list is long; the main items:

- Non-payment (usually with a short grace period of a few business days for technical or administrative errors).
- Breach of a financial covenant.
- Breach of other obligations (often with a cure period of 10 to 30 days if the breach can be remedied).
- Misrepresentation.
- Cross-default.
- Insolvency, insolvency proceedings, creditors' process (a creditor seizing assets).
- Cessation of business, unlawfulness, repudiation of the agreement.
- Change of control (sometimes an event of default, sometimes a mandatory prepayment event).
- Material adverse change.
- Audit qualification (the auditors refusing to sign off the accounts cleanly).

What can the bank actually do when one occurs? The agreement typically gives these rights, in rough order of severity:

1. **Do nothing yet, but reserve rights.** The bank sends a **reservation of rights letter**: "we are aware of the breach; we are not waiving it; we are considering our position; nothing we do or do not do should be taken as a waiver." This is important because, in many legal systems, if the bank carries on as normal (accepts interest, allows drawings) without reserving its rights, it may be treated as having waived the default. The letter stops the clock.
2. **Stop lending.** Cancel the undrawn commitment, refuse new drawings under the revolving facility. Called a **drawstop**. Often the most practical first step because it stops the exposure growing.
3. **Charge default interest.** Usually an extra 1% to 2% on overdue amounts.
4. **Demand information, appoint an investigating accountant** at the borrower's cost, to find out how bad things are.
5. **Accelerate.** Declare all amounts immediately due and payable. This is the nuclear option. It converts a long-term loan into a demand for repayment the borrower almost certainly cannot meet, which usually triggers insolvency. Banks do it when they have decided enforcement is the best route or when they need to crystallise their rights before other creditors move.
6. **Enforce security.** Appoint a receiver or administrator, take possession of and sell collateral ([[11 Collateral and Security]], [[16 Problem Loans, Restructuring and Recovery]]). Usually requires acceleration first.
7. **Set off** deposits against the debt.

In a syndicated loan these decisions are taken by the majority lenders through the agent, so a single bank may not be able to act alone. The intercreditor agreement (section 11) may also restrict who can enforce and when.

In practice, the vast majority of events of default, especially covenant breaches, end in a waiver or an amendment rather than acceleration. The event of default is leverage: it brings the borrower to the table.

## 10. Waivers, amendments and the process around them

A **waiver** is the bank agreeing to overlook a specific breach for a specific period. "We waive the breach of the leverage covenant for the quarter ending 30 June." The covenant still applies at the next test date.

An **amendment** changes the agreement itself: resetting covenant levels (a **covenant reset**), extending the maturity, changing the margin, adding security, adding a new covenant such as minimum liquidity, or an **equity cure** (the shareholders inject cash that is counted as EBITDA or used to reduce debt for the covenant test; agreements usually limit how many times and how often).

The process, in a typical bank:

1. The borrower (or the relationship manager who sees it coming) requests a waiver or amendment in writing, with the reasons and a forecast.
2. The credit officer prepares a paper: what breached, why, what is proposed, what the bank gets in return (a fee, usually 0.1% to 1% of the facility; a higher margin; more security; tighter information; a shorter maturity), and whether the rating should be downgraded.
3. The request goes to the approval authority that originally approved the loan, or higher if the risk has increased ([[13 Credit Governance - Committees, Authorities and the Three Lines]]). A covenant breach is nearly always a trigger for the borrower to be placed on the watchlist ([[15 Monitoring, Early Warning and Watchlist]]) and considered for forbearance classification if the bank has made a concession because of financial difficulty ([[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]]).
4. In a syndicate, the agent circulates the request and collects votes; the required majority depends on what is being changed.
5. Lawyers draft a waiver letter or an amendment and restatement agreement. The borrower signs. The fee is paid.
6. The system is updated: new covenant levels, new test dates, the waiver recorded against the breach, the watchlist and forbearance flags set.

Step 6 is where it goes wrong most often. The amended covenant lives in a letter in the document archive and the system still shows the old level, so the next test runs against the wrong number.

![[12-covenant-breach-flow.svg]]
*The covenant test and breach escalation flow: from test date and compliance certificate through calculation, headroom checks, breach, reservation of rights, and the credit committee's choice between waiver, amendment and enforcement.*

## 11. Security documents and intercreditor agreements

The facility agreement says the loan will be secured; the **security documents** actually create the security. For English-law deals these are typically a debenture (fixed and floating charges over everything), legal mortgages over specific properties, share charges over subsidiaries, assignments of receivables and insurances, and guarantees. For other jurisdictions, local-law documents are needed for local assets, which is why a cross-border deal can have dozens of security documents and a dozen law firms. All of this is covered in depth in [[11 Collateral and Security]].

An **intercreditor agreement** is needed whenever more than one class of creditor has claims on the same borrower or the same security. Common in leveraged finance (senior lenders, second lien, mezzanine, bondholders, hedge counterparties) and in project finance. It fixes by contract:

- **Ranking**: who gets paid first from enforcement proceeds (the **waterfall**).
- **Subordination**: junior creditors agree not to be paid, or not to be paid principal, while senior debt is outstanding, except as permitted.
- **Enforcement control**: who can instruct the security agent to enforce, and standstill periods during which junior creditors must wait before acting.
- **Turnover**: if a junior creditor receives money it should not have, it must hand it over.
- **Release**: the security agent can release junior claims when selling the business, so a buyer gets a clean company.
- **Voting**: how decisions among creditors are made.

For the risk team, the intercreditor agreement determines whether "secured" means "first in the queue" or "fourth in the queue," which is the difference between an LGD of 10% and an LGD of 70%. The system should record the bank's rank, not just the existence of security.

## 12. The role of lawyers and the legal review

The bank almost always instructs external lawyers for anything beyond standard-form lending, and the borrower instructs its own. The bank's lawyers draft the documents (starting from the LMA form), negotiate with the borrower's lawyers, run the CP process, deliver the legal opinions, and register the security. For cross-border deals, local counsel is needed in each jurisdiction where there is a borrower, guarantor or asset.

Inside the bank, a legal department reviews the deal, approves the choice of external counsel, and signs off that the documentation reflects the credit approval. This last point matters: the credit committee approved certain terms (a 3.0x leverage covenant, security over the factory, a parent guarantee), and someone must check that the signed document actually says that. Deviations between the approval and the documentation are a classic control failure. Many banks require a **documentation checklist** or **approval-to-documentation reconciliation** signed by legal and by credit before the first drawing.

Legal review is also the source of the "legal certainty" evidence the Basel rules require before security can be recognised for capital ([[18 Regulatory Capital and Basel - the Short Version]]). The legal opinions should be stored and linked to the facility and collateral records.

## 13. How covenants are monitored in practice

In an ideal bank:

1. On signing, the loan administration team enters every covenant into a **covenant monitoring system** (or module of the lending system): the ratio, the definition reference, the test level for each test date (levels often step down over time), the test frequency, the delivery deadline, and the owner.
2. The system generates a calendar of expected deliverables: accounts, certificates, budgets.
3. When the compliance certificate arrives, an analyst enters the borrower's figures, the system recalculates the ratios, compares them to the levels, and records pass or fail and headroom.
4. Overdue deliverables and breaches generate alerts to the relationship manager and the credit officer, and feed the early warning process ([[15 Monitoring, Early Warning and Watchlist]]).
5. Waivers and amendments update the levels, with an audit trail.
6. Management information reports: covenants tested this month, breaches, waivers granted, headroom distribution across the portfolio, and the all-important "number of facilities with no covenant data in the system."

In many real banks, steps 1 to 6 are a spreadsheet maintained by one analyst, and the compliance certificate is filed as a PDF without the numbers being extracted. The symptoms are: the bank finds out about a breach from the borrower rather than from its own calculation; covenant levels in the system differ from the signed amendment; and nobody can answer "how many borrowers have headroom below 10%" without a two-week project.

Breaches found by the monitoring process need to be classified correctly for accounting and regulation. A covenant breach that the bank waives because the borrower is in financial difficulty is a forbearance measure. A breach that is a sign of significant deterioration pushes the loan toward stage 2 under the expected credit loss rules. A breach the bank decides not to waive, combined with an assessment that the borrower is unlikely to pay, is a default ([[02 What Credit Risk Is]]). The monitoring system and the risk classification systems must talk to each other.

## 14. A worked example

A bank lends 30 million as a five-year term loan to a regional logistics company, with a 10 million revolving facility. Financial covenants: leverage not more than 3.0x (stepping to 2.75x after year 2), interest cover at least 4.0x, capex not more than 6 million a year. Tested quarterly on a last-twelve-months basis; compliance certificate due 45 days after each quarter end.

**Year 1, quarter 4.** EBITDA last twelve months 12 million. Net debt 32 million (30 term plus 4 drawn on the revolver minus 2 cash). Leverage 32 divided by 12 = 2.67x against 3.0x: headroom 0.33x, or about 11% of EBITDA (EBITDA could fall to 10.67 million before breaching). Interest 2.1 million, cover 5.7x, comfortable. Capex 5.2 million, within limit. Pass. The credit officer notes leverage headroom has narrowed from 20% a year ago and flags it for the annual review.

**Year 2, quarter 2.** A major customer leaves. EBITDA last twelve months 10.2 million. Net debt 33 million (revolver more drawn). Leverage 3.24x. Breach. The compliance certificate, delivered on day 44, shows the breach; the bank's own recalculation agrees (and notices the borrower had added back 0.5 million of "exceptional" restructuring costs that the definitions do not permit, which would otherwise have shown 3.07x).

**Response.** Within two days the credit officer issues a reservation of rights letter and imposes a drawstop on the revolver. The borrower is moved to the watchlist. The relationship manager and credit officer meet management, who present a plan: cost cuts, a new contract starting in quarter 4, and the shareholders willing to inject 3 million of equity. The credit officer prepares a paper for the regional credit committee proposing: waiver of the quarter 2 breach; equity cure of 3 million applied to reduce debt; leverage reset to 3.5x for quarters 3 and 4, stepping back to 3.0x in year 3; margin up 0.5%; a 0.25% waiver fee (100,000); monthly management accounts instead of quarterly; a minimum liquidity covenant of 2 million; and a rating downgrade of two notches. The committee approves. Because the bank has changed the terms as a result of the borrower's financial difficulty, the facility is flagged as forborne and assessed for stage 2 under the expected credit loss rules.

**Systems.** The covenant module is updated with the new levels and the new monthly deliverables; the waiver is recorded against the quarter 2 test; the forbearance flag, watchlist category and new rating are set; the drawstop is lifted once the amendment is signed and the equity has arrived (a condition precedent to the amendment).

**Year 3.** The new contract performs, leverage falls to 2.6x, the borrower exits the watchlist after two consecutive clean quarters and completes the forbearance probation period later. The whole episode cost the bank nothing and earned 100,000 plus a higher margin. That is what covenants are for.

## 15. Common mistakes and misunderstandings

- **Thinking a covenant breach means the borrower has missed a payment.** It almost never does. It means a tripwire has gone off while the borrower is still paying. That is the point.
- **Reading the ratio without the definitions.** "EBITDA" and "net debt" are defined terms; the borrower's own calculation may use different add-backs. Always recalculate from the agreement's definitions.
- **Confusing the term sheet with the deal.** The term sheet is not binding and the final agreement may differ. Record what was signed, not what was proposed.
- **Ignoring the commitment letter as an exposure.** It is a binding commitment and belongs in the limit system from the moment it is signed.
- **Letting conditions subsequent drift.** They are promises with deadlines; unmet, they are events of default and often mean unperfected security.
- **Carrying on as normal after a breach without reserving rights.** Can be argued to waive the breach.
- **Treating "secured" as one thing.** Rank matters. Second lien behind 200 million of senior debt may be worth little.
- **Relying on a material adverse change clause.** It is a backstop, not a plan; it is contested and slow.
- **Not updating the system after a waiver or amendment.** The next test runs against the wrong number and the breach is missed or falsely reported.
- **Forgetting that a waiver may be forbearance.** Accounting and regulatory classification follow from the credit decision; the two processes must be linked.
- **Assuming all agreements are LMA-shaped.** Bilateral loans, older facilities, overseas subsidiaries and acquired portfolios may have bespoke documents. The extraction process must cope with exceptions.

## 16. What a platform lead needs to know about this

**Data.** The facility agreement is the source of truth for the facility record. The fields that should be captured in structured form at signing: facility type, amount, currency, availability period, maturity, repayment schedule, margin and ratchet grid, fee schedule, governing law, agent, lender share, transferability. For each covenant: type, definition reference, test frequency, test dates, level per test date, delivery deadline, cure period, equity cure rights. For each condition precedent and subsequent: description, owner, due date, status, evidence. For each event of default: type and grace period. For security: links to the collateral records and the bank's rank from the intercreditor agreement. For information undertakings: each deliverable with its due date. Most of this can be extracted from LMA-form documents in a repeatable way, and document extraction tooling is a reasonable investment, but the extracted values must be checked by a human who has read the clause, because definitions and carve-outs change the meaning.

**Systems.** Expect to find: a document management system holding the signed PDFs; a loan administration or servicing system holding the facility and the repayment schedule; a covenant tracking tool that may be a spreadsheet; the limit system; the collateral system; and the credit workflow system where the approval memo lives. The gap is nearly always between the document and the structured data. The reconciliation "does what the system says match what the signed document says" is the control that catches the most errors, and it is worth automating a sample of it.

**Controls.** No drawing before CPs are satisfied or formally waived. Approval-to-documentation reconciliation signed by credit and legal. Covenant levels entered by one person and checked by another. Deliverable calendar with ageing alerts. Breach alerts routed to credit, not only to the relationship manager. Waivers and amendments cannot be recorded without an approval reference. Forbearance and watchlist flags set automatically when a waiver is recorded, with a credit officer able to override with a reason. Legal opinions stored and linked for the Basel legal certainty evidence.

**Who owns what.** The relationship manager negotiates commercial terms and is the contact for the borrower. The credit officer sets the covenant package and approves waivers within authority. Legal (internal plus external counsel) drafts, reviews and perfects. Loan administration or agency operations enters the data, tracks CPs and deliverables, and handles drawings. Credit risk monitoring runs the covenant tests. Finance and risk reporting consume the breach and forbearance data. The platform lead owns the structured representation of the contract and the links between the document, the facility, the covenants, the collateral and the classification flags, and reports the data quality ([[22 Credit Risk Data, Systems and BCBS 239]]).

**Questions to ask in your first month.** How many facilities have covenants recorded in a system, versus "see the agreement"? When a waiver is signed, how does the system find out? Can you list all facilities with a change-of-control clause, or with cross-default thresholds below a given amount? How many conditions subsequent are open past their due date? Is the commitment letter stage captured in the limit system?

## 17. Related notes

- [[03 The Credit Lifecycle]] for where documentation sits between approval and monitoring.
- [[04 Commercial and Corporate Lending]] and [[07 Leveraged and Acquisition Finance]] for the products and their typical covenant packages.
- [[06 Specialised Finance - Project, Object, Commodities, Real Estate]] for project finance document sets.
- [[09 Credit Analysis - Reading a Borrower]] for the ratios behind the covenants.
- [[11 Collateral and Security]] for the security documents.
- [[13 Credit Governance - Committees, Authorities and the Three Lines]] for who approves waivers.
- [[14 Risk Appetite, Limits and Concentration]] for commitments and limits.
- [[15 Monitoring, Early Warning and Watchlist]] for how breaches feed the watchlist.
- [[16 Problem Loans, Restructuring and Recovery]] for acceleration, enforcement and restructuring.
- [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]] for forbearance and staging.
- [[18 Regulatory Capital and Basel - the Short Version]] for legal certainty.
- [[22 Credit Risk Data, Systems and BCBS 239]] for the data standards.
- [[24 Pricing, RAROC and Return on Capital]] for margins, ratchets and fees.
- [[basel-credit-risk-explained-simply]] and [[basel-credit-risk-decision-tree]] for off-balance sheet commitments.
- [[28 Master Glossary]] for terms.
