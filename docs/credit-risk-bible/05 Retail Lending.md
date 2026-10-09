# Retail Lending

**Why this matters to you.** Retail lending (lending to individual people rather than companies) is where a bank makes millions of small decisions instead of a few hundred large ones. Nobody reads your mortgage application the way a corporate analyst reads a company's accounts. A computer reads it, in seconds, using scores, rules and credit bureau data, and the risk team manages the result as a statistical pool rather than as named individuals. That makes retail credit risk a data and systems business more than any other part of the bank. Volumes are enormous, models are many, decisions are automated, and regulators care as much about whether customers were treated fairly as about whether the bank lost money. For a platform lead, retail is where your pipelines carry the most rows, where a broken data feed can approve thousands of bad loans before lunch, and where your audit trail must prove, years later, exactly why a particular person was turned down.

## Table of contents

1. [Pocket money, a thousand times over](#pocket-money-a-thousand-times-over)
2. [The retail product map](#the-retail-product-map)
3. [Mortgages](#mortgages)
4. [Credit cards](#credit-cards)
5. [Personal loans, car finance, overdrafts, student loans and buy now pay later](#personal-loans-car-finance-overdrafts-student-loans-and-buy-now-pay-later)
6. [Credit bureaus and the credit file](#credit-bureaus-and-the-credit-file)
7. [Scorecards: application, behavioural and collections](#scorecards-application-behavioural-and-collections)
8. [Decision engines, cut-offs, policy rules and champion-challenger](#decision-engines-cut-offs-policy-rules-and-champion-challenger)
9. [Worked example: a mortgage affordability calculation](#worked-example-a-mortgage-affordability-calculation)
10. [Managing pools, not names](#managing-pools-not-names)
11. [Delinquency buckets, roll rates and cure rates](#delinquency-buckets-roll-rates-and-cure-rates)
12. [Vintage analysis](#vintage-analysis)
13. [Collections and recoveries](#collections-and-recoveries)
14. [Fraud loss versus credit loss](#fraud-loss-versus-credit-loss)
15. [Responsible lending and conduct](#responsible-lending-and-conduct)
16. [Retail under Basel](#retail-under-basel)
17. [How retail differs from corporate](#how-retail-differs-from-corporate)
18. [Common mistakes and misunderstandings](#common-mistakes-and-misunderstandings)
19. [What a platform lead needs to know about this](#what-a-platform-lead-needs-to-know-about-this)
20. [Related notes](#related-notes)

## Pocket money, a thousand times over

Lend your little brother 5 pounds until Saturday and you know exactly what you are dealing with: you know when his pocket money arrives, you know he once forgot to repay a friend, and you see him every day. That is corporate lending: one borrower, studied closely ([[04 Commercial and Corporate Lending]]).

Now imagine you run the school tuck shop and a thousand pupils each want to borrow 5 pounds. You cannot interview them all, so you notice patterns. Pupils who repaid before usually repay again. Pupils who already owe three other people often do not. You write a few rules, give each pupil a points score, lend to everyone above a line, and watch the whole group. You expect about 30 of the 1,000 not to pay, and you charged everyone a little extra to cover them. What you watch is whether 30 is creeping up to 60.

That is retail lending: **rules, scores, pools and patterns**, applied to millions of people at once.

## The retail product map

Retail products split two ways: **secured or unsecured** (is there an asset the bank can take?) and **instalment or revolving** (does the loan pay down on a schedule, or can the customer borrow, repay and borrow again?).

| Product | Secured? | Shape | Typical size (illustrative) | Typical term | Typical loss rate |
|---|---|---|---|---|---|
| Residential mortgage | Yes, on the home | Instalment | 100,000 to 1,000,000 | 20 to 35 years | Very low |
| Buy-to-let mortgage | Yes, on a rented property | Instalment, often interest-only | 100,000 to 500,000 | 15 to 25 years | Low |
| Credit card | No | Revolving | 500 to 15,000 limit | Open-ended | High |
| Personal loan | No | Instalment | 1,000 to 35,000 | 1 to 7 years | Medium |
| Car finance | Yes, on the car | Instalment, sometimes with a balloon | 5,000 to 50,000 | 2 to 5 years | Low to medium |
| Overdraft | No | Revolving | 100 to 5,000 | On demand | High |
| Student loan | No (often government-backed) | Income-contingent | 10,000 to 100,000 | Decades | Varies widely |
| Buy now pay later | No | Short instalment | 20 to 2,000 | Weeks to months | Medium to high |

The rule to remember: **secured products have low loss given default (LGD) because there is something to sell; unsecured products have high LGD because there usually is not.** [[02 What Credit Risk Is]] explains probability of default (PD), LGD and exposure at default (EAD), and [[11 Collateral and Security]] covers homes and cars as collateral.

## Mortgages

A mortgage is a loan to buy a home, secured by a legal charge on it. If the borrower stops paying, the bank can, after a long legal process, take possession and sell. Mortgages are the largest single asset on most retail banks' balance sheets.

### Loan-to-value and loan-to-income

**Loan-to-value (LTV)** is the loan divided by the property value. A 270,000 loan on a 360,000 house is 75% LTV. The 25% deposit is the cushion: prices can fall a quarter before the bank is underwater. It is like buying a bike with some of your own savings: you care more about not losing it.

**Loan-to-income (LTI)** is the loan divided by gross annual income: 270,000 against 75,000 is 3.6 times. Some regulators limit the share of new lending at high multiples (for example above about 4.5 times), but rules vary by country.

| Measure | What it protects against | Typical bands (illustrative) |
|---|---|---|
| LTV | Loss when a defaulted home is sold (drives LGD) | 60% or less is low risk; 90% to 95% is high risk and priced higher |
| LTI | Borrowing too much for earning power (drives PD) | Under 4 times common; above 4.5 times often restricted |
| Debt-to-income (DTI) (common in the United States) | All monthly debt payments as a share of monthly income | Ceilings often around 35% to 45%, varying by lender and programme |

### Affordability and stress-rate tests

The real question is whether the household can pay the monthly bill, now and if rates rise. An **affordability assessment** takes net income, subtracts committed spending and estimated living costs, and checks what is left covers the payment. A **stress-rate test** recalculates the payment at a higher rate than the one offered. Some regulators set the stress margin; others leave it to banks. The worked example later walks through one.

### Fixed, variable and tracker

| Rate type | How it works | Who carries the interest rate risk |
|---|---|---|
| **Fixed** | Rate locked for a period (2, 5, 10 years, or the full term in countries such as the United States) | The bank (which hedges it); the borrower is protected until the fix ends |
| **Variable** (standard variable rate) | The bank sets the rate and can change it | The borrower |
| **Tracker** | A set margin above the central bank rate, moving automatically | The borrower |

The credit risk point is **payment shock**: when a cheap fix ends and rates are higher, the payment can jump by hundreds a month. Banks track the "maturity wall" of upcoming fixed-rate expiries for exactly this reason.

### Interest-only versus repayment

On a **repayment** mortgage each payment covers interest plus a slice of the loan, so the balance reaches zero at the end. On an **interest-only** mortgage the borrower pays only interest and must repay the whole loan at the end from savings, investments or selling the house. At 4.5% on 270,000 that is about 1,013 a month against 1,501 for repayment: cheaper, but the exposure never falls, like a corporate bullet loan.

### Buy-to-let

A **buy-to-let** mortgage funds a landlord's rental property. It is assessed mainly on the **rental cover ratio**: expected rent divided by interest at a stressed rate, which must exceed a threshold (often around 125% to 145%, varying by lender and tax position). It is often interest-only, and landlords with many properties may be assessed more like small businesses. Under Basel, property loans repaid from the rent on that property attract higher risk weights than owner-occupied loans (see [[06 Specialised Finance - Project, Object, Commodities, Real Estate]] for the commercial version).

### Remortgaging

**Remortgaging** means moving to a new deal, with the same bank (a **product transfer**) or a different one, usually when a fix ends. Product transfers to existing customers may skip a full affordability check (some regulators allow this so that borrowers are not trapped). The risk twist is adverse selection: good borrowers can shop around and leave, while those whose circumstances have worsened cannot, so they stay, sometimes called **mortgage prisoners**.

## Credit cards

A credit card is a revolving, unsecured line. The customer spends up to a **credit limit**, gets a monthly statement and must pay at least a minimum.

### Transactors and revolvers

| Customer type | Behaviour | What the bank earns | Risk |
|---|---|---|---|
| **Transactor** | Pays the full balance every month | Interchange (a small fee from the shop's bank on each purchase), perhaps an annual fee | Low; the balance is temporary |
| **Revolver** | Carries a balance and pays interest | Interest, often at high rates, plus fees | Higher; this is where both profit and losses live |

Revolvers make the money and the losses; card profitability is about the mix.

### Limits and limit increases

The starting limit comes from the application decision. After that the bank reviews limits regularly using the **behavioural score**. Good customers are offered increases (many countries now require opt-in or an easy opt-out); risky ones may see cuts. Every increase raises **exposure at default**, because customers heading for default tend to draw their available limit first. That is why the credit conversion factor (CCF), the share of undrawn limit expected to be drawn by default, matters so much for cards.

### Minimum payments and interest-free periods

The **minimum payment** is a small share of the balance (say 1% plus interest, or 2% to 3%, with a floor). Paying only the minimum can keep someone in debt for decades, and several regulators require banks to intervene for customers in **persistent debt** (paying more in interest and fees than principal over a long period). Minimum-only payment is also a classic early warning sign.

**Promotional** offers such as 0% on purchases or **balance transfers** for 12 to 30 months attract customers. The risk is a cliff when the promotion ends, and balance transfer customers are by definition already carrying debt elsewhere.

## Personal loans, car finance, overdrafts, student loans and buy now pay later

**Personal loans.** Fixed amount, fixed term, fixed monthly payment, unsecured. Often used for **debt consolidation** (paying off several cards). The hidden risk: if the customer clears the cards and then fills them up again, they owe twice as much.

**Car finance.** Mostly sold through dealers, so the lender never meets the customer, and dealer commission arrangements have been a major conduct issue in some countries.

| Product | How it works | Who owns the car | Key risk |
|---|---|---|---|
| **Hire purchase (HP)** | Deposit, then equal monthly payments; customer owns the car after the last one | The lender until the end | Customer stops paying; car worth less than the debt |
| **Personal contract purchase (PCP)** | Lower monthly payments, then a large final **balloon** (the guaranteed minimum future value). Pay it and keep the car, or hand the car back | The lender until the balloon is paid | **Residual value risk**: if used car prices fall, many customers hand back cars worth less than the balloon |
| **Auto loan** (common in the United States) | A plain secured instalment loan with a lien on the car | The borrower | Long terms (six or seven years) mean the car loses value faster than the loan falls |

**Overdrafts.** Permission to take a current account below zero, up to an arranged limit. On demand in law, but for many customers semi-permanent borrowing in practice.

**Student loans.** In many countries provided or guaranteed by government, with repayments linked to future income and balances written off after a long period. There is no affordability test at the start; losses depend on graduates' earnings.

**Buy now pay later (BNPL).** Splitting a purchase into a few interest-free instalments at the checkout, with the merchant paying the provider a fee. Decisions are instant and amounts small, and historically many providers did not report to credit bureaus. Regulation is being introduced or tightened in many countries. For a bank the risk is **hidden indebtedness**: a customer may owe five BNPL providers that your bureau search cannot see.

## Credit bureaus and the credit file

A **credit bureau** (credit reference agency) collects data from lenders about how people manage credit and sells it back to lenders. Experian, Equifax and TransUnion operate internationally; many countries have local bureaus, and some have a public credit register run by the central bank. Think of it as a shared notebook in which every tuck shop writes down who paid back and who did not.

| What a credit file typically contains | Example | Why lenders care |
|---|---|---|
| Identity and address history | Name, date of birth, addresses | Matching the right person; fraud detection |
| Accounts (tradelines) | Every card, loan, mortgage, overdraft, phone contract, with limit and balance | Total debt and how much available credit is used |
| Payment history | A month-by-month status per account (on time, 1 month late, 2 months late) | The single most predictive data |
| Defaults and judgements | Defaulted accounts, court judgements, bankruptcies | Severe events; often policy knock-outs |
| Searches | Which lenders have checked the file, and when | Many recent applications suggest credit hunger or fraud |
| Linked people | Joint account holders | A partner's debts can affect the household |
| Bureau score | A summary number, such as a FICO score in the United States | A ready-made risk ranking |

A **hard search** (a real application) is visible to other lenders; a **soft search** (a quotation or eligibility check) is not, so many lenders offer soft-search eligibility checks. **Open banking** data, where customers let the lender read their bank transactions, is increasingly used to verify income and spending, especially for people with **thin files** (few or no accounts). Data protection law governs all of this and varies by country.

## Scorecards: application, behavioural and collections

A **scorecard** is a model that turns information about a person into a score ranking how likely they are to default. The technique (typically logistic regression turned into a points table) is explained in [[10 Internal Ratings, Scorecards and PD Models]]. Retail banks use a different scorecard at each stage of the customer's life.

![[05-scorecards-lifecycle.svg]]
*A different score at each stage: an application score to decide whether to lend, a behavioural score to manage live accounts, a collections score once payments are missed, and a recovery score after charge-off.*

| Scorecard | When used | Data | Question it answers | Decisions it drives |
|---|---|---|---|---|
| **Application** | At application | Application form, bureau data, any existing relationship | Will this new customer default in the next 12 to 24 months? | Accept or decline, starting limit, price |
| **Behavioural** | Monthly on live accounts | Balance, utilisation, payments, cash withdrawals, refreshed bureau data | Is this customer's risk rising or falling? | Limit changes, renewals, cross-selling, often the PD for capital and provisions |
| **Collections** | When an account is in arrears | Arrears and contact history, promises to pay | Will this customer pay without intervention? | Who to call first, which treatment |
| **Recovery** | After charge-off | Balance, age of debt, past payments, contactability | How much will we recover, and by which route? | In-house, agency, legal action or debt sale |

Behavioural scores are usually far more powerful than application scores, because how someone actually uses their account says more than what they wrote on a form. That is why existing customers often get better offers than strangers.

## Decision engines, cut-offs, policy rules and champion-challenger

A **decision engine** is the software that takes the application, calls the bureau, runs the scorecards, applies the rules and returns a decision in a second or two. The logic it runs is a **strategy**, configured by credit risk analysts rather than hard-coded by developers.

![[05-retail-decision-flow.svg]]
*How a retail application is decided. Data arrives in seconds from the form, the bureau, internal records and fraud checks. The engine applies policy rules first, then the score cut-off and affordability, and accepts, declines or refers to a human underwriter. Everything is stored for audit.*

**Policy rules** are hard knock-outs that apply whatever the score: under 18, recent bankruptcy, fraud flag, sanctions match, not resident. They express the bank's credit policy ([[13 Credit Governance - Committees, Authorities and the Three Lines]]) and legal requirements, and run first so no score can override them.

**Cut-offs** are score thresholds: above, accept; below, decline. Setting one trades volume against losses, like the bar in the school high jump: lower it and more pupils clear it, but more will knock it over next time.

| Cut-off score | Approval rate | Expected bad rate among approved (illustrative) | Effect |
|---|---|---|---|
| 620 | 78% | 4.8% | High volume, high losses |
| 650 | 65% | 3.1% | Balanced |
| 680 | 51% | 2.0% | Low losses, fewer customers |

**The grey zone** just around the cut-off is often **referred** to a human underwriter, who can check documents and **override**: a **low-side override** accepts someone below the cut-off, a **high-side override** declines someone above it. High override rates mean either the scorecard is wrong or underwriters are ignoring it, so they are tracked.

**Limit and price assignment.** For accepted customers the strategy sets the limit or loan amount and often the price (**risk-based pricing**) by score band and affordability. See [[24 Pricing, RAROC and Return on Capital]].

**Reason codes.** Every decline stores reason codes ("too many recent searches"). Many countries require the lender to tell a declined applicant the main reasons or the bureau used (in the United States, an **adverse action notice**).

**Champion-challenger.** The current strategy (the **champion**) runs on most applications and a variation (the **challenger**, say a slightly lower cut-off) on a random 10%. Months later, when outcomes are visible, the bank compares profit, losses and customer outcomes, and the winner becomes champion. It is like testing a new recipe on one table before changing the menu. It needs genuinely random allocation and a record of which strategy each customer received.

**Reject inference.** You only see how accepted customers behave, so **reject inference** techniques estimate how declined applicants would have performed, to avoid biased scorecards.

## Worked example: a mortgage affordability calculation

A couple want to borrow 270,000 over 25 years on a 360,000 house. All numbers are illustrative.

**Step 1: ratios.** LTV = 270,000 / 360,000 = 75%. Combined gross income 75,000, so LTI = 3.6 times. Both within policy.

**Step 2: net income.** Take-home pay of 4,750 a month, verified from payslips or open banking.

**Step 3: outgoings.** The bank uses the higher of declared costs and a statistical estimate for this household size and income, so applicants cannot understate spending.

| Outgoing | Monthly |
|---|---|
| Car finance payment | 250 |
| Childcare | 600 |
| Credit card (bank assumes 3% of the 2,000 balance, even though they pay in full) | 60 |
| Living costs (statistical estimate, above the 1,100 declared) | 1,350 |
| Housing running costs (property tax, insurance, utilities) | 400 |
| **Total** | **2,660** |

Available for the mortgage: 4,750 minus 2,660 = **2,090** a month.

**Step 4: payment at the offered rate.** A five-year fix at 4.5% on repayment costs **1,501** a month. Comfortable.

**Step 5: stress test.** Policy stresses the rate to 7.5% (offered rate plus 3 percentage points, illustrative). The payment becomes **1,995**, leaving a surplus of 95. **Pass, only just.**

**Step 6: sensitivity.** At an 8.5% stress rate the payment is 2,174 and they fail by 84. Clearing the car finance would let them pass easily. The decision engine runs this automatically, and the thin surplus might trigger referral to an underwriter.

## Managing pools, not names

The deepest difference between retail and corporate is the **law of large numbers**. Toss one coin and you cannot predict it; toss 100,000 and you can be confident close to half land heads. One customer defaults or does not; 100,000 similar customers default at a stable, predictable rate, unless the economy shifts underneath them all.

So retail risk is managed in **pools** (segments, or homogeneous risk groups): accounts with similar characteristics, such as "cards, score band 3, opened 2024, utilisation above 80%". Appetite, monitoring, provisions, capital and strategy all work at pool level. No credit officer approves Mrs Smith's credit card; a credit officer approves the strategy that approved Mrs Smith.

| Corporate thinking | Retail thinking |
|---|---|
| Is this borrower good? | Is this segment performing as expected? |
| Watchlist of names | Dashboard of rates and trends |
| A single default is news | A single default is noise; a 0.2 percentage point rise in the default rate is news |

The catch: the law of large numbers protects against **independent** bad luck (job loss, illness, divorce), not **common** shocks (recession, rate rises, a house price crash) that hit everyone together. Retail portfolios are diversified against individual misfortune but concentrated in the national economy, which is what [[20 Stress Testing and ICAAP]] tests and [[14 Risk Appetite, Limits and Concentration]] sets limits around.

## Delinquency buckets, roll rates and cure rates

### Delinquency buckets

**Delinquency** (arrears) means a payment is late. Accounts are grouped by how many **days past due (DPD)** their oldest unpaid payment is.

| Bucket | Days past due | Meaning |
|---|---|---|
| Current | 0 | All payments made |
| Bucket 1 | 1 to 29 | One missed payment; often forgetfulness |
| Bucket 2 | 30 to 59 | Two missed payments; something is wrong |
| Bucket 3 | 60 to 89 | Serious trouble |
| Default | 90+ | Default for regulatory purposes in most regimes |

Conventions differ: some systems use 1 to 30, 31 to 60 and so on instead. The difference is whether day 30 sits in the first or second bucket, and it matters when you join data from two systems.

**90 days past due** is the Basel default backstop for retail (alongside "unlikely to pay" events such as bankruptcy) and a key trigger for IFRS 9 stage 3; **30 days past due** is the backstop presumption for stage 2 ([[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]]).

### Roll rates and cure rates

A **roll rate** is the share of accounts in one bucket this month that move to the next bucket next month. A **cure rate** is the share that pay up and return to current. Picture a class walking to the bus: most are on time, a few lag, and of the laggards some catch up and some fall further behind.

![[05-delinquency-roll-rates.svg]]
*Monthly flow through the delinquency buckets. Solid arrows show roll-forward, dashed green arrows show cures back to current, and grey boxes show the collections treatment at each stage. Rates are illustrative.*

**Worked roll-rate example.** A card portfolio has 100,000 current accounts. With the diagram's rates:

| Step | Calculation | Accounts |
|---|---|---|
| Current to bucket 1 | 100,000 x 3% | 3,000 |
| Bucket 1 to bucket 2 | 3,000 x 30% | 900 |
| Bucket 2 to bucket 3 | 900 x 60% | 540 |
| Bucket 3 to default | 540 x 80% | 432 |

The **flow rate to default** is 3% x 30% x 60% x 80% = 0.432%. If every month behaves the same, about 0.43% of the book flows to default each month, roughly 5% a year. With an average defaulted balance of 3,000 and LGD of 85%, those 432 accounts cost about 432 x 3,000 x 85% = 1.1 million.

Why roll rates matter:

- **Early warning.** If current-to-bucket-1 rises from 3% to 3.6%, defaults four months later will be about 20% higher.
- **Collections performance.** Falling bucket 1 cure rates may mean an understaffed team or a failed payment system.
- **Forecasting.** Roll rate (flow rate or **Markov chain**) models are a common way to forecast short-term losses.

## Vintage analysis

A **vintage** is a group of accounts opened in the same period, like a school year group. **Vintage analysis** tracks each group's cumulative bad rate by **months on book (MOB)**, so you compare like with like.

**Worked vintage table.** Cumulative percentage of each personal loan vintage that has ever reached 90+ DPD (illustrative):

| Vintage | MOB 3 | MOB 6 | MOB 9 | MOB 12 | MOB 18 | MOB 24 |
|---|---|---|---|---|---|---|
| 2023 Q1 | 0.2% | 0.8% | 1.5% | 2.1% | 2.9% | 3.4% |
| 2023 Q2 | 0.2% | 0.9% | 1.6% | 2.2% | 3.0% | 3.5% |
| 2023 Q3 | 0.3% | 0.9% | 1.6% | 2.3% | 3.1% | |
| 2023 Q4 | 0.3% | 1.0% | 1.8% | 2.6% | | |
| 2024 Q1 | 0.4% | 1.3% | 2.3% | | | |
| 2024 Q2 | 0.5% | 1.5% | | | | |

- **Read down a column** to compare vintages at the same age. At MOB 6, 2024 Q2 (1.5%) is almost twice as bad as 2023 Q1 (0.8%). Something changed: a lower cut-off, a new broker channel, or the economy.
- **Read along a row** to see the loss curve. Unsecured loans typically rise fast in the first year or two, then flatten; mortgages take much longer.
- **The empty triangle** is the future, forecast by assuming new vintages follow older curves, adjusted for how they are tracking.

Vintage analysis separates **quality of new lending** from **ageing of the book**. A fast-growing book looks deceptively healthy because most loans are too young to have gone bad (**growth masking**). Vintage curves also feed the scorecard monitoring in [[21 Model Risk Management and Validation]] and the portfolio monitoring in [[15 Monitoring, Early Warning and Watchlist]].

## Collections and recoveries

**Collections** gets late payments back on track; **recoveries** gets money back after an account is **charged off** (written off as a loss, typically around 180 DPD for cards, varying by product and country). Treatment is segmented by bucket and collections score, as the grey boxes in the roll-rate diagram show.

| Stage | Typical treatment | Aim |
|---|---|---|
| Pre-delinquency (signs of stress, nothing missed yet) | Proactive contact, budgeting tools, product switch | Prevent arrears |
| Bucket 1 | Texts, emails, app reminders, self-serve payment links | Catch the forgetful cheaply |
| Bucket 2 | Agent calls, letters, payment arrangements | Understand the problem, agree a plan |
| Bucket 3 | Formal notices, **forbearance** (reduced payments, payment holidays, term extensions), vulnerability assessment | Avoid default where sustainable |
| Default and charge-off | Account closure, collection agency, litigation, repossession for secured loans, **debt sale** | Maximise recovery fairly |

**Self-cure** matters: many bucket 1 customers simply forgot. Collections scores identify them so agents focus on accounts likely to roll forward, and good customers are not harassed.

**Secured recoveries** are slower. Mortgage possession takes months to years depending on the courts, is heavily regulated and is a last resort. Car repossession is quicker but in some countries needs a court order once a share of the debt is paid. **Debt sale** of charged-off unsecured debt to specialist buyers fetches a fraction of face value (illustratively 5 to 20 pence in the pound), and that price feeds LGD directly. [[16 Problem Loans, Restructuring and Recovery]] covers forbearance and recovery in depth.

## Fraud loss versus credit loss

Not every unpaid loan is a credit loss, and the cause, owner, fix and accounting all differ.

| Type | What happened | Example | Usual owner |
|---|---|---|---|
| **Credit loss** | A genuine customer borrowed in good faith and could not pay | Job loss leads to default | Credit risk |
| **First-party fraud** | A real person borrowed never intending to repay | "Bust-out": builds a good record, maxes every card, disappears | Fraud team (classification varies) |
| **Third-party fraud** | Someone used a stolen identity | Loan taken out in a victim's name | Fraud team; operational risk |
| **Synthetic identity fraud** | A made-up person built from real and fake details | A "customer" who never existed | Fraud team |

Why it matters: if fraud is labelled as credit default, scorecards learn to predict both badly, so development data must flag fraud. For capital, fraud is usually **operational risk**, though treatment of first-party fraud varies by bank and regulator; consistency is what counts. And a victim of identity fraud must never be chased for the debt or have their credit file damaged.

## Responsible lending and conduct

Retail customers are not professionals, and most countries expect lenders to protect them. **Conduct risk** is the risk of harming customers through how products are designed, sold and serviced. Specific rules differ widely; the principles are broadly shared.

| Principle | What it means in practice |
|---|---|
| **Affordability** | Lend only what the customer can repay without hardship, not merely what the bank will get back (a customer who repays by selling their home may still have been harmed) |
| **Vulnerable customers** | Identify people whose circumstances (illness, bereavement, low financial capability, addiction, abuse) make harm more likely, and adapt treatment |
| **Fair treatment** | Products give fair value, customers understand them, complaints are handled fairly |
| **Transparency** | Clear disclosure of the annual percentage rate (APR), total cost and fees before signing |
| **Non-discrimination** | No discrimination on protected characteristics such as race, sex or religion, including indirectly through proxy variables; very prescriptive in some countries, such as the United States |
| **Forbearance in hardship** | Reasonable help before enforcement |

Conduct rules land directly on the platform: affordability calculations must be reproducible, models tested for bias, and vulnerability flags must flow from collections to the decision engine so a vulnerable customer is not offered a limit increase. Redress for unfair practices has cost banks billions, often years later, and the evidence came from (or was missing from) the bank's data.

## Retail under Basel

[[18 Regulatory Capital and Basel - the Short Version]] and [[basel-credit-risk-explained-simply]] explain capital in general. Percentages below follow the Basel framework; national implementations can differ.

### Standardised approach

| Class | What qualifies | Risk weight |
|---|---|---|
| **Regulatory retail** | Individuals or small businesses; product types such as cards, overdrafts, personal loans; total exposure to one counterparty no more than 1 million euros; part of a granular pool | **75%** |
| **Transactors** (within regulatory retail) | Cards and overdrafts repaid in full each month over the past year | 45% |
| **Other retail** | Retail failing the regulatory retail tests | 100% |
| **Residential real estate** | Loans secured on homes meeting legal, valuation and underwriting criteria | Scales with LTV; higher again where repayment depends on rent from the property |

The 75% weight is below the 100% for an unrated corporate because a granular pool of small loans is diversified even if each borrower is fairly risky; mortgages go lower still because the house protects the bank. [[basel-credit-risk-decision-tree]] shows how an exposure is assigned to a class.

### The internal ratings-based approach for retail

Under the **internal ratings-based (IRB)** approach, banks use their own models. Retail IRB differs from corporate IRB in three ways:

1. **Pooling.** Exposures are assigned to **pools** of similar risk (score band, product, delinquency status, LTV) and PD, LGD and EAD are estimated per pool, mirroring how retail is managed day to day.
2. **Own estimates of everything.** There is no foundation version for retail; the bank estimates all three parameters.
3. **Three sub-classes**, each with its own **asset correlation** (how much borrowers are assumed to suffer together in a downturn) in the capital formula:

| IRB retail sub-class | What it covers | Correlation idea |
|---|---|---|
| **Residential mortgages** | Home loans | Relatively high and fixed: house prices and the economy hit everyone together |
| **Qualifying revolving retail exposures (QRRE)** | Unsecured revolving lines to individuals (cards, overdrafts) up to a size limit, with low loss volatility | Low: losses driven more by individual circumstances |
| **Other retail** | Personal loans, car finance, small business retail | Varies with PD |

Retail IRB also has **floors** on PD and LGD, and the final Basel III **output floor** limits how far IRB capital can fall below standardised capital across the bank. [[10 Internal Ratings, Scorecards and PD Models]] covers pool and model building.

## How retail differs from corporate

| Dimension | Retail | Corporate |
|---|---|---|
| **Borrowers** | Millions | Hundreds to thousands |
| **Data** | Very high volume: monthly snapshots of millions of accounts, transactions, bureau refreshes | Lower volume, richer and unstructured (accounts, credit papers) |
| **Defaults in history** | Thousands a month, so models are statistical | Few, so models lean on expert judgement |
| **Models** | Many: application, behavioural, collections, fraud, affordability, PD, LGD, EAD by product | Fewer rating models by segment |
| **Decisions** | Automated, in seconds, by strategy | Human analysis and committees, days to weeks ([[03 The Credit Lifecycle]]) |
| **Governance** | Humans approve strategy changes, not individual loans; heavy model monitoring and conduct oversight | Authority delegated to people by deal size; limits and concentration |
| **Main risk driver** | The economy: unemployment, rates, house prices | Borrower-specific performance and sector |

## Common mistakes and misunderstandings

- **"The credit score decides."** The strategy decides. The score is one input alongside policy rules, affordability, fraud checks and limit logic. Moving a cut-off ten points can be a bigger risk decision than any single corporate loan.
- **"A low default rate means good lending."** Not if the book is young. Growth masks losses. Always look at vintages.
- **"Secured means no loss."** Negative equity, slow repossession, forced-sale discounts and legal costs all produce losses, and conduct rules may limit enforcement.
- **"Retail is diversified, so it is safe."** Diversified against individual bad luck, not against a recession.
- **"Bucket 1 customers are in trouble."** Many simply forgot. Collections scoring exists to tell them apart.
- **"Fraud and credit loss are the same because the money is gone."** They need different models, teams, capital treatment and customer handling.
- **"If the customer repaid, the lending was fine."** A loan repaid only by falling behind on other bills may still breach responsible lending rules.
- **"Days past due is a simple number."** It depends on how partial payments, arrears tolerances, payment holidays and restructured schedules are treated. Two systems can disagree on the same account.

## What a platform lead needs to know about this

**Data shape and volume.** Retail risk runs on **monthly account-level snapshots**: one row per account per month with balance, limit, DPD, bucket, scores, product, segment and flags (forbearance, fraud, vulnerability, deceased, bankrupt). Long, consistent history is the asset: vintages, roll rates, model builds and IRB estimation all depend on it. Never let a system migration lose or redefine history without a mapping.

**Systems you will meet.**

| System | What it holds | Risk dependency |
|---|---|---|
| Origination platform and **decision engine** | Applications, bureau responses, scores, decisions, reason codes, strategy version, champion-challenger group | Audit trail of every decision; data for scorecard rebuilds and reject inference |
| **Bureau interfaces** | Raw and archived bureau reports | Model development, customer disputes; retention rules apply |
| Core banking and **card processing** (often a third-party processor) | Balances, transactions, statements, payments | Source of DPD and utilisation |
| **Collections system** | Contacts, arrangements, forbearance, vulnerability flags | Cure rates, forbearance reporting, conduct |
| Recoveries and debt sale records | Charge-offs, recoveries, sale prices | LGD estimation |
| Fraud systems | Fraud flags and confirmed cases | Excluding fraud from credit models |
| Risk data mart | Monthly snapshots, segments, scores | Provisions, capital, stress tests, management information |

**Controls.** Treat strategy changes like code releases: who requested, who approved, what was tested, when it went live, and the ability to replay any past decision with the strategy live at the time. Monitor approval rates, score distributions and referral rates daily, because a broken bureau feed or mis-mapped field can silently approve or decline thousands. Keep one documented **definition of default** and DPD calculation used consistently by collections, provisioning and capital. Monitor every scorecard monthly for stability and discrimination power, and test models and strategies for unfair bias.

**Who owns what.** Product owners own the proposition and volume targets. Credit risk strategy teams own scorecard use, cut-offs and strategies. Second-line credit risk sets policy and appetite and approves material changes. Model development builds scorecards; model validation challenges them. Collections operations owns treatment paths; conduct and compliance own fair treatment rules; fraud owns fraud models. Data and technology (often your team) own the pipelines, the decision engine platform, the snapshot history and the lineage connecting them, which is the subject of [[22 Credit Risk Data, Systems and BCBS 239]], with reporting in [[23 Reporting - Regulatory Returns, Pillar 3 and Management Information]].

**The questions you will be asked.** Why was this customer declined, and can we prove it? What happens to losses if we lower the cut-off by 20 points? Are this year's vintages worse than last year's? How many accounts are in persistent debt? Your platform should answer each from governed data, not someone's spreadsheet.

## Related notes

- [[00 Start Here]]
- [[02 What Credit Risk Is]]
- [[03 The Credit Lifecycle]]
- [[04 Commercial and Corporate Lending]]
- [[06 Specialised Finance - Project, Object, Commodities, Real Estate]]
- [[10 Internal Ratings, Scorecards and PD Models]]
- [[11 Collateral and Security]]
- [[13 Credit Governance - Committees, Authorities and the Three Lines]]
- [[14 Risk Appetite, Limits and Concentration]]
- [[15 Monitoring, Early Warning and Watchlist]]
- [[16 Problem Loans, Restructuring and Recovery]]
- [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]]
- [[18 Regulatory Capital and Basel - the Short Version]]
- [[20 Stress Testing and ICAAP]]
- [[21 Model Risk Management and Validation]]
- [[22 Credit Risk Data, Systems and BCBS 239]]
- [[23 Reporting - Regulatory Returns, Pillar 3 and Management Information]]
- [[24 Pricing, RAROC and Return on Capital]]
- [[28 Master Glossary]]
- [[basel-credit-risk-explained-simply]]
- [[basel-credit-risk-decision-tree]]
