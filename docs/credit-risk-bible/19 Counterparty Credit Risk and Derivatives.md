# Counterparty Credit Risk and Derivatives

**Why this matters to you.** Most credit risk is one-directional: the bank lends, the borrower owes. Derivatives are different. The amount owed can change every day and can flip from one side to the other, so the "loan" is a moving target. This is counterparty credit risk, and it has its own vocabulary, its own legal documents, its own capital formula and its own systems, which are usually run by a different part of the bank from the loan book. A platform lead for credit risk will be asked to bring derivative exposures into the same limits, the same reports and the same capital numbers as loans, and will discover that the data looks nothing alike. This note explains derivatives from scratch, then the risk, then the machinery.

## Table of contents

1. [The lemonade stand version](#the-lemonade-stand-version)
2. [What a derivative is](#what-a-derivative-is)
3. [Why banks and clients use them](#why-banks-and-clients-use-them)
4. [Mark-to-market: why exposure changes daily](#mark-to-market-why-exposure-changes-daily)
5. [Potential future exposure and expected positive exposure](#potential-future-exposure-and-expected-positive-exposure)
6. [Netting and the ISDA master agreement](#netting-and-the-isda-master-agreement)
7. [Collateral and the credit support annex](#collateral-and-the-credit-support-annex)
8. [Central clearing and CCPs](#central-clearing-and-ccps)
9. [SA-CCR walk-through with a tiny example](#sa-ccr-walk-through-with-a-tiny-example)
10. [Wrong-way risk](#wrong-way-risk)
11. [CVA, DVA and FVA](#cva-dva-and-fva)
12. [Credit limits for derivatives](#credit-limits-for-derivatives)
13. [The xVA desk](#the-xva-desk)
14. [Securities financing transactions and repos](#securities-financing-transactions-and-repos)
15. [The systems and the data problems](#the-systems-and-the-data-problems)
16. [Common mistakes and misunderstandings](#common-mistakes-and-misunderstandings)
17. [What a platform lead needs to know about this](#what-a-platform-lead-needs-to-know-about-this)
18. [Related notes](#related-notes)

## The lemonade stand version

You and your friend Priya agree today that in one month you will swap your bike for her skateboard. Right now the two are worth about the same, so neither of you owes the other anything. But over the month, bikes become fashionable and skateboards do not. Now your bike is worth 30 coins and her skateboard 20. If Priya moves away before the swap, you lose nothing: you keep your bike. But if *you* had the worse end (your bike had become worth 20 and her skateboard 30), and Priya vanished, you would lose the 10 coins of gain you were about to receive.

That is counterparty credit risk: the risk that the other side of a two-way deal disappears at a moment when the deal is worth money to you. The amount at risk changes every day with the prices of bikes and skateboards, and it can be zero one week and 10 coins the next. Everything in this note is about measuring, limiting and protecting against that.

## What a derivative is

A **derivative** is a contract whose value depends on (is derived from) something else, called the **underlying**: an interest rate, an exchange rate, a share price, a commodity price, a bond, or even the weather. The contract itself is just a promise about future payments. There are four basic shapes.

**Forward.** Agree today to buy or sell something at a fixed price on a fixed future date. Example: a British importer agrees with its bank to buy 1 million US dollars in three months at 1.25 dollars per pound, so it will pay 800,000 pounds whatever the exchange rate does. If the dollar strengthens to 1.20, the importer's forward is worth money (it gets dollars cheaper than the market); if the dollar weakens to 1.30, the forward costs the importer (it is paying more than the market). Nothing is paid up front.

**Future.** A forward that is standardised and traded on an exchange, with the exchange's clearing house in the middle and daily settlement of gains and losses. Same economics, much less counterparty risk, because the daily settlement means the unpaid gain is never more than one day's move.

**Swap.** An agreement to exchange streams of payments over time. The most common is an **interest rate swap**: one side pays a fixed rate on a notional amount (say 4% on 100 million), the other pays a floating rate that resets each period (say the overnight rate plus nothing). Only the net difference changes hands each period. If floating rates rise to 6%, the fixed payer is receiving 6% and paying 4% and the swap is worth money to them; the other side is losing. Other swaps exchange currencies (cross-currency swaps), commodity prices, or the return on a share index.

**Option.** The right, but not the obligation, to buy (a **call**) or sell (a **put**) something at a fixed price (the **strike**) on or before a date. The buyer pays a **premium** up front and can never lose more than that; the seller collects the premium and takes on an open-ended risk. Example: an airline buys a call option on jet fuel at 100 per barrel. If fuel goes to 130, it exercises and saves 30; if fuel goes to 80, it lets the option lapse and buys at market.

| Type | Obligation | Up-front payment | Where traded | Counterparty risk |
|---|---|---|---|---|
| Forward | Both sides must perform | None | Over the counter (OTC), bilateral | Full, both ways, grows with time |
| Future | Both sides must perform | Margin only | Exchange, cleared | Small, limited to one day's move |
| Swap | Both sides must perform, many dates | None (usually) | OTC, often centrally cleared | Full, both ways, long-dated |
| Option | Buyer has a right; seller has an obligation | Premium paid by buyer | OTC or exchange | Buyer bears risk on the seller; seller bears none after premium |

**Notional** is the reference amount the payments are calculated on (the 100 million in the swap). It is almost never exchanged and it is not the exposure, which is the single most common confusion about derivatives. A 100 million swap might have an exposure of 2 million or of zero.

## Why banks and clients use them

**Clients hedge.** An exporter who will receive dollars in six months does not want to gamble on the exchange rate, so it sells those dollars forward and locks in the sterling amount. A company with a floating-rate loan fears rising rates and enters a swap to pay fixed. An airline fixes its fuel cost. A pension fund with long-dated liabilities uses swaps to match them. For these clients the derivative removes a risk they do not want and are not paid to take. The bank's credit risk on the client arises because the hedge may end up in the bank's favour, and if the client fails then, the bank loses the gain.

**Banks hedge too.** A bank with a book of 25-year fixed-rate mortgages funded by deposits that reprice monthly is badly exposed if rates rise: its income is fixed and its costs go up. It enters swaps to pay fixed and receive floating, which turns the fixed mortgage income into floating income that moves with its deposit costs. This is interest rate risk in the banking book management, and a big bank's treasury runs enormous swap books for it. Banks also hedge the currency of their foreign subsidiaries, and their trading desks run derivative positions for clients and for their own account.

**Banks make markets.** Dealers stand ready to be the other side of a client's hedge, earning a spread, and then hedge their own resulting position with other dealers or through exchanges. This is why dealer banks have thousands of counterparties and millions of trades, and why their counterparty risk is a system-level problem.

## Mark-to-market: why exposure changes daily

Every derivative is revalued every day at current market prices. The value is the **mark-to-market**, shortened to **MTM**, also called the **present value** or the **replacement cost**. It is the amount you would receive (if positive) or pay (if negative) to close the contract out today, and equivalently what it would cost to replace the contract with a new one if the counterparty vanished.

Credit exposure on a derivative is the MTM **if it is positive**, and zero if it is negative. If the deal is worth 3 million to you and the counterparty fails, you have lost 3 million (you had a 3 million asset that is now a claim in a bankruptcy). If the deal is worth minus 3 million to you and the counterparty fails, you owe 3 million to their estate, and you have lost nothing. So:

> Current exposure = max(MTM, 0)

On day one most derivatives have MTM near zero (they are struck at market), so exposure is near zero. As markets move, the MTM drifts away from zero, and the exposure grows on one side. For a long-dated swap, the possible range of MTM is large, because rates can move a long way over ten years. That is why counterparty risk is as much about the future as about today.

## Potential future exposure and expected positive exposure

Picture a graph. The horizontal axis is time, from today out to the final maturity of the trades. The vertical axis is exposure in money. Today, the exposure is a single known number, the current positive MTM. Tomorrow, it could be a bit higher or a bit lower, so draw a narrow fan. In a year, it could be much higher or much lower, so the fan is wider. The fan keeps widening as the market has more time to move, and then, for a trade with a fixed end date, it narrows again towards the end because fewer payments remain to be at risk. For an amortising swap or a portfolio of trades maturing at different times, the shape is a hump: rising, peaking somewhere in the middle, and falling to zero at the final maturity.

Now take a horizontal slice of that fan at each future date and ask two questions.

**Potential future exposure**, shortened to **PFE**, answers "at this future date, what is the exposure at a high confidence level, say the 95th or 99th percentile?" It is the upper edge of the fan. PFE is what credit officers use for **limits**, because it says "how bad could it plausibly get?" The **peak PFE** is the highest point of the upper edge across all dates, and it is the single number usually compared to a counterparty's limit.

**Expected positive exposure**, shortened to **EPE**, answers "at this future date, what is the average of the positive exposures across all the scenarios?" It is the middle of the positive part of the fan. **Effective EPE**, used in the internal model method for capital, is a time-weighted average of EPE over the first year, with a rule that it cannot decrease. EPE and its relatives are what the pricing desk uses for **CVA**, because pricing cares about the expected cost, not the worst case.

These numbers come from a **Monte Carlo simulation**: the exposure engine generates thousands of possible future paths for every market factor (rates, currencies, prices), revalues every trade on every path at every future date, applies netting and collateral, and reads off the percentiles and averages. A large dealer's exposure engine is one of the biggest computations in the bank, and it runs overnight.

A tiny illustration. A five-year interest rate swap with 100 million notional, struck at market, so MTM today is zero. The simulation might produce a PFE profile at the 95th percentile of roughly 1.5 million at six months, 3.5 million at two years, peaking at about 4 million around year two and a half, and falling to zero at year five. EPE might be about 1.2 million at two years. The credit limit for this counterparty would be tested against the 4 million peak, and the CVA would be priced on the EPE path. Numbers are illustrative; real profiles depend on volatility and the shape of the trade.

## Netting and the ISDA master agreement

A dealer might have 500 trades with one counterparty, some worth plus 2 million, some minus 3 million, and so on. Without netting, if the counterparty fails, the bank must pay the ones it owes and queue in the bankruptcy for the ones it is owed. The exposure is the sum of all the positives. With **close-out netting**, all 500 trades are terminated at once, every MTM is added up, and a single net amount is owed by one side to the other. Exposure is max(net MTM, 0), which is far smaller.

The document that makes this work is the **ISDA master agreement**, published by the International Swaps and Derivatives Association. It is a standard contract that the two parties sign once; every subsequent trade is a confirmation under it. Its key terms: events of default and termination events, the right to close out and net, the method for valuing terminated trades, and a **schedule** where the parties customise it. For netting to count in capital, the bank needs a **legal opinion** that close-out netting is enforceable in the counterparty's jurisdiction and for that counterparty type, which ISDA commissions for most countries and banks maintain in a netting database. Where there is no agreement or no enforceable opinion, trades are measured gross.

A **netting set** is the group of trades with one counterparty under one enforceable netting agreement. A counterparty can have several (one per legal entity, or per product if agreements differ), and the capital calculation is done per netting set.

## Collateral and the credit support annex

Netting reduces exposure; collateral reduces it further. The **credit support annex**, shortened to **CSA**, is the attachment to the ISDA master agreement that sets the collateral rules.

![[19-bilateral-vs-cleared.svg]]
*Left: a bilateral relationship under an ISDA master agreement and credit support annex. Right: the same trades through a central counterparty, with its default waterfall.*

**Variation margin**, shortened to **VM**, is collateral that tracks the MTM. Each day (or less often for some clients), the net MTM of the netting set is calculated, and the party that is out of the money posts cash or securities to the other to cover it. If the bank is owed 5 million and holds 5 million of variation margin, its current exposure is zero. VM is the single most powerful tool against counterparty risk, and since 2016 regulations have required daily VM between financial counterparties in most major markets.

**Initial margin**, shortened to **IM**, covers the gap between the last VM call and the time it would actually take to close out the trades after a default: the **margin period of risk**, typically assumed to be 10 business days for bilateral trades. IM is sized to the potential move in that window at a high confidence level. Between financial counterparties above a size threshold, both sides now post IM to a third-party custodian (so it is segregated and not reusable), under rules often called the uncleared margin rules. Many corporate clients do not post IM.

**Threshold.** An amount of unsecured exposure the parties agree to tolerate before any collateral is called. A threshold of 10 million means the bank calls nothing until it is owed more than 10 million, and then only the excess. Thresholds are common for corporate clients; zero for dealers.

**Minimum transfer amount**, shortened to **MTA**. To avoid daily calls for trivial sums, no transfer is made unless the amount due exceeds the MTA, say 250,000. The threshold plus the MTA is the maximum unsecured exposure under the CSA.

**Eligible collateral and haircuts.** The CSA lists what may be posted (cash in certain currencies, government bonds of certain countries, sometimes equities) and the **haircut** applied to each (a 2% haircut means 100 of bonds covers only 98 of exposure). Currency mismatches get extra haircuts.

**Rating triggers and one-way CSAs.** Some CSAs change terms if a party is downgraded (lower thresholds, more collateral), which is procyclical and was a problem in 2008. Some are **one-way**, where only the client posts, common with sovereigns and supranationals who refuse to post, leaving the bank with uncollateralised exposure.

A worked example. A bank has a netting set with a corporate client: net MTM in the bank's favour of 12 million. The CSA has a threshold of 5 million and an MTA of 1 million. Collateral due is 12 minus 5 = 7 million, above the MTA, so the bank calls 7 million. After the client posts, the bank's unsecured exposure is 5 million (the threshold). If the MTM rose to 12.5 million the next day, the extra 0.5 million is below the MTA, so no call is made and the unsecured exposure is 5.5 million.

## Central clearing and CCPs

A **central counterparty**, shortened to **CCP**, is a specialist institution that steps between the two parties to a trade: the original contract between Bank A and Bank B is replaced by two contracts, A with the CCP and the CCP with B. This is called **novation**. The CCP now faces everyone, and everyone faces only the CCP.

The CCP protects itself with a **default waterfall**: it collects VM daily and IM from every member; if a member defaults, the CCP uses that member's IM first, then that member's contribution to the **default fund**, then a slice of the CCP's own capital, then the default fund contributions of all the other members, and in extreme cases further assessments on members. The surviving members therefore have an exposure to the CCP, through their default fund contributions, which attracts its own capital charge.

Why regulators pushed clearing after 2008: the bilateral market had become a dense web of chains (A owes B owes C owes A) that nobody could see. When Lehman Brothers failed, nobody knew who was exposed to whom. A CCP sees the whole picture, nets across all members (so the total exposure in the system falls sharply), enforces daily margin on everyone, and has a tested process for handling a default. The G20 agreed in 2009 that standardised OTC derivatives should be cleared, and most interest rate swaps and index credit default swaps between financial firms now are. A **qualifying CCP** (one meeting international standards) gets a 2% risk weight on trade exposures, versus perhaps 20% to 100% for a bilateral counterparty. The flip side is that CCPs are now the most systemically important institutions in the world, and their own failure is the new nightmare.

**Clearing members and clients.** Only large firms are direct **clearing members**. Smaller firms clear as **clients** through a member, which creates a second layer of relationships and rules about segregation of client margin.

## SA-CCR walk-through with a tiny example

The **standardised approach for counterparty credit risk**, shortened to **SA-CCR**, is the Basel formula for the exposure at default of a netting set when the bank does not have permission for an internal model. From [[basel-credit-risk-explained-simply]]:

> EAD = 1.4 x (RC + PFE)

![[19-saccr-steps.svg]]
*The SA-CCR calculation: replacement cost from net MTM and collateral, potential future exposure from supervisory add-ons by asset class, combined and scaled by alpha.*

**Replacement cost (RC).** For an unmargined netting set, RC = max(V minus C, 0), where V is the net MTM and C is the haircut-adjusted collateral held. For a margined set, RC also allows for the threshold and MTA: RC = max(V minus C, TH + MTA minus NICA, 0), where NICA is the net independent collateral amount (initial margin received net of posted).

**Potential future exposure (PFE).** The rulebook gives each **asset class** (interest rate, foreign exchange, credit, equity, commodity) a **supervisory factor** that represents a conservative one-year move, and a method for combining trades into **hedging sets** where offsetting positions can net. For each trade, an **adjusted notional** is computed (for interest rate trades this includes a duration-like factor so that a 10-year swap counts for more than a 1-year swap), multiplied by a **maturity factor** (shorter for margined sets, reflecting the margin period of risk), a **supervisory delta** (plus or minus one for linear trades, option deltas for options), and the supervisory factor. The add-ons are aggregated per hedging set and per asset class to give the **aggregate add-on**. Finally a **multiplier**, between 0.05 and 1, reduces the PFE when the netting set is heavily out of the money or over-collateralised.

**A tiny numeric example.** One unmargined five-year interest rate swap, notional 100 million, MTM today plus 1 million in the bank's favour, no collateral. Illustrative rulebook parameters: supervisory factor for interest rates 0.5%; the duration-style adjustment for a five-year swap gives an adjusted notional of roughly 4.4 times notional, about 440 million (the exact rulebook formula is (exp(minus 0.05 x 0) minus exp(minus 0.05 x 5)) / 0.05, which is about 4.42); maturity factor 1 for an unmargined trade over one year; delta plus 1.

- RC = max(1 million minus 0, 0) = 1 million.
- Add-on = 440 million x 1 x 1 x 0.5% = 2.2 million.
- Multiplier: with a positive MTM and no collateral the multiplier is 1.
- PFE = 2.2 million.
- EAD = 1.4 x (1 + 2.2) = 4.48 million.

So a 100 million swap produces a regulatory exposure of about 4.5 million, which is then risk-weighted according to the counterparty (say 100% for an unrated corporate, giving 4.5 million of RWA, or 2% for a qualifying CCP). Add a second swap in the opposite direction with the same counterparty and maturity, and the two add-ons offset inside the hedging set, bringing PFE near zero. Add a CSA with daily variation margin, and the maturity factor falls and RC is capped by threshold and MTA. These effects are why netting and collateral are so valuable in capital terms, and why the data that evidences them matters.

Banks with regulatory permission use the **internal model method**, shortened to **IMM**, which replaces SA-CCR with their own simulation (effective EPE times alpha, with alpha floored at 1.2 or set by the regulator). IMM is usually lower but requires a validated engine, back-testing and stress testing.

## Wrong-way risk

**Wrong-way risk** is when the exposure to a counterparty grows at the same time as the counterparty's probability of default rises. Two kinds:

- **Specific wrong-way risk**: the trade itself is linked to the counterparty. Buying credit protection on a company from that company's own subsidiary; lending against a company's own shares; a currency hedge with an emerging-market bank where a devaluation both increases the bank's exposure and makes the counterparty insolvent. Regulators require these to be identified and treated with the exposure set to the full notional or similar.
- **General wrong-way risk**: a macro correlation. A commodity hedge with an oil producer: if oil falls, the hedge is worth money to the bank and the producer is in trouble. Interest rate swaps with highly leveraged funds that lose money when rates spike. This is captured, if at all, through stress tests and overlays on exposure, and through conservative limit-setting.

The opposite, **right-way risk**, is when exposure falls as the counterparty weakens (an airline that sold the bank fuel calls; if fuel rises the airline is in trouble but the bank's exposure falls). It is real but rarely given capital credit.

## CVA, DVA and FVA

**Credit valuation adjustment**, shortened to **CVA**, is the market price of the counterparty risk in a derivative portfolio: the expected loss from counterparty default, discounted, computed roughly as the sum over time of EPE(t) x probability of default in period t x LGD. Banks deduct CVA from the fair value of their derivative assets, so it is a cost in the income statement, and a bank's reported derivative values are "net of CVA". Because EPE depends on market moves and PD depends on credit spreads, CVA moves every day even if nobody defaults. During 2008, banks lost more from CVA increases than from actual counterparty defaults, which is why Basel III introduced a **CVA capital charge** (under the market risk chapters, as [[basel-credit-risk-explained-simply]] explains, with basic and standardised approaches).

**Debit valuation adjustment**, shortened to **DVA**, is the mirror: the value to the bank of its own possible default on derivatives it owes money on. Accounting standards require it to be recognised, with the odd result that a bank's profit rises when its own credit quality falls. Regulators remove DVA from capital.

**Funding valuation adjustment**, shortened to **FVA**, reflects the cost of funding uncollateralised derivative positions: if the bank is owed 10 million by an uncollateralised client but has hedged with a dealer under a daily-margin CSA, it must post 10 million of collateral to the dealer and fund that, which costs money over the life of the trade. There are further letters (MVA for margin, KVA for capital), collectively **xVA**.

CVA is credit risk measured as a price; the expected loss on a loan is credit risk measured as a provision. They are the same idea expressed in two accounting languages, which is why [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]] and this note describe cousins.

## Credit limits for derivatives

Derivatives are brought into the counterparty's overall credit limit (see [[14 Risk Appetite, Limits and Concentration]]) using exposure measures rather than notionals:

| Limit type | What it measures | Typical use |
|---|---|---|
| PFE limit | Peak PFE at a high percentile, per counterparty, often with sub-limits by tenor bucket (1 year, 5 years, 10 years plus) | The main pre-deal credit check for derivatives; a new trade is simulated incrementally against the limit |
| Current exposure limit | Net MTM less collateral | Monitoring; triggers collateral calls and reviews |
| Settlement limit | The gross amount due to be exchanged on a single day (currency deliveries, securities settlements) | Herstatt-type risk; capped per counterparty per day, mitigated by payment-versus-payment systems such as CLS |
| Tenor limit | Maximum maturity of trades allowed | Shorter for weaker counterparties |
| Product limits | Which products are allowed | No exotic options with small corporates, for instance |
| Collateral terms as conditions | CSA required, threshold and MTA caps | Limits approved conditional on documentation |

The pre-deal check is a system call: the trader or salesperson asks the limit system whether a proposed trade fits, the exposure engine computes the incremental PFE (which can be negative if the trade offsets existing ones), and the answer comes back in seconds. For large or unusual trades the credit officer is consulted. Breaches are reported daily, as in [[15 Monitoring, Early Warning and Watchlist]].

## The xVA desk

Large banks have a central **xVA desk** (or CVA desk) that owns the counterparty risk of the whole derivatives business. When a trading desk does an uncollateralised trade with a client, it pays the xVA desk a charge equal to the CVA (and FVA) of the trade, so the trading desk sees the true cost; the xVA desk then manages the aggregate risk by buying credit protection (credit default swaps on the counterparty or an index) and hedging the market factors that drive EPE. The desk's profit and loss is the CVA movement plus its hedges. It works closely with credit risk (who set limits and approve counterparties), with the exposure engine team, with finance (who book the CVA) and with regulatory capital (who compute the CVA charge). From the platform's point of view it is both a major consumer of exposure data and the group that notices first when the data is wrong, because wrong data means wrong hedges and real money lost.

## Securities financing transactions and repos

**Securities financing transactions**, shortened to **SFTs**, are the other family of counterparty risk, and they are enormous in volume. The main types, from [[basel-credit-risk-explained-simply]]:

- **Repo** (repurchase agreement): sell a security today, agree to buy it back later at a slightly higher price. Economically, a secured cash loan where the security is the collateral. The difference in price is the interest. The cash lender does a **reverse repo**.
- **Securities lending**: lend a security (often shares) against cash or other securities as collateral, for a fee, to someone who needs it (typically to deliver on a short sale).
- **Margin lending**: lend cash to a client to buy securities, holding the securities as collateral.

Repos are how banks, central banks and funds manage short-term cash: a bank with spare cash lends it overnight against government bonds; a fund needing cash borrows it against its holdings. Most repos are overnight or a few days; some are longer ("term repo"). The market is in the trillions daily and it is the plumbing of the financial system; when it seizes, as in 2008 and briefly in 2019 and 2020, central banks step in.

**The risk.** The cash lender holds collateral worth, say, 102 against 100 of cash (the 2 is the **haircut** or **initial margin**). If the borrower defaults and the collateral has fallen to 98, the lender loses 2. So the risk is: counterparty default *combined with* a fall in collateral value, over the time it takes to sell the collateral. Daily margining keeps the gap small: if the collateral falls, the borrower must top up. The standard contract is the **global master repurchase agreement** (GMRA) for repos and the **global master securities lending agreement** (GMSLA) for securities lending, each with close-out netting like an ISDA.

**Capital treatment.** SFTs are not derivatives and do not use SA-CCR. The exposure is calculated with the **comprehensive approach**: exposure = max(0, cash lent plus haircut on the collateral minus collateral value, adjusted for currency mismatch), with supervisory haircuts by collateral type and residual maturity, and netting across a master agreement using a formula that recognises offsetting positions. Banks with permission may use their own value-at-risk model or IMM. [[basel-credit-risk-explained-simply]] notes the classic mistake of running repos through SA-CCR.

**A small example.** A bank lends 100 million cash overnight against government bonds worth 102 million. Supervisory haircut on the bonds, say 2% (illustrative; real haircuts depend on issuer, rating and maturity). Exposure = max(0, 100 minus 102 x (1 minus 0.02)) = max(0, 100 minus 99.96) = 0.04 million. Risk-weight at the counterparty's weight. Now suppose the collateral were equities with a 25% haircut and worth 110 million: exposure = max(0, 100 minus 110 x 0.75) = 17.5 million. The collateral type dominates.

**Operational reality.** Repos settle through securities depositories and tri-party agents, roll daily, and generate enormous transaction volumes. Collateral substitution (the borrower swaps one bond for another) is routine. Matching the collateral actually held to the trade, at the right price, with the right haircut, is a daily reconciliation task and a common source of exposure errors. Rehypothecation (re-using collateral received as collateral posted elsewhere) is legal under most agreements and makes the chains hard to follow.

## The systems and the data problems

![[19-derivative-systems.svg]]
*The chain of systems from trade capture to regulatory capital, with reference data feeding the legal, exposure and limit layers.*

**Trade capture.** Front office systems (there are usually several, by product and desk) record the economic terms of each trade. Derivatives have dozens of fields (notional schedules, rate conventions, day counts, option terms) and any error flows into valuation and exposure.

**Confirmation and legal data.** Trades are confirmed with the counterparty, often through electronic platforms, and linked to the governing ISDA, CSA and netting set. This legal linkage is the first big data problem: the master agreement database is often separate from the trade systems, counterparty legal entity names do not match, and agreements signed decades ago are on paper.

**Valuation.** A pricing library and market data feeds produce the daily MTM per trade. Disputes with counterparties over valuations are common and feed into collateral disputes.

**Collateral management.** A collateral system aggregates MTM per CSA, computes calls, issues and agrees them with the counterparty, tracks collateral balances, applies haircuts, handles substitutions and disputes. It must know every CSA's threshold, MTA, eligible collateral and frequency. Errors here mean under-collateralised exposure that nobody has noticed.

**Exposure engine.** The Monte Carlo simulation (for PFE, EPE, IMM and CVA) or the SA-CCR calculator. It consumes trades, legal linkage, collateral balances and market data, and produces exposure profiles per netting set and counterparty. Run time, model coverage (can it value every product?) and the treatment of trades it cannot value (usually a conservative add-on) are the perennial issues.

**Limit system.** Holds the approved limits per counterparty and checks exposures against them, pre-deal and end of day.

**Capital and reporting.** Takes exposures by netting set, applies risk weights and the CCP rules, computes the CVA capital charge, and feeds the quarterly process in [[18 Regulatory Capital and Basel - the Short Version]].

**Reference data.** Counterparty hierarchies (which legal entity, which group), legal entity identifiers, ratings, country, sector. Derivative counterparties are often special purpose vehicles, funds with many sub-funds, or branches of foreign banks, and getting the hierarchy right drives netting (which must be at legal entity level) and limits (which are usually at group level).

The characteristic data problems: trades not linked to a netting agreement (so measured gross); collateral not linked to the right netting set; counterparty identifiers that differ between the trading system, the legal database and the credit system; CSAs whose terms are not captured as structured data; trades the engine cannot value; stale market data; and the sheer volume, with millions of trades and thousands of counterparties re-simulated nightly. Each of these shows up as an overstated or, worse, understated exposure.

## Common mistakes and misunderstandings

- **Confusing notional with exposure.** A 100 million swap is not a 100 million risk. Exposure is the positive MTM plus a potential future add-on, typically a few percent of notional.
- **Treating exposure as fixed.** It changes daily with the market, and it can flip sides.
- **Treating repos as derivatives.** They are secured loans measured by the collateral haircut method, not SA-CCR.
- **Measuring gross when netting is enforceable, or net when it is not.** Both are errors; the second is dangerous.
- **Forgetting the threshold and MTA.** A CSA does not reduce exposure to zero; it reduces it to roughly threshold plus MTA plus the margin period of risk.
- **Assuming cleared means risk-free.** The 2% risk weight is low, not zero, and the default fund exposure to the CCP is real.
- **Confusing PFE and EPE.** PFE is a high percentile used for limits; EPE is an average used for pricing and IMM capital.
- **Treating CVA as part of credit RWA.** It is a separate market-risk style capital charge, as [[basel-credit-risk-explained-simply]] stresses.
- **Ignoring wrong-way risk.** Correlation between exposure and counterparty health is where the big losses have happened.
- **Thinking options are symmetric.** The option buyer has counterparty risk on the seller; the seller has none after receiving the premium.

## What a platform lead needs to know about this

**Data.** The counterparty risk dataset is trade-level, legal-agreement-level and collateral-level, and all three must join. For each trade: economic terms, counterparty legal entity, netting set, CSA, MTM, valuation date, product type and the asset class and hedging set it belongs to for SA-CCR. For each netting agreement: counterparty, jurisdiction, netting opinion status, products covered. For each CSA: threshold, MTA, IM terms, eligible collateral, haircuts, frequency, rating triggers, one-way or two-way. For each collateral balance: amount, type, currency, haircut, which netting set, posted or received, segregated or not. For SFTs: cash, securities, prices, haircuts, master agreement. Counterparty reference data must map the trading system's identifiers to the credit system's legal entities and groups. Expect that the legal and collateral data is the weakest, because it was never designed for calculation.

**Systems.** You will inherit a chain (trade capture, confirmation, valuation, collateral, exposure engine, limits, capital) owned by different teams, with the exposure engine usually sitting in a quantitative or market risk technology group rather than credit risk technology. The credit risk platform needs a feed of exposures by counterparty (current, PFE profile, EPE, SA-CCR EAD, collateral held) at a frequency the limits and reports need (daily for limits, quarterly for capital), with the ability to drill to netting set and trade. Reconciliation between the exposure engine's view of the trade population and the finance ledger is a standard control, and so is reconciliation of collateral balances to the custodian.

**Controls.** Completeness of trades in the exposure engine (every booked trade is simulated or has a conservative placeholder); legal linkage control (every trade mapped to an agreement, every agreement with an opinion status); collateral control (daily calls issued and agreed, disputes aged and escalated, balances reconciled); limit monitoring with daily breach reporting; model validation of the exposure engine and SA-CCR implementation (see [[21 Model Risk Management and Validation]]); wrong-way risk identification; and the regulatory tests for IMM (back-testing of exposure forecasts against realised MTM).

**Who owns what.** Trading desks own the trades. The legal and documentation team owns the agreements. Collateral operations owns the margin process. Market risk or a quant group usually owns the exposure engine and the pricing library. Credit risk owns counterparty approval, limits and the credit view of exposure. The xVA desk owns the CVA risk. Finance owns valuations and CVA in the accounts. Regulatory capital owns SA-CCR, IMM reporting and the CVA charge. The platform team's job is to join these into one picture per counterparty, which nobody else has.

## Related notes

- [[29 Market Risk]] for the market risk side of the same derivatives: sensitivities, value at risk and FRTB.
- [[basel-credit-risk-explained-simply]] for the Basel treatment of counterparty risk, settlement risk and CCPs, and the correction that netting sits inside SA-CCR.
- [[basel-credit-risk-decision-tree]] for the diagram.
- [[02 What Credit Risk Is]] for PD and LGD.
- [[11 Collateral and Security]] for collateral principles and haircuts.
- [[12 Loan Documentation, Covenants and Conditions]] for how legal documents create enforceable rights.
- [[14 Risk Appetite, Limits and Concentration]] for the limit framework.
- [[15 Monitoring, Early Warning and Watchlist]] for daily breach monitoring.
- [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]] for the accounting cousin of CVA.
- [[18 Regulatory Capital and Basel - the Short Version]] for where the exposures land in capital.
- [[21 Model Risk Management and Validation]] for validating exposure engines.
- [[22 Credit Risk Data, Systems and BCBS 239]] for data architecture and lineage.
- [[26 Sovereign, Bank and Country Risk]] for one-way CSAs and sovereign counterparties.
- [[28 Master Glossary]].
