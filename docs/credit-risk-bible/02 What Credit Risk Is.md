# What Credit Risk Is

**Why this matters to you.** Credit risk is the reason your team exists and the biggest single risk for almost every ordinary bank. Every model your platform runs, every report it produces and every regulatory inspection it survives comes back to one question: how much money might the bank lose because people do not pay it back? This note gives you the vocabulary (default, probability of default, loss given default, exposure at default, expected and unexpected loss), shows how those ideas turn into provisions on the income statement and capital on the balance sheet, and separates credit risk from its cousins (market, operational, liquidity and concentration risk) so you can follow the conversations around you.

## Table of contents

1. [The borrowed bike version](#the-borrowed-bike-version)
2. [A definition that actually works](#a-definition-that-actually-works)
3. [Default: the moment the risk becomes a loss](#default-the-moment-the-risk-becomes-a-loss)
4. [The three ingredients: PD, LGD and EAD](#the-three-ingredients-pd-lgd-and-ead)
5. [Expected loss versus unexpected loss](#expected-loss-versus-unexpected-loss)
6. [How credit risk shows up in the accounts: provisions and capital](#how-credit-risk-shows-up-in-the-accounts-provisions-and-capital)
7. [Credit risk and its cousins](#credit-risk-and-its-cousins)
8. [Flavours of credit risk: borrower, issuer, counterparty, settlement](#flavours-of-credit-risk-borrower-issuer-counterparty-settlement)
9. [Concentration: the risk of too many eggs in one basket](#concentration-the-risk-of-too-many-eggs-in-one-basket)
10. [Credit spread: the price of risk](#credit-spread-the-price-of-risk)
11. [A short history of famous credit losses](#a-short-history-of-famous-credit-losses)
12. [A worked example from a single loan to a whole book](#a-worked-example-from-a-single-loan-to-a-whole-book)
13. [Common mistakes and misunderstandings](#common-mistakes-and-misunderstandings)
14. [What a platform lead needs to know about this](#what-a-platform-lead-needs-to-know-about-this)
15. [Related notes](#related-notes)

## The borrowed bike version

You lend your bike to a friend for the weekend. Three things could go wrong. They might not bring it back at all. They might bring it back with a bent wheel, so you get something but not everything. Or they might bring it back late, which is annoying but not a loss. Before you lend it, you weigh up who the friend is (have they lost things before?), what the bike is worth, and whether you could get it back from their parents if they vanished.

That is the whole of credit risk in miniature:

- "Will they bring it back?" is the **probability of default**.
- "If they do not, how much do I lose?" is the **loss given default**.
- "What is at stake?" is the **exposure at default**.
- "Could I get it from their parents?" is **collateral and guarantees**.
- Lending bikes to ten friends instead of one is **diversification**; lending all ten bikes to the same family is **concentration**.

The banking version adds precision, data and regulation, but the logic never changes.

## A definition that actually works

**Credit risk is the risk of loss because a borrower, issuer or counterparty fails to meet its obligations in full and on time.** Unpack the words:

- **Loss.** Not just "they paid late." Real money gone, or expected to be gone.
- **Borrower, issuer or counterparty.** Three ways to be owed money. A borrower took a loan. An issuer sold you a bond. A counterparty is the other side of a trade. The section on flavours covers the differences.
- **Fails to meet obligations.** Repayment of principal, payment of interest, honouring a contract. Failure can be inability (they ran out of money) or unwillingness (they chose not to pay).
- **In full and on time.** Partial or late payment is a credit event too, even if the money eventually arrives.

A broader definition, which practitioners also use, includes **deterioration** as well as outright failure: a loan to a company whose fortunes are sliding is worth less today even if it is still paying. Accounting rules and pricing both recognise this, so credit risk is not only the risk of default; it is also the risk of things getting worse.

## Default: the moment the risk becomes a loss

**Default** is the formal word for "they have failed to pay." Because so much depends on it (provisions, capital, which team handles the loan, what the regulator is told), banks need a precise definition rather than a feeling. The international standard, used in the Basel rules and copied into most national regulation and accounting practice, has two triggers. A borrower is in default when **either** happens:

1. **90 days past due.** The borrower is more than 90 days late on a material payment. (Some countries and some products use different thresholds, and "material" has its own thresholds, so check your local rulebook. For some retail products 180 days has historically been used.)
2. **Unlikeliness to pay.** The bank judges that the borrower is unlikely to pay in full without the bank taking action such as seizing collateral, even if no payment is late yet. Signs include the bank putting the loan on non-accrued status, a distressed restructuring, the borrower filing for bankruptcy, or the bank selling the loan at a big loss.

The second trigger matters because waiting for 90 days is waiting too long. A company that has announced it cannot pay its suppliers and has called in insolvency advisers is in trouble today, not in three months.

Some related words:

| Term | Meaning |
|---|---|
| **Arrears / delinquency / past due** | A payment is late. Counted in days past due (**DPD**). Not yet default until it crosses the threshold. |
| **Non-performing loan (NPL)** | A loan in default or close to it. Regulators publish NPL ratios for whole banking systems. |
| **Forbearance** | The bank changes the terms (lower payments, a payment holiday) because the borrower is struggling. Can be a sign of default if the change is a concession the bank would not otherwise give. |
| **Cure** | A defaulted borrower gets back to paying normally and, after a probation period, leaves default. |
| **Write-off / charge-off** | The bank gives up on recovering the amount and removes it from the balance sheet. The loss is final. |
| **Recovery** | Money the bank gets back after default, from the borrower, from selling collateral, or from a guarantor. |

The default definition is also a data definition. Every system in the bank must flag default consistently, on the same day, using the same rules, or the bank's numbers will not reconcile. Regulators have spent years forcing banks to harmonise this, and it is one of the topics most likely to produce a finding against a platform. See [[16 Problem Loans, Restructuring and Recovery]] for what happens after default and [[15 Monitoring, Early Warning and Watchlist]] for spotting it early.

## The three ingredients: PD, LGD and EAD

Whether you are a credit officer looking at one company or a model scoring a million credit cards, the risk of a loan always decomposes into three questions.

### How likely? Probability of default (PD)

**Probability of default** (**PD**) is the chance that the borrower defaults within a set period, almost always one year. A PD of 2% means that, out of 100 borrowers like this one, about 2 will default in the next twelve months.

PD comes from grading the borrower. For companies this is an **internal rating**, a grade on a scale (for example 1 to 20) produced by a mix of financial analysis and judgement, mapped to a PD. For retail it is a **score** from a statistical scorecard. External rating agencies (Moody's, S&P, Fitch) do the same thing for public companies and governments on scales like AAA down to D. All of this is covered in [[10 Internal Ratings, Scorecards and PD Models]] and [[09 Credit Analysis - Reading a Borrower]].

Rough feel for the scale (illustrative, varies by bank and cycle):

| Grade (agency style) | Who | Approximate one-year PD |
|---|---|---|
| AAA to AA | Strong governments, a handful of giant companies | Well under 0.1% |
| A to BBB ("investment grade") | Most large, established companies | 0.1% to 0.5% |
| BB to B ("high yield" or "sub-investment grade") | Smaller, more indebted or cyclical companies | 1% to 8% |
| CCC and below | Companies in distress | 20% and up |

### How bad? Loss given default (LGD)

**Loss given default** (**LGD**) is the share of the exposure the bank loses if default happens, after everything it manages to recover. An LGD of 40% means the bank loses 40 cents in the dollar and recovers 60.

LGD depends mostly on:

- **Collateral.** A mortgage backed by a house usually has low LGD because the house can be sold. An unsecured credit card has high LGD because there is nothing to sell. See [[11 Collateral and Security]].
- **Seniority.** Whether the bank is first or last in the queue when the borrower's assets are shared out. Senior secured lenders recover most; subordinated lenders recover least.
- **Guarantees.** A parent company or government standing behind the borrower.
- **Legal system and time.** Recovering through courts in some countries takes years, and money recovered in five years is worth less than money recovered now. LGD is measured after discounting and after the costs of recovery.
- **The economic cycle.** In a recession, house prices and company asset values fall exactly when defaults rise. Regulators require banks to estimate a "downturn LGD" for this reason.

Illustrative LGD ranges:

| Exposure | Typical LGD |
|---|---|
| Residential mortgage, modest loan-to-value | 10% to 25% |
| Senior secured corporate loan | 25% to 45% |
| Senior unsecured corporate loan | 40% to 60% |
| Subordinated debt | 60% to 90% |
| Unsecured retail (cards, personal loans) | 60% to 90% |

### How much? Exposure at default (EAD)

**Exposure at default** (**EAD**) is how much would be owed at the moment of default. For a plain term loan it is simply the outstanding balance. It gets harder for:

- **Revolving facilities** (credit cards, overdrafts, corporate credit lines). The borrower can draw more at any time, and struggling borrowers tend to draw everything they can right before they fail. EAD must therefore include an estimate of how much of the undrawn limit will be drawn, called a **credit conversion factor** (**CCF**). A 1 million line with 400,000 drawn and a 50% CCF on the undrawn part has an EAD of 400,000 + 50% x 600,000 = 700,000.
- **Guarantees and letters of credit.** Nothing is drawn today, but the bank may have to pay the full amount.
- **Derivatives.** The amount owed changes every day with market prices. Covered in [[19 Counterparty Credit Risk and Derivatives]].

Together, PD, LGD and EAD are the three numbers every credit risk system is ultimately trying to produce for every exposure, every month. Maturity (how long the loan lasts) is sometimes treated as a fourth, because more time means more chances for things to go wrong.

## Expected loss versus unexpected loss

![[02-expected-unexpected-loss.svg]]
*The three ingredients multiply to give expected loss, the normal cost of lending, which is covered by provisions and pricing. The bad year, well above the average, is unexpected loss, which is what capital is for. Beyond capital lies failure.*

Multiply the three ingredients and you get the **expected loss** (**EL**):

> Expected loss = PD x LGD x EAD

A 1,000 loan with a 2% PD and a 40% LGD has an expected loss of 0.02 x 0.40 x 1,000 = 8 a year. That is not a disaster. It is the ordinary, budgeted cost of being in the lending business, like a shop budgeting for a certain amount of breakage. The bank charges for it in the interest rate (the credit spread, covered below) and sets money aside for it in provisions.

But averages are not what kill banks. In an ordinary year 2 borrowers in 100 default. In a bad year it might be 8. The difference between the average year and the bad year is **unexpected loss** (**UL**). Nobody can budget for it in the price, because you do not know which year it will be. So instead the bank holds a cushion of its own money, **capital**, big enough to absorb a bad year without failing. How big is "big enough" is exactly what the Basel capital rules decide: they size capital to cover losses up to a very bad year (statistically, roughly the worst year in a thousand). [[18 Regulatory Capital and Basel - the Short Version]] and [[basel-credit-risk-explained-simply]] walk through the calculation.

The sorting rule to remember:

| Kind of loss | Who pays for it | Where it lives |
|---|---|---|
| Expected loss (the average year) | The borrowers, through the interest margin; recognised in advance as provisions | Income statement (impairment charge) and balance sheet (provision deducted from loans) |
| Unexpected loss (the bad year) | The shareholders, through the capital cushion | Balance sheet (equity), sized by risk-weighted assets |
| Beyond capital (the catastrophe) | Depositors, deposit insurance, taxpayers, or bondholders through "bail-in" | Bank failure and resolution |

One subtlety: expected loss on a single loan is a smooth number (8 a year), but the real outcome on a single loan is lumpy: usually zero, occasionally the whole thing. Expected loss only becomes a smooth, predictable cost across a large portfolio. That is why retail banks, with millions of small loans, can treat credit losses almost like a utility bill, while a bank with twenty huge corporate loans cannot. [[05 Retail Lending]] and [[04 Commercial and Corporate Lending]] explore this difference.

## How credit risk shows up in the accounts: provisions and capital

Credit risk is invisible until it is turned into numbers in two places.

**Provisions** (also called **impairment allowances** or **expected credit loss allowances**). Each reporting date, the bank estimates how much of its loan book it expects to lose and books that amount as a provision. The provision reduces the value of the loans on the balance sheet, and the change in the provision from last period is the **impairment charge** on the income statement. Modern accounting rules (**IFRS 9** internationally and **CECL**, current expected credit loss, in the United States) require provisions to be forward-looking and to recognise expected losses before any payment is missed, with bigger provisions once a loan has shown a significant increase in risk. The mechanics are in [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]]. The practical point: your team's PD, LGD and EAD models directly drive a line on the published accounts.

**Capital.** Separately, the bank must hold regulatory capital against unexpected loss. The amount is a percentage of **risk-weighted assets** (**RWA**), where each exposure is multiplied by a risk weight reflecting its riskiness. Under the simpler **standardised approach**, risk weights come from a rulebook table. Under the **internal ratings-based** (**IRB**) approach, the bank's own PD, LGD and EAD estimates go into a regulatory formula. Either way, riskier lending means higher RWA, higher capital, and therefore a more expensive loan for the bank to carry. [[24 Pricing, RAROC and Return on Capital]] explains how that feeds back into pricing.

Provisions and capital are two views of the same loss distribution, cut at different points: provisions cover the expected part, capital covers the unexpected part. Under IRB, the regulator checks that provisions at least cover expected loss and, if they fall short, deducts the shortfall from capital, so a bank cannot dodge the cost by under-provisioning.

## Credit risk and its cousins

![[02-risk-taxonomy.svg]]
*A taxonomy of the risks a bank faces. Credit risk is one of several, and itself has several flavours depending on how the bank came to be owed money.*

Banks run into trouble in many ways, and the risk function is organised around them. Knowing the boundaries stops you solving the wrong problem.

| Risk | One-line definition | Example | Who owns it |
|---|---|---|---|
| **Credit risk** | Someone we lent to or dealt with does not pay | A borrower defaults on a mortgage | Credit risk |
| **Market risk** | Prices or rates move against positions we hold | A bond the trading desk holds falls in price because interest rates rose, though the issuer is fine | Market risk |
| **Operational risk** | Loss from failed people, processes, systems, or external events | A payments system outage, a rogue trader, a cyber attack, a regulatory fine | Operational risk |
| **Liquidity risk** | We cannot find cash on the day we need it | A run on deposits | Treasury and liquidity risk |
| **Interest rate risk in the banking book** | The gap between what we pay on deposits and earn on loans squeezes as rates move | Fixed-rate mortgages funded by floating-rate deposits when rates rise | Treasury and market risk |
| **Concentration risk** | Too much exposure to one name, sector, country or collateral type | Half the loan book is commercial property in one city | Credit risk and portfolio management |
| **Model risk** | A model is wrong or misused | A PD model trained on boom years underestimates risk in a bust | Model risk management |
| **Conduct and compliance risk** | We treat customers unfairly or break the rules | Mis-selling, lending that was not affordable, breaching sanctions | Compliance |
| **Strategic and reputational risk** | The business plan fails or the bank's name is damaged | A scandal drives customers away | Executive and board |

The boundaries are blurry at the edges, and that blur matters:

- A bond falling in price because the **issuer's creditworthiness** worsened is credit risk (specifically credit spread risk). The same bond falling because **all interest rates** rose is market risk. In the trading book, both are measured by market risk; in the banking book, the credit part is measured by credit risk.
- A loan that defaults because the bank's **own staff** approved it fraudulently is an operational risk event that shows up as a credit loss.
- A wave of defaults can create **liquidity risk** if it scares depositors.

Regulators measure credit, market and operational risk separately in the capital rules ("Pillar 1"), and concentration, interest rate and the rest in the supervisor's judgement layer ("Pillar 2"). See [[20 Stress Testing and ICAAP]].

## Flavours of credit risk: borrower, issuer, counterparty, settlement

Credit risk has several flavours depending on **how** the bank came to be owed money. They are measured differently and often managed by different teams, so the words are worth learning.

### Borrower risk

The classic case. The bank made a loan; the borrower may not repay. This is the subject of most of this vault: [[03 The Credit Lifecycle]], [[04 Commercial and Corporate Lending]], [[05 Retail Lending]] and so on. The exposure is the loan balance plus any undrawn commitment. The risk lasts for the life of the loan.

### Issuer risk

The bank bought a bond. The **issuer** (the government or company that sold the bond) may not pay the coupons or the principal. Economically this is borrower risk, but with differences: the bond is tradeable, so the bank can sell it if it gets nervous (at a loss); the issuer usually has a public rating; and the exposure can sit in the trading book as well as the banking book. Issuer risk on government bonds is called **sovereign risk**, covered in [[26 Sovereign, Bank and Country Risk]].

### Counterparty risk

The bank entered a two-way contract, typically a **derivative** (a swap, a forward, an option) or a **securities financing transaction** (a repo). Nobody has lent anybody anything on day one. But as markets move, the contract becomes worth money to one side. If the side that is losing goes bust, the winning side does not get paid. The exposure is therefore not a fixed loan balance but a moving, uncertain amount that could be zero or large. This is **counterparty credit risk** (**CCR**), sometimes called **pre-settlement risk** because it is the risk during the life of the contract. It needs its own measurement machinery (replacement cost, potential future exposure, netting, collateral), covered in [[19 Counterparty Credit Risk and Derivatives]].

### Settlement risk

Every trade ends with a hand-over: we pay cash, they deliver securities or the other currency. If the two halves do not happen at the same instant, there is a window where we have paid and they have not yet delivered. If they fail inside that window, we lose the whole amount. This is **settlement risk**, nicknamed **Herstatt risk** after a German bank closed by regulators in 1974 in the middle of the trading day, after it had received one side of its currency trades but before paying the other. The cure is to make both halves happen together (**delivery versus payment** for securities, **payment versus payment** for currencies). Settlement risk is short-lived (hours or days) but can be enormous, because it is the full principal.

| Flavour | How the bank is owed | Size of exposure | Lasts | Measured by |
|---|---|---|---|---|
| Borrower | Made a loan | Balance plus undrawn | Life of loan, years | Loan balance, CCF |
| Issuer | Bought a bond | Bond value | Until sold or matures | Market value, rating |
| Counterparty | Two-way contract | Moving, could be zero | Life of contract | Replacement cost plus future exposure |
| Settlement | Mid-trade hand-over | Full principal | Hours to days | Gross amount in flight |

## Concentration: the risk of too many eggs in one basket

Suppose two banks each have 1,000 of loans with an average PD of 2%. Bank A has lent 1 each to 1,000 different households across the country. Bank B has lent 500 each to two property developers in the same town. The expected loss is the same (20 a year). The unexpected loss is wildly different. Bank A will lose about 20 every year with small wobbles. Bank B will lose nothing in most years and 500 or 1,000 in the year the town's property market crashes.

That is **concentration risk**: the risk that losses cluster because exposures share a common cause. The main kinds:

- **Single name**: one borrower or group of connected borrowers (a parent and its subsidiaries) is too large relative to the bank's capital. Regulators cap this through **large exposure** rules (typically no more than a quarter of the bank's Tier 1 capital to one group).
- **Sector**: too much lending to one industry (commercial property, oil and gas, shipping, retail chains).
- **Geography**: one country, region or city.
- **Collateral type**: everything secured on the same kind of asset, so one price fall hits every loan.
- **Product or tenor**: everything maturing in the same year, or everything with the same structural weakness.

Diversification, the opposite of concentration, is the single most powerful tool in credit risk, and it is free. It is why the Basel rules give retail portfolios lower capital per unit of exposure than a corporate loan with the same PD. The bank's board sets concentration limits as part of its **risk appetite**, covered in [[14 Risk Appetite, Limits and Concentration]].

## Credit spread: the price of risk

Why does a company pay 6% on its loan when the government pays 3% on its bonds? The extra 3% is the **credit spread**: the price the market charges for bearing the risk that the company fails. In its simplest form:

> Lending rate = risk-free rate + credit spread + bank's costs and profit

The credit spread should at least cover expected loss. If PD is 2% and LGD 40%, expected loss is 0.8% of the loan per year, so the spread must be at least 0.8% just to break even on losses before costs. It should also pay for the capital tied up against unexpected loss: if a loan requires the bank to hold capital of 8 per 100 lent and shareholders expect a 12% return on that capital, that is another 0.96% per year. Add operating costs and the spread needed is perhaps 2% to 3%. That calculation, properly done, is called risk-adjusted pricing and is in [[24 Pricing, RAROC and Return on Capital]].

The credit spread is also the market's running vote on a borrower's health. When a company's bonds trade at a wider spread, the market thinks it has become riskier. When a whole country's spreads widen at once, the market is pricing a recession. Credit risk teams watch spreads as an early warning signal, and the **credit default swap** (**CDS**) market, where you can buy insurance against a named borrower's default, gives a daily spread for thousands of names.

A spread that is too thin for the risk is the most common way banks get into trouble in good times: competition drives prices down, the expected loss is still quietly there, and the bank is lending at a loss without noticing until the cycle turns.

## A short history of famous credit losses

Credit losses are not theoretical. A few episodes everyone in the industry knows:

**The 2007 to 2009 subprime crisis.** American lenders made mortgages to borrowers with weak credit ("subprime"), often with low teaser rates and little checking of income, on the assumption that rising house prices would always allow refinancing. Those mortgages were packaged into securities (securitisation), sliced into tranches, rated AAA by rating agencies, and bought by banks worldwide with very little capital held against them. When house prices fell, defaults rose far beyond the models' assumptions, the AAA slices turned out to be anything but, and losses spread through the global banking system. Several large institutions failed or were rescued, and the Basel III rules (higher capital, a leverage ratio, liquidity rules, tougher securitisation treatment) are a direct response. It is the reason every credit model is now asked "what happens in a downturn?" and why concentration in one asset class is treated so seriously.

**Sovereign default: Argentina 2001 and Greece 2012.** Governments can default too. Argentina stopped paying on around 100 billion dollars of debt in 2001, the largest sovereign default at the time, after a currency crisis. Greece restructured its debt in 2012, imposing losses of over half on private bondholders, including many European banks that had treated government bonds as risk-free. The lesson: sovereign bonds carry credit risk, especially in a currency the government does not control, and "zero risk weight" in a rulebook is not the same as zero risk. See [[26 Sovereign, Bank and Country Risk]].

**Corporate collapse: Enron 2001 and Carillion 2018.** Enron, an American energy company, hid debt in off-balance sheet vehicles and collapsed from an investment-grade rating to bankruptcy in a few months, leaving banks with billions of unpaid loans and derivatives. Carillion, a large British construction and services company, collapsed in 2018 with around 1.5 billion pounds of debt after years of thin margins, aggressive accounting and a growing pile of trade creditors. In both cases the warning signs (complex structures, cash flow that did not match reported profit, growing reliance on short-term funding) were visible to anyone reading carefully. [[09 Credit Analysis - Reading a Borrower]] is about reading carefully.

**Counterparty failure: Lehman Brothers 2008 and Archegos 2021.** Lehman's bankruptcy left thousands of counterparties with derivative contracts worth money that were never paid, which is why central clearing and collateral rules were tightened. Archegos, a family investment office, built huge concentrated equity positions through derivatives with several banks, none of which could see the others' exposure; when the shares fell, the banks lost around 10 billion dollars between them. The lesson for your team: counterparty exposure must be aggregated across products and legal entities, and a single client's exposure at one bank is not the whole story.

## A worked example from a single loan to a whole book

**One loan.** A bank lends 500,000 to a restaurant group. Internal rating implies a one-year PD of 3%. The loan is secured on the restaurant premises, valued at 400,000, and the bank's LGD model gives 35%. The loan is fully drawn, so EAD is 500,000.

- Expected loss = 0.03 x 0.35 x 500,000 = 5,250 per year.
- The bank's pricing needs to cover that 5,250, plus the cost of capital, plus operating costs. Say the rulebook formula requires capital of 7% of the loan, 35,000, and shareholders want a 12% return on it: 4,200. Operating cost of serving the loan: 2,500. Total cost of risk and service: about 11,950, or 2.4% of the loan. If the bank can fund itself at 3%, it needs to charge at least 5.4% to break even and more to make a profit. It charges 6.5%.
- On day one, under IFRS 9, the bank books a provision roughly equal to one year's expected loss, 5,250 ("stage 1"). This appears as an impairment charge on the income statement in the month the loan is made, even though nothing has gone wrong.

**Two years later.** The restaurant group misses a rent payment to its landlord and its sales are falling. The rating is downgraded; PD is now 12%. Under IFRS 9 this is a significant increase in credit risk, so the loan moves to "stage 2" and the provision must cover expected losses over the whole remaining life, not just one year. Say that is 0.12 x 0.35 x 480,000 (the balance has amortised a little) across three remaining years, roughly 50,000 after some discounting. The impairment charge this quarter is the increase from 5,250 to about 50,000. The loan goes on the watchlist ([[15 Monitoring, Early Warning and Watchlist]]).

**Default.** Six months later the group stops paying the bank. At 90 days past due it is in default, "stage 3". The bank now estimates the actual loss on this loan: it expects to sell the premises for 320,000 after costs and a long sale, so it will lose 160,000 of the 480,000 owed. The provision rises to 160,000. The workout team takes over ([[16 Problem Loans, Restructuring and Recovery]]).

**The whole book.** The same bank has 2,000 such loans averaging 500,000, so 1 billion of SME exposure. Average PD 3%, average LGD 35%: expected loss about 10.5 million a year, which is what the impairment charge should look like in a normal year. In a recession, PD might double to 6% and LGD rise to 45% as property prices fall: expected loss 27 million. The difference of 16.5 million is the unexpected loss the bank's capital has to absorb. If this portfolio carries risk-weighted assets of, say, 800 million and the bank holds 10% capital against them, that is 80 million of capital, enough to absorb several recession years. That comfort is exactly what the Basel calculation is designed to provide.

## Common mistakes and misunderstandings

- **"Credit risk is the risk of default."** It is the risk of loss, which includes deterioration before default. A loan that is downgraded has already cost the bank money in provisions and capital.
- **"Expected loss is a bad thing."** Expected loss is a cost of doing business, priced into the loan. The job is not to drive it to zero (that means not lending) but to know it, price for it, and avoid surprises.
- **"Capital covers losses."** Capital covers unexpected losses. Expected losses are covered by provisions and the margin. If a bank is using capital to absorb ordinary, predictable losses, it has under-priced or under-provisioned.
- **"Low PD means safe."** A 0.1% PD on a single 500 million exposure is still an expected loss of 500,000 a year and an unexpected loss of 500 million. Size and concentration matter as much as probability.
- **"Collateral removes credit risk."** Collateral reduces LGD; it does not change PD, and its value tends to fall exactly when it is needed. Banks that lent on collateral value alone, ignoring whether the borrower could pay, have failed repeatedly.
- **"A rating is a prediction about one borrower."** A PD is a frequency across many similar borrowers. One borrower either defaults or does not. Ratings are useful because of the law of large numbers, not because they foresee any individual fate.
- **"Government bonds are risk-free."** Ask a holder of Greek bonds in 2012.
- **"Market risk and credit risk are separate departments, so they are separate problems."** The same bond can lose value for either reason, counterparty risk sits on the trading book, and a credit crisis becomes a liquidity crisis within days.
- **"Default is 90 days past due."** That is one trigger. Unlikeliness to pay is the other and usually fires first for companies. Systems that only check days past due will under-count defaults and fail a regulatory inspection.

## What a platform lead needs to know about this

**Data.** The three ingredients are the core data products of a credit risk platform. Each has a lineage: PD comes from a rating or scoring model fed by financial statements, bureau data and behavioural data; LGD from collateral valuations, seniority, guarantees and historical recovery data; EAD from the core banking balance, limit, and credit conversion factors. Each must be stored per exposure, per reporting date, with the model version that produced it, because auditors and regulators will ask "what was the PD on this loan on 31 March and which model produced it?" and the answer must be retrievable years later.

**The default flag.** The single most important field in credit risk data is the default flag, with its date and its trigger reason (days past due versus unlikeliness to pay). It drives IFRS 9 staging, the regulatory default classification, the move to the workout team, and the historical data every PD model is trained on. If your systems compute it differently (one uses 90 days, one uses 180, one does not capture unlikeliness to pay), every downstream number is wrong. Harmonising the default definition across systems is a multi-year programme at most banks; find out where yours is.

**Systems.** Expect separate engines for rating (corporate), scoring (retail), collateral management, limit management, impairment (IFRS 9 or CECL) and regulatory capital (RWA), plus a data warehouse that feeds them all. The impairment and capital engines consume the same PD, LGD and EAD but with different adjustments (for example, accounting uses point-in-time, forward-looking estimates, while regulatory capital uses through-the-cycle and downturn estimates). Keeping those two views reconciled and explained is a permanent job. [[22 Credit Risk Data, Systems and BCBS 239]] and [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]] cover the detail.

**Controls.** Model outputs feeding published accounts and regulatory capital are subject to model risk management ([[21 Model Risk Management and Validation]]): independent validation before use, ongoing performance monitoring, change control, and documented overrides. The platform needs to support override logging (a credit officer overriding a model's rating must record why), reconciliation between source balances and risk engine balances, and completeness checks (every exposure on the ledger has a PD, LGD and EAD; nothing is missing or duplicated).

**Who owns what.** Credit risk modelling owns the models and their methodology. Credit risk reporting or portfolio management owns the aggregated numbers. Finance owns the ledger balances and the published provision. Operations owns the collateral records. Model validation (independent of modelling) signs off models. The platform team owns the computation environment and the data flows between them, and will be the first call when the numbers do not match.

**Vocabulary to use carefully.** "Exposure" means different things to different teams (drawn balance, limit, EAD, risk-weighted amount). "Loss" can mean provision charge, write-off, or economic loss. When someone asks you for "the exposure to this customer," ask which one they mean. [[28 Master Glossary]] has the definitions.

## Related notes

- [[00 Start Here]]
- [[29 Market Risk]] for market risk, the closest neighbour to credit risk.
- [[01 What a Bank Is and How It Makes Money]]
- [[03 The Credit Lifecycle]]
- [[09 Credit Analysis - Reading a Borrower]]
- [[10 Internal Ratings, Scorecards and PD Models]]
- [[11 Collateral and Security]]
- [[14 Risk Appetite, Limits and Concentration]]
- [[15 Monitoring, Early Warning and Watchlist]]
- [[16 Problem Loans, Restructuring and Recovery]]
- [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]]
- [[18 Regulatory Capital and Basel - the Short Version]]
- [[19 Counterparty Credit Risk and Derivatives]]
- [[24 Pricing, RAROC and Return on Capital]]
- [[26 Sovereign, Bank and Country Risk]]
- [[28 Master Glossary]]
- [[basel-credit-risk-explained-simply]]
- [[basel-credit-risk-decision-tree]]
