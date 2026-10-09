# Retail Lending

**Why this matters to you.** Retail lending (lending to individual people rather than companies) is where a bank makes millions of small decisions instead of a few hundred large ones. Nobody in a retail bank reads your mortgage application the way a corporate analyst reads a company's accounts. A computer reads it, in seconds, using scores, rules and data from credit bureaus, and the risk team manages the result as a statistical pool rather than as named individuals. That makes retail credit risk a data and systems business more than any other part of the bank. The volumes are enormous, the models are many, the decisions are automated, and the regulators care as much about whether customers were treated fairly as about whether the bank lost money. If you lead a credit risk platform, retail is where your pipelines carry the most rows, where a broken data feed can approve thousands of bad loans before lunch, and where your audit trail has to prove, years later, exactly why a particular person was turned down.

## Table of contents

1. [Pocket money, a hundred times over](#pocket-money-a-hundred-times-over)
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

## Pocket money, a hundred times over

Imagine you lend your little brother 5 pounds until Saturday. You know him. You know he gets pocket money on Saturdays, you know he once forgot to pay back a friend, and you can see him every day. That is how corporate lending feels: one borrower, studied closely. [[04 Commercial and Corporate Lending]] covers that world.

Now imagine you run the school tuck shop and a thousand pupils each want to borrow 5 pounds. You cannot interview them all. Instead you notice patterns. Pupils who have borrowed before and paid on time usually pay again. Pupils who already owe money to three other people often do not. Pupils from the year group that just had a school trip are short of cash this month. You write a few simple rules, give each pupil a points score, lend to everyone above a line, and then watch the whole group. You know that perhaps 30 of the 1,000 will not pay you back, and you do not mind, because you charged everyone a little extra to cover those 30. What you watch is whether the number is 30 or creeping up to 60.

That is retail lending: **rules, scores, pools and patterns**, applied to millions of people at once.

## The retail product map

Retail products split along two lines: **secured or unsecured** (is there an asset the bank can take if the borrower stops paying?) and **instalment or revolving** (does the loan pay down to zero on a schedule, or can the customer borrow, repay and borrow again?).

| Product | Secured? | Shape | Typical size (illustrative) | Typical term | Typical loss rate |
|---|---|---|---|---|---|
| Residential mortgage | Yes, on the home | Instalment | 100,000 to 1,000,000 | 20 to 35 years | Very low |
| Buy-to-let mortgage | Yes, on a rented property | Instalment, often interest-only | 100,000 to 500,000 | 15 to 25 years | Low |
| Credit card | No | Revolving | 500 to 15,000 limit | Open-ended | High |
| Personal loan | No | Instalment | 1,000 to 35,000 | 1 to 7 years | Medium |
| Car finance (hire purchase, personal contract purchase) | Yes, on the car | Instalment, sometimes with a balloon | 5,000 to 50,000 | 2 to 5 years | Low to medium |
| Overdraft | No | Revolving | 100 to 5,000 | Open-ended, on demand | High |
| Student loan | No (often government-backed) | Income-contingent | 10,000 to 100,000 | Decades | Varies widely |
| Buy now pay later | No | Short instalment | 20 to 2,000 | Weeks to months | Medium to high |

The one rule to remember: **secured products have low loss given default (LGD) because there is something to sell; unsecured products have high LGD because there usually is not.** [[02 What Credit Risk Is]] explains probability of default (PD), loss given default and exposure at default (EAD), and [[11 Collateral and Security]] covers how homes and cars work as collateral.

## Mortgages

A mortgage is a loan to buy a home, secured by a legal charge on that home. If the borrower stops paying, the bank can, after a long legal process, take possession and sell the property. Mortgages are the biggest single asset on most retail banks' balance sheets.

### Loan-to-value and loan-to-income

**Loan-to-value (LTV)** is the loan divided by the property's value. A 270,000 loan on a 360,000 house is 75% LTV. The deposit (25%) is the cushion: house prices can fall a quarter before the bank is underwater. Think of LTV as how much of the bike you borrowed versus how much you paid for yourself. If you put in your own money, you care about the bike.

**Loan-to-income (LTI)** is the loan divided by the borrower's gross annual income. 270,000 against 75,000 of household income is 3.6 times. Many regulators cap how much lending a bank can do at high multiples (some countries limit the share of new mortgages above about 4.5 times income), but the exact rule varies by country.

| Measure | What it protects against | Typical bands (illustrative) |
|---|---|---|
| LTV | Loss if the borrower defaults and the house is sold (drives LGD) | 60% or less is low risk; 90% to 95% is high risk and priced higher |
| LTI | Borrowing too much relative to earning power (drives PD) | Under 4 times is common; above 4.5 times is often restricted |
| Debt-to-income (DTI) (used in the United States and elsewhere) | Total monthly debt payments as a share of monthly income | Often a ceiling somewhere around 35% to 45%, varying by lender and programme |

### Affordability and stress-rate tests

LTV and LTI are blunt. The real question is whether the household can pay the monthly bill, now and if interest rates rise. An **affordability assessment** takes net income, subtracts committed spending (other loans, childcare) and estimated living costs, and checks that what is left covers the mortgage payment. A **stress-rate test** recalculates the payment at a higher interest rate than the one being offered, to check the household could cope if rates went up. Some regulators set the stress margin; others leave it to banks. The worked example later in this note walks through one.

### Fixed, variable and tracker

| Rate type | How it works | Who carries the interest rate risk |
|---|---|---|
| **Fixed** | Rate locked for an initial period (2, 5, 10 years, or the whole term in some countries such as the United States) | The bank (which usually hedges it); the borrower is protected until the fix ends |
| **Variable** (standard variable rate) | The bank sets the rate and can change it | The borrower |
| **Tracker** | A set margin above the central bank rate, moving automatically | The borrower |
| **Discounted** | A discount off the variable rate for a period | The borrower |

The credit risk point is **payment shock**: when a cheap fixed rate ends and the borrower moves to a much higher rate, the monthly payment can jump by hundreds. A wave of fixes ending in a period of high rates is a known risk that banks track as a "maturity wall" of fixed-rate expiries.

### Interest-only versus repayment

On a **repayment** (capital and interest) mortgage each payment covers interest plus a slice of the loan, so the balance falls to zero by the end. On an **interest-only** mortgage the borrower pays only interest and must repay the full loan at the end from some other source (savings, an investment, selling the house). From our earlier numbers, interest-only on 270,000 at 4.5% costs about 1,013 a month against about 1,501 for repayment. Cheaper each month, but the exposure never falls, and the bank is betting on a repayment plan decades away. It is the retail cousin of the corporate bullet loan in [[04 Commercial and Corporate Lending]].

### Buy-to-let

A **buy-to-let** mortgage is for a landlord buying a property to rent out. It is assessed mainly on the **rental cover ratio**: expected rent divided by the mortgage interest at a stressed rate, which must exceed a threshold (often somewhere around 125% to 145%, varying by lender and tax position). Buy-to-let is often interest-only, sits closer to small business lending than to a home loan, and landlords with many properties ("portfolio landlords") may be assessed as businesses. Under the Basel rules, loans repaid from the rent on the property are treated as riskier than owner-occupied loans (see [[06 Specialised Finance - Project, Object, Commodities, Real Estate]] for the commercial version).

### Remortgaging

**Remortgaging** means moving the loan to a new deal, either with the same bank (a **product transfer**) or a different one. When a fix ends, most borrowers remortgage. For risk this matters three ways: the bank's book turns over constantly, product transfers to existing customers may skip a full affordability check (some regulators allow this for borrowers who would otherwise be trapped), and customers who cannot remortgage elsewhere (because their circumstances worsened) stay with you on a higher rate. That last group, sometimes called **mortgage prisoners**, is an adverse selection problem: the good borrowers leave, the stuck ones remain.

## Credit cards

A credit card is a revolving, unsecured line. The customer can spend up to a **credit limit**, receives a monthly statement, and must pay at least a minimum amount.

### Transactors and revolvers

| Customer type | Behaviour | What the bank earns | Risk |
|---|---|---|---|
| **Transactor** | Pays the full balance every month | Interchange (a small fee from the shop's bank on each purchase), sometimes an annual fee. No interest | Low; their balance is temporary |
| **Revolver** | Carries a balance and pays interest | Interest, often at high rates, plus fees | Higher; this is where the lending, and the losses, are |
| **Dormant or inactive** | Rarely uses the card | Little or nothing | Low today, but the undrawn limit can be drawn in a crisis |

The economics are a balancing act: revolvers make the money, but too many risky revolvers make the losses. A card portfolio's profitability depends on the mix.

### Limits and limit increases

The starting limit comes from the application decision. After that, the bank reviews limits regularly using the **behavioural score** (see below). Good customers are offered increases (sometimes automatically, though many countries now require customers to opt in or allow them to opt out); risky ones may have their limits cut. Every limit increase raises **exposure at default**, because the undrawn limit can be drawn before default. That is why the credit conversion factor (CCF), the share of undrawn limit expected to be drawn by default, matters so much for cards.

### Minimum payments

The **minimum payment** is usually a small percentage of the balance (say 1% plus interest, or 2% to 3% of the balance, with a floor amount). Paying only the minimum can keep someone in debt for decades. Several regulators now require banks to identify customers in **persistent debt** (paying more in interest and fees than principal over a long period, such as 18 months) and intervene. A customer who only ever pays the minimum is a classic early warning sign.

### Interest-free periods

**Promotional** offers (0% on purchases or on **balance transfers** from another card for, say, 12 to 30 months) attract customers. The risk is a cliff when the promotion ends and interest starts, and the bank's income depends on enough customers staying after it does. Balance transfer customers are often already carrying debt elsewhere, so they need careful scoring.

## Personal loans, car finance, overdrafts, student loans and buy now pay later

**Personal loans.** A fixed amount, fixed term, fixed monthly payment, unsecured. Used for cars, home improvements, weddings and, very often, **debt consolidation** (paying off several cards). Consolidation loans carry a hidden risk: if the customer clears their cards and then fills them up again, they now owe twice as much.

**Car finance.** Two common shapes in countries such as the United Kingdom, with equivalents elsewhere:

| Product | How it works | Who owns the car | Key risk |
|---|---|---|---|
| **Hire purchase (HP)** | Deposit, then equal monthly payments; owns the car after the last payment | The lender until the final payment | The customer stops paying; the car is worth less than the debt |
| **Personal contract purchase (PCP)** | Lower monthly payments, then a large final payment (the **guaranteed minimum future value**, a balloon). The customer can pay it and keep the car, hand the car back, or trade in | The lender until the balloon is paid | **Residual value risk**: if used car prices fall, many customers hand back cars worth less than the balloon, and the lender takes the loss |
| **Auto loan** (common in the United States) | A plain secured instalment loan | The borrower, with the lender holding a lien | Long terms (six or seven years) mean the car loses value faster than the loan falls |

Car finance is mostly sold by dealers, which means the bank does not meet the customer, and dealer commission arrangements have been a major conduct issue in some countries.

**Overdrafts.** Permission to take a current account below zero. Arranged overdrafts have a limit; unarranged overdrafts happen when a payment goes through anyway. Overdrafts are on demand and reviewed regularly, but for many customers they become semi-permanent borrowing. Regulators in several countries have cracked down on high overdraft fees because they fall hardest on the least well-off.

**Student loans.** In many countries these are provided or guaranteed by government, with repayments linked to income after graduation and debt written off after a long period. They behave very differently from commercial credit: there is no affordability test at the start, and losses depend on graduates' future earnings. Private student lenders (common in the United States) score them like any other loan, often relying on a co-signer such as a parent.

**Buy now pay later (BNPL).** Splitting a purchase into a few interest-free instalments, often at the online checkout. The merchant pays the provider a fee. Individual amounts are small, decisions are instant, and historically many providers did not report to credit bureaus, so other lenders could not see the debt. Regulation of BNPL is being introduced or tightened in many countries. For a bank, the risk is **hidden indebtedness**: a customer can owe money to five BNPL providers that your bureau search does not show.

## Credit bureaus and the credit file

A **credit bureau** (credit reference agency) is a company that collects data from lenders about how people manage credit and sells it back to lenders. The big three internationally are Experian, Equifax and TransUnion; many countries have their own, and some have a public credit register run by the central bank instead of, or alongside, private bureaus. Think of it as the school's shared notebook in which every tuck shop writes down who paid back and who did not.

| What a credit file typically contains | Example | Why lenders care |
|---|---|---|
| Identity and address history | Name, date of birth, current and previous addresses | Matching the right person; fraud detection |
| Accounts (tradelines) | Every card, loan, mortgage, overdraft, phone contract, with limit and balance | Total debt and how much of available credit is used |
| Payment history | A month-by-month status for each account (on time, 1 month late, 2 months late...) | The single most predictive data |
| Defaults and judgements | Accounts defaulted, court judgements, bankruptcies, insolvency arrangements | Severe negative events; often policy knock-outs |
| Searches | Which lenders have checked the file, and when | Many recent applications suggest credit hunger or fraud |
| Linked people | Financial associates (joint account holders) | One partner's debts can affect the other |
| Electoral roll or address verification (in some countries) | Registered at address since 2015 | Stability and identity |
| Bureau score | A summary number such as a FICO score in the United States | A ready-made risk ranking |

Two kinds of search exist: a **hard search** (a real application, visible to other lenders) and a **soft search** (a quotation or eligibility check, visible only to the person). Many lenders now offer soft-search eligibility checks so customers can see their chances without harming their file.

**Open banking** data, where the customer lets the lender read their bank transactions, is increasingly used to verify income and spending, especially for people with thin credit files (few or no accounts, for example young people and recent arrivals).

Data protection law governs all of this, and the rules on what can be used, for how long, and what a customer can see and correct vary by country.

## Scorecards: application, behavioural and collections

A **scorecard** is a model that turns information about a person into a score that ranks how likely they are to default. Higher score, lower risk (usually). The technique, typically logistic regression grouped into points tables, is explained in [[10 Internal Ratings, Scorecards and PD Models]]. Retail banks use different scorecards at different stages.

![[05-scorecards-lifecycle.svg]]
*Retail banks use a different score at each stage of the customer's life: an application score to decide whether to lend, a behavioural score to manage live accounts, a collections score once payments are missed, and a recovery score after charge-off.*

| Scorecard | When used | Data | Question it answers | Decisions it drives |
|---|---|---|---|---|
| **Application** | At the moment of applying | Application form, bureau data, any existing relationship | Will this new customer default in the next 12 to 24 months? | Accept or decline, starting limit, price |
| **Behavioural** | Every month on live accounts | How the account is used: balance, utilisation, payments, cash withdrawals, plus refreshed bureau data | Is this existing customer's risk going up or down? | Limit increases and decreases, renewals, cross-selling, and often the PD for capital and provisions |
| **Collections** | When an account is in arrears | Arrears history, contact history, promises to pay, behavioural data | Will this customer pay without intervention, or do we need to act now? | Who to call first, which treatment |
| **Recovery** | After charge-off | Balance, age of debt, previous payments, contactability | How much will we recover, and by which route? | In-house recovery, agency placement, legal action, debt sale |

Behavioural scores are usually much more powerful than application scores, because how someone actually uses their account tells you more than what they wrote on a form. This is why existing customers often get better offers than strangers.

**Generic versus bespoke.** Bureaus sell generic scores built across all lenders. Large banks build bespoke scorecards on their own data, often using the bureau score as one input. Small lenders and new products often start with generic scores until they have enough of their own history.

## Decision engines, cut-offs, policy rules and champion-challenger

A **decision engine** is the software that takes in the application data, calls the bureau, runs the scorecard, applies the rules and returns a decision, usually in a second or two. The logic it runs is called a **strategy**, and it is configured by credit risk analysts rather than hard-coded by developers.

![[05-retail-decision-flow.svg]]
*How a retail application is decided. Data is gathered in seconds from the form, the bureau, internal records and fraud checks. The decision engine applies policy rules first, then the score cut-off and affordability, and either accepts, declines or refers to a human underwriter. Everything is stored for audit.*

The pieces of a strategy:

**Policy rules** are hard yes/no rules that apply regardless of score: applicant under 18, recent bankruptcy, fraud flag, sanctions match, not resident, already at maximum exposure. They reflect the bank's credit policy ([[13 Credit Governance - Committees, Authorities and the Three Lines]]) and legal requirements. They are applied first so no score can override them.

**Cut-offs** are the score thresholds. Everyone above the cut-off is accepted, everyone below declined. Setting the cut-off is a business decision trading volume against losses. Think of the school high jump bar: lower it and more pupils clear it, but some of them will knock it over next time.

| Cut-off score | Approval rate | Expected bad rate among approved (illustrative) | Effect |
|---|---|---|---|
| 620 | 78% | 4.8% | High volume, high losses |
| 650 | 65% | 3.1% | Balanced |
| 680 | 51% | 2.0% | Low losses, fewer customers |

**The grey zone** sits just around the cut-off. Applications there may be **referred** to a human underwriter, who can check documents and use judgement. Underwriters can **override**: a **low-side override** accepts someone below the cut-off, a **high-side override** declines someone above it. Override rates are tracked closely, because lots of overrides mean either the scorecard is wrong or the underwriters are ignoring it.

**Limit and price assignment.** For accepted customers, the strategy assigns a credit limit or loan amount and often a price (**risk-based pricing**, where riskier customers pay higher rates) based on score band and affordability.

**Reason codes.** Every decline carries reason codes ("too many recent searches", "insufficient income"). In many countries the law requires the lender to tell a declined applicant the main reasons or at least which bureau was used (in the United States, an **adverse action notice**).

**Champion-challenger.** A bank never knows whether its current strategy is the best possible. So it runs the current strategy (the **champion**) on most applications and a variation (the **challenger**, for example a slightly lower cut-off or a different limit rule) on a random small share, say 10%. After enough months to see how the accounts behave, it compares profit, losses and customer outcomes. If the challenger wins, it becomes the new champion. It is a controlled experiment, like testing a new recipe on one table of the restaurant before changing the menu. It needs a random allocation that cannot be gamed, and a record of which strategy each customer received.

**Reject inference.** One awkward problem: you only see how accepted customers behave. Declined ones never get a loan, so you cannot know if they would have paid. Building a new scorecard only on accepted customers biases it. Techniques called **reject inference** estimate how the declines would have behaved, sometimes using bureau data on how they performed with other lenders.

## Worked example: a mortgage affordability calculation

A couple apply to borrow 270,000 over 25 years to buy a 360,000 house. All numbers are illustrative.

**Step 1: the ratios.** LTV = 270,000 / 360,000 = 75%. Combined gross income 75,000; LTI = 270,000 / 75,000 = 3.6 times. Both within policy.

**Step 2: net monthly income.** After tax and pension contributions, the couple take home 4,750 a month (verified from payslips or open banking data).

**Step 3: committed and living costs.** The bank uses the higher of the declared costs and a statistical estimate for a household of this size and income (so that people cannot understate their spending).

| Outgoing | Monthly |
|---|---|
| Car finance payment | 250 |
| Childcare | 600 |
| Credit card (bank assumes 3% of the 2,000 balance, even though they pay in full) | 60 |
| Living costs (statistical estimate, higher than the 1,100 declared) | 1,350 |
| Housing running costs (property tax, insurance, utilities) | 400 |
| **Total** | **2,660** |

Money available for the mortgage: 4,750 minus 2,660 = **2,090** a month.

**Step 4: payment at the offered rate.** A five-year fix at 4.5% on a repayment basis costs **1,501** a month. Comfortable.

**Step 5: the stress test.** The bank's policy stresses the rate to 7.5% (the offered rate plus 3 percentage points, an illustrative buffer). The payment becomes **1,995** a month. 2,090 minus 1,995 leaves a surplus of 95. **Pass, but only just.**

**Step 6: what changes the answer.** If the stress rate were 8.5%, the payment would be 2,174 and the couple would fail by 84. If they cleared the car finance, they would pass easily. If they asked for interest-only, the stressed interest-only payment would be lower, but most banks would require a credible repayment plan for the 270,000 at the end and might not accept them at all at 75% LTV. A decision engine runs this calculation automatically; the thin surplus might trigger a referral to an underwriter.

## Managing pools, not names

The deepest difference between retail and corporate is the **law of large numbers**. Toss one coin and you cannot predict heads or tails. Toss 100,000 coins and you can say with great confidence that close to half will land heads. One customer either defaults or does not; 100,000 similar customers will default at a rate that is quite stable and predictable, unless the economy shifts underneath them all.

So retail risk is managed on **pools** (also called segments or homogeneous risk groups): groups of accounts with similar characteristics, such as "credit cards, score band 3, opened 2024, utilisation above 80%". The bank sets appetite, monitors performance, calculates provisions and capital, and changes strategy at the pool level. No credit officer approves Mrs Smith's credit card; a credit officer approves the strategy that approved Mrs Smith.

| Corporate thinking | Retail thinking |
|---|---|
| Is this borrower good? | Is this segment performing as expected? |
| Watchlist of names | Dashboard of rates and trends |
| Analyst judgement per deal | Analyst judgement per strategy change |
| A single default is news | A single default is noise; a 0.2 percentage point rise in the default rate is news |

The catch is that the law of large numbers protects you against **independent** bad luck (someone loses their job, gets ill, divorces) but not against **common** shocks: a recession, a rise in interest rates, a house price crash or the closure of a big local employer hits many borrowers together. Retail portfolios are diversified against individual misfortune and concentrated in the national economy. That is what [[20 Stress Testing and ICAAP]] tests.

## Delinquency buckets, roll rates and cure rates

### Delinquency buckets

**Delinquency** (or arrears) means a payment is late. Accounts are grouped by how many **days past due (DPD)** their oldest unpaid payment is.

| Bucket | Days past due | Also called | Meaning |
|---|---|---|---|
| Current | 0 | Up to date | All payments made |
| Bucket 1 | 1 to 29 | 1 cycle, "30 days" | One missed payment; often forgetfulness |
| Bucket 2 | 30 to 59 | 2 cycles | Two missed payments; something is wrong |
| Bucket 3 | 60 to 89 | 3 cycles | Serious trouble |
| Bucket 4+ | 90+ | Default | Default for regulatory purposes in most regimes |

Banks label buckets slightly differently (the diagram below uses 1 to 30, 31 to 60 and so on, another common convention). The difference is whether day 30 belongs in the first or second bucket, and it matters when you join data from two systems that use different conventions.

**90 days past due** is the regulatory definition of default for most retail exposures under Basel (alongside "unlikely to pay" events such as bankruptcy), and it is a key trigger for IFRS 9 stage 3 ([[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]]). Thirty days past due is the backstop presumption for stage 2.

### Roll rates and cure rates

A **roll rate** is the share of accounts in one bucket this month that move to the next bucket next month. A **cure rate** is the share that pay up and return to current. Think of a class lining up for a school trip: some are on time, a few are late, and of the late ones some catch up and some get even later.

![[05-delinquency-roll-rates.svg]]
*How accounts flow through the delinquency buckets each month. Solid arrows show roll-forward to the next bucket, dashed green arrows show cures back to current, and the grey boxes show the collections treatment at each stage. The rates are illustrative.*

**Worked roll-rate example.** A card portfolio has 100,000 current accounts. Using the illustrative rates in the diagram:

| Step | Calculation | Accounts |
|---|---|---|
| Current rolling to bucket 1 | 100,000 x 3% | 3,000 |
| Bucket 1 rolling to bucket 2 | 3,000 x 30% | 900 |
| Bucket 2 rolling to bucket 3 | 900 x 60% | 540 |
| Bucket 3 rolling to default | 540 x 80% | 432 |

So of every 100,000 current accounts, about 432 reach default four months later. The **flow rate to default** is 3% x 30% x 60% x 80% = 0.432%. If each month's cohort of current accounts behaves the same way, roughly 0.43% of the book flows to default each month, about 5% a year. The bank can multiply by average balance and expected loss given default to forecast losses months ahead. With an average defaulted balance of 3,000 and LGD of 85%, the 432 accounts cost about 432 x 3,000 x 85% = 1.1 million.

Why roll rates are so useful:

- **Early warning.** If the current-to-bucket-1 rate rises from 3% to 3.6%, the bank knows months in advance that defaults will be about 20% higher.
- **Collections performance.** If bucket 1 cure rates fall, the collections team may be understaffed or a payment system may have failed.
- **Forecasting.** Roll rate models (sometimes called **Markov chain** or **flow rate** models) are a common way to forecast short-term losses and support provisioning.

Roll rates are usually measured on both **account counts** and **balances**, since large balances may behave differently from small ones.

## Vintage analysis

A **vintage** is a group of accounts opened in the same period, like a year of wine or a year group at school. **Vintage analysis** tracks each group's cumulative bad rate by **months on book (MOB)**, so you compare like with like: every vintage at month 6, every vintage at month 12.

**Worked vintage table.** Cumulative percentage of a personal loan vintage that has ever reached 90+ days past due (illustrative):

| Vintage | MOB 3 | MOB 6 | MOB 9 | MOB 12 | MOB 18 | MOB 24 |
|---|---|---|---|---|---|---|
| 2023 Q1 | 0.2% | 0.8% | 1.5% | 2.1% | 2.9% | 3.4% |
| 2023 Q2 | 0.2% | 0.9% | 1.6% | 2.2% | 3.0% | 3.5% |
| 2023 Q3 | 0.3% | 0.9% | 1.6% | 2.3% | 3.1% | |
| 2023 Q4 | 0.3% | 1.0% | 1.8% | 2.6% | | |
| 2024 Q1 | 0.4% | 1.3% | 2.3% | | | |
| 2024 Q2 | 0.5% | 1.5% | | | | |

How to read it:

- **Read down a column** to compare vintages at the same age. At MOB 6, the 2024 Q2 vintage (1.5%) is almost twice as bad as 2023 Q1 (0.8%). Something changed: perhaps the cut-off was lowered in early 2024, a new broker channel was added, or the economy turned.
- **Read along a row** to see the **loss curve** shape. Most unsecured loans show losses rising fast in the first year or two and then flattening. Mortgages take much longer.
- **The empty triangle** is the future. Vintage analysis lets you forecast it by assuming each new vintage follows the curve of older ones, adjusted for how it is tracking.

The power of vintage analysis is that it separates **quality of new lending** from **ageing of the book**. A portfolio's overall bad rate can rise just because lots of loans written two years ago are now at their peak loss age, even if nothing is wrong. And a fast-growing book can look deceptively healthy because most of its loans are too young to have gone bad yet (this is called **growth masking** losses). Vintage curves are also a key input to the scorecard monitoring described in [[21 Model Risk Management and Validation]].

## Collections and recoveries

**Collections** is the work of getting late payments back on track; **recoveries** is the work of getting money back after an account has been **charged off** (written off the books as a loss, typically after around 180 days past due for cards, though the timing varies by product and country).

Strategies are segmented by the collections score and the bucket, as the grey boxes in the roll-rate diagram show:

| Stage | Typical treatment | Aim |
|---|---|---|
| Pre-delinquency (behavioural signs of stress, no missed payment yet) | Proactive contact, budgeting tools, product switch | Prevent arrears |
| Bucket 1 | Text messages, emails, app reminders, automated calls; self-serve payment links | Catch the forgetful cheaply |
| Bucket 2 | Agent phone calls, letters, payment arrangements | Understand the problem, agree a plan |
| Bucket 3 | Formal notices, **forbearance** (reduced payments, payment holidays, term extension), vulnerability assessment | Keep the customer out of default where sustainable |
| Default and charge-off | Formal demand, card closure, debt collection agency, litigation, repossession for secured loans, **debt sale** to specialist buyers | Maximise recovery fairly |

**Self-cure** is important: many bucket 1 customers simply forgot and will pay anyway. Collections scores identify them so the bank does not waste effort (or annoy good customers) chasing them, and puts agents on the accounts most likely to roll forward.

**Secured recoveries** differ. For a mortgage, the bank can seek possession of the house, but this is slow (months to years, depending on the country's courts), regulated, and a last resort. For car finance, the lender can repossess the car, though in some countries it needs a court order once a certain share of the debt has been paid. The sale proceeds minus costs, compared with the debt, determine the LGD. [[16 Problem Loans, Restructuring and Recovery]] covers forbearance and recovery in depth.

**Debt sale.** Banks often sell charged-off unsecured debt to specialist buyers for a fraction of its face value (perhaps 5 to 20 pence in the pound, illustratively, depending on age and quality). The price becomes a direct input to LGD.

## Fraud loss versus credit loss

Not every unpaid loan is a credit loss. The distinction matters because the cause, the owner, the fix and the accounting are all different.

| Type | What happened | Example | Who usually owns it |
|---|---|---|---|
| **Credit loss** | A genuine customer borrowed in good faith and could not pay | Job loss leads to default | Credit risk |
| **First-party fraud** | A real person borrowed with no intention to repay | "Bust-out": builds a good record, maxes every card, disappears | Fraud team (often reported with credit losses, debated) |
| **Third-party fraud** | Someone used a stolen or fake identity | Loan taken out in a victim's name | Fraud team; operational risk |
| **Synthetic identity fraud** | A made-up person built from real and fake details | A new "customer" who never existed | Fraud team |

Why the line matters for a platform lead:

- **Models.** If fraud losses are labelled as credit defaults, the credit scorecard learns to predict fraud badly and credit badly. Development data must flag and exclude or separate fraud.
- **Capital.** Fraud is usually **operational risk** for regulatory capital, not credit risk, although some first-party fraud is treated as credit loss depending on bank policy and regulator. The rules vary; the important thing is consistency.
- **Customers.** A victim of identity fraud must not be chased for the debt or have their credit file damaged.

## Responsible lending and conduct

Retail customers are not professionals, and the law in most countries expects lenders to protect them. This is called **conduct risk**: the risk of harming customers through how products are designed, sold and serviced. Specific rules differ widely by country, but the principles are broadly shared.

| Principle | What it means in practice |
|---|---|
| **Affordability** | Lend only what the customer can repay without hardship, considering income, spending and other debts, not just whether the bank will get its money back (a person can repay you by selling their house and still have been harmed) |
| **Vulnerable customers** | Identify customers whose circumstances (illness, bereavement, low financial capability, addiction, domestic abuse) make them more likely to be harmed, and adapt treatment |
| **Fair treatment and fair outcomes** | Products give value for money; customers understand what they are buying; complaints are handled fairly |
| **Transparency** | Clear disclosure of the annual percentage rate (APR), total cost, fees and risks before signing |
| **Non-discrimination** | Decisions must not discriminate on protected characteristics such as race, sex or religion, even indirectly through variables that act as proxies. In some countries (the United States in particular) fair lending law is very prescriptive |
| **Forbearance in hardship** | Customers in difficulty should be offered reasonable help before enforcement |
| **Explainability** | Customers can find out why they were declined, and automated decisions can be challenged in some jurisdictions |

Conduct rules bite directly on the platform. Affordability calculations must be documented and reproducible. Scorecards and machine learning models must be tested for bias. Vulnerability flags must flow from collections systems to the decision engine so a vulnerable customer is not offered a limit increase. Several countries have seen banks pay billions in redress for mis-selling or unfair practices, often years after the event, and the evidence came from (or was missing from) the bank's data.

## Retail under Basel

[[18 Regulatory Capital and Basel - the Short Version]] and [[basel-credit-risk-explained-simply]] explain capital in general. The retail-specific points are below; exact percentages here follow the Basel framework, and national implementations can differ.

### Standardised approach

| Class | What qualifies | Risk weight |
|---|---|---|
| **Regulatory retail** | Exposures to individuals or small businesses; a product type such as cards, overdrafts, personal loans; total exposure to one counterparty no more than 1 million euros; part of a granular (well-diversified) pool | **75%** |
| **Transactor exposures** (within regulatory retail) | Cards and overdrafts repaid in full each month over the past year | 45% |
| **Other retail** | Retail that fails the regulatory retail tests | 100% |
| **Residential real estate** | Loans secured on homes, meeting legal, valuation and underwriting criteria | Depends on LTV: lower weights for low LTV, rising with LTV; higher weights again where repayment depends on rental income from the property |

The **75% weight** is lower than the 100% for an unrated corporate, because a granular pool of small loans is diversified even if each borrower is quite risky. Mortgages get lower weights still because the house protects the bank. The decision tree in [[basel-credit-risk-decision-tree]] shows how an exposure is assigned to a class.

### The internal ratings-based approach for retail

Under the **internal ratings-based (IRB)** approach, banks estimate risk themselves using their own models. Retail IRB has three features that differ from corporate IRB:

1. **Pooling.** Rather than rating each borrower, banks assign exposures to **pools** of similar risk (by score band, product, delinquency status, LTV and so on) and estimate PD, LGD and EAD for each pool. This mirrors how retail is managed day to day.
2. **Own estimates of everything.** For retail there is no "foundation" version; a bank using IRB for retail estimates all three parameters itself.
3. **Three sub-classes with different formulas.** Each has a fixed **asset correlation** (how much borrowers are assumed to suffer together in a downturn) built into the capital formula:

| IRB retail sub-class | What it covers | Correlation idea |
|---|---|---|
| **Residential mortgages** | Owner-occupied home loans | Relatively high, fixed, because house prices and the economy hit all borrowers together |
| **Qualifying revolving retail exposures (QRRE)** | Unsecured revolving lines to individuals (cards, overdrafts) up to a size limit, with low volatility of loss rates | Low, because card losses are driven more by individual circumstances |
| **Other retail** | Personal loans, car finance, small business retail | Varies with PD |

Retail IRB also has **floors** on PD and LGD (minimum values a bank's estimates cannot go below) and, since the final Basel III reforms, an **output floor** that limits how far IRB capital can fall below standardised capital across the whole bank. [[10 Internal Ratings, Scorecards and PD Models]] covers how the pools and models are built.

## How retail differs from corporate

| Dimension | Retail | Corporate |
|---|---|---|
| **Number of borrowers** | Millions | Hundreds to thousands |
| **Typical exposure** | Hundreds to hundreds of thousands | Millions to billions |
| **Data volumes** | Very high: monthly snapshots of millions of accounts, daily transactions, bureau refreshes | Lower volume but richer, unstructured (financial statements, credit papers) |
| **Defaults in history** | Thousands a month, so models can be statistical | Few, so models lean on expert judgement and external data ([[10 Internal Ratings, Scorecards and PD Models]]) |
| **Models** | Many: separate application, behavioural, collections, fraud, affordability, PD, LGD, EAD models by product | Fewer rating models covering segments |
| **Decision-making** | Automated, seconds, by strategy | Human analysis, committees, days to weeks ([[03 The Credit Lifecycle]]) |
| **Approval authority** | Delegated to the strategy; humans approve strategy changes | Delegated to people by deal size ([[13 Credit Governance - Committees, Authorities and the Three Lines]]) |
| **Monitoring** | Portfolio dashboards, roll rates, vintages ([[15 Monitoring, Early Warning and Watchlist]]) | Annual reviews, covenants, watchlists by name |
| **Governance focus** | Strategy change control, model monitoring, conduct and fairness | Credit papers, limits, concentration |
| **Conduct regulation** | Heavy | Light (professional counterparties) |
| **Main risk driver** | The economy (unemployment, interest rates, house prices) | Borrower-specific business performance and sector |

## Common mistakes and misunderstandings

- **"The credit score decides."** The strategy decides. The score is one input, alongside policy rules, affordability, fraud checks and limit logic. Changing a cut-off by ten points can be a bigger risk decision than any single corporate loan.
- **"A low default rate means good lending."** Not if the book is young. Growth masks losses because new loans have not had time to go bad. Always look at vintages.
- **"Secured means no loss."** Mortgages default less and lose less, but negative equity, slow repossession, forced-sale discounts and legal costs all produce losses, and conduct rules may limit enforcement.
- **"Undrawn card limits are not exposure."** Customers in trouble use their available limit before defaulting. EAD on cards is often well above the balance a few months before default.
- **"Retail is diversified, so it is safe."** It is diversified against individual bad luck, not against a recession. Every borrower shares the same economy.
- **"Bucket 1 customers are in trouble."** Many simply forgot. Treating them all as distressed wastes money and upsets good customers. Collections scoring exists to tell them apart.
- **"Fraud and credit loss are the same thing because the money is gone either way."** They need different models, different teams, different capital treatment and different customer treatment.
- **"If the customer repaid, the lending was fine."** Under responsible lending rules, a loan the customer could only repay by falling behind on other bills or selling their home may still be a regulatory failure.
- **"Days past due is a simple number."** It depends on how partial payments, small arrears tolerances, payment holidays, and restructured schedules are treated. Two systems can report different DPD for the same account.
- **"Champion-challenger is just A/B testing."** It is, but it needs a long wait (months) to see outcomes, careful randomisation, a fair-treatment review of the challenger, and a record of who got which strategy.

## What a platform lead needs to know about this

**Data volumes and shape.** Retail risk runs on **monthly account-level snapshots**: one row per account per month, with balance, limit, DPD, bucket, scores, product, segment, and flags (forbearance, fraud, vulnerability, deceased, bankrupt). Five million accounts over ten years is six hundred million rows before you add transactions. History is the asset: vintage, roll-rate, model build and IRB estimation all need long, consistent, unbroken time series. Never let a system migration lose or redefine history without a mapping.

**Systems you will meet.**

| System | What it holds | Risk dependency |
|---|---|---|
| Origination platform and **decision engine** | Applications, bureau responses, scores, decisions, reason codes, strategy version, champion-challenger assignment | Audit trail of every decision; data for scorecard rebuilds and reject inference |
| **Bureau interfaces** | Raw bureau reports and archived copies | Model development, regulatory challenge, customer disputes; storage and retention rules apply |
| Core banking and **card processing** platforms (often a third-party processor) | Balances, transactions, statements, payments | Source of DPD and utilisation |
| **Collections system** | Contacts, promises to pay, arrangements, forbearance, vulnerability flags | Cure rates, forbearance reporting, conduct |
| Recoveries and debt sale records | Charge-offs, recoveries, sale prices | LGD estimation |
| Fraud systems | Fraud flags and confirmed fraud cases | Excluding fraud from credit models; operational risk reporting |
| Risk data mart or lake | Monthly snapshots, segments, scores | Everything downstream: provisions, capital, stress tests, management information |

**Controls.** Strategy changes must go through **change control** as strictly as code: who requested, who approved, what was tested, when it went live, and the ability to replay any past decision with the strategy that was live at the time. Monitor approval rates, score distributions and referral rates daily, because a broken bureau feed or a mis-mapped field can silently approve or decline thousands. Keep a single, documented **definition of default** and DPD calculation, used consistently by collections, provisioning ([[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]]) and capital ([[18 Regulatory Capital and Basel - the Short Version]]). Monitor every scorecard for stability and discrimination power each month, as [[21 Model Risk Management and Validation]] describes. Test models and strategies for unfair bias.

**Who owns what.** The business (product owners for mortgages, cards, loans) owns the customer proposition and volume targets. Credit risk strategy teams (first line in many banks) own scorecard use, cut-offs and strategies. Second-line credit risk sets policy and appetite, and approves material strategy changes. Model development builds the scorecards; model validation challenges them. Collections operations owns the treatment paths. Conduct and compliance own fair treatment rules. Fraud owns fraud models. Data and technology (often your team) own the pipelines, the decision engine platform, the snapshot history and the lineage that connects them, which is what [[22 Credit Risk Data, Systems and BCBS 239]] is about. Management information on all of this is covered in [[23 Reporting - Regulatory Returns, Pillar 3 and Management Information]].

**The questions you will be asked.** Why was this customer declined, and can we prove it? What would happen to losses if we lowered the cut-off by 20 points? Are 2025 vintages worse than 2024? How many accounts are in persistent debt? Your platform should answer each from data, not from someone's spreadsheet.

## Related notes

- [[00 Start Here]]
- [[01 What a Bank Is and How It Makes Money]]
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
