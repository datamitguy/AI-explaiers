# Market Risk

**Why this matters to you.** Credit risk asks "will they pay me back?" Market risk asks "what if the price changes before I sell?" Nobody has to default for a bank to lose a fortune on market risk; prices just have to move the wrong way. The two risks sit side by side: the same bond can carry both, the same derivative feeds both the market risk engine and the counterparty exposure engine, and the same market data drives your expected credit loss scenarios, your stress tests and the trading desk's daily profit. This note explains market risk from zero, picking up where section 8 of [[basel-credit-risk-explained-simply]] stops, at the line between the banking book and the trading book.

## Table of contents

1. [The lemonade stand version](#the-lemonade-stand-version)
2. [How market risk differs from credit risk, and where they meet](#how-market-risk-differs-from-credit-risk-and-where-they-meet)
3. [Where market risk lives in a bank](#where-market-risk-lives-in-a-bank)
4. [The risk factors](#the-risk-factors)
5. [Sensitivities and the Greeks](#sensitivities-and-the-greeks)
6. [Profit and loss](#profit-and-loss)
7. [Value at risk](#value-at-risk)
8. [Expected shortfall](#expected-shortfall)
9. [Stress testing and scenario analysis](#stress-testing-and-scenario-analysis)
10. [Backtesting](#backtesting)
11. [Regulatory capital under FRTB](#regulatory-capital-under-frtb)
12. [Limits and governance](#limits-and-governance)
13. [Systems and data](#systems-and-data)
14. [Common mistakes and misunderstandings](#common-mistakes-and-misunderstandings)
15. [What a platform lead needs to know about this](#what-a-platform-lead-needs-to-know-about-this)
16. [Related notes](#related-notes)

## The lemonade stand version

On Friday you buy 100 lemons at 10p each, planning to make lemonade on Saturday. Overnight there is news of a bumper lemon harvest and the price drops to 6p. Nobody has cheated you and nobody has gone bust, but if you had to sell the lemons back this morning you would get 6 pounds instead of the 10 you paid. You have lost 4 pounds because the price moved. That is **market risk**.

Now suppose instead you had promised to *sell* your neighbour 100 lemons next week at 10p, and had not bought them yet. The same price drop is good news: you buy at 6p and deliver at 10p. Market risk is always a **position** (what you own or owe) combined with a **price move**, and the first job of a market risk team is to know every position and which prices it depends on.

The banking version: a desk owns 50 million pounds of government bonds, rates rise overnight, and the desk is 1 million pounds poorer, though the government will still pay every penny.

## How market risk differs from credit risk, and where they meet

| | Credit risk | Market risk |
|---|---|---|
| The question | Will the borrower pay me back? | Will the price move against me before I sell? |
| What causes the loss | Default or downgrade of a borrower | A change in a market price, rate or volatility |
| How fast it shows | Months, through arrears and impairment | Every day, through mark-to-market |
| Typical horizon | One year (capital), lifetime (provisions) | One day to a few weeks |
| Where it mostly lives | Banking book: loans, mortgages, held bonds | Trading book, plus rate risk in the banking book |
| Main measures | Probability of default, loss given default, exposure at default, expected credit loss | Sensitivities, value at risk, expected shortfall, stress losses |
| Accounting | Amortised cost with provisions (see [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]]) | Fair value, revalued daily |

They overlap in four places, which is where a credit platform lead gets pulled in.

- **Credit spread risk.** A company's bond pays more interest than a government bond because the company might default. That extra is the **credit spread**. If markets start worrying about the company, the spread widens and the bond's price falls, though the company is still paying. A credit worry, showing up as a price move.
- **Issuer default in the trading book.** If the company actually defaults, the bond's price collapses in one jump. The capital rules catch this with a separate **default risk charge**, because daily price models handle sudden jumps badly.
- **CVA.** The **credit valuation adjustment**, shortened to **CVA**, is the market price of the chance a derivative counterparty defaults. It moves daily with spreads and prices. See [[19 Counterparty Credit Risk and Derivatives]]; its capital charge sits in the market risk chapters but is calculated separately.
- **Wrong-way risk.** When a market move both increases what a counterparty owes you and weakens the counterparty, also covered in [[19 Counterparty Credit Risk and Derivatives]].

## Where market risk lives in a bank

![[29-market-risk-taxonomy.svg]]
*The six families of risk factor and the desks or books that mainly carry each one. Interest rate and credit spread risk also sit in the banking book, managed by treasury under Pillar 2 rather than the trading book rules.*

### Trading desks

The markets division is split into **desks**, each a team of traders responsible for a family of products.

| Desk | What it trades | Main risk factors |
|---|---|---|
| Rates | Government bonds, interest rate swaps, futures, options on swaps | Interest rates, rate volatility |
| Foreign exchange (FX) | Spot currency, forwards, FX swaps and options | Exchange rates, FX volatility, interest rates |
| Equities | Shares, index futures, equity options | Share prices, equity volatility, dividends |
| Credit | Corporate bonds, credit default swaps (CDS), credit indices | Credit spreads, default, interest rates |
| Commodities | Oil, gas, power, metals, agricultural futures | Commodity prices and volatility |

The desk is also the unit regulators care about: each has a written strategy, a head, its own limits and, if the bank uses internal models, its own approval.

### Market making, hedging and proprietary trading

A second-hand bike shop buys bikes from sellers and sells to buyers, earning the difference. While bikes sit in the shop their value can change. That is **market making**: the bank quotes a buying price (the **bid**) and a selling price (the **offer**) to clients, earns the gap, and holds an **inventory** meanwhile. The inventory is the market risk.

**Hedging** is taking a position to cancel a risk you already have. A desk that has just bought 100 million of bonds from a client might sell bond futures to cancel most of the interest rate risk while it finds buyers.

**Proprietary trading** is the bank betting its own money with no client involved. After 2008 several countries restricted it for deposit-taking banks, reasoning that depositors' money, often protected by the state, should not fund speculation. The United States did this through the Volcker rule; the United Kingdom and others separate retail deposit-taking from riskier trading through ring-fencing or similar structures. Details vary by country, and the line between market making with inventory and proprietary trading is hard to draw, so these rules come with heavy monitoring.

### Treasury and the banking book

The bank's **treasury** manages the rate and currency risk that arises from ordinary lending and deposit-taking. A bank with 25-year fixed-rate mortgages funded by deposits that reprice monthly loses margin, and value, when rates rise. This is **interest rate risk in the banking book**, shortened to **IRRBB**. Its cousin, **credit spread risk in the banking book** (**CSRBB**), mostly hits the bonds treasury holds as a liquidity buffer.

These are not covered by the trading book capital rules. They fall under **Pillar 2**, where supervisors review risks bank by bank (see [[18 Regulatory Capital and Basel - the Short Version]] and [[20 Stress Testing and ICAAP]]). Banks measure IRRBB as the change in **net interest income** (next year's interest profit) and in **economic value of equity** (the present value of all banking book cash flows) under standard rate shocks. Thresholds vary by jurisdiction.

## The risk factors

A **risk factor** is any market number whose movement changes the value of a position. A big bank's risk engine tracks tens of thousands, in six families.

| Family | In plain words | Example | Positions that lose |
|---|---|---|---|
| Interest rates | The price of borrowing money for a period | 10-year government bond yield at 4.2% | Owning bonds when rates rise |
| Credit spreads | Extra interest a risky borrower pays over a safe one | A company's bonds yield 1.8% more than government bonds | Owning the bonds when spreads widen |
| Foreign exchange | The price of one currency in another | 1 pound buys 1.25 US dollars | Owning a currency that weakens |
| Equity prices | The price of a share or index | A share at 40 pounds | Owning shares that fall |
| Commodity prices | The price of physical goods | Oil at 80 dollars a barrel | Owning oil when it falls |
| Volatility | How much a price is expected to jump around | Implied volatility of 20% a year | Selling options when markets get jumpy |

**Interest rates and yield curves.** An interest rate is the rent for borrowing money, and the rent depends on how long you borrow. Plot rates against length of borrowing and you get a **yield curve**, normally sloping upwards. Risk systems describe each curve by **tenor points** (3 months, 1 year, 2, 5, 10, 30 years and so on), with separate curves per currency and often several per currency. The key fact: **when rates go up, the price of an existing fixed-rate bond goes down.** If your bond pays 3% and new bonds pay 4%, nobody pays full price for yours.

**Credit spreads.** Tracked by issuer, rating, sector and tenor. They widen when the market thinks default is more likely, exactly as [[02 What Credit Risk Is]] would predict, so credit knowledge transfers directly.

**Foreign exchange.** If the bank owns dollars and the dollar weakens, those dollars are worth fewer pounds. FX positions come from trading, client hedges, foreign currency loans and foreign subsidiaries.

**Commodity prices.** Energy, metals and agricultural goods, with quirks like seasonality and storage costs; each delivery month is effectively its own price.

**Volatility.** How much a price wobbles. Options (explained in [[19 Counterparty Credit Risk and Derivatives]]) are worth more when prices are jumpier. The market's view of future volatility, read from option prices, is **implied volatility**; it differs by strike and expiry, so it is stored as a grid called a **volatility surface**. A desk that has sold options loses when volatility rises, even if prices do not move.

## Sensitivities and the Greeks

Riding a bike downhill, your speed tells you roughly where you will be in a second. A **sensitivity** is the speed of a position's value with respect to one risk factor: "if this factor moves one small step, how much do I gain or lose?" Sensitivities are cheap to compute, add up neatly across trades on the same factor, and are easy to limit. Option traders name them after Greek letters.

| Sensitivity | Question it answers | Analogy |
|---|---|---|
| Delta | Value change if the underlying price moves by 1 | Speed |
| Gamma | Change in delta if the price moves by 1 | Acceleration |
| Vega | Value change if volatility moves by 1 percentage point | Exposure to bumpy weather |
| Theta | Value change as one day passes | An ice cream melting |
| Duration | Approximate % fall in a bond's price for a 1 percentage point rise in rates | How long your money is tied up |
| DV01 or PV01 | Money change for a 1 basis point (0.01%) move in rates | Delta for rates, in money |
| Convexity | How duration itself changes as rates move | Gamma for bonds |

**Delta.** An option on 1,000 shares with delta 0.5 behaves, for small moves, like 500 shares: a 2-pound rise gains about 1,000 pounds. **Gamma** says delta itself shifts as the price moves, so this morning's sensitivities can be wrong by afternoon; option sellers usually have negative gamma and lose more and more in big moves either way. **Vega**: with vega of 3,000 pounds per volatility point, a rise in implied volatility from 20% to 23% gains about 9,000 pounds. **Theta**: an option is like a lottery ticket with a draw date, losing a little value each quiet day.

A **basis point** is one hundredth of a percentage point. **DV01** (dollar value of one basis point) and **PV01** (present value of one basis point) mean the same thing. Banks compute them per tenor, giving a **bucketed DV01** ladder that shows, say, long 5-year and short 10-year rates.

### Worked example: a bond's DV01

A desk owns a 10-year government bond, face value 10 million pounds, priced at 100. Its **modified duration** is 8 (illustrative).

- DV01 = 10,000,000 x 8 x 0.0001 = **8,000 pounds per basis point**.
- Yields rise 25 basis points: estimated loss = 25 x 8,000 = **200,000 pounds**.

**Convexity** refines this: for an ordinary bond, the true loss when yields rise is slightly smaller than the duration estimate, and the gain when they fall slightly larger. With an illustrative convexity of 80, the correction is 0.5 x 80 x 0.0025 squared x 10,000,000, about 2,500 pounds, so the true loss is about 197,500. Small here, but it grows with the square of the move, so it matters in a 200 basis point shock.

### Worked example: an FX position

A desk holds 5 million US dollars; the pound buys 1.25 dollars.

- Value in pounds = 5,000,000 / 1.25 = **4,000,000**.
- The dollar weakens to 1.27: value = 5,000,000 / 1.27 = **3,937,008**.
- Loss = **62,992 pounds** from a 2-cent move.

Check with a sensitivity: the move is about a 1.6% weakening of the dollar, and 1.6% of 4 million is about 63,000. They agree because spot FX is a straight-line risk; for an FX option they would not, because of gamma.

Sensitivities to the *same* factor add across trades (plus 3,000 and minus 2,000 of 5-year DV01 make plus 1,000). Sensitivities to *different* factors cannot simply be added, because factors do not move together perfectly. Combining them is the job of the measures below.

## Profit and loss

### Mark-to-market and daily P&L

Every trading book position is revalued daily at market prices (**mark-to-market**). The change in value since yesterday, plus cash received or paid, is the daily **profit and loss**, shortened to **P&L**, reported per trade, book, desk and division. Positions without an observable price are **marked to model** using a pricing model and whatever data exists.

### P&L attribution and explain

Every morning someone asks "why did we make that much?" The **P&L explain** splits actual P&L using sensitivities.

| Component | How estimated | Pounds |
|---|---|---|
| Interest rate delta | Bucketed DV01 x yesterday's rate moves | +300,000 |
| FX delta | FX delta x FX move | -50,000 |
| Vega | Vega x volatility move | +80,000 |
| Theta | Theta x 1 day | -20,000 |
| New trades | Day-one value of today's trades | +60,000 |
| **Explained (risk-based)** | | **+370,000** |
| **Actual (full revaluation)** | | **+410,000** |
| **Unexplained** | | **+40,000** |

A small unexplained amount is normal, since sensitivities are approximations. A large or persistent one is a red flag: a missing risk factor, a mis-booked trade, different market data in front office and risk, a bad model, or occasionally someone hiding something. Rogue trading scandals have often first appeared as P&L nobody could explain. Under FRTB this comparison became a formal regulatory test.

### Independent price verification and valuation adjustments

Traders mark their own books and are paid partly on P&L, which is like letting pupils mark their own exams. So a separate team in finance or product control performs **independent price verification**, shortened to **IPV**: at least monthly, it checks marks against broker quotes, consensus services and real trades, and books corrections.

Finance also books **valuation adjustments** for what the mid-market price ignores: the cost of exiting at bid or offer, model uncertainty, concentrated positions, and the counterparty adjustments in [[19 Counterparty Credit Risk and Derivatives]]. Some jurisdictions, notably the European Union and the United Kingdom, also require **prudent valuation**, deducting the gap between fair value and a conservative value from capital. The practical lesson: a position has several "prices" (trader mark, verified mark, accounting fair value, prudent value), and every report must say which it uses.

## Value at risk

Your parents ask how much pocket money you could lose at the funfair on a bad day. You look back over 100 Saturdays and say: "on 99 days in 100, I lose no more than 8 pounds." That is a value at risk.

**Value at risk**, shortened to **VaR**, is the loss a portfolio should not exceed over a chosen **horizon** at a chosen **confidence level**, assuming positions do not change. "One-day 99% VaR of 5 million" means on about 99 days in 100 we lose less than 5 million, and on about 1 day in 100 we lose more. Unlike sensitivities, it combines all risk factors, allowing for how they move together, into one money number.

| Method | How it works | Strengths | Weaknesses |
|---|---|---|---|
| Historical simulation | Replay real daily market moves from the last year or more on today's portfolio | No assumption about the shape of returns; real co-movements | Only knows its window; needs long clean history |
| Parametric (variance-covariance) | Assume normal (bell-shaped) moves; combine sensitivities with volatilities and correlations | Fast, explainable | Underestimates extremes; poor for options |
| Monte Carlo simulation | Generate thousands of random scenarios from a statistical model and revalue | Flexible, handles complex products | Slow; depends on model assumptions |

**Parametric example.** 10 million pounds of an equity index, daily volatility 1.5%. The 99% point of a normal distribution is about 2.33 standard deviations, so one-day 99% VaR = 10,000,000 x 1.5% x 2.33 = **349,500 pounds**. Scaling to 10 days by the square root of 10 (about 3.16) gives about 1.1 million, a shortcut that assumes independent days and an unchanged position.

### A worked historical-simulation example

A desk replays the last 100 days of market moves on today's positions. The ten worst hypothetical P&Ls, in millions of pounds:

| Rank | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 |
|---|---|---|---|---|---|---|---|---|---|---|
| P&L | -9.0 | -6.2 | -4.8 | -3.9 | -3.5 | -3.1 | -2.8 | -2.6 | -2.4 | -2.2 |

For 95% VaR we want the loss exceeded on only 5% of days, the 5 worst of 100. Conventions differ (5th worst, 6th worst, or interpolation) and the bank's methodology fixes one. Taking the 5th worst, **95% one-day VaR is 3.5 million**. A 99% VaR from 100 days would rest on one or two observations, which is why real historical VaR uses at least 250 days.

### What VaR does not tell you

- **How bad the bad days are.** VaR was 3.5 million; the worst day was 9 million.
- **Anything outside its window.** A calm year teaches it nothing about a crisis three years ago.
- **Liquidity.** It assumes exit at today's prices; in a crisis some positions cannot be sold for weeks.
- **Jumps and defaults** that are not in the history.
- **It is not a maximum.** At 99% it is broken, by design, about 2 or 3 times a year.

It is also not always **subadditive**: two desks combined can, oddly, show more VaR than the sum of each.

### Stressed VaR

VaR was at its lowest just before 2008, because the preceding years were calm. The post-crisis reforms known as **Basel 2.5** added **stressed VaR**: the same model fed with a 12-month period of significant stress relevant to the portfolio (for many banks, covering 2007 to 2009). Capital became VaR plus stressed VaR, each multiplied by at least 3, so capital no longer fell just as danger built up.

## Expected shortfall

Back at the funfair: VaR said "on 99 Saturdays in 100 you lose less than 8 pounds." **Expected shortfall**, shortened to **ES**, answers the follow-up: "and on the bad Saturdays, how much do you lose *on average*?"

![[29-var-vs-es.svg]]
*Both measures come from the same sorted list of scenario P&Ls: VaR reads one point at the cut-off, expected shortfall averages everything beyond it.*

The **Fundamental Review of the Trading Book**, shortened to **FRTB**, is the Basel Committee's overhaul of market risk capital, published in 2016 and revised in 2019. For internal models it replaced VaR and stressed VaR with ES at 97.5%, because ES sees the size of tail losses, is subadditive, and is harder to game (a trader cannot hide catastrophic but rare losses beyond the cut-off). For a normal distribution 97.5% ES is close to 99% VaR, so headline prudence stays similar while the tail gets counted. FRTB's ES is calibrated to a stress period, absorbing the stressed VaR idea.

### Worked example: same VaR, different ES

Using the 5th worst as 95% VaR and the average of the 5 worst as 95% ES (a simple illustrative convention):

| | Desk A (fat tail) | Desk B (thin tail) |
|---|---|---|
| Five worst losses (millions) | 9.0, 6.2, 4.8, 3.9, 3.5 | 3.6, 3.6, 3.5, 3.5, 3.5 |
| 95% VaR | 3.5 | 3.5 |
| 95% ES | 27.4 / 5 = **5.48** | 17.7 / 5 = **3.54** |

By VaR the desks look identical. By ES, Desk A is clearly riskier, perhaps because it sells out-of-the-money options: steady small income, occasional disasters.

### Liquidity horizons

The old 10-day VaR horizon assumed every position could be exited in 10 days: fine for major currencies, absurd for a small company's bonds in a crisis. FRTB gives each risk factor a **liquidity horizon** of 10, 20, 40, 60 or 120 days, the time to exit or hedge it under stress. ES is computed on a 10-day base and scaled up for longer-horizon factors, so illiquid risks attract more capital. For a platform team this means every risk factor needs a liquidity horizon tag, and ES runs several times over different factor subsets, multiplying compute.

## Stress testing and scenario analysis

VaR and ES describe ordinary bad days drawn from a window. **Stress testing** applies a large, specific set of moves to today's positions: less a weather forecast, more a fire drill.

**Historical scenarios** replay real crises:

- **2008 financial crisis**: credit spreads exploded, equities fell, volatility spiked and some markets stopped trading.
- **March 2020 pandemic shock**: a dash for cash; equities and oil fell fast, spreads widened, and even government bond markets were disorderly until central banks intervened.
- **2022 United Kingdom gilt crisis**: after a government fiscal announcement, long-dated government bond (gilt) yields rose extremely fast. Pension funds using leveraged hedges faced collateral calls and sold gilts, pushing yields higher, until the Bank of England bought gilts to calm the market. A textbook loop between price moves and collateral.

**Hypothetical scenarios** are designed by the bank or supervisor ("rates up 300 basis points, equities down 30%, spreads double") to test what history has not shown, including the bank's own concentrations. **Single-factor shocks** ("all curves up 100 basis points") support limits; **reverse stress tests** ask what move would wipe out a year's profit.

Market stress results feed the bank-wide programme in [[20 Stress Testing and ICAAP]], combined with credit losses from the same story. The same scenario must drive both the market revaluation and the shifts in credit model inputs, which is where the two teams' data must line up.

## Backtesting

To judge a weather forecaster, you check whether "10% chance of rain" meant rain on about 1 day in 10. **Backtesting** does the same for VaR: each day, compare yesterday's VaR with today's P&L. A loss bigger than VaR is an **exception**. At 99%, over 250 days, you expect about 2.5. Regulators use a **traffic light**:

| Zone | Exceptions in 250 days (99% VaR, bank-wide) | Consequence |
|---|---|---|
| Green | 0 to 4 | None |
| Amber | 5 to 9 | Higher capital multiplier, investigation |
| Red | 10 or more | Highest multiplier; model approval at risk |

**Example.** Seven exceptions in a year is amber: capital rises and market risk must explain each one (a genuine shock, a missing factor, bad data). Clustered exceptions are a stronger signal than scattered ones.

Banks backtest against **hypothetical P&L** (yesterday's positions revalued at today's prices, no new trades or fees), the cleaner test of the model, and **actual P&L**, what really happened. Under FRTB, backtesting is also done **per desk** at 99% and 97.5%, and a desk with too many exceptions loses internal model approval; check the exact thresholds in your jurisdiction's rules.

## Regulatory capital under FRTB

This is the market risk counterpart of the credit story in [[18 Regulatory Capital and Basel - the Short Version]]. The output is a capital requirement, converted to **risk-weighted assets** (RWA) by multiplying by 12.5, joining credit, operational and CVA RWA in the capital ratio.

![[29-frtb-decision-tree.svg]]
*Which FRTB approach a position ends up under: the book boundary first, then the simplified option for small banks, then desk approval, backtesting and the P&L attribution test. SBM is the sensitivities-based method, DRC the default risk charge, RRAO the residual risk add-on and NMRF non-modellable risk factors.*

### The boundary

Section 8 of [[basel-credit-risk-explained-simply]] described the two piles. Banks used to move positions to whichever gave lower capital, so FRTB tightened the line:

- **Intent.** Positions held for short-term resale, to profit from short-term price moves, to lock in arbitrage, or to hedge such positions, belong in the trading book.
- **A presumptive list.** Some instruments are presumed trading book (for example, positions managed on a trading desk, listed equities, underwriting positions) and some banking book (for example, unlisted equity, real estate holdings). Deviating needs supervisory approval.
- **No switching for benefit.** Moving between books needs approval in exceptional cases, and cannot reduce capital.
- **Internal risk transfers**, such as treasury hedging rate risk with the trading desk, are recognised only under conditions.

The result is stored as a book-level flag that drives everything downstream; if it is wrong, the position lands in the wrong rulebook.

### The standardised approach

Every FRTB bank calculates the **standardised approach** (SA), even with model approval, as a fallback and benchmark. It is like an exam where you show your own working but must use the formula sheet provided. Three parts:

1. **Sensitivities-based method (SBM).** The bank computes delta and vega to a prescribed list of regulatory risk factors, plus a **curvature** charge for large moves in options (a stand-in for gamma). Each is multiplied by a supervisory **risk weight**, then combined within and across **buckets** using prescribed **correlations**, calculated under low, medium and high correlation with the worst taken.
2. **Default risk charge (DRC).** The jump-to-default loss per issuer (from notional, market value and a prescribed loss given default), with limited offsetting of longs and shorts in the same issuer and risk weights by credit quality. This is the most credit-like part, using ratings and seniority familiar from [[10 Internal Ratings, Scorecards and PD Models]].
3. **Residual risk add-on (RRAO).** A small percentage of gross notional on instruments with risks the SBM cannot see (exotic underlyings, complex payoffs), crude on purpose.

**A tiny SBM illustration.** A desk's only position has a 10-year sterling DV01 of 8,000 pounds. If the regulatory risk weight for that tenor equated to a 150 basis point move (illustrative; real weights are in the rules), the weighted sensitivity and the delta charge would be 8,000 x 150 = 1.2 million pounds. Add a 5-year position with DV01 of minus 6,000 and the two partly offset, depending on the prescribed correlation between the tenors.

### The internal models approach

The **internal models approach** (IMA) can give lower, more risk-sensitive capital, but approval is **desk by desk**, and every desk must keep passing:

- **Expected shortfall** at 97.5%, stress-calibrated, with liquidity horizons, and only partial credit for diversification across risk classes.
- **Backtesting** at desk and bank level.
- **The P&L attribution test (PLA).** The bank compares **risk-theoretical P&L** (what its risk model produces) with **hypothetical P&L** from front office pricing, using statistical tests of how closely they match. Green desks stay on IMA, amber desks stay with a capital surcharge, red desks fall back to SA. This is "unexplained P&L" turned into a pass-fail exam, and often the hardest hurdle.
- **Non-modellable risk factors (NMRF).** A factor may sit in the ES model only if there is enough evidence of real prices: a minimum count of real trades or committed quotes spread through the year (the **risk factor eligibility test**). Failing factors get a separate, usually expensive, stress-based charge.
- **Default risk charge**, modelled internally over one year at high confidence.

Total IMA capital is roughly the ES charge (with a backtesting-dependent multiplier) plus the NMRF charge plus the DRC, plus SA capital for desks not on IMA. The Basel **output floor** limits how far internal models can reduce total RWA.

| Approach | Who uses it | Main inputs | Compute |
|---|---|---|---|
| Simplified standardised | Small trading books, where permitted | Positions, simple charges | Low |
| Standardised (SBM + DRC + RRAO) | Every FRTB bank, at least as fallback | Sensitivities, issuer data, exotic notionals | Medium |
| Internal models (ES + NMRF + DRC) | Approved desks only | Full revaluation, long clean histories, observation data, two P&Ls | Very high |

The **simplified standardised approach** is essentially the older Basel standardised method with scaling factors, for small trading books where the supervisor permits it. **Implementation dates** vary: countries have adopted FRTB on different timetables, several have postponed it, and some phased in parts first. Check your regulator's current position rather than any date in a general guide.

## Limits and governance

Market risk limits are like house rules for a teenager with a debit card: a daily spending cap, banned shops, and "if you have lost a lot this month, stop and talk to us." They cascade from the bank's risk appetite (see [[14 Risk Appetite, Limits and Concentration]]) to division, desk and sometimes trader.

| Limit | What it caps | Example (illustrative) | Weakness |
|---|---|---|---|
| VaR or ES | Overall statistical risk | Rates desk one-day 99% VaR up to 4 million | Blind to tails and to things outside history |
| Sensitivity | Exposure to one factor or bucket | 10-year sterling DV01 up to 50,000 pounds; vega per underlying | Many numbers; ignores correlation |
| Stop-loss | Cumulative loss over a period | Escalate if month-to-date loss exceeds 5 million | Backward looking |
| Stress loss | Loss under defined scenarios | "2008 replay" loss up to 50 million | Only as good as the scenarios |
| Concentration | One issuer, sector, country or illiquid position | Jump-to-default to any issuer up to 20 million | Needs good issuer hierarchy data |
| Product and tenor | What may be traded, and how long | No commodity options beyond 10 years | Needs product classification |

Limits are checked at least daily, sensitivities often intraday. A breach triggers explanation by the trader and desk head, a decision by market risk (temporary increase or risk reduction), and reporting to senior management.

The **market risk function** is the independent **second line of defence** (see [[13 Credit Governance - Committees, Authorities and the Three Lines]]): it sets and monitors limits, owns VaR, ES and stress methodology, challenges desks and reports. Pricing and risk models are validated as in [[21 Model Risk Management and Validation]].

**New product approval** checks, before a desk trades anything new, that it can be booked, valued, risk managed, settled, accounted for and capitalised. Products traded before systems can handle them breed manual workarounds and P&L surprises.

**The daily risk report** reaches senior management each morning: P&L by desk and its explain, VaR and ES against limits, key sensitivities, stress results, backtesting exceptions, breaches and commentary. It is the market equivalent of the credit reports in [[15 Monitoring, Early Warning and Watchlist]], but daily, with an unforgiving deadline.

## Systems and data

![[29-daily-process.svg]]
*The end-of-day market risk process: positions and market data are frozen, every trade revalued, sensitivities and scenario measures computed, limits checked and the report produced, with risk P&L reconciled to finance P&L.*

**Front-office trading systems** book and price trades during the day, usually several per bank (by asset class, plus legacy). They also feed the counterparty exposure engine in [[19 Counterparty Credit Risk and Derivatives]], so both risk teams share this dependency.

**The risk engine** takes all positions, applies common market data and scenarios, and produces sensitivities, VaR, ES, stress results and FRTB capital. The cleaner design reuses front office pricing libraries, since the P&L attribution test punishes mismatch.

**Market data** is everything positions are valued with: **curves** (rates per currency, credit spreads per issuer, commodity forwards), **surfaces** (implied volatility), and **time series** (years of daily history per factor, for VaR and for finding the FRTB stress period). The **golden source** is the single approved, checked end-of-day snapshot that every downstream system uses. Different snapshot times or sources produce different numbers.

**Static and reference data** describes instruments (coupon, maturity, issuer), books and desks with their regulatory flags (trading or banking book, IMA or SA), legal entities, issuer ratings, holiday calendars, and the mapping of each instrument to risk factors and FRTB buckets. Issuer and legal entity data overlaps heavily with credit reference data (see [[22 Credit Risk Data, Systems and BCBS 239]]).

**The end-of-day batch.** Markets close, positions freeze, market data is snapshotted and validated, and overnight the batch revalues everything, computes sensitivities, runs scenarios and builds the report before the next trading day. Late trades, failed data loads or crashed jobs eat into the window.

**Full revaluation versus sensitivities.** Full revaluation reruns the pricing model per trade per scenario: accurate for options, but 50,000 trades x 500 scenarios is 25 million valuations, multiplied again by FRTB's stress periods and liquidity horizon subsets. The sensitivity (Taylor) approach multiplies scenario moves by delta, gamma and vega: fast, but wrong for big moves in option books. Banks mix them, or precompute **revaluation grids** and interpolate. Market risk is among a bank's biggest users of grid and cloud compute.

| Data problem | What it looks like | Why it matters |
|---|---|---|
| Stale prices | A bond's price unchanged for 20 days | Hides risk; understates VaR |
| Missing time series | A new issuer with three months of history | Needs a proxy; may be non-modellable |
| Proxies | Spread history approximated by a rating and sector index | Fine if documented; a source of PLA failure |
| Spikes and bad ticks | A one-day jump from a data error | A false extreme scenario dominates VaR for a year |
| Mapping errors | Trade mapped to the wrong curve or bucket | Wrong sensitivities and capital |
| Book classification errors | Position in the wrong book or desk | Wrong rulebook or approval status |
| Late or missing trades | Booked after cut-off or in a system not feeding risk | Invisible risk; reconciliation break |

**Reconciliation.** Every day the risk system's trade population and P&L must reconcile to finance P&L and the ledger. If risk sees 49,800 trades and finance 50,000, the missing 200 are invisible risk. It is the discipline of [[22 Credit Risk Data, Systems and BCBS 239]], done daily before breakfast.

**The overlap with counterparty exposure engines.** Both engines simulate market factors and revalue often the same trades with the same pricing libraries and market data. They differ in purpose (what the bank loses if prices move, versus what each counterparty will owe at future dates), horizon (days versus years) and aggregation (desk versus netting set). Sharing trade feeds, market data, scenario generation and pricing avoids inconsistent numbers, which is why many banks are converging them. CVA, which needs both, is the bridge.

## Common mistakes and misunderstandings

- **"Market risk needs a default."** No. A government bond can lose a fifth of its value with no default risk, as long-dated bonds did when rates rose sharply in 2022.
- **"VaR is the most we can lose."** It is a threshold broken on purpose about 1 day in 100 at 99%; losses beyond it can be many times larger.
- **"Low VaR means a safe book."** It may mean a calm window, missing factors or hidden tail risk. Look at ES, stress and sensitivities.
- **"Sensitivities add up across everything."** Only across the same factor.
- **"Notional is risk."** A huge hedged swap book can have little market risk; a small option book can have a lot.
- **"Trading book and banking book are just labels."** They decide the rulebook, capital, limits and systems. Misclassification is a regulatory finding.
- **"Interest rate risk is a trading problem."** Banking book rate risk can dwarf trading risk, as bank failures in 2023, combining bond losses with deposit outflows, showed.
- **"Unexplained P&L is noise."** Persistent unexplained P&L signals missing risk or data mismatches, and under FRTB can cost a desk its model approval.
- **"Price is one number."** Trader mark, verified mark, fair value and prudent value can all differ.
- **"Credit spread risk is ours."** In the trading book it is market risk (default in the DRC); in the banking book it is CSRBB under Pillar 2; loan defaults are credit risk. Three treatments of one idea, which must not be double counted or missed.

## What a platform lead needs to know about this

**Data.** For each position: terms, book, desk, trading or banking book flag, FRTB desk status, counterparty, issuer, product classification and risk factor and bucket mappings. For each risk factor: definition, source, daily history, liquidity horizon and modellability evidence. For each day: the golden source snapshot, scenarios, and the front office, hypothetical, risk-theoretical and actual P&Ls. Issuer hierarchies, ratings and legal entity identifiers should come from the same reference data as credit; otherwise the default risk charge and credit concentration reports will disagree about who owns whom.

**Systems.** Expect front office systems per asset class, a market data platform, one or more risk engines, an FRTB calculator, limit monitoring, reporting, and the counterparty exposure engine sharing inputs. The credit platform mostly *consumes*: market data for expected credit loss and stress scenarios, trading book issuer exposures for single-name concentration and large exposures, CVA, and market risk RWA for the capital picture in [[18 Regulatory Capital and Basel - the Short Version]] and [[23 Reporting - Regulatory Returns, Pillar 3 and Management Information]]. It may *supply* ratings, probabilities of default and loss given default for the DRC, and banking book positions for IRRBB and CSRBB.

**Controls.** Daily completeness reconciliation to finance; market data checks for staleness, spikes, gaps and proxy approval; P&L explain thresholds; backtesting and PLA monitoring; limit breach logs; book and desk classification governance; model validation of pricing, VaR, ES and FRTB; and source-to-return lineage in line with [[22 Credit Risk Data, Systems and BCBS 239]].

**Who owns what.** Traders own positions (first line). Market risk owns limits, methodology, the daily report and challenge (second line). Product control owns official P&L, IPV and valuation adjustments. Quantitative analysts own pricing models; model validation reviews them. Market data operations owns the golden source. Treasury owns IRRBB and CSRBB positions, overseen by a balance sheet risk team. Regulatory reporting owns FRTB returns. Technology runs the batch and compute grid. The joins between credit and market risk technology (market data, issuer reference data, counterparty exposure, CVA, stress scenarios, consolidated capital) are where a platform lead earns their keep, because each team assumes the other owns them.

## Related notes

- [[basel-credit-risk-explained-simply]], section 8, for the banking book versus trading book split this note continues.
- [[basel-credit-risk-decision-tree]] for where the trading book branches off.
- [[01 What a Bank Is and How It Makes Money]] for where markets and treasury sit.
- [[02 What Credit Risk Is]] for the credit side of the comparison.
- [[10 Internal Ratings, Scorecards and PD Models]] for the ratings the default risk charge uses.
- [[13 Credit Governance - Committees, Authorities and the Three Lines]] for the three lines of defence.
- [[14 Risk Appetite, Limits and Concentration]] for limits and concentration.
- [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]] and [[ifrs9-explained-simply]] for amortised cost versus fair value.
- [[18 Regulatory Capital and Basel - the Short Version]] for how market risk RWA joins the capital ratio.
- [[19 Counterparty Credit Risk and Derivatives]] for derivatives, CVA and the exposure engine.
- [[20 Stress Testing and ICAAP]] for bank-wide stress testing, Pillar 2 and IRRBB.
- [[21 Model Risk Management and Validation]] for validating pricing, VaR and ES models.
- [[22 Credit Risk Data, Systems and BCBS 239]] for data architecture, lineage and reconciliation.
- [[23 Reporting - Regulatory Returns, Pillar 3 and Management Information]] for market risk in returns and disclosures.
- [[26 Sovereign, Bank and Country Risk]] for sovereign bond and spread risk.
- [[28 Master Glossary]].
