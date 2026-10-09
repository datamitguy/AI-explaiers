# Problem Loans, Restructuring and Recovery

**Why this matters to you.** Everything in the earlier notes is about lending money and hoping it comes back. This note is about what happens when it does not. Problem loans are where a bank's real losses are made or avoided, where the numbers that feed the loss models come from, and where the data is messiest. If you are the platform lead for a credit risk team, the workout and collections world will send you some of your hardest data requests, your most sensitive customer records, and the inputs that decide whether the bank's loss given default models can be trusted at all. Understanding how a loan goes from "fine" to "written off", and every stop in between, is the key to understanding half of what your systems are for.

## Table of contents

1. [The lemonade stand version](#the-lemonade-stand-version)
2. [What makes a loan a problem loan](#what-makes-a-loan-a-problem-loan)
3. [The handover to the workout team](#the-handover-to-the-workout-team)
4. [The five strategies: hold, restructure, refinance, enforce, sell](#the-five-strategies-hold-restructure-refinance-enforce-sell)
5. [Forbearance and its regulatory definition](#forbearance-and-its-regulatory-definition)
6. [The restructuring toolbox](#the-restructuring-toolbox)
7. [Consensual versus formal processes](#consensual-versus-formal-processes)
8. [Insolvency basics](#insolvency-basics)
9. [Enforcing security](#enforcing-security)
10. [The waterfall: who gets paid first](#the-waterfall-who-gets-paid-first)
11. [Recovery rates and what drives them](#recovery-rates-and-what-drives-them)
12. [Non-performing loan definitions](#non-performing-loan-definitions)
13. [Selling non-performing loans and securitising them](#selling-non-performing-loans-and-securitising-them)
14. [Retail collections](#retail-collections)
15. [The data needed to compute loss given default](#the-data-needed-to-compute-loss-given-default)
16. [A worked example from first missed payment to final loss](#a-worked-example-from-first-missed-payment-to-final-loss)
17. [Common mistakes and misunderstandings](#common-mistakes-and-misunderstandings)
18. [What a platform lead needs to know about this](#what-a-platform-lead-needs-to-know-about-this)
19. [Related notes](#related-notes)

## The lemonade stand version

Imagine you lent your friend Sam 20 coins to buy a bike, and Sam promised to pay you back 2 coins a week for 10 weeks. For four weeks it works. Then Sam misses a week. Then another.

You have choices. Wait and see (maybe Sam's pocket money was late). Say "pay me 1 coin a week for 20 weeks instead" (a restructure). Ask Sam's older sister to take over the debt (a refinance). Take the bike and sell it (enforcement). Or sell the whole promise to another kid for 8 coins and walk away (a loan sale). Each gets you a different amount back, takes a different time, and does different damage to the friendship. A bank faces exactly these choices, thousands of times a year, with lawyers and regulators watching. The rest of this note is detail on top of that.

## What makes a loan a problem loan

A loan becomes a problem when the bank stops believing it will be repaid in full, on time, without having to do anything unusual. There is no single moment; it is a slide, and the bank tries to catch it early. The signals come from [[15 Monitoring, Early Warning and Watchlist]] and fall into three groups.

| Group | Examples | What it tells you |
|---|---|---|
| Payment behaviour | Missed instalment, overdraft above limit, bounced direct debit, interest unpaid | The borrower is short of cash right now |
| Contractual breaches | Covenant breach (see [[12 Loan Documentation, Covenants and Conditions]]), late accounts, unauthorised disposal of collateral | The borrower is drifting from what was agreed |
| External and soft signals | Rating downgrade, auditor's going concern warning, loss of a major customer, key person leaves, sector shock, press stories | Trouble is coming even though payments are still on time |

A loan is tagged with a status that gets worse in steps. Names vary, but a typical ladder is **performing**, **watchlist**, **forborne** or **substandard**, **non-performing** (also called **defaulted**, **impaired** or **doubtful**), and **written off**. The bottom grades of the rating scale in [[10 Internal Ratings, Scorecards and PD Models]] are the default grades. The thing to hold onto: "problem loan" is a judgement; "non-performing" and "default" are defined terms with rules. A bank that waits for the formal trigger before acting loses more money.

## The handover to the workout team

In good times a loan is looked after by a **relationship manager**, the person who won the customer and wants to keep them. When a loan goes wrong, that person has a conflict: they are close to the customer, their incentives may be tied to the relationship, and they may lack the specialist skills. So banks move problem loans to a separate team called **workout**, **special situations**, **intensive care** or **restructuring and recovery**, or in retail simply **collections** and **recoveries**.

![[16-problem-loan-handover.svg]]
*How a loan travels from early warning through watchlist to the workout team, the five strategy options, and the two ways it ends.*

The handover is a real event, not just a flag change. A good handover involves:

1. A **trigger**: hard rules (for example, any corporate loan 60 days past due, or in the bottom two non-default grades, must be transferred) plus credit officer discretion.
2. A **transfer memo** from the relationship team: what went wrong, what has been tried, what the customer says.
3. A **new owner**, a workout officer who takes over customer contact and decision rights. The relationship manager may no longer make promises to the customer.
4. A **strategy paper** within a set number of weeks, choosing among the five strategies with a recovery forecast for each.
5. A **provisioning review**, because the handover nearly always moves the loan to Stage 3 under [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]].

Some banks run a lighter step first, where a workout specialist "shadows" the relationship manager, because early, quiet intervention often avoids the heavy process. The authority to transfer a loan and to approve a strategy sits with the credit committees in [[13 Credit Governance - Committees, Authorities and the Three Lines]]. Retail accounts are handled by rules in a collections system with no committee at all.

## The five strategies: hold, restructure, refinance, enforce, sell

Every workout plan is a choice among five basic strategies, often combined.

| Strategy | What it means | When it makes sense | Main risk |
|---|---|---|---|
| Hold | Keep the loan as it is, monitor closely, maybe waive a breach | Temporary problem, strong collateral, borrower still paying | The problem is not temporary and you have wasted time |
| Restructure | Change the terms so the borrower can pay | Viable business, wrong debt structure | You pour good money after bad; "extend and pretend" |
| Refinance | Another lender, or the market, takes the bank out | Borrower is still attractive to someone else | Rarely available once the trouble is public |
| Enforce | Use your legal rights: take the collateral, appoint a receiver, petition for insolvency | Borrower is not viable or not cooperating; collateral is good | Slow, expensive, destroys value, reputational damage |
| Sell | Sell the loan, alone or in a portfolio, to an investor | Bank wants the loan off its books now and accepts a discount | You crystallise the loss and lose any upside |

A workout officer compares strategies on **net present value**, shortened to **NPV**: what a stream of future cash is worth today, after costs, allowing for the fact that money later is worth less than money now. The strategy with the highest NPV wins, subject to the bank's appetite for time, reputation and effort.

The restructure often wins on NPV, but it is also the slowest and most uncertain. Banks under pressure from their regulator to reduce non-performing loans quickly, or short of workout staff, often take the sale instead. The worked example at the end of this note shows the comparison with numbers.

## Forbearance and its regulatory definition

**Forbearance** is the word for the bank going easy on a borrower who is in, or about to be in, financial difficulty. If a borrower who could pay asks for a lower rate and gets it, that is commercial repricing. If a borrower who cannot pay asks for the same thing and gets it, that is forbearance. The difference is the borrower's financial difficulty, not the change itself.

Regulators care because forbearance is the easiest way to hide a bad loan. Give the borrower a payment holiday and, by magic, there are no arrears and the loan looks performing. After 2008, European supervisors in particular found that many banks had been doing this at scale, so they wrote a formal definition. In broad terms, a loan is **forborne** when both of these are true:

1. The borrower is experiencing, or is about to experience, **financial difficulty** in meeting their commitments.
2. The bank grants a **concession** it would not otherwise have granted: a modification of terms (lower rate, longer tenor, payment holiday, covenant waiver), or a refinancing into a new loan to help repay the old one.

Once flagged, the forbearance tag sticks for a **probation period** (commonly a minimum of two years, though rules vary by country) of regular payment with no new concessions. If the loan is non-performing when forborne, it must also pass a **cure period** (commonly at least a year) before it can be called performing again. Forbearance is typically a qualitative trigger for Stage 2 or Stage 3 in [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]]. The practical point: every concession must be **recorded** as a concession so the flag can be set. A restructure keyed as a plain "rate change" is a reporting error and, to the regulator, a sign that the bank cannot see its own problems.

## The restructuring toolbox

Restructuring means changing the deal so that a viable borrower with the wrong debt can carry on. These are the tools, and they are usually combined.

| Tool | What it does | Who it helps | Watch out for |
|---|---|---|---|
| Extend the tenor | Push out the final repayment date, lower each instalment | Borrower whose cash flow is real but too slow for the schedule | More time means more risk; interest cost rises for the borrower |
| Payment holiday (moratorium) | Stop all or some payments for a few months | Borrower hit by a short-term shock (a bad season, a delayed contract) | Arrears do not disappear; the missed amounts must go somewhere |
| Interest capitalisation | Instead of paying interest in cash, add it to the loan balance | Borrower with no cash now but assets later | The loan grows; the bank is lending more to a struggling borrower |
| Interest rate reduction or payment-in-kind | Lower the rate, or let part of the interest accrue to be paid at the end | Borrower whose margin cannot carry the interest bill | Reduces the bank's income; a real concession the accountants will measure |
| Covenant reset | Loosen or suspend financial covenants (see [[12 Loan Documentation, Covenants and Conditions]]) | Borrower in technical breach but still paying | Resetting too easily removes your early warning system |
| Debt for equity swap | The bank cancels part of the loan in exchange for shares in the borrower | Over-indebted but viable company; the bank gets the upside if it recovers | The bank now owns a company; equity gets a punitive capital treatment (see [[18 Regulatory Capital and Basel - the Short Version]]) |
| Haircut (principal write-down) | Formally forgive part of the loan | Borrower who can pay most but never all | Immediate loss; may be the price of keeping the rest |
| Standstill agreement | All lenders agree not to enforce for a period while a plan is negotiated | Multi-lender situations where one lender rushing to enforce would sink everyone | Needs all lenders to sign; the clock is ticking |
| New money (super senior rescue finance) | Lend a little more, ranking ahead of everything else, to keep the business trading | Businesses that die without working capital | Good money after bad if the plan fails |

A typical corporate restructure combines a standstill, a covenant reset, a tenor extension, some capitalised interest, and a small haircut in exchange for equity warrants. In retail the tools are simpler: term extension, temporary reduced payments, interest-only periods and arrears capitalisation.

Accountants treat these as a **modification** of the loan. If the new terms are very different, the old loan is treated as extinguished and a new one recognised, with a loss booked for the difference. This decides when the loss hits the income statement.

## Consensual versus formal processes

There are two roads to fixing a troubled borrower.

A **consensual** process is a private negotiation between the borrower and its lenders with no court involved. The borrower keeps running the business, nobody outside needs to know, and it is faster, cheaper and less destructive. The difficulty is that it needs every important creditor to agree, and one lender who would rather enforce can hold the others hostage. Lenders solve this with standstill agreements, steering committees of the largest lenders, informal industry codes, and specialist restructuring advisers on both sides.

A **formal** process uses the law. A court or court-appointed officer takes some or all control, creditors are bound by majority votes rather than unanimity, and the process is public. Formal processes exist because consensus sometimes fails: a holdout creditor, a dishonest borrower, a business so far gone that only a legal freeze can stop the bleeding.

Most real workouts start consensual and hold the formal option as a threat. Some formal tools, such as the scheme of arrangement below, are designed to be used inside a consensual deal specifically to bind the minority.

## Insolvency basics

Insolvency law is different in every country and the names change, but the underlying ideas are the same everywhere. A borrower is **insolvent** when it cannot pay its debts as they fall due, or when its liabilities exceed its assets. When that happens, the law provides a set of processes. Think of them as four generic shapes.

**Rescue with management in place.** The company gets a breathing space from its creditors (a **moratorium** or **automatic stay**) while it proposes a plan. Creditors vote in classes, and if enough approve, the plan binds the dissenters. The United States version is **Chapter 11**, which is why people everywhere say "a Chapter 11 style reorganisation"; many countries now have something similar. Lenders usually accept worse terms; in return the business survives.

**Rescue with an outside officer in charge.** An independent professional (an **administrator** in the United Kingdom and elsewhere) takes control from the directors and tries to rescue the company, achieve a better result than liquidation, or realise assets for secured creditors. Administration often ends in a sale of the business as a going concern, sometimes a **pre-pack**, where the sale is agreed before the appointment and completed immediately after.

**Court-approved compromise.** A **scheme of arrangement** (and newer relatives with cross-class cram-down) lets a company agree a deal with a class of creditors by a qualified majority, often three quarters in value, with the court imposing it on the minority. No moratorium, management stays. Used for big restructurings where everyone broadly agrees except a few.

**Liquidation.** The company stops trading, a **liquidator** sells everything, pays creditors in the legal order, and the company is dissolved. Recoveries are lowest because assets are sold piecemeal and in a hurry. In the United States this is **Chapter 7**.

For individuals, countries have their own equivalents (bankruptcy, voluntary arrangements, debt relief orders) with the same shape and more protection for the person's home.

| Process shape | Who is in control | Moratorium? | Typical outcome | Recovery for lenders |
|---|---|---|---|---|
| Reorganisation (Chapter 11 style) | Existing management, with court oversight | Yes | Business survives with new capital structure | Medium to high for secured, variable for unsecured |
| Administration | Appointed officer | Yes | Business sold, often pre-pack, or wound down | Medium |
| Scheme of arrangement | Existing management | No | Debt compromised by majority vote | Medium to high |
| Liquidation | Appointed officer | Yes | Assets sold, company dissolved | Low |

A banker needs three things from insolvency law: whether their security will be respected (see [[11 Collateral and Security]]), how long the process takes, and how much goes to others first. These vary enormously across countries, which is why the same loan can have a very different loss given default in two places. See [[26 Sovereign, Bank and Country Risk]].

## Enforcing security

If the bank holds security, it can take the asset rather than wait in the queue. Enforcement is the act of using that right. The main forms:

- **Repossession** of a movable asset (a car, a machine, an aircraft) followed by sale. Aviation and shipping have international conventions to ease cross-border repossession.
- **Possession and sale of property**. For a mortgage, the bank obtains possession (usually after a court process with protections for homeowners), sells at a fair price and returns any surplus to the borrower.
- **Receivership**. The bank appoints a **receiver** over a specific asset (typically a building or a business unit) to collect its income and sell it. The receiver acts for the bank, not for all creditors.
- **Enforcement of guarantees**, where the guarantor becomes a new problem borrower, and **share pledge enforcement**, where in leveraged deals (see [[07 Leveraged and Acquisition Finance]]) lenders take ownership of the whole group in one step.

Enforcement is rarely as clean as the documents suggest: legal costs, delays, a fallen market, and headlines when a bank evicts families or shuts factories. The workout officer weighs all this against the NPV of other strategies.

## The waterfall: who gets paid first

When a borrower's assets are sold, the cash is shared out in a strict legal order. This is called the **waterfall** or **ranking**, and it is the single biggest driver of how much each lender gets back.

![[16-creditor-waterfall.svg]]
*The order in which proceeds are paid out in a typical insolvency. The exact order and the categories vary by country, especially the treatment of taxes and employees.*

A worked example. A company owes 100 in total and its assets are sold for 60.

| Rank | Creditor | Owed | Collateral value | Paid | Recovery |
|---|---|---|---|---|---|
| 1 | Insolvency costs | 4 | not applicable | 4 | 100% |
| 2 | Super senior rescue loan | 6 | not applicable | 6 | 100% |
| 3 | Secured bank loan (over the factory, worth 30) | 40 | 30 | 30 from the factory, plus a share of the rest | see below |
| 4 | Preferential (employees) | 5 | not applicable | 5 | 100% |
| 5 | Unsecured (suppliers, bondholders, the bank's 10 shortfall) | 35 + 10 | none | 15 shared pro rata | 33% |
| 6 | Subordinated loan | 10 | none | 0 | 0% |
| 7 | Shareholders | not applicable | not applicable | 0 | 0% |

After costs, rescue finance, the secured lender's collateral and the preferential creditors, 15 is left for 45 of unsecured claims, so each unsecured creditor gets a third. The secured bank recovers 30 from the factory plus a third of its 10 shortfall, about 33.3, a recovery of 83%. The subordinated lender and shareholders get nothing. Same company, same sale, recovery from 0% to 100% depending only on your place in the queue. **Where you rank is worth more than how much you are owed**, and ranking is set when the loan is documented (see [[12 Loan Documentation, Covenants and Conditions]] and [[11 Collateral and Security]]), which is why intercreditor agreements are negotiated so hard.

## Recovery rates and what drives them

A **recovery rate** is the share of what was owed that the bank eventually gets back, after costs, and usually after discounting for the time it took. **Loss given default**, shortened to **LGD**, is simply one minus the recovery rate, and it is one of the three ingredients of expected loss described in [[02 What Credit Risk Is]].

The drivers, roughly in order of importance:

| Driver | Effect | Typical scale (illustrative) |
|---|---|---|
| Seniority and security | Secured senior debt recovers far more than unsecured or subordinated | Senior secured 60% to 80% recovery; senior unsecured 30% to 50%; subordinated 10% to 30% |
| Collateral type and quality | Cash and government bonds recover almost fully; residential property well; specialised machinery and inventory poorly | Residential mortgage LGD often 10% to 25%; unsecured consumer lending 60% to 90% |
| Loan to value at default | Lower LTV means more cushion against falling prices | A 50% LTV mortgage rarely loses; a 95% LTV mortgage often does |
| Jurisdiction | Speed and creditor-friendliness of the legal system | Enforcement of a mortgage can take under a year in some countries and more than five in others |
| Point in the economic cycle | Collateral is worth less and buyers are fewer in a downturn; regulators require a **downturn LGD** in capital models | Recoveries in 2009 were materially lower than in 2006 for the same asset types |
| Industry | Asset-heavy industries (property, utilities) recover more than people-heavy ones (services, technology) | |
| Workout strategy, skill and time | A well-run consensual restructure beats a liquidation; longer workouts mean more cost and more discounting | |

Two words you will meet. **Cure** means the borrower defaulted and then returned to performing without the bank losing money (apart from costs). Cure rates are high in retail and are a big part of why retail LGD is lower than the raw collateral position suggests. **Workout LGD** is LGD computed from the actual cash flows of real workouts, as opposed to market LGD computed from the price of a defaulted bond.

## Non-performing loan definitions

Because so much depends on whether a loan is "non-performing", regulators defined it carefully. The Basel definition of **default** (see [[basel-credit-risk-explained-simply]]) and the accounting and supervisory definitions of **non-performing exposure**, shortened to **NPE** (or **non-performing loan**, **NPL**, for loans alone), have been harmonised in most places so that they mean nearly the same thing. The core is two tests, either of which is enough:

1. **90 days past due**. A material amount has been overdue for more than 90 days. "Material" is defined with thresholds (an absolute amount and a percentage of the exposure, set by the regulator) so that a trivial unpaid fee does not trigger default on a large loan. Days past due are counted from the day the amount was first due, not from the day the bank noticed.
2. **Unlikeliness to pay**, shortened to **UTP**. The bank judges that the borrower is unlikely to pay in full without the bank enforcing security, regardless of arrears. Indicators include: the bank stops accruing interest, a specific provision is raised, the loan is sold at a material credit-related loss, a distressed restructuring involving forgiveness or postponement, the borrower files for insolvency, or the bank petitions for it.

Two further rules make the definition bite harder. The **pulling effect**: for a corporate borrower, if one loan defaults, all of that borrower's loans are treated as defaulted (retail may be assessed facility by facility). **Contagion**: if the defaulted borrower is part of a connected group, the bank must consider whether the others are also unlikely to pay.

Getting out of default is harder than getting in. The borrower must satisfy the **cure** conditions: no amounts past due, the unlikeliness-to-pay indicators no longer apply, and a minimum **probation period** (commonly three months for a plain default, at least a year for a forborne non-performing loan, with exact periods set locally) of regular payment has elapsed. Only then does the loan return to performing. If it was forborne, the forbearance flag stays on for its own probation period after that.

![[16-npl-status-timeline.svg]]
*The status ladder from performing to non-performing and back, with forbearance flags running alongside. The periods shown are common supervisory minimums and vary by country.*

The non-performing flag drives the move to **Stage 3** in [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]], a **150% risk weight** (100% if well provisioned) under the standardised approach in [[18 Regulatory Capital and Basel - the Short Version]], the bank's published **NPL ratio** (non-performing loans divided by total loans, watched closely by investors and supervisors, some of whom impose calendar-based **provisioning backstops** that force full provisioning after a set number of years), and the **default history** used to build the models in [[10 Internal Ratings, Scorecards and PD Models]].

## Selling non-performing loans and securitising them

A bank does not have to work out every bad loan itself. A whole industry buys them.

**NPL portfolio sales.** The bank bundles loans by type into a portfolio, prepares a **data tape** (one row per loan, dozens of columns), opens a data room, and invites specialist investors to bid as a percentage of gross book value. Bids depend on collateral, legal jurisdiction and, above all, data quality: missing valuations or unclear legal status mean a lower price, because the buyer prices in the uncertainty. The bank books a loss equal to the gap between carrying value (gross less provisions) and price. Because the loans were already heavily provisioned, the extra loss is often small, and the bank sheds the capital charge, the workout cost and the reputational drag at once. A large corporate loan can also be sold on its own in the secondary loan market, usually to a distressed debt investor who becomes the lender of record.

**NPL securitisation.** The loans are transferred to a special purpose vehicle, which issues notes in tranches (mechanics in [[basel-credit-risk-explained-simply]]). Some countries have run government guarantee schemes for the senior tranche to get these markets going. The bank often keeps a junior piece and acts as servicer, so the risk transfer is partial.

**Servicing.** Whoever owns the loan, someone has to chase the borrower and manage the collateral. Independent **servicers** do this for a fee. If the bank outsources servicing, the servicer's behaviour towards customers is still the bank's responsibility in the eyes of conduct regulators.

## Retail collections

For millions of small loans the workout process is industrialised and called **collections** (while the customer still owes the money and might pay) and **recoveries** (after the loan is written off or the collateral sold, when the bank is chasing the residual). The approach is driven by data and automation, not by workout officers.

**Contact strategies.** A collections system decides, for each account, who to contact, when, how (text message, app notification, email, letter, call, external agency) and with what message, based on days past due, amount, risk score and past behaviour. Early, low-pressure contact ("we noticed a payment was missed, is everything alright?") recovers more than threats. Champion-challenger testing, where two strategies run side by side and the better one wins, is standard.

**Delinquency buckets.** Accounts are grouped by days past due: current, 1 to 30, 31 to 60, 61 to 90, and so on. Movement between buckets is measured monthly in a **roll rate** table, which feeds both the collections budget and the provisioning models. Most accounts in the 1 to 30 bucket roll back to current; an account that reaches 90 days has a high chance of going all the way to write-off.

**Hardship and vulnerability.** Conduct rules in most countries require banks to identify customers in financial difficulty or who are vulnerable (illness, bereavement, mental health) and treat them with forbearance rather than pressure: payment holidays, reduced payments, interest freezes, term extensions, and signposting to free debt advice. The regulator's expectations have moved firmly towards fair treatment over recovery.

**Debt management plans.** For a customer with several debts, a debt advice charity or commercial debt manager negotiates a single affordable monthly payment split among all creditors. The bank accepts reduced payments, often freezes interest, and flags the account as forborne. Statutory variants bind all creditors.

**Write-off and sale.** After a set period of non-payment (often around 180 days for unsecured retail, a bank policy decision), the account is **written off** for accounting purposes. The debt is not forgiven; the bank has simply stopped carrying it as an asset. Recoveries continue in-house or through a sale to a debt purchaser, and cash received after write-off is booked as a recovery. For mortgages and car finance, repossession is a last resort with mandatory forbearance steps before court action.

## The data needed to compute loss given default

Every loss given default model, whether for capital under the internal ratings-based approach or for accounting under expected credit loss rules, is built from the record of what actually happened to defaulted loans. If that record is incomplete, the models are guesswork and the regulator will not approve them.

For each defaulted facility, the bank needs:

| Data item | Why it is needed |
|---|---|
| Default date and default trigger (90 days or which unlikeliness-to-pay indicator) | Start of the clock; allows analysis by trigger |
| Exposure at default: balance, accrued interest, undrawn amount drawn after default | Denominator of the LGD; also feeds exposure at default models |
| Every cash flow after default: payments, collateral sale proceeds, guarantee receipts, with dates | The recoveries, discounted from their actual dates |
| Every cost: legal fees, agent fees, valuation costs, internal workout cost allocation | Recovery is net of costs |
| Collateral details at default: type, valuation, valuation date, LTV, charge rank | Drives secured LGD and lets the model be segmented |
| Workout strategy and process type (consensual, administration, liquidation) | Explains variation and supports strategy choice |
| Outcome and outcome date: cured, written off, sold, restructured (including amounts forgiven) | Defines the end of the workout and the final loss |
| Post-write-off recoveries and sale prices | Recoveries do not stop at write-off |
| Incomplete workouts: current expected recovery | Open cases need a treatment, otherwise recent defaults bias the model |

The arithmetic: for each default, discount all recoveries and costs back to the default date at an appropriate rate, sum them, and divide by the exposure at default. Economic LGD is one minus that ratio. Average across defaults, segment by driver, and you have a model. Regulators require long histories (often five to seven years minimum, including a downturn), add-ons for incomplete workouts, and a **downturn** adjustment.

The practical problem is that this data lives in different places: the loan system, the collateral system, the workout team's spreadsheets, the legal files, the finance ledger and the debt purchaser. Stitching it into a single default-level record is a classic multi-year data project, covered in [[22 Credit Risk Data, Systems and BCBS 239]].

## A worked example from first missed payment to final loss

Let us follow one loan through the whole process. Numbers are illustrative.

**The loan.** A bank lent 5 million to a regional furniture retailer, secured on its warehouse (valued at 3 million at origination) and a floating charge over stock and receivables. Monthly interest, bullet repayment in four years, two covenants: leverage below 3.5 times and interest cover above 2.5 times.

**Month 1 to 18.** All fine. The relationship manager visits twice a year.

**Month 19.** Quarterly accounts show interest cover at 2.2 times. Covenant breach. The early warning system flags it, the loan goes on the watchlist, the relationship manager asks for a plan and gets a waiver approved by the credit officer. The accounting team moves the loan to Stage 2 because of the breach and the deterioration in rating. No cash has been missed.

**Month 23.** The company misses its monthly interest, 25,000. Day 1 past due.

**Month 24.** Second missed interest. The company tells the bank its main supplier has moved to cash-on-delivery. Transfer rule triggers: 60 days past due on a corporate exposure means handover to the workout team. Forbearance assessment: the company is in financial difficulty.

**Month 25.** Workout officer's strategy paper. Options assessed:

- Enforce now: appoint a receiver over the warehouse. Forced-sale value now 2.4 million (the market has softened). Stock and receivables perhaps 0.6 million after preferential creditors. Total about 3 million, less 0.3 million of costs, over 12 to 18 months. NPV about 2.5 million.
- Restructure: interest-only at a reduced rate for 12 months, capitalise the missed interest, extend the term by two years, reset covenants, take a personal guarantee from the owner. If it works (estimated 55%), full recovery over three years, NPV about 4.5 million. If it fails, enforce later, NPV about 2.2 million. Expected NPV about 3.5 million.
- Sell: a distressed debt fund indicates 50 cents, 2.5 million, immediately.

The restructure wins and the credit committee approves it. Because interest has been postponed and capitalised for a borrower in difficulty, this is a **distressed restructuring**, an unlikeliness-to-pay indicator, so the loan becomes **non-performing** and **forborne** and moves to **Stage 3**. The individually assessed provision is the gap between the carrying amount (5.05 million after capitalisation) and the probability-weighted discounted recovery (3.5 million): about 1.5 million.

**Month 26 to 38.** The company pays the reduced interest. Trading stabilises but does not recover. At month 37 the owner finds a buyer for the business at a price that repays 4 million. The bank accepts 4 million in full settlement (a **haircut** of 1.05 million), writes off 1.05 million against the provision, and releases the remaining 0.45 million back to the income statement.

**The LGD record.** Exposure at default (month 24): 5.05 million. Recoveries: about 150,000 of reduced interest plus 4 million at month 38. Costs: 150,000. Discounted back to month 24 at, say, 8% a year, net recovery is roughly 3.75 million. Economic LGD: about 26%. Duration: 14 months. Strategy: consensual restructure then negotiated settlement. That one record is a single data point in the LGD model. The bank needs thousands like it.

## Common mistakes and misunderstandings

- **Treating "non-performing" and "problem loan" as the same thing.** Non-performing is a defined status with rules. A loan can be a serious problem long before it is non-performing, and the point of early warning is to act before the label applies.
- **Thinking forbearance is a kindness with no consequences.** Forbearance is a regulatory flag that changes the loan's classification, provisioning, capital and reporting for years. Granting it without recording it is a reporting failure.
- **Confusing write-off with forgiveness.** Write-off is an accounting act: the bank stops carrying the asset. The borrower still owes the money unless formally released, and recoveries after write-off are common. Default (90 days), write-off (often 180 days or more) and the end of the workout (years) are three different points on the timeline.
- **Believing a secured loan cannot lose money.** Collateral falls in value, costs eat recoveries, legal processes take years, and someone may rank ahead of you.
- **"Extend and pretend".** Restructuring a borrower that is not viable just delays and increases the loss. The NPV comparison is supposed to prevent this, but optimism bias in the recovery forecast is common and validators check for it.
- **Leaving the relationship manager in charge.** The conflict of interest is real, and independence of the workout decision is a governance point regulators check.
- **Treating cure as the end.** A cured loan must sit through probation, and a forborne loan keeps its flag for years. Systems that drop the flags too early misreport.

## What a platform lead needs to know about this

**Data.** The workout world generates the single most valuable dataset for credit risk modelling, the default and recovery history, and it is usually the least well captured. Your priorities: a single default event record per borrower or facility with a definitive default date and trigger; a cash flow ledger capturing every recovery and cost after default with dates; collateral valuations linked to the facility; the strategy, process type and outcome; and forbearance and probation flags with start and end dates. Write-off, debt sale and post-sale recoveries must link back to the original facility, because the LGD model needs the whole chain.

**Systems.** Expect a collections system for retail (workflow, dialler, strategy engine), a case management system for corporate workouts (often part tool, part spreadsheets), a collateral system, the core loan systems holding balances and days past due, the accounting engine holding provisions and write-offs, and a reporting layer. The handover to workout should be a system event with an audit trail, not an email. The forbearance flag needs one home that provisioning, capital and regulatory reporting all read.

**Controls.** Completeness of the default population (every account meeting the 90-day or unlikeliness-to-pay test is flagged); one default definition across capital, accounting and reporting; forbearance identification (every concession to a borrower in difficulty is captured); cure and probation logic (nobody leaves default early); recovery cash flow capture; and conduct controls in collections (vulnerability identification, call recording, agency oversight). Auditors and model validators (see [[21 Model Risk Management and Validation]]) will test all of these.

**Who owns what.** The workout or special situations team owns the strategy and the customer relationship for corporate problem loans. Collections owns retail. Credit risk owns the default definition, the watchlist criteria and the model inputs. Finance owns the provision and the write-off. Legal owns enforcement and insolvency. Regulatory reporting owns the NPL and forbearance returns described in [[23 Reporting - Regulatory Returns, Pillar 3 and Management Information]]. Your platform sits underneath all of them, and the default record is the thing they all need to agree on. The first question to ask: can we reconstruct the full history of a defaulted loan, from first missed payment to final recovery, from system data alone, without the workout officer's spreadsheet?

## Related notes

- [[02 What Credit Risk Is]] for the three ingredients of loss.
- [[03 The Credit Lifecycle]] for where this stage sits.
- [[10 Internal Ratings, Scorecards and PD Models]] for how default history feeds PD models.
- [[11 Collateral and Security]] for what can be enforced.
- [[12 Loan Documentation, Covenants and Conditions]] for events of default and intercreditor ranking.
- [[13 Credit Governance - Committees, Authorities and the Three Lines]] for who approves a workout.
- [[15 Monitoring, Early Warning and Watchlist]] for the stage before handover.
- [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]] for the accounting consequences.
- [[18 Regulatory Capital and Basel - the Short Version]] and [[basel-credit-risk-explained-simply]] for the capital treatment of defaulted exposures.
- [[21 Model Risk Management and Validation]] for LGD model validation.
- [[22 Credit Risk Data, Systems and BCBS 239]] for the data architecture.
- [[26 Sovereign, Bank and Country Risk]] for why insolvency regimes differ.
- [[28 Master Glossary]].
