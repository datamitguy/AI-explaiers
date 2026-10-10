# Liquidity Risk and Funding

**Why this matters to you.** Banks rarely die because their loans go bad slowly. They die because the cash runs out quickly. A bank can be profitable on Monday and gone by Friday if depositors, other banks and derivative counterparties all want their money at once. That is **liquidity risk**, and it is managed by treasury, not by credit risk. So why is it in your vault? Because the data that drives the biggest liquidity outflows in a crisis is credit data: the undrawn credit lines borrowers will grab, the collateral the bank has promised to post on its derivatives, the clauses that bite when the bank's own rating falls, and the loans already pledged to someone else. Your platform holds much of that data, and the liquidity reporting team will come and ask for it, daily. This note explains liquidity and funding from zero, the two big Basel ratios with worked numbers, and exactly where your world and treasury's meet.

## Table of contents

1. [The pocket money version](#the-pocket-money-version)
2. [Liquidity versus solvency](#liquidity-versus-solvency)
3. [Funding liquidity and market liquidity](#funding-liquidity-and-market-liquidity)
4. [Bank runs, old and new](#bank-runs-old-and-new)
5. [Sources and uses of funding](#sources-and-uses-of-funding)
6. [Treasury and asset liability management](#treasury-and-asset-liability-management)
7. [Funds transfer pricing](#funds-transfer-pricing)
8. [The liquidity coverage ratio](#the-liquidity-coverage-ratio)
9. [The net stable funding ratio](#the-net-stable-funding-ratio)
10. [Intraday liquidity](#intraday-liquidity)
11. [Liquidity stress testing and the contingency funding plan](#liquidity-stress-testing-and-the-contingency-funding-plan)
12. [The ILAAP](#the-ilaap)
13. [Interest rate risk in the banking book, briefly](#interest-rate-risk-in-the-banking-book-briefly)
14. [Where liquidity meets credit risk](#where-liquidity-meets-credit-risk)
15. [Data and systems for liquidity reporting](#data-and-systems-for-liquidity-reporting)
16. [Common mistakes and misunderstandings](#common-mistakes-and-misunderstandings)
17. [What a platform lead needs to know about this](#what-a-platform-lead-needs-to-know-about-this)
18. [Related notes](#related-notes)

## The pocket money version

You look after your class's trip fund. Thirty classmates have each given you 10, so you hold 300. They can ask for it back at any time, but on a normal week only one or two do. Holding 300 in a tin feels wasteful, so you lend 250 to your older cousin, who promises to repay 270 in a year. You keep 50 in the tin.

Then a rumour goes round that your cousin has lost his job, and ten classmates ask for their money back on the same morning. You need 100 and have 50. On paper you are rich, but nobody will give you 100 today for a promise that pays in a year. You can sell the promise cheaply, borrow from your parents, or tell classmates to wait, which makes the other twenty panic too.

That is liquidity risk: not "do I have enough in total?" but "do I have enough **cash today**, for the people who want it **today**?" Everything in this note is a more careful version of that tin, the cousin and the queue.

## Liquidity versus solvency

[[01 What a Bank Is and How It Makes Money]] introduced the two words. Here is the fuller version.

| | Solvency | Liquidity |
|---|---|---|
| The question | Is what I own worth more than what I owe? | Can I pay what falls due today and next week? |
| What protects you | Capital (equity) that absorbs losses | Cash and assets you can sell or borrow against quickly, plus stable funding |
| What kills you | Loan losses greater than capital | Outflows faster than you can raise cash |
| Regulatory measure | Capital ratios on risk-weighted assets (see [[18 Regulatory Capital and Basel - the Short Version]]) | Liquidity coverage ratio and net stable funding ratio (this note) |
| Remedy when short | New capital, retained profit, shrinking risk | Central bank lending, selling or pledging assets, raising deposits |

A family with a 400,000 house and a 100,000 mortgage is very **solvent**, but if the boiler repair costs 3,000 and the current account holds 800, it is **illiquid** until payday. The two problems chase each other in a loop, and that loop turns a bad week into a bank failure.

![[37-liquidity-vs-solvency.svg]]
*Two separate questions, four possible states, and the doom loop that links them: forced asset sales turn a liquidity problem into losses, and rumours of losses turn a solvency worry into a run.*

Central banks lend to banks that are solvent but illiquid, against good collateral. In a fast crisis nobody can be sure which is which, so a bank needs **pre-positioned collateral** (loans the central bank has already reviewed and accepted) long before it needs the money. Those loans are described in your data.

## Funding liquidity and market liquidity

"Liquidity" means two related things.

**Funding liquidity** is the bank's ability to meet its payments as they fall due: to repay deposits, roll over maturing borrowing and fund new loans. It is about the bank itself. The trip fund running dry is a funding liquidity problem.

**Market liquidity** is how easily an asset can be sold quickly without moving its price much. A government bond of a large country can usually be sold in minutes at almost the screen price; a loan to a mid-sized company might take weeks to sell and only at a discount. It is about the asset. Your cousin's promise was illiquid in the market sense.

In short: funding liquidity is "do I have bus fare in my pocket?"; market liquidity is "can I sell my old bike today for close to what it is worth?" They feed each other: forced sellers push prices down, and falling prices cause losses and margin calls that make funding harder still. See also [[29 Market Risk]].

## Bank runs, old and new

A **bank run** is a crowd of creditors trying to get out at once. Because a bank lends long and borrows short (its job, described in [[01 What a Bank Is and How It Makes Money]]), it can never pay everyone at once. Some patterns, described generally:

| Era and type | What happened, in outline | What drained the cash | Lesson |
|---|---|---|---|
| A British mortgage lender, 2007 | Relied on wholesale funding and securitisation; when those markets shut, retail customers queued too | Wholesale markets, then retail | Wholesale funding vanishes first |
| Global crisis, 2008 | Investment banks and others reliant on overnight secured funding saw lenders demand more collateral or stop lending; interbank lending froze | Lenders of secured funding, prime brokerage clients, derivative counterparties | Led directly to the Basel liquidity rules in this note |
| United States regional banks, 2023 | Mid-sized banks with concentrated, largely uninsured business deposits held long-dated bonds that lost value as rates rose; once losses became public, depositors withdrew tens of billions within a day or two, by app | Uninsured corporate and technology-sector deposits | Concentrated uninsured deposits behave like wholesale money; digital runs are measured in hours; unrealised interest rate losses matter |
| A large European bank, 2023 | Years of losses and scandals eroded confidence; outflows accelerated until an arranged takeover | Wealth clients and institutional deposits | Liquidity buffers that look ample can still be outrun when trust goes |

Three lessons for a platform lead: **speed** (outflows now take hours, so daily data is not a luxury), **concentration** (a few hundred large depositors who talk to each other behave as one), and the fact that the 2023 failures were interest rate and liquidity failures, not credit failures.

## Sources and uses of funding

**Funding** is simply where the money on the balance sheet came from, and **uses** are what it was spent on. Think of a family budget split into "where our money comes from" (salary, a loan from grandma, savings) and "where it goes" (rent, a car on finance, a rainy-day pot).

| Source of funding | Typical tenor | Stability | Cost (relative) |
|---|---|---|---|
| Insured retail deposits in transactional accounts | Repayable on demand, but behaviourally sticky for years | Very stable | Cheap |
| Operational corporate deposits (cash kept for payroll, payments, cash management) | On demand | Moderately stable, because moving them is hard work | Moderate |
| Non-operational corporate deposits | On demand or short term | Flighty | Close to market rates |
| Deposits from other financial institutions | Short term | Very flighty | Market rates |
| Repurchase agreements (repo): borrowing against bonds as collateral | Overnight to months | Stable only while the collateral is good and markets work | Cheap |
| Unsecured bonds issued by the bank (senior debt) | 2 to 10 years | Stable until maturity | Higher; depends on the bank's credit rating |
| Covered bonds and securitisations: bonds backed by a pool of the bank's loans | Several years | Stable, but encumber the loans | Moderate |
| Equity and subordinated debt | Permanent or very long | Most stable | Most expensive |

Uses run from cash and government bonds (liquid at once) through short loans (repaid within months) to mortgages and long corporate loans (years to repay, slow to sell, though they can be pledged), plus undrawn lines, which use nothing today but promise to use funding tomorrow. The art of funding is matching: long-lived, illiquid uses should be paid for with long-lived, stable sources, and every promise to lend later (an undrawn line) needs a cushion behind it. That principle becomes the net stable funding ratio later.

## Treasury and asset liability management

### What treasury does

**Treasury** is the bank's own finance department for money itself. It does not lend to customers; it makes sure the bank has the right amount of cash, funding and capital at the right time and the right price. Within treasury, **asset liability management** (ALM) is the discipline of managing the mismatch between assets (mostly loans) and liabilities (mostly deposits and borrowing) in maturity, interest rate and currency. Its main jobs: liquidity and funding plans, bond issuance, the liquid asset buffer, hedging interest rate and currency mismatches, collateral management (which assets are pledged and which are free) and funds transfer pricing.

### ALCO

Treasury reports to the **asset and liability committee** (ALCO), chaired usually by the chief financial officer or chief executive, with the chief risk officer and business heads. ALCO sets the liquidity risk appetite, funding plan, interest rate risk limits and transfer pricing policy. See [[13 Credit Governance - Committees, Authorities and the Three Lines]] for committees generally. The second-line **liquidity risk** team (inside the risk function) independently sets limits, challenges treasury's assumptions and owns the stress tests in many banks; arrangements vary.

## Funds transfer pricing

[[24 Pricing, RAROC and Return on Capital]] explained the **funds transfer price** (FTP): the internal rate treasury charges a lending business for the money it uses, made of a base rate for the loan's term plus the bank's own credit spread. Here we add the liquidity parts, because FTP is how the cost of liquidity reaches the people who create it.

**The analogy.** A family where one child keeps borrowing the car for long trips and another always brings home spare change. A fair parent charges the first for petrol and wear and thanks the second with a little extra pocket money. Without that, everyone borrows the car.

FTP has three liquidity jobs:

1. **Term liquidity premium.** Lending for five years needs five-year funding, which is dearer than overnight money. Long loans pay more.
2. **Credit for stable funding.** Businesses that gather sticky deposits receive an FTP credit (they are "selling" funding to treasury). The credit is higher for stable retail balances than for flighty wholesale ones.
3. **Contingent liquidity charge.** An undrawn committed line uses no money today but forces the bank to hold liquid assets in case it is drawn. Good FTP charges for that.

### Worked example: three products under FTP

All figures illustrative.

| Product | Amount | Customer rate | FTP rate (charge or credit) | Business margin | Annual margin in money |
|---|---|---|---|---|---|
| 5-year corporate loan | 10,000,000 | 6.00% | Charge: 3.50% base + 0.60% term liquidity premium = 4.10% | 6.00% minus 4.10% = 1.90% | 190,000 |
| Instant-access retail deposit (stable, behaviourally long) | 10,000,000 | Pays customer 1.50% | Credit: 3.20% | 3.20% minus 1.50% = 1.70% | 170,000 |
| Undrawn committed revolving facility | 20,000,000 undrawn | Commitment fee 0.35% | Contingent charge: 10% assumed stressed drawdown x 0.40% cost of holding liquid assets | Fee 70,000 minus charge 8,000 | 62,000 |

Check the last row: 20,000,000 x 10% = 2,000,000 might be drawn; holding that much in low-yielding liquid assets costs 0.40% a year, or 8,000. The fee is 20,000,000 x 0.35% = 70,000.

Without the contingent charge, the business sees the undrawn line as pure fee profit and the cost lands silently on treasury's buffer. The undrawn amounts and facility types used come from the credit platform.

## The liquidity coverage ratio

After 2008, the Basel Committee on Banking Supervision (BCBS), the club of regulators described in [[basel-credit-risk-explained-simply]], wrote two liquidity standards, finalised for the first in January 2013 and for the second in October 2014, and phased in nationally afterwards. The first is the **liquidity coverage ratio** (LCR).

**The analogy.** Before a month-long camping trip with no shops, you pack enough food for the worst plausible month, not an average one. The LCR asks: if a severe stress hit tomorrow and lasted 30 days, could the bank pay all its stressed outflows from assets it can turn into cash immediately?

> LCR = stock of high-quality liquid assets / total net cash outflows over the next 30 calendar days, which must be at least 100%

### High-quality liquid assets

**High-quality liquid assets** (HQLA) are assets that can be turned into cash quickly at little loss, even in a stress, and that central banks would accept. They must be **unencumbered**: not already pledged to anyone. They come in levels, with **haircuts** (a percentage knocked off the value to allow for price falls) and **caps** on the weaker levels.

| Level | Typical assets (Basel standard; national rules differ in detail) | Haircut | Cap |
|---|---|---|---|
| Level 1 | Cash; central bank reserves that can be drawn in stress; bonds of sovereigns, central banks and some public bodies with a 0% risk weight | 0% | None |
| Level 2A | Bonds of sovereigns and public bodies with a 20% risk weight; high-rated covered bonds and corporate bonds (rated AA- or better) | 15% | Level 2 in total at most 40% of HQLA |
| Level 2B | Certain residential mortgage-backed securities (25% haircut); corporate bonds rated A+ to BBB- and certain listed equities (50% haircut) | 25% to 50% | At most 15% of HQLA |

Loans to customers are never HQLA, however good the borrower. That is why a bank with a pristine loan book can still fail a liquidity test.

### Outflows and inflows

Outflows are each liability or commitment multiplied by a **run-off rate**: the share assumed to leave in the stress. Inflows are contractual money coming in, also discounted, and capped so the bank cannot rely on them for more than 75% of outflows. The idea is that in a crisis your own customers may not pay you on time but your creditors will certainly ask.

| Item (Basel standard rates; check national rules) | Rate |
|---|---|
| Stable retail deposits (insured, in established relationships or transactional accounts) | 5% (3% in some jurisdictions meeting extra conditions) |
| Less stable retail deposits | 10% or higher |
| Operational deposits from corporates (cash management, custody, clearing) | 25% |
| Non-operational deposits from non-financial corporates | 40% (20% if fully insured) |
| Unsecured funding from banks and other financial institutions | 100% |
| Undrawn committed credit facilities to non-financial corporates | 10% |
| Undrawn committed liquidity facilities to non-financial corporates | 30% |
| Undrawn committed facilities to banks | 40% |
| Extra collateral needed if the bank is downgraded by up to three notches | 100% of the amount |
| Collateral calls from market moves on derivatives | Largest net 30-day collateral outflow seen in the past 24 months |
| Inflows from performing loans to non-financial corporates and retail | 50% |
| Inflows from banks and other financial institutions | 100% |

A **credit facility** is a general-purpose line (a revolving credit facility a company uses for working capital). A **liquidity facility** is one set up to refinance the customer's own debt if markets close, such as a backstop for commercial paper, which is much more likely to be drawn in a stress, hence the higher rate. This classification lives in facility data, and getting it wrong moves the ratio.

![[37-lcr-flow.svg]]
*How the LCR is built: liquid assets are levelled, haircut and capped into the HQLA stock; liabilities and commitments are multiplied by run-off rates; inflows are discounted and capped at 75% of outflows; the ratio must be at least 100%.*

### Worked example: an LCR calculation

A mid-sized bank, figures in millions, illustrative.

**Step 1: HQLA.**

| Asset | Market value | Level | Haircut | Counted |
|---|---|---|---|---|
| Central bank reserves | 600 | 1 | 0% | 600 |
| Government bonds (0% risk weight), unencumbered | 900 | 1 | 0% | 900 |
| High-rated covered bonds | 300 | 2A | 15% | 255 |
| Corporate bonds rated A | 100 | 2B | 50% | 50 |
| **HQLA** | | | | **1,805** |

Caps: Level 2 is 255 + 50 = 305, which is 16.9% of 1,805 (under 40%); Level 2B is 50, which is 2.8% (under 15%). No cap bites.

**Step 2: outflows.**

| Item | Balance | Run-off | Outflow |
|---|---|---|---|
| Stable retail deposits | 8,000 | 5% | 400 |
| Less stable retail deposits | 3,000 | 10% | 300 |
| Operational corporate deposits | 1,000 | 25% | 250 |
| Non-operational corporate deposits | 1,500 | 40% | 600 |
| Deposits from financial institutions | 300 | 100% | 300 |
| Undrawn committed credit facilities, corporates | 2,000 | 10% | 200 |
| Undrawn committed liquidity facilities, corporates | 200 | 30% | 60 |
| Derivative collateral: downgrade trigger and historical look-back | | | 90 |
| **Total outflows** | | | **2,200** |

**Step 3: inflows.**

| Item | Amount due within 30 days | Inflow rate | Inflow |
|---|---|---|---|
| Performing corporate loan repayments | 500 | 50% | 250 |
| Maturing placements with other banks | 200 | 100% | 200 |
| Retail loan repayments | 100 | 50% | 50 |
| **Total inflows** | | | **500** |

Cap: 75% of 2,200 = 1,650. Inflows of 500 are below it, so all 500 count.

**Step 4: the ratio.** Net outflows = 2,200 minus 500 = 1,700. LCR = 1,805 / 1,700 = **106.2%**. The bank passes, but only just, and most banks run an internal target well above 100% (management buffers of 110% to 130% or more are common, illustratively).

**Step 5: a data error.** Suppose the facility data had wrongly tagged the 200 of liquidity facilities as credit facilities. Outflow would fall from 60 to 20, net outflows to 1,660 and the LCR rise to 108.7%. A classification field in the credit platform just flattered a regulatory ratio by 2.5 points. Now suppose 300 of the government bonds were actually pledged in a repo but the collateral system had not flagged them: HQLA falls to 1,505 and the LCR to 88.5%, a breach. Encumbrance flags are not a detail.

## The net stable funding ratio

The LCR covers the first 30 days. The **net stable funding ratio** (NSFR) looks out a year and asks a structural question: are long-term, illiquid assets paid for with long-term, stable money?

**The analogy.** Buying a car with money borrowed from a friend who can ask for it back any week is a bad idea, however good the car. The NSFR checks that the car (a five-year loan) is matched by a five-year loan to you, or by savings that will not walk off.

> NSFR = available stable funding / required stable funding, which must be at least 100%

**Available stable funding** (ASF) weights each liability by how likely it is to stay beyond a year. **Required stable funding** (RSF) weights each asset (and off-balance sheet commitment) by how much stable funding it needs, which is more for long, illiquid, risky assets.

| Liability (illustrative Basel factors) | ASF factor |
|---|---|
| Capital and liabilities with remaining maturity of a year or more | 100% |
| Stable retail deposits | 95% |
| Less stable retail deposits | 90% |
| Funding under a year from non-financial corporates; operational deposits | 50% |
| Funding under six months from financial institutions; other liabilities | 0% |

| Asset (illustrative Basel factors) | RSF factor |
|---|---|
| Cash and central bank reserves | 0% |
| Unencumbered Level 1 assets | 5% |
| Unencumbered Level 2A assets | 15% |
| Short-term unsecured loans to financial institutions | 15% |
| Loans to non-financial corporates and retail with under a year remaining | 50% |
| Unencumbered residential mortgages of a year or more with risk weight of 35% or less | 65% |
| Other performing loans of a year or more with higher risk weights | 85% |
| Non-performing loans, fixed assets, assets encumbered for a year or more | 100% |
| Undrawn committed credit and liquidity facilities | 5% of the undrawn amount |

Notice how credit data drives RSF: the risk weight (from the capital engine), remaining maturity, performing or non-performing status, and encumbrance all decide the factor.

### Worked example: an NSFR calculation

A simplified bank, figures in millions, illustrative.

| Liability | Amount | ASF factor | ASF |
|---|---|---|---|
| Capital | 1,000 | 100% | 1,000 |
| Bonds issued, over a year to maturity | 1,500 | 100% | 1,500 |
| Stable retail deposits | 8,000 | 95% | 7,600 |
| Less stable retail deposits | 3,000 | 90% | 2,700 |
| Corporate deposits under a year | 2,500 | 50% | 1,250 |
| Funding from financial institutions under 6 months | 1,000 | 0% | 0 |
| Other liabilities | 800 | 0% | 0 |
| **Total** | **17,800** | | **14,050** |

| Asset | Amount | RSF factor | RSF |
|---|---|---|---|
| Cash and reserves | 600 | 0% | 0 |
| Level 1 bonds | 900 | 5% | 45 |
| Level 2A bonds | 300 | 15% | 45 |
| Short-term loans to banks | 200 | 15% | 30 |
| Corporate loans under a year | 2,000 | 50% | 1,000 |
| Residential mortgages (risk weight 35% or less) | 9,000 | 65% | 5,850 |
| Corporate loans over a year (higher risk weight) | 4,000 | 85% | 3,400 |
| Non-performing loans | 300 | 100% | 300 |
| Fixed and other assets | 500 | 100% | 500 |
| **On-balance sheet total** | **17,800** | | **11,170** |
| Undrawn committed facilities (off-balance sheet) | 2,200 | 5% | 110 |
| **Total RSF** | | | **11,280** |

NSFR = 14,050 / 11,280 = **124.6%**. Comfortable.

**What if** the bank grows its five-year corporate lending by 2,000, funded with six-month borrowing from other banks? ASF is unchanged (that funding scores 0%). RSF rises by 2,000 x 85% = 1,700 to 12,980. NSFR = 14,050 / 12,980 = **108.2%**. Still above 100%, but the ratio fell by more than 16 points because long, illiquid lending was paid for with hot money. If 300 of those loans then become non-performing, they move from 85% to 100%, adding another 45 of RSF.

## Intraday liquidity

Payments happen **during** the day, and a bank can be perfectly fine at close of business yet unable to make a payment at 11 in the morning.

**The analogy.** You will be paid your pocket money at 5pm, but the ice-cream van comes at noon. Over the day you are fine; at noon you are stuck.

Large-value payments between banks settle through the central bank's **real-time gross settlement** (RTGS) system: each payment is settled individually and immediately, so the bank needs cash (or intraday credit from the central bank, against collateral) in its account at the moment of each payment.

The Basel Committee published monitoring tools for intraday liquidity in 2013. The main ones are the **daily maximum intraday liquidity usage** (the deepest the bank's cumulative net position went during the day), **available intraday liquidity** at the start of the day, **time-specific obligations** that must be paid by a set time, and **throughput** (the share of payments made by certain times). For a credit platform, intraday matters through derivative margin flows (see [[19 Counterparty Credit Risk and Derivatives]]) and large same-day facility drawdowns.

## Liquidity stress testing and the contingency funding plan

### Internal stress tests

The LCR is one regulator-designed scenario. Banks also run their own **liquidity stress tests**, usually daily or weekly: a **bank-specific** scenario (a downgrade, a scandal, a large outage), a **market-wide** one (a funding freeze, a sharp rate rise) and a **combined** one, the most severe. Each scenario runs over several **horizons** (overnight, one week, one month, three months, a year) and produces a **survival horizon**: how many days until the bank's liquid resources run out without management action.

### Worked example: a stressed cash flow ladder

A **cash flow ladder** (or maturity ladder) lists stressed outflows and inflows by time bucket. **Counterbalancing capacity** is the cash the bank can raise from its liquid assets after haircuts. Figures in millions, illustrative, combined scenario, starting counterbalancing capacity 1,800.

| Time bucket | Stressed outflows | Stressed inflows | Net flow | Cumulative net flow | Counterbalancing capacity remaining |
|---|---|---|---|---|---|
| Overnight | 400 | 100 | -300 | -300 | 1,500 |
| 2 to 7 days | 700 | 150 | -550 | -850 | 950 |
| 8 to 30 days | 900 | 250 | -650 | -1,500 | 300 |
| 31 to 90 days | 800 | 300 | -500 | -2,000 | -200 |

The capacity runs out inside the 31 to 90 day bucket. If outflows in that bucket are spread evenly over its 60 days, the remaining 300 is used up after 300 / 500 = 60% of the bucket, about 36 days into it, so the survival horizon is about day 66. Suppose the bank's risk appetite demands at least 90 days under the combined scenario. It is short, and ALCO must act: raise term funding, hold more HQLA, or reduce the commitments that drive the outflows.

### The contingency funding plan

A **contingency funding plan** (CFP) is the bank's fire drill for a liquidity crisis. It sets out:

- **Early warning indicators**: falling share price, widening credit spreads on the bank's bonds, deposit outflows above normal, counterparties shortening the term they will lend, rating agency outlook changes, unusual drawdowns on facilities.
- **Escalation stages**: normal, heightened monitoring, stress, crisis, each with who decides and how often the crisis team meets.
- **Actions** with sizes and timings: sell or repo liquid assets, use central bank facilities, issue secured funding against pre-positioned loans, slow new lending, raise deposit rates, draw committed lines the bank has from others.
- **Communication**: what to tell staff, customers, markets and the supervisor.

A CFP is tested at least annually, often with a simulation. The test regularly discovers that the data to execute an action (which loans are eligible for the central bank, and are they already pledged?) is not ready. That data is credit data.

## The ILAAP

The **internal liquidity adequacy assessment process** (ILAAP) is the liquidity twin of the **internal capital adequacy assessment process** (ICAAP) described in [[20 Stress Testing and ICAAP]]. It is the bank's own documented judgement, approved by the board, that its liquidity and funding are adequate. It typically covers the liquidity risk appetite (minimum survival horizons, internal LCR and NSFR targets, concentration limits), governance, the funding profile and plan, the liquid asset buffer (size, currency, legal entity and readiness to turn into cash), stress testing results, intraday liquidity, the contingency funding plan, funds transfer pricing, data and reporting quality, and a self-assessment of gaps. The supervisor reviews it annually and may require more liquidity if it is not convinced. Names and formats vary by jurisdiction.

## Interest rate risk in the banking book, briefly

**Interest rate risk in the banking book** (IRRBB) is the risk that changes in interest rates hurt the bank's earnings or the value of its banking book (the loans and bonds it holds rather than trades). It is not liquidity risk, but it lives in treasury and ALM, and 2023 showed how it can trigger a run.

**The analogy.** You lock in a ten-year deal to lend your bike out for 1 a week. A year later everyone is charging 3 a week. The deal still pays, but it is worth far less, and selling it would crystallise a loss.

It is measured two ways: the change in **economic value of equity** (EVE), the present value of all banking book cash flows, and the change in **net interest income** (NII) over the next year. The Basel standard (published in 2016) asks banks to apply six standard rate shock scenarios (parallel up and down, steepening, flattening, short rates up and down) and supervisors run an **outlier test**: a bank whose EVE falls by more than 15% of its Tier 1 capital under any scenario attracts closer scrutiny. Credit data feeds IRRBB through repayment schedules, fixed-rate periods and expected prepayments.

## Where liquidity meets credit risk

Credit and liquidity are run by different teams, but in a crisis they are the same event seen from two sides. When a borrower or the bank itself gets into trouble, credit events turn into cash demands.

![[37-credit-to-liquidity.svg]]
*How a credit event becomes a liquidity drain: borrowers in trouble draw their lines, the bank's own downgrade triggers collateral calls and frightens depositors, and encumbered or mislabelled assets shrink the buffer just when it is needed.*

| Link | How it works | Credit data involved |
|---|---|---|
| Undrawn commitments drawn in stress | Companies under strain draw every committed line, as many did in early 2020. Credit sees exposure at default rise; treasury sees cash leave | Facility limits, drawn and undrawn amounts, committed or uncommitted, credit or liquidity facility, customer type, maturity |
| Collateral and margin calls on derivatives | When markets move, the bank must post margin under its collateral agreements | Netting sets, credit support annex terms, thresholds, minimum transfer amounts, eligible collateral (see [[19 Counterparty Credit Risk and Derivatives]]) |
| Rating downgrade triggers | Some contracts require the bank to post more collateral, or let counterparties terminate, if the bank's own rating falls | Downgrade clauses captured from legal agreements; the LCR adds outflows for up to a three-notch downgrade |
| Encumbrance | Assets pledged for repo, covered bonds, securitisations or central bank borrowing cannot be sold or pledged again | Pledge status per loan and bond, pool membership, eligibility flags |
| Credit lines to other banks | Lines the bank provides to other banks are assumed drawn heavily in stress; lines it relies on from other banks may be cut | Counterparty type, facility purpose; bank limits from [[26 Sovereign, Bank and Country Risk]] |
| Loan repayments that do not arrive | Defaults reduce expected inflows | Payment schedules, arrears status |

### Worked example: a credit shock becomes a liquidity week

The bank from the LCR example is downgraded two notches after large credit losses in a property portfolio. In the following week (figures in millions, illustrative):

| Effect | Cash leaving |
|---|---|
| Downgrade clauses: extra collateral to derivative counterparties | 150 |
| Corporate customers draw 25% of 2,000 undrawn credit lines | 500 |
| 40% of 1,500 non-operational corporate deposits withdrawn | 600 |
| Other banks refuse to roll over short-term placements | 200 |
| **Total** | **1,450** |

The bank thought it had 1,805 of HQLA, which would leave 355. Then treasury discovers that 300 of its government bonds were pledged in a repo last month, but the encumbrance flag had not flowed through. Real HQLA is 1,505, leaving **55**. One more large withdrawal and the bank is at the central bank's window. The credit losses caused the downgrade; credit facility and collateral data decided how much cash left; and a missing data flag decided how close the bank came to the edge.

## Data and systems for liquidity reporting

Liquidity reporting is data-hungry, and much of its data is shared with credit.

### What gets produced

| Output | Frequency | Content |
|---|---|---|
| Regulatory LCR return | Typically monthly, with daily internal calculation; frequency varies by jurisdiction and can be raised in stress | HQLA by level, outflows and inflows by category |
| Regulatory NSFR return | Typically quarterly | ASF and RSF by category |
| Internal stress test and survival horizon | Daily or weekly | Cash flow ladders by scenario |
| Encumbrance reporting | Typically quarterly | Assets pledged and free |
| ALCO pack | Monthly | All of the above, plus funding plan and IRRBB |

### The cash flow ladder engine

The heart of liquidity reporting is a **cash flow engine**: project every contract's contractual cash flows, then apply **behavioural assumptions** to turn contractual flows into expected and stressed flows.

| Behavioural assumption | Why it is needed | Example |
|---|---|---|
| Deposit stickiness | Current accounts are repayable today but most balances stay for years | Treat 70% of stable retail balances as staying beyond a year, from historical analysis (illustrative) |
| Prepayment | Borrowers repay mortgages early when rates fall or they move house | 8% a year prepayment rate (illustrative) |
| Drawdown of commitments | Undrawn lines get drawn, more so in stress | 5% normal, 25% stressed for corporate revolvers (illustrative) |

Behavioural assumptions are models, so they need documentation, validation and governance (see [[21 Model Risk Management and Validation]]).

### Data shared with credit

| Data item | Credit use | Liquidity use |
|---|---|---|
| Facility limit, drawn and undrawn amounts | Exposure at default, limits | Drawdown outflows, NSFR off-balance sheet RSF |
| Commitment type (committed or uncommitted; credit or liquidity facility) | Credit conversion factors | LCR run-off category |
| Counterparty type and sector | Exposure class, concentration | Run-off category, funding concentration |
| Maturity and repayment schedule | Effective maturity, expected credit loss lifetime | Inflows in the ladder |
| Performing status, arrears, default flag | Default and staging | Inflow eligibility, NSFR 100% factor |
| Collateral and pledge status | Loss given default | Encumbrance, HQLA eligibility, central bank eligibility |
| Derivative netting sets and collateral agreements | Counterparty exposure | Margin outflows, downgrade triggers |

The two teams often build separate extracts from the same source systems, with different cut-off times and different filters, and then cannot reconcile undrawn amounts. One governed facility dataset used by both is worth a great deal.

### Daily reporting realities

Liquidity runs daily, with results often needed by mid-morning, so feeds must land overnight, reference data must be current, and failed feeds need flagged fallbacks such as the previous day's balance. Under the BCBS 239 principles described in [[22 Credit Risk Data, Systems and BCBS 239]], liquidity is explicitly a risk where supervisors expect rapid aggregation in stress, including on request within hours.

## Common mistakes and misunderstandings

- **"A profitable bank cannot have a liquidity problem."** Profit and cash are different.
- **"Good loans are liquid."** Loans are never HQLA. They can be pledged to a central bank only if already prepared and eligible.
- **"The LCR is the stress test."** It is one standardised scenario. Banks must run their own, and a bank can pass the LCR and still have a short survival horizon in a bank-specific scenario.
- **"Undrawn lines are free money for the business."** They cost liquidity and capital and should carry a contingent FTP charge.
- **"Liquidity is treasury's problem, not credit's."** The biggest stress outflows are driven by credit facility, collateral and derivative data.
- **"An asset we own is an asset we can use."** Not if it is encumbered. Encumbrance flags must be accurate and timely.
- **"Interest rate risk is not a liquidity issue."** Unrealised losses on bond portfolios helped trigger the 2023 runs.

## What a platform lead needs to know about this

**You are a data supplier to liquidity.** Expect the liquidity reporting or treasury data team to consume facility, undrawn, collateral, pledge, counterparty and derivative data from your platform daily. Find out which extracts exist, their cut-offs, and whether they reconcile to the credit numbers.

**Classification fields have liquidity consequences.** Committed or uncommitted, credit or liquidity facility, counterparty sector (non-financial corporate, bank, other financial institution), operational relationship: each moves LCR and NSFR. Treat them as critical data elements with owners, rules and thresholds.

**Encumbrance, eligibility and triggers.** Pledge status and central bank eligibility flags are among the most consequential fields in the bank in a crisis and must be current every morning. Downgrade triggers and credit support annex terms belong in structured data, not only in PDFs.

**Timeliness.** Your batch failures can become liquidity reporting incidents. Agree service levels with treasury and include them in the incident severity matrix (see [[38 Platform Lead Toolkit - Runbooks, Metrics and Templates]]).

**Behavioural assumptions are models.** Drawdown rates that treasury uses for liquidity and credit conversion factors that credit uses for exposure at default describe the same behaviour. Very different numbers in the two places will attract questions.

**Who owns what.**

| Area | Owner |
|---|---|
| Liquidity management, funding plan, liquid asset buffer, FTP | Treasury (first line) |
| Liquidity risk appetite, limits, stress test challenge | Liquidity risk (second line) |
| LCR, NSFR and other liquidity regulatory returns | Regulatory reporting or treasury reporting, with finance |
| ILAAP document | Treasury and liquidity risk, approved by the board |
| Facility, collateral and counterparty source data | Credit operations and the credit platform |

See also [[32 The Credit Risk Data Model]] for how facilities, collateral and counterparties should be modelled so that one dataset serves credit and liquidity, and [[35 Regulatory Landscape and Change Calendar]] for where liquidity rule changes sit among the bank's regulatory commitments.

## Related notes

- [[01 What a Bank Is and How It Makes Money]] for the balance sheet, liquidity versus solvency and bank runs in brief.
- [[20 Stress Testing and ICAAP]] for the ICAAP and the ILAAP in outline.
- [[24 Pricing, RAROC and Return on Capital]] for funds transfer pricing in loan pricing.
- [[19 Counterparty Credit Risk and Derivatives]] for collateral agreements and margin.
- [[31 Settlement and Pre-Settlement Risk]] for payment and settlement exposures.
- [[11 Collateral and Security]] for collateral data and pledges.
- [[26 Sovereign, Bank and Country Risk]] for how banks assess other banks' liquidity.
- [[29 Market Risk]] for market liquidity and the trading book.
- [[22 Credit Risk Data, Systems and BCBS 239]] for data aggregation principles.
- [[23 Reporting - Regulatory Returns, Pillar 3 and Management Information]] for regulatory reporting processes.
- [[36 Credit Portfolio Management and Risk Transfer]] for securitisation and risk transfer, which also encumber assets.
- [[18 Regulatory Capital and Basel - the Short Version]] for where liquidity sits in the Basel framework.
- [[basel-credit-risk-explained-simply]]
- [[28 Master Glossary]]
