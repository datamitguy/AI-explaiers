# Provisioning and Expected Credit Loss - IFRS 9 and CECL

**Why this matters to you.** A provision is the bank's own estimate, written into its accounts, of how much of its loan book it will not get back. It is the biggest judgement in a bank's financial statements, it moves the reported profit by hundreds of millions in a bad quarter, it feeds straight into regulatory capital, and it is produced by a large, fragile system that pulls data from every corner of the bank and runs it through statistical models under multiple economic scenarios. If you lead the platform for a credit risk team, the expected credit loss engine will be one of the two or three most important things you run, and the one with the hardest deadlines, because the accounts have to close every quarter.

> **Going deeper.** This note covers impairment from a credit risk team's point of view. For the whole of IFRS 9, including how assets are classified and hedge accounting, see the decision trees in [[ifrs9-decision-tree]] and the long plain-language walk-through in [[ifrs9-explained-simply]].

## Table of contents

1. [The lemonade stand version](#the-lemonade-stand-version)
2. [What a provision is and who cares](#what-a-provision-is-and-who-cares)
3. [The old incurred-loss model and why it failed in 2008](#the-old-incurred-loss-model-and-why-it-failed-in-2008)
4. [IFRS 9 expected credit loss: the three stages](#ifrs-9-expected-credit-loss-the-three-stages)
5. [Significant increase in credit risk](#significant-increase-in-credit-risk)
6. [The formula: PD x LGD x EAD, discounted over time](#the-formula-pd-x-lgd-x-ead-discounted-over-time)
7. [Multiple economic scenarios and probability weighting](#multiple-economic-scenarios-and-probability-weighting)
8. [Post-model adjustments and management overlays](#post-model-adjustments-and-management-overlays)
9. [CECL: the American version](#cecl-the-american-version)
10. [Individually assessed versus collectively assessed](#individually-assessed-versus-collectively-assessed)
11. [Write-offs versus provisions](#write-offs-versus-provisions)
12. [How provisions hit the income statement and capital](#how-provisions-hit-the-income-statement-and-capital)
13. [The link to Basel: expected loss shortfall and net exposure](#the-link-to-basel-expected-loss-shortfall-and-net-exposure)
14. [How an ECL engine works end to end](#how-an-ecl-engine-works-end-to-end)
15. [Governance: the impairment committee](#governance-the-impairment-committee)
16. [What auditors look at](#what-auditors-look-at)
17. [A worked example](#a-worked-example)
18. [Common mistakes and misunderstandings](#common-mistakes-and-misunderstandings)
19. [What a platform lead needs to know about this](#what-a-platform-lead-needs-to-know-about-this)
20. [Related notes](#related-notes)

## The lemonade stand version

You run a lemonade stand and you have lent 100 coins to ten friends, 10 coins each. From experience you know that, in a normal year, one friend in ten never pays you back. So although your notebook says "friends owe me 100 coins", you know in your heart it is really worth about 90.

A sensible stand-owner writes "100 owed, minus 10 I probably will not see, equals 90" in the notebook. That 10 is a **provision**. You have not lost it yet. Nobody has actually failed to pay. But you have set it aside in your accounts so that you do not fool yourself, or your parents, about how rich you are.

Now suppose a rumour goes round that the big kids are going to start charging for playground space next term, and three of your friends will struggle. You have not lost anything yet, but you *expect* to lose more than the usual 10. A good stand-owner increases the provision now, to say 25, because the expectation has changed. That is the whole idea of **expected credit loss**: provision for what you expect to lose, not just what has already gone wrong.

## What a provision is and who cares

A **provision** (also called an **allowance**, an **impairment allowance**, or a **loan loss reserve**) is an amount deducted from the value of the loans on the bank's balance sheet to reflect the credit losses the bank expects. The loans are shown at their **gross carrying amount** (what is contractually owed) minus the provision, giving the **net carrying amount**. Every time the provision goes up, the increase is a cost in the income statement called the **impairment charge** (or **credit loss expense**, or informally "the bad debt charge"). Every time it goes down, there is a release that adds to profit.

Three groups care intensely:

- **Accountants and auditors**, because the provision decides whether the published profit and the published value of the bank's assets are true and fair. The rules come from accounting standard setters: the International Accounting Standards Board, whose standard is **IFRS 9** (International Financial Reporting Standard 9, used in most of the world including Europe, the United Kingdom, Canada, Australia and much of Asia), and the United States Financial Accounting Standards Board, whose standard is **CECL** (current expected credit losses).
- **Regulators**, because the provision is the first line of defence before capital. Expected losses should be covered by provisions; capital is for the unexpected. If provisions are too low, capital is overstated. See [[18 Regulatory Capital and Basel - the Short Version]].
- **Investors and analysts**, because the impairment charge is the most volatile line in a bank's results and the **coverage ratio** (provisions divided by non-performing loans) is a key measure of prudence.

## The old incurred-loss model and why it failed in 2008

Before 2018, the international rule (called IAS 39) and the United States rule both used an **incurred-loss** model. The idea was that a bank could only book a provision when there was objective evidence that a loss event had already happened: a missed payment, a bankruptcy filing, a breach. Expected future losses, however likely, could not be provided for. The motivation was to stop banks from using provisions as a secret profit-smoothing jar, hiding profits in good years by over-provisioning and releasing them in bad years.

It worked too well in the other direction. In 2007 and 2008, banks could see the storm coming, but the rule said they could not provision until borrowers actually missed payments. Provisions stayed tiny while risk soared, profits looked healthy right up until the cliff, and then losses arrived all at once: "too little, too late". Governments that had to rescue banks asked the standard setters to fix it, and the answer was a shift to **expected** losses. IFRS 9 took effect in 2018 and CECL in 2020 for the largest American banks.

| | Incurred loss (IAS 39, old US GAAP) | Expected credit loss (IFRS 9, CECL) |
|---|---|---|
| When to provision | After a loss event has occurred | From day one, based on expectations |
| Forward-looking? | No, backward-looking evidence only | Yes, must use forecasts of the economy |
| Size in good times | Very low | Higher, because expected losses exist even when nothing has gone wrong |
| Behaviour in a downturn | Jumps late and sharply | Rises earlier and more gradually (in theory) |
| Main criticism | Too little, too late | Complex, judgemental, procyclical in a different way |

## IFRS 9 expected credit loss: the three stages

IFRS 9 sorts every loan into one of three **stages** based on how much its credit risk has changed since the bank first made it. The stage decides how far ahead the bank must look when calculating expected loss.

![[17-ifrs9-stages.svg]]
*The three IFRS 9 stages, the transfers between them, and the typical tests that move a loan into Stage 2.*

**Stage 1: performing, no significant deterioration.** The bank provisions for the losses expected from defaults that could happen in the **next 12 months** only. This is called **12-month expected credit loss**. Note the subtlety: it is not the losses that will be paid out in 12 months, it is the full lifetime loss on those loans that are expected to default within the next 12 months. Interest income is calculated on the gross carrying amount. Almost every loan starts here.

**Stage 2: significant increase in credit risk, but not defaulted.** The bank must provision for losses from defaults that could happen at any time over the **remaining life** of the loan. This is **lifetime expected credit loss**. For a 25-year mortgage, that is a long time, so moving from Stage 1 to Stage 2 can multiply the provision by five or ten. Interest income is still on the gross amount.

**Stage 3: credit-impaired.** The loan has defaulted, in the sense explained in [[16 Problem Loans, Restructuring and Recovery]] (90 days past due or unlikely to pay). Lifetime expected credit loss again, but now the probability of default is effectively 100%, so the provision is really about how much will be recovered. Interest income is calculated on the **net** carrying amount (gross less provision), which reflects that the bank will not actually collect interest on the lost part.

There is also a special category, **purchased or originated credit-impaired** (POCI), for loans that were already defaulted when the bank acquired them, for example in a non-performing loan purchase. They are measured at lifetime expected loss forever and never move to Stage 1.

| Stage | Trigger | Loss horizon | Interest on | Typical share of a healthy book (illustrative) |
|---|---|---|---|---|
| 1 | Default: no significant increase in credit risk | 12 months | Gross | 85% to 95% of balances |
| 2 | Significant increase in credit risk since origination | Lifetime | Gross | 5% to 15% |
| 3 | Credit-impaired (defaulted) | Lifetime, PD effectively 100% | Net | 1% to 5%, much higher in a crisis or for troubled banks |

Movement between stages is two-way. A Stage 2 loan whose risk falls back can return to Stage 1, and a Stage 3 loan that cures (see the cure and probation rules in [[16 Problem Loans, Restructuring and Recovery]]) can return to Stage 2 and eventually Stage 1. Many banks apply a **cure period** before allowing a move back, to stop loans flipping each month.

## Significant increase in credit risk

The whole of IFRS 9 turns on one question: has there been a **significant increase in credit risk**, shortened to **SICR**, since the loan was first recognised? The standard deliberately does not give a formula. It says the bank must compare the risk of default *now* with the risk of default *at origination*, using reasonable and supportable information, and it adds one hard backstop. Each bank writes its own rules, and they typically combine:

**A quantitative test on probability of default.** The bank compares the current lifetime probability of default (PD) with the lifetime PD it expected at origination. The usual form is a **relative** test ("current lifetime PD is more than, say, two or three times the origination lifetime PD") combined with an **absolute** floor or cap ("but only if the current PD is above 0.5%", so that a move from 0.01% to 0.03% does not count, and "always if the current PD is above 20%"). The multipliers and thresholds are the bank's own and are calibrated to its portfolios. Because this needs the PD *at origination* for every loan, including loans written decades ago, it was one of the great data problems of IFRS 9 implementation.

**Qualitative indicators.** The loan is on the watchlist (see [[15 Monitoring, Early Warning and Watchlist]]); it has been forborne; the borrower's internal rating has dropped by a set number of notches; it is in a sector flagged as stressed; a covenant has been breached. Any one of these can trigger Stage 2 regardless of the PD test.

**The 30 days past due backstop.** IFRS 9 says there is a rebuttable presumption that credit risk has increased significantly when a payment is more than 30 days overdue. In practice almost every bank treats 30 days past due as an automatic Stage 2 trigger. Rebutting it is possible but has to be justified.

A related simplification, the **low credit risk exemption**, lets a bank keep investment-grade exposures (for example, highly rated bonds) in Stage 1 without running the SICR test. Many banks use it for their liquidity portfolios but not for loans.

**Cure from Stage 2.** When the trigger goes away (the PD falls back, the arrears are cleared, the watchlist flag is removed), the loan can return to Stage 1. Most banks require the condition to have been absent for a minimum period, often three to twelve months depending on the trigger, to avoid churn.

The SICR rules are where bank practice varies most and where supervisors and auditors push hardest, because loosening them is the easiest way to keep provisions low. The logic lives in a rules engine in front of the loss calculation, and it needs to be versioned, tested and auditable like any model.

## The formula: PD x LGD x EAD, discounted over time

Expected credit loss is built from the three ingredients introduced in [[02 What Credit Risk Is]]: **probability of default** (PD), **loss given default** (LGD) and **exposure at default** (EAD). The IFRS 9 version has three twists compared with the regulatory version described in [[basel-credit-risk-explained-simply]].

**Twist 1: it is a term structure, not a single number.** For lifetime loss, the bank needs the PD for each future period of the loan's life: the chance of defaulting in year 1, the chance of defaulting in year 2 given survival through year 1, and so on. This is the **PD term structure**, and it is usually built from historical migration between rating grades (see [[10 Internal Ratings, Scorecards and PD Models]]). Similarly, EAD is projected forward along the repayment schedule (a mortgage balance shrinks each year; a credit card balance may grow), and LGD may vary over time as collateral values move.

**Twist 2: it is point-in-time, not through-the-cycle.** Regulatory PDs are deliberately smoothed over the economic cycle so that capital does not swing. IFRS 9 PDs must reflect current conditions and the forecast for the future, so they move with the economy. The same loan has two different PDs for two different purposes, which confuses everyone.

**Twist 3: it is discounted.** Losses in the future are brought back to today's value using the loan's **effective interest rate**, shortened to **EIR**, which is the rate that exactly discounts the contractual cash flows to the loan's carrying amount. For a fixed-rate loan this is close to the contractual rate.

Putting it together, for a loan with remaining life T years:

> Lifetime ECL = sum over t = 1 to T of [ PD(t) x LGD(t) x EAD(t) x DF(t) ]

where PD(t) is the **marginal** probability of defaulting in period t (having survived to then), and DF(t) is the discount factor for period t at the EIR. 12-month ECL is the same sum truncated at t = 1.

A small worked example. A 3-year loan of 1,000, repaid 1,000 at the end (a bullet), EIR 6%, LGD 40% throughout, marginal PDs of 2%, 3% and 4% in years 1, 2 and 3.

| Year | Marginal PD | LGD | EAD | Loss before discount | Discount factor at 6% | Discounted loss |
|---|---|---|---|---|---|---|
| 1 | 2.0% | 40% | 1,000 | 8.0 | 0.943 | 7.5 |
| 2 | 3.0% | 40% | 1,000 | 12.0 | 0.890 | 10.7 |
| 3 | 4.0% | 40% | 1,000 | 16.0 | 0.840 | 13.4 |
| **Total** | | | | **36.0** | | **31.6** |

12-month ECL is 7.5. Lifetime ECL is 31.6, more than four times as much. That ratio is why the Stage 1 to Stage 2 transfer matters so much. (Strictly, the marginal PDs should be scaled by the probability of surviving the earlier years; with PDs this small the difference is less than a tenth of a unit and is ignored here.)

## Multiple economic scenarios and probability weighting

The standard requires expected loss to be an **unbiased, probability-weighted** amount that reflects a range of possible outcomes. Because the relationship between the economy and losses is not a straight line (a mild recession costs a little, a deep one costs a lot more than twice as much), the loss under the "most likely" forecast is not the same as the expected loss across all forecasts. So banks run their models under several **macroeconomic scenarios** and weight the results.

A typical set-up is three to five scenarios: a **base case** (the bank's central forecast), an **upside**, a **downside**, and often a **severe downside**. Each has a full path for the variables that drive the models: GDP growth, unemployment, house prices, commercial property prices, interest rates, perhaps oil prices or exchange rates, projected over several years. Each is given a probability weight, chosen by the bank's economists and approved by a committee. The weights are a judgement; they might be 50% base, 20% upside, 20% downside, 10% severe.

The macro variables get into the loss calculation through **satellite models** (also described in [[20 Stress Testing and ICAAP]]), which are statistical relationships between macro variables and PD, LGD or EAD, fitted on history. If unemployment rises 2 points, retail PDs rise by some percentage; if house prices fall 10%, mortgage LGDs rise by some amount. The ECL engine runs the whole book through each scenario, computes the loss, and then averages the losses using the weights.

Illustrative: a portfolio with model ECL of 100 under base, 80 under upside, 150 under downside, 300 under severe, and weights 50/20/20/10 gives weighted ECL of 50 + 16 + 30 + 30 = 126. Note that this is well above the base case of 100, because the bad scenarios hurt more than the good one helps. That gap is the **non-linearity** effect, and it is one reason the scenario set and weights get so much scrutiny.

Staging also uses the scenarios. The SICR test is run on the probability-weighted PD, or sometimes scenario by scenario, which is another design choice banks make differently.

## Post-model adjustments and management overlays

No model captures everything. When management believes the model output is wrong for a reason the model cannot see, it adds a **post-model adjustment**, shortened to **PMA** (also called a **management overlay**, **management adjustment** or **in-model adjustment** depending on where it is applied). Examples:

- A new event the models were not built for: a pandemic, a sudden energy price shock, a flood in a region where the bank has many mortgages.
- A known model weakness awaiting a fix: the PD model is under-predicting for a segment, and the next version is six months away.
- A data problem: origination PDs are missing for an old portfolio, so staging is unreliable there.
- Government support schemes that temporarily hide the true level of distress.

During the pandemic, overlays became a large share of total provisions at many banks, sometimes a quarter or more, which worried regulators and auditors because they are judgement rather than calculation. Good practice now is that every overlay has a documented rationale, a quantification method, an owner, an expected lifetime, a plan to retire it, and impairment committee sign-off. Regulators dislike overlays that persist for years, and dislike even more any overlay that *reduces* provisions below model output without strong evidence.

## CECL: the American version

The United States took the same idea and simplified it, with one big difference: **there are no stages**. Under CECL, every loan carries a **lifetime** expected credit loss provision from the day it is originated. There is no 12-month bucket and no SICR test.

The consequences:

- **Day-one loss.** A new loan carries a lifetime provision immediately, even though it was priced to earn a margin that covers that loss. Critics call this double-counting; defenders say it is simple and prudent.
- **Higher provisions in good times** and a smaller jump in bad times, because loans do not transfer stage.
- **Simpler systems.** No origination PD, no SICR rules engine, no stage transfer logic. The hard parts (term structures, scenarios, discounting) remain.
- **More flexibility in method**, from full PD/LGD/EAD models to simpler loss-rate, vintage or **weighted average remaining maturity** (WARM) methods for smaller banks.
- **Reasonable and supportable forecast period.** Banks forecast the economy for a period they can justify (often one to three years), then **revert** to long-run average loss rates. IFRS 9 banks do something similar in practice.

| Feature | IFRS 9 | CECL |
|---|---|---|
| Stages | Three | None |
| Loss horizon for performing loans | 12 months (Stage 1), lifetime after SICR (Stage 2) | Lifetime for everything |
| SICR test | Central to the model | Not needed |
| Day-one provision | 12-month ECL | Lifetime ECL |
| Discounting | Required at EIR | Depends on method |
| Interest on impaired loans | On net carrying amount | On gross, with separate treatment of non-accrual |
| Scenarios | Multiple, probability-weighted | Reasonable and supportable forecasts, then reversion |
| Who uses it | Most of the world outside the US | US banks and companies |

Large international banks with both an IFRS 9 group and a US subsidiary run both, which means two engines, two sets of models and two reconciliations. A platform lead in that position should expect the two to share data and PD term structures where possible, and to differ in the staging and horizon logic.

## Individually assessed versus collectively assessed

Not every loan goes through the models.

**Collectively assessed** loans are grouped into portfolios with shared risk characteristics (product, rating grade, country, loan-to-value band, vintage) and run through the statistical PD/LGD/EAD models described above. All retail lending and most smaller corporate lending works this way. Millions of loans, one engine.

**Individually assessed** loans are the large Stage 3 exposures, typically corporate and specialised lending above a threshold set by the bank. For these, a workout officer forecasts what the bank will actually recover under two or three scenarios (the restructure works, the bank enforces, the borrower is sold), weights them, discounts at the EIR, and sets the provision as the gap between the carrying amount and the weighted recovery. This judgement overrides the model for that loan; the worked example in [[16 Problem Loans, Restructuring and Recovery]] shows one. The threshold is a policy decision: too low and the workout team drowns in cases, too high and large losses are left to a model that does not know the specifics.

## Write-offs versus provisions

A **provision** is an estimate of a loss that has not yet been confirmed. A **write-off** is the removal of a loan (or part of it) from the balance sheet because the bank has no reasonable expectation of recovering it. The write-off is charged against the provision, not against profit (because the provision was already a cost when it was raised); if the write-off is larger than the provision held, the extra hits profit.

Timing differs by product and country: unsecured retail often at around 180 days past due, mortgages after the property is sold, corporates when the insolvency concludes. Write-off does not extinguish the debt; recoveries after write-off are booked as income when they arrive, as explained in [[16 Problem Loans, Restructuring and Recovery]]. For data, the provision **stock** (balance sheet) and **flow** (income statement charge) only reconcile if write-offs, recoveries, foreign exchange and discount unwind are tracked separately. The **provision movement table** (opening balance, new provisions, releases, write-offs, recoveries, other, closing balance) is a core control and a disclosure requirement.

## How provisions hit the income statement and capital

Follow the money. In a quarter, the bank's expected credit loss goes from 1,000 to 1,150. It also writes off 60 of loans against the provision and recovers 10 on loans written off earlier.

- **Balance sheet.** Gross loans fall by 60 (the write-off). The provision balance goes from 1,000 to 1,150 after the write-off, so new provisions raised in the period must have been 1,150 minus 1,000 plus 60 = 210.
- **Income statement.** Impairment charge = new provisions 210, less recoveries 10, = 200. Profit before tax falls by 200.
- **Capital.** Lower profit means lower retained earnings, which means lower Common Equity Tier 1 (CET1) capital, as described in [[18 Regulatory Capital and Basel - the Short Version]]. After tax at, say, 25%, CET1 is 150 lower than it would otherwise have been.

So every unit of provision costs the bank roughly one unit of pre-tax profit and three quarters of a unit of CET1. This is why provisioning is the subject of such intense debate inside a bank, and why the impairment committee exists.

Because IFRS 9 moves provisions earlier and larger in a downturn, it can make capital fall fastest exactly when the economy is weakest. Regulators worried about this **procyclicality** and allowed **transitional arrangements** that let banks add back a declining share of the increase in provisions to CET1 for a few years after adoption; most have now expired.

## The link to Basel: expected loss shortfall and net exposure

Accounting provisions and regulatory capital are calculated by different rules but meet in two places.

![[17-provisions-to-capital.svg]]
*How the accounting provision flows into profit and capital, and how it interacts with the two Basel approaches.*

**Under the internal ratings-based (IRB) approach: the expected loss comparison.** Basel calculates its own **regulatory expected loss** as PD x LGD x EAD using the regulatory (through-the-cycle, downturn LGD) parameters. It then compares this to the bank's total eligible accounting provisions on the IRB portfolios. If provisions are **less** than regulatory expected loss, the **shortfall** is deducted from CET1, so the bank cannot escape the cost by under-provisioning. If provisions are **more**, the **excess** can be added to Tier 2 capital, capped at 0.6% of IRB risk-weighted assets. This is done separately for defaulted and non-defaulted exposures in many regimes.

**Under the standardised approach (SA): provisions reduce the exposure.** Specific provisions (broadly, Stage 3 provisions on the loan in question) are deducted from the exposure before the risk weight is applied, so a 100 loan with a 40 provision is risk-weighted on 60. The risk weight for a defaulted exposure is 150%, falling to 100% if provisions cover at least 20% of it. General provisions (broadly, Stage 1 and 2) may be included in Tier 2 capital up to 1.25% of SA risk-weighted assets. How Stage 1 and 2 provisions are split between "specific" and "general" for this purpose is a question each regulator has answered slightly differently, and it is a known source of inconsistency.

**Different PDs.** The regulatory PD is through-the-cycle and the regulatory LGD is a downturn estimate; the accounting versions are point-in-time and scenario-weighted. The two expected loss numbers legitimately differ, and part of the platform's job is to hold both and explain the bridge.

## How an ECL engine works end to end

This is the system view, and it is the heart of what a platform lead owns.

![[17-ecl-engine.svg]]
*An expected credit loss engine as a system: inputs, staging and calculation, adjustments and controls, sign-off, and outputs.*

**1. Inputs.** Each month or quarter, the engine takes a snapshot of every exposure: balance, undrawn limit, contractual schedule, interest rate, days past due, collateral and its valuation, product, segment, origination date. It needs the current and origination PD for every exposure from the rating systems in [[10 Internal Ratings, Scorecards and PD Models]], the macroeconomic scenarios with weights, and the model parameters: PD term structures, LGD, EAD and credit conversion factor models, satellite models, and the EIR per loan. Data quality is checked at the door: completeness against the general ledger, valid codes, no missing origination dates.

**2. Staging.** The rules engine applies the SICR tests, the 30 days past due backstop, the default definition, the cure rules and the forbearance flags, and assigns each exposure a stage. Comparison with last period produces a **stage migration** report, one of the first things anyone looks at.

**3. Calculation.** For each exposure and each scenario, the engine projects the balance, applies the scenario-conditioned PD term structure, LGD and EAD, discounts at the EIR, and sums over 12 months or lifetime according to stage. Individually assessed Stage 3 cases are loaded from the workout process and override the model. For tens of millions of accounts and four scenarios this is a large batch job, and run time matters because the quarter end timetable is unforgiving.

**4. Scenario weighting.** The per-scenario results are combined using the approved probabilities into a single ECL per exposure.

**5. Adjustments.** Post-model adjustments are applied, each tagged with its rationale, owner and approval. Where possible they are applied at account level so they flow into stage and segment reports; where not, they are held at portfolio level.

**6. Controls and reconciliation.** The total is reconciled to the general ledger. The movement from last period is broken down by driver: new lending, repayments, stage transfers, changes in PD, changes in LGD, changes in scenarios and weights, overlays, write-offs, foreign exchange. Large movements at account level are investigated. The split of the book by stage, the coverage ratio per stage, and the sensitivity to each scenario are produced for the committee.

**7. Sign-off and outputs.** The impairment committee reviews and approves. The approved numbers post to the general ledger (provision balance and charge), flow to regulatory capital (expected loss comparison, SA net exposure), to regulatory returns and Pillar 3 disclosures in [[23 Reporting - Regulatory Returns, Pillar 3 and Management Information]], and to management information.

Throughout, every run must be **reproducible**: the same inputs, the same model versions and the same scenarios must give the same answer months later when the auditor asks. That means versioned data snapshots, versioned models and parameters, and an audit log of every manual intervention.

## Governance: the impairment committee

Because the provision is a judgement with a large effect on profit, banks give it a dedicated forum, usually called the **impairment committee** or **provisioning committee**. It typically meets monthly and always at quarter end, chaired by the chief financial officer or chief risk officer, with members from finance, credit risk, the modelling team, economics, and the business lines, and with internal audit and the external auditor attending as observers.

It approves the scenarios and weights, changes to SICR criteria or model parameters, the post-model adjustments, large individually assessed provisions, and the final number. It reviews the movement analysis, stage migration, coverage ratios, sensitivities and the back-testing of last period's expectations against what happened. Its minutes are read by auditors and supervisors. Wider governance is in [[13 Credit Governance - Committees, Authorities and the Three Lines]] and [[21 Model Risk Management and Validation]].

## What auditors look at

The external auditor treats the provision as a **key audit matter** every year, and their work tends to concentrate on:

| Area | What they test |
|---|---|
| Completeness and accuracy of data | Reconciliations of exposure data to the ledger; sample tests of key fields (balance, days past due, collateral value) back to source |
| SICR criteria | Whether the thresholds are reasonable, consistently applied, and whether a different reasonable choice would change the number materially |
| Model methodology | Independent model validation (see [[21 Model Risk Management and Validation]]), re-performance on samples, benchmarking against peers |
| Macroeconomic scenarios and weights | Comparison with external forecasts; whether the severe scenario is severe enough; whether the weights are justified |
| Post-model adjustments | Rationale, quantification, approval, and whether they are a substitute for fixing known model issues |
| Individually assessed cases | Re-performing the cash-flow forecasts on a sample of large Stage 3 cases, challenging the collateral values and scenario weights |
| IT general controls | Access, change management and job scheduling for the ECL engine and its feeds |
| Disclosures | The stage tables, movement tables, sensitivity disclosures and the narrative about judgements |

They also look at tone: whether the committee genuinely challenges, and whether management's adjustments consistently go in one direction.

## A worked example

A bank has a portfolio of 10,000 personal loans, average balance 10,000, total 100 million, all originated two years ago with three years remaining. At origination, the lifetime PD for a typical borrower was 6%. Illustrative numbers throughout.

**Staging.** Current lifetime PDs are recomputed. 8,800 loans have a current lifetime PD below 2.5 times their origination PD, no arrears and no other flags: Stage 1. 1,000 loans have either more than 30 days of arrears or a current lifetime PD above the threshold: Stage 2. 200 loans are more than 90 days past due: Stage 3.

**Stage 1.** 88 million of balances. 12-month PD 2%, LGD 70% (unsecured), EAD equal to balance, discounting ignored for simplicity. ECL = 88 million x 2% x 70% = 1.23 million.

**Stage 2.** 10 million of balances. Remaining lifetime PD (three years) 18%, LGD 70%. ECL = 10 million x 18% x 70% = 1.26 million. Notice that 10% of the balances generate as much provision as the other 88%.

**Stage 3.** 2 million of balances. PD 100%, expected recovery 25% so LGD 75%. ECL = 2 million x 75% = 1.5 million.

**Model total before scenarios.** 3.99 million, about 4% coverage of the book. Run under four scenarios the weighted figure comes to, say, 4.4 million because the downside scenarios lift PDs.

**Overlay.** Management believes the PD model is understating risk for borrowers in one region hit by a factory closure that happened after the data snapshot. It adds a post-model adjustment of 0.3 million, documented and approved. Final provision: 4.7 million.

**Income statement.** Last quarter's provision was 4.2 million, and 0.4 million of Stage 3 loans were written off against it during the quarter. New provisions raised: 4.7 minus 4.2 plus 0.4 = 0.9 million. Recoveries on previously written-off loans: 0.05 million. Impairment charge for the quarter: 0.85 million.

**Capital.** If the portfolio is on the IRB approach, regulatory expected loss is computed with through-the-cycle PD and downturn LGD, say 5.0 million. Provisions of 4.7 million are 0.3 million short, so 0.3 million is deducted from CET1. If the portfolio is on the standardised approach instead, the 1.5 million of Stage 3 provision reduces the defaulted exposure from 2 million to 0.5 million before the 150% risk weight is applied.

## Common mistakes and misunderstandings

- **"A provision is money set aside in a bank account."** It is not. It is an accounting entry that reduces the stated value of the loans. No cash moves.
- **Confusing provisions with write-offs.** The provision is the estimate; the write-off is the confirmation. Write-offs are charged against provisions, not straight to profit, unless under-provisioned.
- **Thinking 12-month ECL means losses paid within 12 months.** It means lifetime loss on defaults expected within 12 months.
- **Treating the regulatory PD and the accounting PD as the same number.** One is through-the-cycle, the other point-in-time and forward-looking. Both are "the PD" and both are correct for their purpose.
- **Treating Stage 2 as "bad loans".** Stage 2 loans are performing. They have deteriorated relative to origination. A loan originated as high risk and still high risk may be Stage 1; a loan originated as very safe that has become moderately risky may be Stage 2.
- **Treating Stage 3 and non-performing as different populations.** In most banks they are aligned by design, and regulators expect them to be. Where they differ, it needs a documented reason.
- **Assuming the base-case scenario gives the expected loss.** Because of non-linearity, the probability-weighted ECL is usually higher than the base case.
- **Letting overlays become permanent.** If an overlay is still there in three years, the model should have been fixed.
- **Missing the capital link.** Under IRB, under-provisioning does not save capital; the shortfall is deducted from CET1 anyway.
- **Running the engine as a black box.** If the movement from last quarter cannot be explained by driver, the committee cannot do its job and the auditor will not sign.

## What a platform lead needs to know about this

**Data.** The engine needs a complete, reconciled exposure snapshot at the reporting date, with fields many source systems were never designed to hold: origination date and origination PD, contractual schedule, EIR, undrawn limits, collateral values with dates, consistent days past due, forbearance and watchlist flags, and the segment keys the models use. Historical snapshots must be kept for back-testing and audit re-performance. Scenario data needs its own governed, versioned store. Most of the pain is in the joins: exposure to rating, exposure to collateral, facility to borrower to group. [[22 Credit Risk Data, Systems and BCBS 239]] covers the architecture.

**Systems.** Expect a chain: source systems, a data warehouse or risk data mart, a staging rules engine, a calculation engine (vendor product or in-house), an overlay and adjustment tool (too often a spreadsheet), a reconciliation and reporting layer, and interfaces to the general ledger and the regulatory capital engine. The calculation engine must handle multiple scenarios, lifetime projection, discounting, and both collective and individual assessment, and it must finish inside the quarter-end timetable with room for re-runs when the committee asks "what if we change the weights". Model versions and parameters must be deployed under change control, with the validation sign-off from [[21 Model Risk Management and Validation]] attached.

**Controls.** The critical ones: input reconciliation to the ledger (completeness); data quality gates with thresholds and sign-off for exceptions; staging logic tested against expected cases each run; model version control; a documented and approved overlay register; the provision movement analysis by driver; output reconciliation to the ledger posting; access control and segregation of duties (the person who runs the engine cannot also change the parameters); and an end-to-end audit trail that lets an auditor re-run a historical quarter. IT general controls over the engine will be tested every year.

**Who owns what.** Finance owns the provision number and the accounting policy. Credit risk owns the models, the staging criteria and the default definition. The modelling team builds; validation checks. Economics owns the scenarios and proposes the weights. The workout team owns individually assessed cases. The impairment committee approves. Internal audit and the external auditor test. Regulatory reporting consumes the output for capital and returns. The platform team owns the pipes, the engine, the schedule, the controls and the evidence, and is usually the only group that sees the whole chain end to end.

**Quarter end.** The ECL run sits on the critical path of the bank's results. Know the timetable (data cut-off, quality sign-off, staging, calculation, committee pack, adjustments, final run, posting) and how long a full or partial re-run takes. The question the chief financial officer will ask is "if the committee changes the scenario weights on Thursday, can we have the new number by Friday morning?"

## Related notes

- [[ifrs9-decision-tree]] and [[ifrs9-explained-simply]] for the full IFRS 9 standard, box by box.
- [[02 What Credit Risk Is]] for PD, LGD and EAD.
- [[10 Internal Ratings, Scorecards and PD Models]] for where the PDs and term structures come from.
- [[11 Collateral and Security]] for the collateral values that drive LGD.
- [[13 Credit Governance - Committees, Authorities and the Three Lines]] for committee structures.
- [[15 Monitoring, Early Warning and Watchlist]] for the qualitative SICR triggers.
- [[16 Problem Loans, Restructuring and Recovery]] for default, cure, write-off and individually assessed cases.
- [[18 Regulatory Capital and Basel - the Short Version]] and [[basel-credit-risk-explained-simply]] for the expected loss shortfall and SA net exposure.
- [[20 Stress Testing and ICAAP]] for scenarios and satellite models.
- [[21 Model Risk Management and Validation]] for validation of ECL models.
- [[22 Credit Risk Data, Systems and BCBS 239]] for the data architecture.
- [[23 Reporting - Regulatory Returns, Pillar 3 and Management Information]] for the disclosures.
- [[28 Master Glossary]].
