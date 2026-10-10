# Settlement and Pre-Settlement Risk

**Why this matters to you.** Every trade a bank does with another party has two dangerous periods. The first is the long stretch between agreeing the deal and carrying it out, when the other side could disappear and leave the bank having to replace the deal at a worse price. The second is the short, sharp moment of the exchange itself, when the bank may have sent its money and not yet received what it bought. The first is **pre-settlement risk**; the second is **settlement risk**. They are measured, limited and owned differently, yet a single foreign exchange (FX) forward carries both. Settlement risk is easy to forget because it lasts only hours, and enormous because it is the full amount of the trade. Your platform will probably hold the limits for both, fed by some of the most time-critical data in the bank. This note puts the two side by side so you never confuse them.

## Table of contents

1. [The swapping-stickers version](#the-swapping-stickers-version)
2. [From trade date to settlement date](#from-trade-date-to-settlement-date)
3. [The two risks side by side](#the-two-risks-side-by-side)
4. [Worked example: one FX forward through its life](#worked-example-one-fx-forward-through-its-life)
5. [Measuring pre-settlement risk](#measuring-pre-settlement-risk)
6. [Measuring settlement risk](#measuring-settlement-risk)
7. [Mitigants: DvP, PvP, CLS and friends](#mitigants-dvp-pvp-cls-and-friends)
8. [The Basel capital treatment in brief](#the-basel-capital-treatment-in-brief)
9. [Limits: pre-settlement and daily settlement](#limits-pre-settlement-and-daily-settlement)
10. [Famous episodes](#famous-episodes)
11. [Systems and data](#systems-and-data)
12. [Common mistakes and misunderstandings](#common-mistakes-and-misunderstandings)
13. [What a platform lead needs to know about this](#what-a-platform-lead-needs-to-know-about-this)
14. [Related notes](#related-notes)

## The swapping-stickers version

On Monday you and Sam agree that on Friday you will swap your rare gold football sticker for Sam's ten ordinary stickers. Right now they are worth about the same.

**Between Monday and Friday** the playground market moves. Suppose gold stickers go out of fashion and by Thursday yours is worth only six ordinary ones. Your deal with Sam is now a very good one: you get ten stickers for something worth six. If Sam moves school on Thursday, you still have your gold sticker, but you have lost the good deal. To get ten ordinary stickers now you would have to give up more than your gold one is worth, so you are four stickers worse off. (If gold had gone *up* instead, Sam leaving would cost you nothing: you would simply swap with someone else on better terms.) That is **pre-settlement risk**: losing the *value* of an unfinished deal. It is small compared with the stickers involved, and it goes up and down every day.

**On Friday** you meet at the school gate. You hand over your gold sticker first. Before Sam can open his bag, the bell rings and Sam runs off with your sticker and his ten. Now you have lost the *whole* gold sticker, not just a bit of value. That is **settlement risk**: losing the full amount at the moment of exchange because the two halves did not happen together.

The fix for Friday: put both lots on the table and let a teacher swap them at the same instant. Banks built exactly that.

## From trade date to settlement date

### Trade date and value date

Every trade has at least two dates:

- **Trade date**, written **T**: the day the two parties agree the price and amounts. Nothing is exchanged yet. The deal is a promise.
- **Settlement date**, also called the **value date**: the day the promise is carried out and money and assets actually move.

Market convention describes the gap in business days. **T+0** means same-day settlement, **T+1** the next business day, **T+2** two business days later, and so on. Business days skip weekends and the holidays of the currencies involved, so a Thursday trade at T+2 normally settles on Monday.

### The usual conventions

Conventions change and differ by market; treat this as a guide.

| Product | Usual settlement | Notes |
|---|---|---|
| FX spot | T+2 for most currency pairs | Some pairs settle T+1 by convention, for example United States dollar against Canadian dollar |
| FX forward | Any agreed future date, from a few days to several years | The settlement date is fixed on trade date; until then it is a derivative |
| FX swap | Two settlements: a near leg (often spot) and a far leg (the forward date) | Two separate settlement risk events, plus pre-settlement risk on the far leg in between |
| Government bonds | T+1 in many markets, T+2 in others | Varies by country |
| Shares (equities) | T+1 in the United States, Canada and Mexico since 2024; T+2 in the United Kingdom and European Union, which plan to move to T+1 | Shorter cycles cut pre-settlement risk but squeeze operations |
| Over-the-counter derivatives | Periodic payments; final payment or delivery at maturity | Cross-currency swaps and physically settled options exchange full principal |

The **gap between trade date and settlement date is where pre-settlement risk lives**, and **the settlement date itself is where settlement risk lives**.

![[31-exposure-timeline.svg]]
*A trade's life as two zones of risk: from trade date the bank carries pre-settlement risk, a moving replacement cost that is usually a small fraction of notional; on the value date, once it sends its leg, it carries settlement risk on the full principal until receipt is confirmed.*

### What "settlement" actually involves

Settlement is not one click. For a typical FX trade:

1. **Confirmation.** Both sides confirm the terms, usually by messages over **SWIFT** (the Society for Worldwide Interbank Financial Telecommunication, the banks' messaging network) or a matching platform.
2. **Settlement instructions.** Each side tells the other which account to pay into. Banks keep **standard settlement instructions** (SSIs) on file per counterparty and currency.
3. **Payment.** On value date the bank instructs its payment system or its **correspondent bank** (a bank abroad that holds accounts on its behalf) to pay out its currency. Once a payment is past its **cancellation cut-off** it cannot be recalled.
4. **Receipt.** The other currency arrives in the bank's **nostro account** (from the Latin for "ours": the bank's own account held at a correspondent bank abroad).
5. **Reconciliation.** Operations checks what arrived against what was expected and chases gaps.

The settlement risk window runs from step 3 (our payment can no longer be stopped) to step 5 (we know theirs has arrived), which can be a day or two, not hours.

## The two risks side by side

| | Pre-settlement risk | Settlement risk |
|---|---|---|
| Plain question | If they fail before the exchange, what will it cost to replace the deal? | If they fail during the exchange, how much have we already handed over? |
| Also called | Counterparty credit risk, replacement cost risk | Delivery risk, principal risk, Herstatt risk |
| When it exists | From trade date until settlement | From the moment our leg becomes irrevocable until theirs is confirmed |
| How long | Days to decades | Hours, sometimes a day or two |
| Size | Positive mark-to-market plus a buffer for future moves: usually a few per cent of notional | The full principal of what we pay or deliver |
| Moves with markets? | Yes, every day, can be zero | No, it is fixed by the trade amounts |
| Who usually owns the limit | Credit risk (counterparty credit officers) | Credit risk sets it; treasury operations or payments operations runs it day to day |
| Main mitigants | Netting agreements, collateral, central clearing | Payment versus payment, delivery versus payment, payment netting, prefunding |

The key line is **size**: pre-settlement exposure on a 10 million forward might be 300,000; settlement exposure is 10 million.

## Worked example: one FX forward through its life

All figures illustrative. Ignore interest rate discounting to keep the arithmetic clear.

**The trade.** On 1 March, a British exporter that will receive 12.5 million United States dollars (USD) in six months agrees a forward with our bank: on 1 September the exporter will deliver USD 12.5 million and the bank will pay 10 million pounds (GBP). The forward rate is 1.25 dollars per pound. Notional: GBP 10 million.

**Who wins when.** The bank is buying dollars at 1.25. If the dollar strengthens (say to 1.20), the forward is worth money to the bank; if it weakens (say 1.30), to the exporter.

**Mark-to-market** (MTM, the value of the contract at today's prices) to the bank, in pounds:

> MTM = (USD 12.5 million divided by today's rate) minus GBP 10 million

**Pre-settlement exposure** is the positive MTM plus an **add-on**, a buffer for how much the MTM could still move before settlement. Here the bank uses an illustrative internal add-on table for FX forwards that shrinks as the remaining time shrinks: 5% of notional with six months to go, 4% at four months, 2.5% at two months, 1% in the final week.

| Date | Rate | Value of USD 12.5m in GBP | MTM to bank | Current exposure max(MTM, 0) | Add-on | Pre-settlement exposure | Settlement exposure |
|---|---|---|---|---|---|---|---|
| 1 Mar (trade) | 1.25 | 10,000,000 | 0 | 0 | 500,000 (5%) | **500,000** | Not yet |
| 1 May | 1.22 | 10,245,902 | +245,902 | 245,902 | 400,000 (4%) | **645,902** | Not yet |
| 1 Jul | 1.28 | 9,765,625 | minus 234,375 | 0 | 250,000 (2.5%) | **250,000** | Not yet |
| 31 Aug | 1.20 | 10,416,667 | +416,667 | 416,667 | 100,000 (1%) | **516,667** | Not yet |
| 1 Sep, after the bank pays | 1.20 | 10,416,667 | n/a | n/a | n/a | Ends | **10,000,000** |

Check the arithmetic: 12,500,000 / 1.22 = 10,245,902; 12,500,000 / 1.28 = 9,765,625; 12,500,000 / 1.20 = 10,416,667.

**Reading the table.**

- On 1 July the MTM is negative, so losing the exporter would cost nothing today; exposure is still 250,000 because rates could swing back.
- The pre-settlement exposure peaked at about 646,000, roughly 6.5% of notional.
- On 1 September the bank pays GBP 10 million in the London morning; the dollars reach its New York nostro hours later. If the exporter collapsed in between, the bank would have paid away **GBP 10 million** for nothing but a bankruptcy claim.
- Settlement exposure is 10,000,000 / 516,667, roughly **19 times** the pre-settlement exposure the day before.

**What if the exporter fails on 31 August?** The bank still holds its GBP 10 million (it has not paid). It must buy USD 12.5 million in the market at 1.20, costing GBP 10,416,667, instead of the GBP 10,000,000 it had agreed. Loss: GBP 416,667, the replacement cost. Pre-settlement risk is the cost of a broken promise; settlement risk is the cost of a broken handshake.

**What if the bank had used CLS?** If both sides settled through CLS (originally Continuous Linked Settlement, explained below), the pounds would leave the bank only at the same instant the dollars arrived. Settlement exposure would be close to zero; pre-settlement exposure would be unchanged.

## Measuring pre-settlement risk

Pre-settlement risk is counterparty credit risk, so the full machinery is in [[19 Counterparty Credit Risk and Derivatives]]. In summary:

| Method | How it works | Where you see it |
|---|---|---|
| Current exposure plus add-on | Positive MTM plus a table-driven add-on by product and remaining maturity, as in the example | Limit systems for FX and simple derivatives |
| Potential future exposure (PFE) | Simulated market paths, read off at a high percentile at each future date | Large dealers' limit systems |
| Standardised approach for counterparty credit risk (SA-CCR) | The Basel formula, 1.4 x (replacement cost + PFE add-on) | Regulatory capital |

Three things shrink pre-settlement exposure:

**Netting.** If the bank has a signed master agreement with close-out netting (usually an **International Swaps and Derivatives Association**, or ISDA, master agreement) and a legal opinion that it works, all trades with that counterparty are combined into one net amount on default. Suppose the bank also has a second forward with the exporter worth minus 300,000 on 31 August. Gross current exposure would be 416,667 (the negative trade does not count); net current exposure is 416,667 minus 300,000 = 116,667.

**Collateral.** Under a **credit support annex** (CSA), the side that is out of the money posts collateral to cover the MTM. Many corporate clients have no CSA; most bank and fund counterparties do.

**Central clearing.** Trades cleared through a **central counterparty** (CCP) are margined daily, so pre-settlement exposure to the original counterparty disappears and is replaced by a small, well-collateralised exposure to the CCP.

## Measuring settlement risk

Settlement exposure is simple arithmetic but hard to get right, because it depends on operational facts (timings, routes, payment status) more than prices.

### The basic measure

For each **counterparty**, each **value date** and each **currency**, add up the amounts the bank will pay away that are not protected by a simultaneous exchange. Convert to the reporting currency and add across currencies. That total is the **settlement exposure** for that counterparty on that day. The key word is **gross**: if the bank pays 50 million euros and receives 52 million dollars, the settlement exposure is the 50 million euros paid, not the small difference in value.

### Worked example: one counterparty's settlement day

Bank X (our counterparty) and our bank have these trades all settling on 15 June, none through CLS. Amounts converted to pounds at illustrative rates (0.85 pounds per euro, 1.25 dollars per pound, 190 yen per pound).

| Trade | We pay | We receive | Our pay leg in GBP |
|---|---|---|---|
| FX spot 1 | EUR 20m | USD 21.25m | 17.0m |
| FX spot 2 | USD 10m | EUR 9.4m | 8.0m |
| FX forward maturing | GBP 5m | JPY 950m | 5.0m |
| FX swap near leg | GBP 12m | USD 15m | 12.0m |
| **Total gross settlement exposure** | | | **42.0m** |

Pre-settlement exposure to Bank X on the same day might be 3 million. The settlement exposure is 14 times larger.

**Payment netting.** If the two banks have agreed to **net payments** per currency per value date (a bilateral payment netting agreement, sometimes using a standard industry form), the euro and dollar legs offset:

| Currency | We pay | We receive | Net we pay |
|---|---|---|---|
| EUR | 20.0m | 9.4m | 10.6m |
| USD | 10.0m | 21.25m | 0 (net receipt of 11.25m) |
| GBP | 17.0m | 0 | 17.0m |
| JPY | 0 | 950m | 0 (net receipt) |

Net pay legs in pounds: at the same illustrative rate (20m euros = 17m pounds, so 0.85 pounds per euro), EUR 10.6m is about GBP 9.0m, plus GBP 17.0m = **about GBP 26.0m**, down from 42.0m. Note that **payment netting** (fewer, smaller payments on a normal day) is different from **close-out netting** (one net claim if a party defaults), which reduces pre-settlement risk.

### The settlement window in more detail

A careful bank does not treat a trade as a settlement risk only on the value date. It tracks each trade's status:

| Status | Meaning | Exposure? |
|---|---|---|
| Revocable | Our payment instruction can still be cancelled | Not yet, if the bank really can and will cancel in time |
| Irrevocable | Our payment has passed the cancellation cut-off at our correspondent or payment system | Yes, full amount |
| Uncertain | Their payment is due, but we have not yet confirmed it arrived | Yes, full amount |
| Failed | Their payment did not arrive when due | Yes, full amount, now an overdue claim |
| Settled | Receipt confirmed by reconciliation | No |

The **cancellation cut-off** is often earlier than people assume, sometimes a day or more before value date for distant time zones, so real exposure can last well over a day. Basel Committee supervisory guidance on FX settlement risk encourages banks to measure the full window rather than assume same-day exchange.

### Free deliveries

For securities, settlement risk arises when the bank delivers before being paid, or pays before receiving the securities: a **free delivery**. This is rare where depositories link the two legs, but still happens in some markets. A trade that has simply **failed** (neither leg moved) carries replacement cost risk only.

## Mitigants: DvP, PvP, CLS and friends

### Delivery versus payment

**Delivery versus payment** (DvP) means the securities move only if the cash moves, and vice versa, enforced by the settlement system. A **central securities depository** (CSD) links the securities and cash accounts, so both legs happen as one step or not at all. It is the school-gate teacher holding both bags.

### Payment versus payment

**Payment versus payment** (PvP) is the equivalent for currencies: the payment in one currency happens only if the payment in the other currency happens. It is harder than DvP because the two currencies move through different central bank payment systems, often in different time zones. The main solution is CLS.

### How CLS works, in plain words

**CLS** (originally Continuous Linked Settlement) is a specialist institution owned by the banks that use it and overseen by central banks. Created in the early 2000s to remove Herstatt risk, it settles a large share of interbank FX in around 18 major currencies (check the current list).

Think of a referee with a cash box per currency: members hold accounts at CLS in each currency, and CLS holds accounts at each currency's central bank.

![[31-cls-pvp.svg]]
*How CLS removes settlement risk: both banks submit instructions, CLS matches and nets them, members pay in their net amounts during a window when all the central bank payment systems are open, and each trade settles both legs on CLS's books at the same instant, or not at all.*

Step by step:

1. **Submit.** Both banks send settlement instructions to CLS.
2. **Match.** CLS matches them; an unmatched trade stays an ordinary settlement risk.
3. **Net and schedule.** Before value date CLS works out, for each member and each currency, the net amount it must pay in across all its trades with everyone. CLS sends each member a **pay-in schedule**.
4. **Pay in.** On value date, during a window of a few hours in the European morning when the central bank payment systems for all CLS currencies are open at the same time, members pay their net amounts to CLS through those payment systems.
5. **Settle.** CLS settles each trade on its own books, moving pounds A to B and dollars B to A in one step, only if both accounts pass its risk tests (broadly, each member's overall balance stays positive and short positions within limits). Otherwise the trade waits and is retried.
6. **Pay out.** CLS pays members their resulting balances back through the central bank payment systems.

If a member fails, its unsettled trades are returned: nobody has paid one leg without receiving the other. Members still face **replacement cost** and **liquidity** stress, but not loss of principal. CLS also has committed liquidity lines in each currency so it can pay out if a member fails to pay in.

**Limits of CLS.** Not every currency is eligible, not every counterparty is a member (smaller banks and corporates settle as **third parties** through a member), and some value dates fall outside its timetable. The remaining gross exposure tends to sit in emerging market currencies and with smaller counterparties, exactly where credit quality is weaker.

### Other mitigants

| Mitigant | How it works | Typical use |
|---|---|---|
| Payment netting | Pay only the net amount per currency per value date | Bank counterparties with frequent two-way flows |
| Central clearing | A CCP becomes the counterparty and handles settlement with its own safeguards | FX futures, some FX options and non-deliverable forwards, securities through clearing houses |
| Prefunding | The counterparty pays first, or places funds with us before we pay | Weak or new counterparties, small corporates |
| Non-deliverable forward (NDF) | Settle only the cash difference in a major currency instead of exchanging principal | Restricted currencies; removes principal risk, leaves replacement cost |

## The Basel capital treatment in brief

The Basel rules treat the two risks in different places. The fuller explanation is in [[basel-credit-risk-explained-simply]] ("Way 3" for counterparty credit risk and "Way 4" for settlement risk) and in [[18 Regulatory Capital and Basel - the Short Version]].

**Pre-settlement risk** is counterparty credit risk: exposure from SA-CCR or an approved internal model, risk-weighted by counterparty, plus a separate **credit valuation adjustment** (CVA) capital charge.

**Settlement risk** has its own chapter. In outline:

- **Trades settled DvP or PvP that are on time** attract no settlement charge.
- **DvP or PvP trades that fail** (the other side has not delivered) attract a charge from the fifth business day after the due date, based on the price difference the bank is exposed to (the replacement cost), with a percentage that rises with time:

| Business days after the agreed settlement date | Capital as a percentage of the positive price difference |
|---|---|
| 5 to 15 | 8% |
| 16 to 30 | 50% |
| 31 to 45 | 75% |
| 46 or more | 100% |

- **Free deliveries** (we delivered or paid and are waiting for the other side) are treated as a loan to the counterparty from the day we paid, risk-weighted like any other exposure to it. If the other leg is still outstanding a few business days after it was due, the bank must hold capital equal to the full amount, in effect writing it off for capital purposes. Check the exact day counts in your jurisdiction's text.

Two takeaways. Settlement capital is **small for well-run banks** because most flows are DvP or PvP and on time, so the risk is managed mainly through **limits and operations**. And DvP and PvP are not "credit risk mitigation" in the Basel sense; they are the reason the charge does not arise.

## Limits: pre-settlement and daily settlement

![[31-limit-check.svg]]
*How a new trade is checked against both limits: pre-settlement exposure against the counterparty's pre-settlement limit, then the gross amount we pay against the daily settlement limit for that value date, unless it settles through a payment-versus-payment route.*

### Two limits, two shapes

| | Pre-settlement limit | Daily settlement limit |
|---|---|---|
| Measures | Peak PFE or MTM plus add-on, net where netting is enforceable | Gross amount paid away per value date, all currencies combined |
| Time shape | One number, or a profile by tenor bucket (under 1 year, 1 to 5 years, over 5 years) | One number **per future value date** |
| Typical size relative to business | Small fraction of traded notional | Can be very large for bank counterparties (they trade huge volumes), small for corporates |
| Monitored by | Credit risk, with the exposure engine | Treasury or payments operations, intraday; credit risk end of day |
| Typical breach cause | Market move, new trade | Large trade, failed netting, value date bunching, a trade dropping out of CLS |

Both limits are set by credit officers. The settlement limit sits in the counterparty's limit structure (see [[14 Risk Appetite, Limits and Concentration]]) next to, not inside, the lending and pre-settlement limits: adding hours-long principal exposures to years-long loans would make totals meaningless.

### How settlement limits are set

A credit officer asks three questions:

1. **How much do we need?** Look at the historical daily gross flows with this counterparty, excluding CLS, and the business plan.
2. **How much could we bear to lose in one day?** The settlement limit is a full-principal exposure, so it is sized against the counterparty's credit quality and the bank's capital, like a very short loan. A weak corporate client might get a limit near zero, forcing prefunding or PvP routes.
3. **How long is the window?** If the bank's cancellation cut-off for a currency is a day before value date, exposure starts a day earlier, and the limit must cover two days of flows in that currency.

Some banks also cap settlement exposure by country and by currency.

### Intraday versus end-of-day monitoring

**End-of-day monitoring** checks tomorrow's and future value dates against the limits after the day's trading. It is enough for pre-settlement limits, which move slowly. It is **not** enough for settlement limits, because the risk peaks during the day: by the time an end-of-day report runs, the payment has gone.

**Intraday monitoring** updates the position as trades are booked, payments released and receipts confirmed. A mature setup puts the check **inside payment release**: a payment that would breach the limit is held for approval. It is one of the few places a credit control can physically stop money leaving the building.

### Worked example: a day's settlement limit

Counterparty Bank Y has a daily settlement limit of GBP 50 million for non-CLS flows. Value date 20 June, as of 9 a.m. two days earlier:

| Item | GBP |
|---|---|
| Existing non-CLS pay legs for 20 June | 38.0m |
| New trade request: pay EUR 15m (about GBP 12.75m) | 12.75m |
| Projected utilisation | 50.75m |
| Limit | 50.0m |
| Excess | 0.75m |

The dealer has options: settle the new trade through CLS (if Bank Y and the currencies qualify), choose a different value date, ask Bank Y to agree payment netting with an existing offsetting trade, or seek approval for a temporary excess.

### Excesses and approvals

An **excess** (or breach) is utilisation above the limit. Policy normally distinguishes:

- **Pre-approved excesses**: the trade cannot proceed until someone with enough credit authority approves it, usually recorded in the limit system with a reason and expiry.
- **Passive excesses**: the limit was exceeded without a new trade (a market move pushing up pre-settlement exposure, or a failed receipt still counting as settlement exposure). These are reported and explained, and may need action.
- **Technical excesses**: data errors (a trade recorded twice, a CLS flag missing). These must be fixed, not approved, and tracked as data quality issues.

Approval authority follows the credit authority ladder in [[13 Credit Governance - Committees, Authorities and the Three Lines]]. Repeated excesses mean the limit is wrong or ignored; either belongs at credit committee.

The division between credit risk (who decides how much risk is acceptable) and operations (who sees the payments in real time) is the most common source of gaps. Settlement risk sits exactly on the seam.

## Famous episodes

### Herstatt, 1974

Bankhaus Herstatt, a mid-sized German bank, had made large losses on currency speculation. On a June afternoon in 1974 German regulators closed it at the end of the German business day. Counterparties had already paid it Deutsche marks in Germany; the matching dollar payments, due in New York hours later, never came. They lost the full principal. Banks everywhere grew unwilling to pay first, and the shock led to the creation of the Basel Committee on Banking Supervision later that year. FX settlement risk is still called **Herstatt risk**.

The lesson: time zones create gaps between the two legs, and a closure can happen inside the gap. It took nearly three decades for PvP through CLS to close it for major currencies.

### The failure of a large investment bank in September 2008

When a large US investment bank filed for bankruptcy in September 2008, it was a counterparty to an enormous number of trades. Two things stood out.

- **CLS worked.** FX trades with the failed firm that were in CLS either settled or were returned, and no member lost principal through CLS. Counterparties still suffered replacement cost losses on their unsettled trades (pre-settlement risk), which netting and collateral reduced.
- **Outside CLS, payments kept flowing to the failing entity.** At least one public sector bank sent a payment of several hundred million euros to the failing firm on the morning of the bankruptcy filing, as part of a routine automated FX swap, and never received the matching leg. Nothing in its processes stopped payments to a counterparty in obvious distress, and the episode led to public outrage and dismissals.

The lessons: settlement limits and payment-release controls must be able to **stop** payments to a counterparty on very short notice; a credit officer's decision to "suspend" a name must reach the payment system the same morning; and automated standing instructions are dangerous when nobody owns the kill switch.

## Systems and data

The chain looks like this:

| System | What it does | What settlement and pre-settlement risk need from it |
|---|---|---|
| Trade capture (front office booking system) | Records each trade's economics | Counterparty legal entity, trade date, value date, currencies and amounts of each leg, product, settlement route (CLS, gross, net, NDF) |
| Confirmation matching | Matches our confirmation with the counterparty's, often SWIFT FX confirmation messages or a matching platform | Matched status; an unmatched trade may not settle as expected and may not enter CLS |
| Standard settlement instructions database | Holds where each counterparty is paid in each currency | Correct and current SSIs; a wrong SSI means a failed or misdirected payment |
| CLS interface | Submits trades to CLS and receives status | Which trades are in CLS and their status, so they can be excluded from gross settlement exposure only when genuinely matched |
| Payment system and payment hub | Generates and releases payments, through central bank systems and correspondents | Release times, cancellation cut-offs by currency and correspondent, payment status |
| Nostro reconciliation | Compares expected and actual receipts in each nostro account | Confirmation of receipt (ending exposure) and failed receipts (extending it) |
| Settlement limit engine | Aggregates gross pay legs by counterparty and value date, checks against limits intraday, holds payments | Value-date aggregation across all source systems, currency conversion, CLS and netting treatment, real-time payment status |

### Value-date aggregation

The settlement limit engine builds, per counterparty, a ladder of future value dates with gross amounts payable on each, from **every** booking system (FX, money markets, securities, derivative payments). Harder than it sounds:

- Several booking systems, each with its own counterparty identifiers. They must map to one legal entity (see [[22 Credit Risk Data, Systems and BCBS 239]]).
- Value dates move: a holiday is announced, a trade is amended, a forward is extended.
- The CLS flag must be accurate. A trade marked "CLS" that failed to match is real gross exposure.
- Netting must be applied only where a payment netting agreement exists and operations actually nets.

### Messaging

SWIFT traffic has been moving from older message types to the richer **ISO 20022** standard (from the International Organization for Standardization); feeds built on old message fields need retesting.

## Common mistakes and misunderstandings

- **"Settlement risk is operational risk."** The cause can be operational, but the loss is a credit loss on a counterparty that failed to pay. Banks manage it with credit limits, and Basel treats it in the credit risk rules.
- **"Our exposure to this bank is 3 million."** That may be the pre-settlement figure. On a busy value date the settlement exposure to the same bank could be fifty times larger.
- **"CLS means no settlement risk."** Only for matched trades in eligible currencies, between members or their third parties, that are actually settled in CLS. Everything else is gross.
- **"Settlement risk lasts a few minutes."** Measured from cancellation cut-off to reconciliation, it often lasts more than a day.
- **"Netting covers it."** Close-out netting reduces pre-settlement risk on default; it does nothing for a payment already sent. Only payment netting reduces settlement flows.
- **"A failed trade and a free delivery are the same."** A failed DvP trade leaves both legs with their owners, so only replacement cost is at risk. A free delivery means we have already paid, so full principal is at risk.
- **"End-of-day settlement monitoring is enough."** The risk peaks during the day; end-of-day reports arrive after the money has gone.
- **"Capital is small, so the risk is small."** Basel capital is low because most flows are DvP or PvP. The residual risk is managed by limits and operations, and a single failure can still be large.

## What a platform lead needs to know about this

**You probably own two limit engines, or one engine doing two very different jobs.** The pre-settlement side is a slow-moving, model-driven, end-of-day world. The settlement side is a real-time, arithmetic, intraday world sitting next to payments. Ask early which system holds settlement limits, whether it is genuinely intraday, and whether it can hold a payment.

**Data you must have, per trade.** Counterparty legal entity (mapped across all booking systems), value date, each leg's currency and amount, pay or receive, settlement route (CLS, gross, payment-netted, NDF), CLS match status, payment status (pending, released, irrevocable, settled, failed), cancellation cut-off for the currency and correspondent, and links to the netting set for pre-settlement purposes. Gaps in any of these produce a wrong number, usually too low.

**Data you must have, per counterparty.** Limit structure (pre-settlement by tenor, settlement by value date, any country or currency settlement caps), CLS membership or third-party status, payment netting agreements by currency, close-out netting and collateral agreements, suspension or stop status.

**Controls you will be asked to evidence.** Completeness of the settlement ladder against booking systems; CLS reconciliation; SSI change control; intraday breach detection and escalation times; the counterparty suspension process (test it: how long from a credit officer's decision to every payment being held?); excess approval audit trails; nostro break ageing.

**Interfaces and timing.** Settlement exposure depends on the payment system and reconciliation feeds, which belong to operations technology, not credit technology. Agree service levels and failure procedures for those feeds. If the payment status feed is late, the settlement limit engine should assume payments are irrevocable and receipts uncertain, not the reverse.

**Reporting.** Expect daily reports of the largest settlement exposures, CLS coverage (share of FX flow settled PvP), excesses and failed trade ageing. Liquidity colleagues will also want the settlement ladder, because the same flows drive intraday liquidity needs (see [[37 Liquidity Risk and Funding]]).

**Who owns what.** Credit risk owns limits and excess approval. Treasury or payments operations owns intraday monitoring and payment release. Settlements operations owns confirmations, SSIs and failed trade chasing. Reconciliations owns nostro matching. Front office owns trade booking quality. You own the systems and data that join them, which no single owner sees end to end. Record it in your data model (see [[32 The Credit Risk Data Model]]) and runbooks (see [[38 Platform Lead Toolkit - Runbooks, Metrics and Templates]]).

## Related notes

- [[02 What Credit Risk Is]] for the four flavours of credit risk, including counterparty and settlement.
- [[19 Counterparty Credit Risk and Derivatives]] for pre-settlement risk in depth: PFE, netting, collateral, SA-CCR and CCPs.
- [[basel-credit-risk-explained-simply]] for "Way 3" (counterparty credit risk) and "Way 4" (settlement risk) in the Basel rules.
- [[14 Risk Appetite, Limits and Concentration]] for the limit framework and breach escalation.
- [[13 Credit Governance - Committees, Authorities and the Three Lines]] for approval authorities.
- [[18 Regulatory Capital and Basel - the Short Version]] for capital and risk-weighted assets.
- [[22 Credit Risk Data, Systems and BCBS 239]] for counterparty identifiers and data lineage.
- [[26 Sovereign, Bank and Country Risk]] for transfer risk and bank counterparties.
- [[30 Operational Risk]] for payment errors, SSI fraud and the operational causes of settlement failures.
- [[32 The Credit Risk Data Model]] for how trades, legs and value dates are modelled.
- [[37 Liquidity Risk and Funding]] for intraday liquidity and the settlement ladder.
- [[38 Platform Lead Toolkit - Runbooks, Metrics and Templates]] for runbooks and metrics.
- [[28 Master Glossary]].
