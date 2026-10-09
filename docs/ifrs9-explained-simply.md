# IFRS 9, explained from zero

This is a companion to [[basel-credit-risk-explained-simply]]. That piece explains how the Basel rules decide how much **capital** a bank must hold. This one explains the accounting rule that decides how a bank **values** its loans and investments in its published accounts, and how much it sets aside for loans that may not be paid back. It walks through every box in three diagrams. Read it top to bottom the first time, then use the table of contents to jump around. Every acronym is spelled out the first time it appears, and there is a glossary at the end.

For a shorter, provisions-only view, read [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]]. This document goes deeper on impairment and also covers the other two parts of IFRS 9.

---

## Table of contents

1. [The one-sentence version](#1-the-one-sentence-version)
2. [What accounting is and why banks keep score](#2-what-accounting-is-and-why-banks-keep-score)
3. [Who writes the rules: the IASB, IFRS and US GAAP](#3-who-writes-the-rules-the-iasb-ifrs-and-us-gaap)
4. [What a provision is](#4-what-a-provision-is)
5. [The old rule, IAS 39, and why it was too little, too late](#5-the-old-rule-ias-39-and-why-it-was-too-little-too-late)
6. [The three parts of IFRS 9](#6-the-three-parts-of-ifrs-9)
7. [Part 1: classification and measurement, the sorting hat](#7-part-1-classification-and-measurement-the-sorting-hat)
8. [The effective interest rate, with real numbers](#8-the-effective-interest-rate-with-real-numbers)
9. [Financial liabilities and reclassification](#9-financial-liabilities-and-reclassification)
10. [Part 2: impairment, the scope and the three stages](#10-part-2-impairment-the-scope-and-the-three-stages)
11. [12-month versus lifetime ECL, and the cliff](#11-12-month-versus-lifetime-ecl-and-the-cliff)
12. [Significant increase in credit risk, in depth](#12-significant-increase-in-credit-risk-in-depth)
13. [Stage 3, default, and interest on gross versus net](#13-stage-3-default-and-interest-on-gross-versus-net)
14. [POCI: loans that were already broken when bought](#14-poci-loans-that-were-already-broken-when-bought)
15. [The simplified approach and the provision matrix](#15-the-simplified-approach-and-the-provision-matrix)
16. [Measuring ECL: PD, LGD, EAD and discounting](#16-measuring-ecl-pd-lgd-ead-and-discounting)
17. [Forward-looking information and multiple scenarios](#17-forward-looking-information-and-multiple-scenarios)
18. [Overlays, modifications, write-offs and cure](#18-overlays-modifications-write-offs-and-cure)
19. [Disclosures and the stage movement table](#19-disclosures-and-the-stage-movement-table)
20. [The link to regulatory capital](#20-the-link-to-regulatory-capital)
21. [How the ECL calculation runs each month](#21-how-the-ecl-calculation-runs-each-month)
22. [Part 3: hedge accounting](#22-part-3-hedge-accounting)
23. [IFRS 9 compared with CECL and Basel expected loss](#23-ifrs-9-compared-with-cecl-and-basel-expected-loss)
24. [A worked example from start to finish](#24-a-worked-example-from-start-to-finish)
25. [Things that are easy to get wrong](#25-things-that-are-easy-to-get-wrong)
26. [What a platform lead needs to know](#26-what-a-platform-lead-needs-to-know)
27. [Related notes](#27-related-notes)
28. [Glossary](#28-glossary)

---

## 1. The one-sentence version

IFRS 9 is the accounting rule that tells a bank how to value the loans, bonds, shares and derivatives it holds, how to set aside money in its accounts for loans it expects will not be repaid (looking forward rather than waiting for trouble), and how to show the deals it uses to protect itself against moves in interest rates and currencies.

Everything else in this document is detail on top of that sentence.

---

## 2. What accounting is and why banks keep score

Imagine you keep a notebook for your lemonade stand. One page lists what you own: 20 coins in the jar, a jug, and a note saying "Sam owes me 5 coins." Another lists what you owe: "I borrowed 10 coins from my sister." Each week you write down what you earned and spent. That notebook is your **accounts**.

Two pages matter most:

- The **balance sheet** is a snapshot, on one day, of what you own (**assets**) and what you owe (**liabilities**). The difference is **equity**, what is really yours.
- The **income statement**, also called the **profit and loss account** or **P&L**, is the story of a period: money earned, money spent, and the **profit** or loss left over.

A bank's biggest assets are loans (it is owed that money) and bonds it has bought. Its biggest liabilities are deposits (it owes that money back). Its main income is interest.

The tricky part is that some things have no obvious value. What is "Sam owes me 5" worth if Sam has just lost his pocket money? Two honest people could write different numbers. **Accounting standards** make everyone write the number the same way, so shareholders, depositors and regulators can trust and compare banks' accounts.

---

## 3. Who writes the rules: the IASB, IFRS and US GAAP

Most of the world uses **International Financial Reporting Standards**, shortened to **IFRS**, written by the **International Accounting Standards Board** (**IASB**), an independent body in London. Like the Basel Committee, it makes no laws; each country decides whether to adopt its standards. Well over a hundred do, including the European Union, the United Kingdom, Canada, Australia and much of Asia, Africa and the Middle East.

Older standards, written by the IASB's predecessor, are called **IAS** (International Accounting Standard), such as **IAS 39**. Newer ones are called IFRS, such as **IFRS 9**, which covers **financial instruments**: contracts involving money, such as loans, deposits, bonds, shares and derivatives.

The United States uses its own rulebook, **US GAAP** (Generally Accepted Accounting Principles), written by the **Financial Accounting Standards Board** (**FASB**). Its version of the impairment rules is **CECL** (current expected credit losses), compared in section 23.

Accounting and Basel are different things:

| | Accounting (IFRS 9) | Regulation (Basel) |
|---|---|---|
| Written by | IASB | Basel Committee on Banking Supervision (BCBS) |
| Question | What is this worth, and what profit did we make? | How much capital do we need to survive a bad year? |
| Loss it cares about | The average loss we expect | The unexpected loss in a bad year |
| Checked by | External auditors | Supervisors |

---

## 4. What a provision is

You have lent 10 coins each to ten friends. Experience says one friend in ten never pays. Your notebook says "friends owe me 100," but it is really worth about 90.

An honest stand-owner writes: "Owed 100. Less: amount I probably will not get, 10. Worth 90." That 10 is a **provision**, also called a **loss allowance**, **impairment allowance** or **loan loss reserve**. Nobody has failed to pay yet; you have just stopped fooling yourself.

Three facts to fix now:

- **No cash moves.** A provision is a number in the notebook that reduces the stated value of the loans.
- **An increase is a cost.** If the provision goes from 10 to 15, the extra 5 is an **impairment charge** (or **credit loss expense**) in the income statement, and profit falls by 5. A decrease adds to profit.
- **A loan shows at two amounts.** The **gross carrying amount** is what is owed (100). Subtract the provision to get the **net carrying amount** (90).

IFRS 9 calls its provision **expected credit loss**, shortened to **ECL**.

---

## 5. The old rule, IAS 39, and why it was too little, too late

Before 2018 the rule was IAS 39 and its **incurred-loss model**: a bank could only provide once there was objective evidence that a **loss event** had already happened, such as a missed payment or a bankruptcy. Losses it merely expected could not be provided for. The aim was to stop banks hiding profits in a provisions piggy bank in good years and releasing them in bad ones.

It backfired. In 2007 and 2008 bankers could see house prices falling and unemployment rising, but the rule said wait until people actually stop paying. Provisions stayed small, profits looked fine, then losses landed all at once. The G20 leaders and the Financial Stability Board called loan loss recognition **"too little, too late,"** and asked the standard setters to fix it.

The answer was IFRS 9, finalised in 2014 and effective for periods starting on or after **1 January 2018**. Its central change is from incurred to **expected** loss: from the day a loan is made, the bank provides for losses it expects, using forecasts of the economy, and raises the provision as soon as the outlook worsens.

| | IAS 39 incurred loss | IFRS 9 expected loss |
|---|---|---|
| When a provision starts | After a loss event | From day one |
| Information used | Past and present evidence | Also reasonable forecasts of the future |
| Going into a downturn | Late, sudden jump | Earlier, more gradual rise (in theory) |
| Main criticism | Too little, too late | Complex and judgemental |

---

## 6. The three parts of IFRS 9

| Part | Question | Lemonade version | Sections |
|---|---|---|---|
| 1. Classification and measurement | Which box does each asset go in, and is it valued at cost or at today's market price? | Is "Sam owes me 5" written at 5, or at what someone would pay for the IOU today? | 7 to 9 |
| 2. Impairment | How much do we set aside for loans that may not be repaid? | How many friends will not pay, and when do I admit it? | 10 to 21 |
| 3. Hedge accounting | How do we show deals that protect us against rate or currency moves? | I insured my lemon prices; how do I show the insurance and the lemons together? | 22 |

Credit risk people live in Part 2, but Part 1 decides which assets even get a provision, so it comes first.

---

## 7. Part 1: classification and measurement, the sorting hat

![[ifrs9-classification-tree.svg]]
*The IFRS 9 classification tree: every financial asset is sorted by instrument type, whether its cash flows are plain principal and interest, and why the bank holds it, ending in one of four measurement boxes.*

Think of the tree as a sorting hat. Every asset enters at the black box, **financial asset on the balance sheet**, and comes out in a coloured box that decides two things:

1. **How it is valued**: at **amortised cost** (roughly what you paid, less repayments, adjusted for interest) or at **fair value** (what someone would pay for it today, roughly the market price).
2. **Where value changes show up**: in **profit or loss**, or in **other comprehensive income** (**OCI**), a side section of the accounts where some value changes are parked so profit does not jump around.

The first diamond asks **what kind of instrument is it?** Derivative, equity (shares), or debt (loan, bond, receivable).

### Derivatives

A **derivative** is a contract whose value depends on something else: a **swap** (exchange fixed interest payments for floating ones), a **forward** (agree today to buy dollars in six months at a fixed price), an **option** (the right, not the duty, to buy or sell at a set price). See [[19 Counterparty Credit Risk and Derivatives]].

The box **derivative** goes straight to **FVTPL**, **fair value through profit or loss**, "always (unless a designated hedge)." A derivative's value can swing hugely from nothing, so the only honest measure is today's market value with every change in profit. The exception is Part 3.

### Equity: shares the bank owns

For shares, the diamond asks **held for trading?** If yes, FVTPL. If no (say a strategic stake in a payments company), the next diamond asks: **irrevocable election at day one to present changes in OCI?** The bank may choose, holding by holding, on the day it buys, to send all value changes to OCI. "Irrevocable" means it can never change its mind.

With the election, the holding lands in **FVOCI (equity)**, fair value through other comprehensive income. Value changes stay in OCI and are **never recycled** to profit, even on sale ("recycling" means moving an amount from OCI into profit later; banning it stops cherry-picking gains). **Dividends** still go to profit. There is **no impairment**, because the value is already at fair value. Without the election, FVTPL. Shares can never be at amortised cost, because there are no scheduled repayments.

### Debt and the SPPI test

For debt the diamond asks: **SPPI test: are the cash flows solely payments of principal and interest?** **Principal** is the amount lent; **interest** is the payment for lending it. The test asks whether the contract is a basic lending arrangement, paying only for the time value of money, the borrower's credit risk, basic costs, and a profit margin. Amortised cost only makes sense for cash flows that predictable.

Lend your friend 10 coins for "10 back next month plus 1 for the favour": that passes. Lend for "10 back plus a quarter of your stand's earnings": you are now partly an owner. That fails.

| Instrument | Result | Why |
|---|---|---|
| Plain fixed- or floating-rate loan | Pass | Time and credit risk only |
| Mortgage prepayable at par, or at par plus reasonable compensation | Pass | Still principal and interest (a 2017 amendment confirmed even "negative compensation" can pass) |
| Convertible bond | Fail | Return depends on the issuer's share price |
| Profit-share loan | Fail | Return depends on the business's profits |
| Loan with an equity kicker (warrants or a share of sale proceeds) | Fail | Part of the return is an equity return |
| Loan with interest linked to an oil price | Fail | Return depends on a commodity price |

Two subtleties in outline. **Benchmark interest modifications**: if a rate resets monthly but is set from a one-year rate, the bank must check the mismatch does not make the cash flows significantly different from a plain loan; usually it does not. **Contingent features**, such as a sustainability-linked margin, need care; IASB amendments effective from 1 January 2026 clarify when they pass.

A fail goes to FVTPL ("e.g. returns linked to equity or commodity prices"). Unlike IAS 39, IFRS 9 does not split such assets into a loan plus an **embedded derivative**; the whole asset goes to fair value. A pass moves on.

### The business model test

The diamond **business model test: why does the bank hold it?** looks at purpose, not the contract. It is judged per portfolio, at the level management runs the business, using evidence such as what senior management is shown, how managers are paid, and the history of sales.

| Business model | Meaning | Examples | Destination |
|---|---|---|---|
| Hold to collect | Held to collect contractual cash flows until repaid | Mortgages, personal and corporate loans | Amortised cost |
| Hold to collect and sell | Collecting and selling both integral | Treasury's liquidity portfolio of government bonds | FVOCI (debt) |
| Other | Trading, or managed on fair value | Trading-desk bonds; loans made in order to be syndicated or sold | FVTPL |

How many sales can a hold to collect portfolio have? Sales stay consistent with it when they are **infrequent** (even if large) or **insignificant** in value (even if frequent), made because **credit risk has increased**, or made **close to maturity**. Banks set their own thresholds, such as a few per cent of the portfolio a year excluding credit-driven sales; these are not in the standard. If sales creep above them, the policy team checks whether the model has changed.

"Other: trading, or managed on fair value" goes to FVTPL. The two hold models go to one last diamond.

### The fair value option

**Fair value option used to remove an accounting mismatch?** A bank may, on day one and irrevocably, put a passing asset at FVTPL, but only if that removes or significantly reduces an **accounting mismatch**: two things that move together economically but are measured differently, so profit swings for no reason. Example: a fixed-rate bond at amortised cost alongside a fixed-rate issued note at fair value that moves the other way with rates. Putting the bond at fair value makes the two cancel.

If yes, FVTPL. If no, **amortised cost** for hold to collect, **FVOCI (debt)** for hold to collect and sell.

### The four destinations

| Box | Balance sheet | Interest | Other value changes | Impairment |
|---|---|---|---|---|
| Amortised cost (green) | Cost less repayments, by EIR, less allowance | Profit, by EIR | Ignored | Yes |
| FVOCI debt (dark blue) | Fair value | Profit, by EIR | OCI, recycled on sale | Yes |
| FVOCI equity | Fair value | Dividends in profit | OCI, never recycled | No |
| FVTPL (red) | Fair value | Within fair value change | Profit | No |

For FVOCI debt, profit looks exactly as if the asset were at amortised cost, the balance sheet shows fair value, and the difference waits in OCI until sale. FVTPL needs no impairment because a fair value already reflects the market's view of credit risk.

The grey box, **go to the impairment tree**, has dashed arrows from amortised cost and FVOCI debt only. Those are the boxes needing an ECL, which for most banks means nearly all loans and most treasury bonds.

---

## 8. The effective interest rate, with real numbers

The **effective interest rate** (**EIR**) drives amortised cost and is also the rate used to discount ECL.

Loans often have fees at the start, so the money the bank actually hands over differs from what the borrower owes. The EIR is the single rate that turns the money actually paid out into exactly the cash flows expected back. It spreads fees and directly linked costs (such as broker commissions, but not general overheads) over the loan's life instead of booking them on day one.

**Worked example.** A bank lends 1,000 for three years at 5% a year, repaid at the end, and takes a 30 arrangement fee upfront. Real outlay: 970. Cash back: 50, 50, 1,050. The EIR is the rate r where 50/(1+r) + 50/(1+r)² + 1,050/(1+r)³ = 970, which is about **6.12%**.

| Year | Opening | Interest at 6.12% | Cash received | Closing |
|---|---|---|---|---|
| 1 | 970.00 | 59.41 | 50 | 979.41 |
| 2 | 979.41 | 59.99 | 50 | 989.40 |
| 3 | 989.40 | 60.60 | 1,050 | 0.00 |
| **Total** | | **180.00** | **1,150** | |

Interest income totals 180: 150 of contractual interest plus the 30 fee, spread over three years. The carrying amount climbs from 970 towards 1,000; that climb is the **amortisation** that gives amortised cost its name. Fees often sit in a different system from the loan, so many banks run a separate EIR engine.

---

## 9. Financial liabilities and reclassification

**Liabilities** (deposits, issued bonds, borrowings) are simpler:

- **Most are at amortised cost**, using the EIR.
- **Trading liabilities and negative-value derivatives are at FVTPL.**
- **The fair value option** is available to remove a mismatch, for liabilities managed on a fair value basis, or to avoid splitting out an embedded derivative (which, unlike for assets, is still split out for liabilities).

The famous quirk is **own credit**. When a bank's creditworthiness worsens, the market value of its issued bonds falls. For a liability at fair value, that fall is a **gain**, so a bank in trouble would report profits because it was in trouble, which happened around 2008. IFRS 9 sends the part of the change caused by the bank's **own credit risk** to **OCI**, never recycled, for liabilities designated at fair value (unless that would itself create a mismatch in profit). There is no impairment on liabilities.

**Reclassification** of debt assets happens only when the bank **changes its business model** for a whole portfolio, for example on closing a business line. The standard expects this to be very infrequent. It applies from the first day of the next reporting period, without restating the past. The FVOCI equity election and the fair value option are irrevocable, and liabilities are never reclassified. For a platform lead: classification is set at origination and almost never changes; frequent reclassifications in the data mean something is wrong.

---

## 10. Part 2: impairment, the scope and the three stages

![[ifrs9-impairment-tree.svg]]
*The IFRS 9 impairment tree: which exposures are in scope, how each is routed to POCI, the simplified approach or the three stages, how ECL is measured, adjusted and booked, and how everything is re-staged each reporting date.*

The black box, **exposure in scope of impairment**, leads to the **in scope** box:

- **Debt at amortised cost or FVOCI**, the two boxes with dashed arrows in the classification tree.
- **Lease receivables**: payments owed when the bank leases out a car or machine.
- **Contract assets**: amounts earned but not yet billed, from the revenue standard. Rare in banks.
- **Loan commitments and financial guarantees not at FVTPL.** People forget these. An undrawn credit line or a guarantee is not a loan on the balance sheet, but if the customer fails the bank loses money, so it needs an ECL, held as a **liability** (or shown with the loan if drawn and undrawn parts are on one facility). See [[08 Trade Finance and Guarantees]].

Not in scope: anything at FVTPL, and all equity.

The big idea is to sort friends into three groups: those as reliable as when you lent (worry about the next year), those noticeably less reliable since you lent but still paying (worry about the whole time until repayment), and those who have stopped paying (work out what you will recover).

Each exposure passes three routing diamonds:

1. **Purchased or originated credit-impaired (POCI)?** Special treatment, section 14.
2. **Trade receivable, contract asset or lease receivable?** Simplified approach, section 15.
3. Otherwise, **"no: general approach,"** the staging questions.

In the general approach, **credit-impaired now?** ("in default: 90 days past due rebuttable presumption, or unlikely to pay") sends defaulted exposures to **stage 3**. The rest meet **low credit risk at reporting date?**, an optional exemption (section 12): if used and met, **stage 1**. Otherwise comes the big test, **significant increase in credit risk since initial recognition?**: no means stage 1, yes means stage 2.

| Stage | Box | Who | Horizon | Interest on |
|---|---|---|---|---|
| 1 | Green, "performing" | No significant increase in risk since recognition | 12-month ECL | Gross carrying amount |
| 2 | Amber, "underperforming" | Significant increase, not in default | Lifetime ECL | Gross carrying amount |
| 3 | Red, "credit-impaired" | In default | Lifetime ECL | Net carrying amount |

Almost every loan starts in stage 1. The key words in the stage 2 test are **"since initial recognition."** IFRS 9 does not ask "is this loan risky?" but "has it got riskier since we made it?" A weak borrower priced at a high rate can stay in stage 1 forever if it never gets worse; a superb borrower who has become merely good may be stage 2. The logic: losses expected at the start were priced in, and only deterioration beyond that calls for a lifetime provision.

---

## 11. 12-month versus lifetime ECL, and the cliff

**12-month ECL** is the expected loss from defaults that might happen in the **next 12 months**. It is not "losses paid within 12 months"; it is the full loss on a loan if it defaults within the year, times the chance it does. **Lifetime ECL** covers defaults at **any time over the remaining life**.

Moving to stage 2 adds more years of default chances, and each year's chance is higher because the loan has got riskier. The two effects multiply into the **cliff effect**.

**Worked example.** A 10,000 loan repayable in one lump in five years. **Loss given default** (**LGD**, the share lost on default) is 40%; EIR 5%. **Probability of default** (**PD**) is the chance of defaulting in a year.

*At the start*, PD is 1% a year. Stage 1:

> 12-month ECL = 1% x 40% x 10,000, discounted one year at 5% = **38**

*A year later*, the borrower's industry is in trouble. PD is 3% for next year and 3.5% to 4% after. If the loan stayed in stage 1, ECL would be 3% x 40% x 10,000 / 1.05 = **114**. But the SICR test triggers, so it moves to stage 2 and every remaining year counts:

| Year | Chance of defaulting in this year (after surviving earlier years) | Discounted loss |
|---|---|---|
| 1 | 3.00% | 114.3 |
| 2 | 3.40% | 123.2 |
| 3 | 3.74% | 129.4 |
| 4 | 3.59% | 118.3 |
| 5 | 3.45% | 108.1 |
| **Lifetime** | **17.2% cumulative** | **593** |

The provision goes from 38 to 593. The move to 114 is the borrower worsening; the move from 114 to 593, more than five times, is purely the stage change. That is why the stage 2 boundary is the most argued-about line in a bank's accounts, and why books of long loans swung so hard when many crossed it together in 2020.

---

## 12. Significant increase in credit risk, in depth

The diamond **"significant increase in credit risk since initial recognition? Relative PD change, qualitative flags such as watchlist or forbearance, 30 days past due rebuttable backstop"** is the **SICR** test. IFRS 9 gives no formula: the bank compares the risk of default over the expected life **now** with that risk **at initial recognition**, using reasonable and supportable information, including forecasts. Each bank writes its own policy, usually combining the pieces below.

**Relative versus absolute.** A **relative** test compares now with then ("has lifetime PD more than doubled?"); an **absolute** test looks only at now ("is PD above 5%?"). IFRS 9 is relative at heart, but pure relative tests misbehave at the extremes. A PD moving from 0.02% to 0.06% has tripled but is still tiny, so banks add an **absolute floor**. A loan originated at 15% PD moving to 25% has not doubled but is very risky, so banks add an **absolute backstop**. A typical rule (illustrative only): *stage 2 if current lifetime PD exceeds 2.5 times origination lifetime PD and 12-month PD is above 0.3%, or if 12-month PD exceeds 20%.*

**The origination PD.** The relative test needs the PD at origination for every exposure, on a basis comparable with today's. This is one of IFRS 9's hardest data problems. Old loans may have no stored PD, or one from a retired model. A 12-month PD at origination must be converted to a lifetime one. And lifetime PDs change as loans age even when nothing goes wrong, so good comparisons check today's remaining-life PD against what the origination term structure expected at this age. Where history is missing, banks use proxies such as the earliest available rating, documented and often overlaid. See [[10 Internal Ratings, Scorecards and PD Models]].

**Quantitative thresholds.** The test can be a PD ratio or a fall in **rating notches** (fewer notches needed near the top of the scale, where PD gaps are small). Thresholds are calibrated on history and back-tested: what share of this year's defaults were in stage 2 last year, and for how long?

**Qualitative triggers.** Some warnings reach the PD too slowly, so any of these pushes a loan to stage 2: on the **watchlist** (see [[15 Monitoring, Early Warning and Watchlist]]); **forborne** (section 18); a covenant breached or waived; a high-risk sector or country list; for retail, arrears on another product or a collections contact.

**The 30 days past due backstop.** IFRS 9's one hard-coded rule is a **rebuttable presumption** that risk has increased significantly once a payment is **more than 30 days past due**. "Rebuttable" means the bank may argue otherwise with good evidence, such as a known administrative error, but auditors expect that to be rare. Almost every bank treats it as automatic. It is a **backstop**: a good SICR model should catch most loans earlier.

**The low credit risk exemption.** The diamond **low credit risk at reporting date?** lets a bank skip SICR for exposures that are low risk today, roughly **investment grade** (BBB minus or better). It is optional ("no, or exemption not used"). Banks commonly use it for high-quality government and bank bonds; supervisors dislike it for loan books.

**Collective assessment.** If a town's biggest employer closes, every mortgage there is riskier before anyone misses a payment. The bank must then assess SICR collectively, moving a proportion of the group ("top-down") or the whole group sharing the risk characteristic ("bottom-up") to stage 2, often through an overlay.

---

## 13. Stage 3, default, and interest on gross versus net

**Credit-impaired now?** sends exposures to **stage 3**. IFRS 9's evidence includes significant financial difficulty, a breach such as being past due, a concession given because of difficulty, and likely bankruptcy. For **default**, the bank must use a definition consistent with its internal credit risk management, with a rebuttable presumption that default happens no later than **90 days past due**.

That matches Basel's "90 days past due or unlikely to pay" (see [[basel-credit-risk-explained-simply]] and [[16 Problem Loans, Restructuring and Recovery]]). Regulators strongly expect one definition, so that **stage 3**, regulatory **default** and **non-performing** are the same population. In the EU, European Banking Authority guidelines add a **materiality threshold** (tiny overdue amounts do not start the 90-day count) and **unlikeliness to pay** triggers such as distressed restructuring. Many banks adopted that definition for stage 3. Any difference needs a documented reason and a reconciliation. Same Sam, same notebook entry.

In stage 3, PD is effectively 100%, so the provision is about **recovery**. Large loans are **individually assessed**: a workout officer forecasts recoveries under a few weighted scenarios, discounted at the EIR, and the provision is the gap to the gross carrying amount. Smaller ones are **collectively assessed** by models.

**Interest on gross versus net.** Stages 1 and 2 earn interest at the EIR on the **gross** carrying amount. Stage 3 switches to the **net** amount (gross minus allowance). For a defaulted 1,000 loan with a 600 provision at a 6% EIR, income is 6% x 400 = **24**, not 60, because nobody expects to collect interest on the lost part. The contractual interest still accrues; only the income recognised is lower. If the loan cures, the bank switches back to gross from the next period. The difference between the loan system's contractual interest and accounting interest must be calculated and posted, often by the ECL or EIR engine.

---

## 14. POCI: loans that were already broken when bought

**Purchased or originated credit-impaired (POCI)?** catches loans already impaired when recognised: a portfolio of defaulted loans bought at 40 cents on the dollar, or a new loan created by a heavy restructuring of a defaulted one (section 18).

The **POCI treatment** box says "only changes in lifetime ECL since purchase are recognised; credit-adjusted interest rate; never moves to stage 1":

- **No day-one provision.** Paying 40 for 100 of face value already prices in the loss; a 60 provision on top would count it twice.
- **Credit-adjusted EIR.** Interest uses a rate that discounts the cash flows actually expected (after losses) back to the 40 paid.
- **Only changes count.** If recoveries beat expectations, the bank books an **impairment gain**, which can make the allowance negative.
- **Never stage 1.** A POCI asset stays POCI for life, usually in its own disclosure column.

The POCI flag is set once and never removed. Getting it wrong corrupts both the staging tables and interest.

---

## 15. The simplified approach and the provision matrix

**Trade receivable, contract asset or lease receivable?** leads to the **simplified approach**: "always lifetime ECL, often via a provision matrix by days past due (required without a significant financing component; a policy choice otherwise)."

A **trade receivable** is money a customer owes for something delivered, due in weeks. Banks have some: fees owed by clients, amounts due from brokers, receivables in leasing and factoring subsidiaries. There is no staging, no SICR and no origination PD; the bank always holds lifetime ECL, which for short receivables is close to 12-month anyway. It is **required** where there is no **significant financing component** (payment terms long enough to amount to a loan), and a policy choice for lease receivables and receivables with one.

The usual tool is a **provision matrix**: loss rates by ageing bucket, from history, adjusted for forecasts.

**Worked example.** A leasing subsidiary has 1,000,000 of trade receivables:

| Ageing bucket | Balance | Historical rate | Forward-looking add-on | Rate used | ECL |
|---|---|---|---|---|---|
| Not yet due | 600,000 | 0.4% | 0.1% | 0.5% | 3,000 |
| 1 to 30 days past due | 200,000 | 1.6% | 0.4% | 2.0% | 4,000 |
| 31 to 60 days | 100,000 | 5.0% | 1.0% | 6.0% | 6,000 |
| 61 to 90 days | 60,000 | 12.5% | 2.5% | 15.0% | 9,000 |
| Over 90 days | 40,000 | 45.0% | 5.0% | 50.0% | 20,000 |
| **Total** | **1,000,000** | | | | **42,000** |

The add-on reflects, say, forecast business insolvencies. The 10% of balances over 60 days overdue carries 29,000 of the 42,000.

---

## 16. Measuring ECL: PD, LGD, EAD and discounting

All five routes flow into the dark blue box: **"measure ECL = sum over time of PD x LGD x EAD, discounted at the effective interest rate. Unbiased, probability-weighted across several economic scenarios, using reasonable and supportable forecasts."** This section covers the first sentence.

The ingredients are those of Basel ([[02 What Credit Risk Is]]): **PD**, **LGD**, and **exposure at default** (**EAD**, how much will be owed at default). IFRS 9 differs in three ways: it needs them **for each future period**; it wants **point-in-time** estimates reflecting today's economy and forecasts, not **through-the-cycle** averages; and it **discounts**.

### PD term structures

A list of PDs for each future year is a **PD term structure**. Three related numbers are easily confused:

| Name | Meaning |
|---|---|
| **Cumulative PD** to year t | Chance of defaulting any time from now to the end of year t |
| **Marginal PD** for year t | Chance, seen from today, of defaulting during year t |
| **Conditional PD** for year t (hazard rate) | Chance of defaulting in year t, given survival to its start |

> Marginal PD(t) = Cumulative PD(t) minus Cumulative PD(t minus 1)
>
> Marginal PD(t) = Survival to start of year t x Conditional PD(t), where survival = 1 minus Cumulative PD(t minus 1)

The ECL formula uses **marginal** PDs. Using conditional PDs without the survival adjustment counts some borrowers as defaulting twice. Term structures are built from **rating migration matrices**, survival analysis on loan history, or scorecards with a time dimension. **Lifetime PD** is the cumulative PD to the end of the remaining life.

### LGD and EAD

IFRS 9 LGD is an unbiased, point-in-time estimate of the share lost after default, net of collateral and recoveries, without Basel's deliberate downturn conservatism. It can vary by scenario (falling house prices push mortgage LGDs up) and over time (as a mortgage is repaid, LGD falls). See [[11 Collateral and Security]].

EAD follows the repayment schedule, adjusted for expected early repayment. **Revolving facilities** such as credit cards add two problems:

1. **The undrawn limit.** Customers tend to draw more as they get into trouble, so EAD includes expected extra drawing via a **credit conversion factor** (**CCF**).
2. **How long is "lifetime"?** A card can usually be cancelled at a day's notice, which would make its lifetime one day and its ECL tiny. Real cards stay open for years, with limits cut only once trouble shows. So IFRS 9 uses the period the bank is actually exposed until its normal risk management actions would end it, the **behavioural life**, estimated from the bank's own data and commonly a few years for cards. It varies by bank and product and moves stage 2 provisions a lot. See [[05 Retail Lending]].

### Discounting

A loss in three years is worth less than one today. ECL is discounted to the reporting date at the loan's EIR (or an approximation); the expected EIR on drawing for commitments; the credit-adjusted EIR for POCI.

### The 3-year worked example

> ECL = sum over each period t of [ Marginal PD(t) x LGD(t) x EAD(t) x Discount factor(t) ], where Discount factor(t) = 1 / (1 + EIR) to the power t

A 3,000 loan repaid 1,000 a year. LGD 45%, EIR 5%. Cumulative PDs: 2%, 5%, 9%. EAD in each year is the balance outstanding that year.

| Year | Cumulative PD | Marginal PD | Conditional PD | EAD | Undiscounted loss | Discount factor | Discounted loss |
|---|---|---|---|---|---|---|---|
| 1 | 2% | 2% | 2.00% | 3,000 | 27.00 | 0.9524 | 25.71 |
| 2 | 5% | 3% | 3.06% | 2,000 | 27.00 | 0.9070 | 24.49 |
| 3 | 9% | 4% | 4.21% | 1,000 | 18.00 | 0.8638 | 15.55 |
| **Total** | | | | | **72.00** | | **65.75** |

Check year 2: survive year 1 (98%) times 3.06% conditional gives 3% marginal; times 45% times 2,000 is 27.00; discounted two years is 24.49. In **stage 1** the provision is year 1 only, **25.71**; in **stage 2** it is **65.75**. The cliff is gentler than in section 11 because this loan is short and amortising.

---

## 17. Forward-looking information and multiple scenarios

ECL must reflect **reasonable and supportable forecasts**. Banks forecast the drivers of loss (unemployment, GDP, house and commercial property prices, interest rates) for several years and link them to PD, LGD and EAD through **satellite models** (see [[20 Stress Testing and ICAAP]]). Beyond the forecastable horizon, projections **revert** to long-run averages.

One forecast is not enough because losses respond to the economy non-linearly: a deep recession costs far more than twice a mild one. If a sunny summer loses you 2 cups to spills and a stormy one loses 20 when the stand blows over, at even odds your expected loss is 11, not the "typical" 2. IFRS 9 wants that average, so banks run several **scenarios** and weight them.

| Scenario | Story | Weight | ECL | Weighted |
|---|---|---|---|---|
| Upside | Strong growth | 20% | 150 | 30 |
| Base | Central forecast | 50% | 200 | 100 |
| Downside | Mild recession, house prices down 10% | 20% | 320 | 64 |
| Severe | Deep recession, house prices down 25% | 10% | 600 | 60 |
| **Weighted** | | **100%** | | **254** |

The ECL is **254**, not the base 200; the gap is the non-linearity effect. Economists propose scenarios and weights and the impairment committee approves them. Moving 5% of weight from base to severe adds 0.05 x (600 minus 200) = 20. Scenarios also affect staging: some banks stage on the weighted PD, others per scenario, and the choice must be documented.

---

## 18. Overlays, modifications, write-offs and cure

### Overlays

Below the measurement box: **"post-model adjustments and management overlays for risks the models miss, governed and documented."** Models learn from history, so new events fool them. A **post-model adjustment** (**PMA**), or **management overlay**, corrects the output for things like a pandemic or energy shock, a known model weakness awaiting a fix, missing origination PDs, government support masking distress, or an unmodelled concentration. Overlays became a big share of provisions in the pandemic, worrying supervisors. Good practice: a written rationale, a quantification method rather than a round number, allocation to stage and segment, an owner and expiry date, committee approval, and extra scrutiny for any overlay that reduces provisions. One still there after three years is a model problem in disguise. See [[21 Model Risk Management and Validation]].

The next box, **"book the loss allowance,"** says the change hits profit or loss. For FVOCI debt the allowance sits in OCI, because the asset is already at fair value and reducing it again would double-count.

### Modifications and forbearance

The re-staging box mentions modifications. A **modification** is any change to contractual cash flows. **Forbearance** is a modification given because the borrower is in difficulty: Sam cannot pay this month, so you let him pay over three. IFRS 9 asks:

1. **Is the change so big the old loan is gone?** This is **derecognition**. There is no fixed test for assets; bank policies count things like a change of currency, conversion to equity or a large change in value. If yes, a new loan is recognised at fair value with a **new initial recognition date**, so SICR starts afresh, and if the borrower is in default it may be POCI.
2. **If not derecognised**, the gross carrying amount is recalculated by discounting the new cash flows at the **original** EIR, and the difference is a **modification gain or loss** in profit. Cutting the rate on a 100,000 four-year loan from 6% to 3% lowers the present value to about 89,600, a modification loss of about 10,400, separate from ECL. SICR still compares with the **original** origination date, and forbearance is itself a stage 2 trigger (stage 3 if it is a distressed restructuring).

Regulatory forbearance rules run alongside. In the EU, a forborne exposure stays flagged through a two-year **probation** as "forborne performing", and a non-performing forborne exposure must stay non-performing for at least a year. Other countries differ. Because stage 3 aligns with non-performing, these clocks drive the accounting stages. See [[16 Problem Loans, Restructuring and Recovery]].

### Write-offs

**"Write off when there is no reasonable expectation of recovery."** A **write-off** removes all or part of a loan from the balance sheet; it is the confirmation, the provision was the estimate. It reduces the gross amount and uses up the provision, so if the provision covered it there is no extra profit hit; any excess is an extra charge. **Recoveries after write-off** are booked as gains. Write-off does not cancel the debt, and collection can continue. Timing varies: unsecured retail often around 180 days past due, mortgages after the property is sold, corporates when insolvency ends. Late write-offs inflate gross loans and provisions, which supervisors watch for.

### Cure and probation

**"Stage 2 and 3 can cure back after probation,"** and the dashed **"next period"** arrow returns to **credit-impaired now?** Every exposure goes through the whole tree again each reporting date. **Cure** is moving to a better stage; **probation** is the wait before a cure counts, to stop loans bouncing monthly.

| Move | Typical condition (illustrative) |
|---|---|
| Stage 3 to 2 | No longer in default and probation met (at least three months under EU default rules, longer after distressed restructuring) |
| Stage 2 to 1 | Trigger gone (PD back under threshold, arrears cleared, flags removed), often for a minimum number of months |
| Stage 3 to 1 | Usually only via stage 2 |

So the staging engine needs **history**, not just today's snapshot: when each flag started, how many months the borrower has been current.

---

## 19. Disclosures and the stage movement table

**IFRS 7** (Financial Instruments: Disclosures) sets what must be published: definitions of SICR, default and write-off; inputs and scenarios with weights; exposure by grade and stage; modifications; amounts written off but still being pursued; often sensitivities to each scenario; and, most importantly, the **reconciliation of the loss allowance by stage**, the **stage movement table**. An illustrative one (millions):

| | Stage 1 | Stage 2 | Stage 3 | POCI | Total |
|---|---|---|---|---|---|
| Opening | 120 | 210 | 480 | 15 | 825 |
| Transfer to stage 1 | 18 | (15) | (3) | | 0 |
| Transfer to stage 2 | (22) | 40 | (18) | | 0 |
| Transfer to stage 3 | (4) | (35) | 39 | | 0 |
| Remeasurement on transfer | (9) | 95 | 110 | | 196 |
| New loans | 35 | | | | 35 |
| Repaid or derecognised | (14) | (20) | (25) | (2) | (61) |
| Parameter and scenario changes | 6 | 22 | 30 | (1) | 57 |
| Write-offs | | | (140) | (3) | (143) |
| Foreign exchange and other | 2 | 3 | 5 | | 10 |
| **Closing** | **132** | **300** | **478** | **9** | **919** |

Transfer rows move opening allowance between columns and sum to zero; the remeasurement row is the cliff effect. Building it needs each exposure's stage and allowance at both period ends, so last period's results must be kept at account level.

---

## 20. The link to regulatory capital

Only the touch points here; see [[18 Regulatory Capital and Basel - the Short Version]].

- **Provisions reduce capital through profit.** Each unit of impairment charge cuts retained earnings and so **Common Equity Tier 1** (**CET1**), roughly three quarters of a unit after tax.
- **Internal ratings-based (IRB) approach: expected loss shortfall.** Basel's **regulatory expected loss** (one-year PD x LGD x EAD with through-the-cycle PD and downturn LGD) is compared with accounting provisions on the same loans. A **shortfall** is deducted from CET1, so under-provisioning saves nothing; a limited excess counts as Tier 2.
- **Standardised approach (SA): provisions reduce exposure.** Specific provisions are subtracted before the risk weight is applied, and affect the weight on defaulted loans. How stage 1 and 2 provisions split between "specific" and "general" differs by country.
- **Two PDs.** IFRS 9 PDs are point-in-time; Basel PDs are through-the-cycle. Both are right for their purpose, and the platform must hold both and explain the bridge.
- **Transitional relief.** Provisions jumped on 1 January 2018, and regulators feared expected-loss provisioning would squeeze capital hardest in downturns (**procyclicality**). Several jurisdictions, including the EU and UK, let banks add back a declining share of the IFRS 9 increase to CET1 for a few years, extended during the pandemic. These were temporary and have largely run off; check current local rules.

---

## 21. How the ECL calculation runs each month

The short note [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]] has a diagram of the engine; this is the process, monthly, with extra rigour at quarter end.

| Step | What happens | Usual owner |
|---|---|---|
| 1. Data cut-off | Snapshot of every exposure: balances, limits, schedules, rates, days past due, collateral, ratings, flags; reconciled to the general ledger | Platform, finance |
| 2. Data quality | Missing origination dates, impossible values, unmapped products, stale valuations fixed or approved | Platform, data owners |
| 3. Staging | Default definition, SICR, backstops, exemption, forbearance, cure, POCI applied; stage migration report produced | Credit risk owns rules; platform runs |
| 4. Models | PD term structures, LGD, EAD per scenario, discounted at EIR; provision matrices for receivables | Modelling team |
| 5. Scenario weighting | Results weighted by approved probabilities | Economics proposes, committee approves |
| 6. Individual cases | Large stage 3 assessments loaded, overriding the model | Workout teams |
| 7. Overlays | Applied from the approved register | Finance and credit risk |
| 8. Review | Movement by driver, coverage ratios, sensitivities, back-testing | Finance and credit risk |
| 9. Impairment committee | Approves scenarios, weights, overlays, large cases and the final number | Chief financial officer and chief risk officer |
| 10. Ledger posting | Allowance and charge by stage, product and entity; stage 3 interest adjustment | Finance |
| 11. Downstream | Regulatory capital, returns, disclosures, management information | Regulatory reporting |

Every run must be **reproducible** months later (versioned data, models, parameters and scenarios, and a log of manual changes), and it sits on the **critical path** of the bank's results: if the committee changes weights on Thursday, someone will want the new number by Friday. See [[13 Credit Governance - Committees, Authorities and the Three Lines]].

---

## 22. Part 3: hedge accounting

![[ifrs9-hedge-types.svg]]
*The three types of hedge accounting under IFRS 9: what each protects against, a typical banking example, how gains and losses are shown, and what happens to any ineffective part.*

### Why it exists

A bank that has issued a fixed-rate bond but earns floating rates on its assets might use an **interest rate swap** to turn its fixed payments floating. Economically the pair is safe. But under Part 1 the swap is at FVTPL, so every rate move hits profit, while the bond at amortised cost does not move at all. Profit jumps though the bank is protected: an **accounting mismatch**.

Lemonade version: you agree with your uncle to swap coins for lemon-currency at a fixed rate each month. If you record the uncle's deal at today's value but not your lemon bill, the notebook shows wild swings although the two together are steady. Hedge accounting lets you show them side by side.

It is **optional**, relationship by relationship. Without it (the red box, **no hedge accounting**), the derivative is at FVTPL, the item at its normal measurement, and profit swings.

### Qualifying

The black box needs a **hedging instrument** (usually a derivative) designated against a **hedged item** (asset, liability, future cash flow or foreign operation). The diamond asks whether it qualifies:

- **Documented at the start**: what is hedged, against which risk, with what, and how effectiveness is judged. No deciding afterwards that a lucky derivative was a hedge.
- **An economic relationship**: the two genuinely move oppositely because of the same risk.
- **Credit risk does not dominate**: if the swap counterparty is near default, the swap's value moves for credit reasons, not rates.
- **A sensible hedge ratio**: the one actually used for risk management.

IAS 39 demanded a bright-line test: the hedge had to offset between **80% and 125%** of the item's changes. IFRS 9 replaced it with these principles and added **rebalancing**: adjust the ratio rather than stop and restart.

### The three types

**What is being protected?**

**Fair value hedge (a value).** Risk: a fixed-rate asset or liability's value moves with rates. Example: a fixed-rate issued bond swapped to floating. Accounting: the **hedged item is adjusted** for the hedged risk, in profit, alongside the swap's change, and the two largely cancel. If the swap loses 4.0 million and the bond's value for the hedged risk falls 3.9 million (a gain, since it is a liability), profit shows a net loss of 0.1 million, not 4.0 million.

**Cash flow hedge (a cash flow).** Risk: future cash flows vary. Example: floating-rate loans swapped to fixed so income is predictable. Accounting: the **effective part** of the swap's value change waits in OCI, in the **cash flow hedge reserve**, and is released to profit when the hedged cash flows hit profit, so income looks fixed.

**Net investment hedge (a foreign operation).** Risk: currency moves on a foreign subsidiary. Example: a sterling bank owning a 500 million euro subsidiary borrows 500 million euros, or uses an FX forward. Accounting: the effective part goes to OCI in the **translation reserve**, recycled only if the subsidiary is sold.

| Type | Protects | Bank example | Effective part goes to |
|---|---|---|---|
| Fair value | Value of an asset or liability | Fixed-rate bond swapped to floating | Profit, offset by adjusting the item |
| Cash flow | Future cash flows | Floating loans swapped to fixed | OCI, then profit as flows occur |
| Net investment | Foreign operation | Euro debt against a euro subsidiary | OCI, recycled on sale |

**"Any ineffective part goes straight to profit or loss."** Hedges are rarely perfect (resets on different dates, counterparty credit moves); the non-offsetting part, **ineffectiveness**, hits profit each period. If the relationship breaks, hedge accounting stops prospectively; under IFRS 9 a bank cannot simply drop a hedge that still meets its risk management objective.

### The policy choice and macro hedging

The grey box: **"many banks kept IAS 39 hedge accounting; macro (portfolio) hedging is a separate, ongoing project."** Banks hedge the net interest rate risk of whole, constantly changing portfolios, called **macro hedging**. IAS 39 had a portfolio fair value hedge model, and the EU version has a **carve-out** allowing hedges of items like core deposits. The IASB did not finish a macro replacement in IFRS 9, so it let companies **keep IAS 39 hedge accounting** until it does. Many banks took that option, at least for portfolio hedges. The IASB has been developing a model it calls risk mitigation accounting; check its current status. Hedge accounting mostly lives with treasury and finance, but hedge adjustments change hedged loans' carrying amounts, and the derivatives carry counterparty risk, so the data meets.

---

## 23. IFRS 9 compared with CECL and Basel expected loss

| Feature | IFRS 9 ECL | CECL (US GAAP) | Basel expected loss (IRB) |
|---|---|---|---|
| Purpose | Accounting provision | Accounting provision | Test provision adequacy for capital |
| Stages | Three, plus POCI | None | Defaulted or not |
| Healthy loan horizon | 12 months, lifetime after SICR | Lifetime from day one | One year |
| PD | Point-in-time, forward-looking | Point-in-time, forward-looking | Through-the-cycle |
| LGD | Unbiased | Unbiased | Downturn (conservative) |
| Scenarios | Several, weighted | Forecast period, then reversion | None |
| Discounting | At EIR | Depends on method | Within LGD only |
| Purchased impaired loans | POCI | PCD (purchased credit deteriorated) | Normal defaulted treatment |
| Impaired loan interest | On net amount | Gross, with non-accrual rules | Not applicable |
| Hard platform problem | Origination PD and staging | Lifetime projections for all loans | Through-the-cycle and downturn calibration |

CECL took effect for the largest US public companies in 2020 and others later. With lifetime loss on everything it provides more in good times but has no stage 2 cliff. Global banks often run both from shared data and term structures.

---

## 24. A worked example from start to finish

One small bank, four exposures, one year. Numbers are illustrative; discounting is ignored except where stated, and each ECL is the scenario-weighted result.

**1 January.** All four pass SPPI and are held to collect, so all are at amortised cost and need ECL.

| Exposure | What it is | Balance | Stage | Calculation | Opening ECL |
|---|---|---|---|---|---|
| A | Corporate term loan | 1,000,000 | 1 | 1.0% x 40% x 1,000,000 | 4,000 |
| B | Mortgage, 20 years left | 400,000 | 1 | 0.5% x 15% x 400,000 | 300 |
| C | Small business loan | 200,000 | 1 | 2.0% x 50% x 200,000 | 2,000 |
| D | Fee receivables | 50,000 | Simplified | All current at 1% | 500 |
| **Total** | | | | | **6,800** |

**Loan A stays in stage 1.** It repays 100,000. Its 12-month PD edges up to 1.1% as forecasts worsen, but lifetime PD is only about 1.2 times its origination level, below the threshold.

> Closing ECL = 1.1% x 40% x 900,000 = **3,960**

**Mortgage B moves to stage 2.** The borrower takes a lower-paid job after redundancies. Payments are on time, but lifetime PD has risen from 4% at origination to 12%, three times, above the 2.5 times threshold. Local house prices fell, so LGD rises from 15% to 18%. Balance: 390,000.

> Closing ECL = lifetime PD 12% x 18% x 390,000 = **8,424**

(A real engine sums year by year with marginal PDs and discounting, as in section 16.) Staying in stage 1 at a 1.5% 12-month PD would have given about 1,050, so the cliff costs about 7,400.

**Loan C defaults, stage 3.** The business loses its main customer and stops paying in July; by December it is over 90 days past due. The workout team expects to recover 90,000 in present value after costs, from equipment and a personal guarantee.

> Closing ECL = 200,000 minus 90,000 = **110,000**

From next year, interest at a 6% EIR is on the net 90,000: 5,400, not 12,000.

**Receivables D, simplified approach.** A client has not paid a 30,000 invoice, now 61 to 90 days overdue; 20,000 is current.

> Closing ECL = 30,000 x 15% + 20,000 x 1% = **4,700**

**Year end.**

| Exposure | Stage move | Opening ECL | Closing ECL | Charge to profit |
|---|---|---|---|---|
| A | 1 to 1 | 4,000 | 3,960 | (40) |
| B | 1 to 2 | 300 | 8,424 | 8,124 |
| C | 1 to 3 | 2,000 | 110,000 | 108,000 |
| D | Simplified | 500 | 4,700 | 4,200 |
| **Total** | | **6,800** | **127,084** | **120,284** |

With no write-offs, the impairment charge equals the allowance increase: **120,284**. Loan A gives a small release.

| Balance sheet | Gross | Allowance | Net |
|---|---|---|---|
| Stage 1 (A) | 900,000 | 3,960 | 896,040 |
| Stage 2 (B) | 390,000 | 8,424 | 381,576 |
| Stage 3 (C) | 200,000 | 110,000 | 90,000 |
| Simplified (D) | 50,000 | 4,700 | 45,300 |
| **Total** | **1,540,000** | **127,084** | **1,412,916** |

| Stage movement | Stage 1 | Stage 2 | Stage 3 | Simplified | Total |
|---|---|---|---|---|---|
| Opening | 6,300 | 0 | 0 | 500 | 6,800 |
| Transfer B to stage 2 | (300) | 300 | | | 0 |
| Transfer C to stage 3 | (2,000) | | 2,000 | | 0 |
| Remeasurement and parameter changes | (40) | 8,124 | 108,000 | 4,200 | 120,284 |
| **Closing** | **3,960** | **8,424** | **110,000** | **4,700** | **127,084** |

**Next year.** The workout on C recovers 95,000 and the remaining 105,000 is written off against the 110,000 allowance: no extra cost, and the 5,000 surplus is released. Borrower B finds a better job, PD falls below the threshold, and after a six-month probation B returns to stage 1, the allowance drops to 12-month ECL, and the release adds to profit.

**Capital.** On IRB, the 127,084 is compared with regulatory expected loss on the same loans; any shortfall comes off CET1. On SA, loan C's 110,000 provision cuts its exposure to 90,000 before the defaulted risk weight.

---

## 25. Things that are easy to get wrong

- **"A provision is cash set aside."** It is an accounting entry; no money moves.
- **"Stage 2 means bad loans."** Stage 2 loans are performing but worse **since origination**.
- **"12-month ECL means losses paid within 12 months."** It is the full loss on defaults in the next 12 months.
- **Conditional PDs used as marginal.** Missing the survival adjustment overstates ECL.
- **Contractual life for credit cards.** Revolving facilities use behavioural life.
- **Forgetting commitments and guarantees.** They need ECL, held as a liability.
- **Base case as expected loss.** The weighted answer is usually higher.
- **One PD for both worlds.** IFRS 9 is point-in-time; Basel is through-the-cycle.
- **A day-one provision on POCI.** The price already reflects expected loss.
- **A non-comparable origination PD.** It must be on the same basis and adjusted for age.
- **Restarting SICR after a modification that is not a derecognition.** The original date still applies.
- **Stage 3 drifting from regulatory default.** They should match, or be reconciled.
- **Permanent overlays.** A model problem in disguise.
- **Frequent reclassifications.** Only a business model change allows one.
- **Thinking hedge accounting is compulsory.** It is optional, and many banks still use IAS 39 for macro hedges.
- **"CECL is IFRS 9 in America."** CECL has no stages and holds lifetime loss from day one.

---

## 26. What a platform lead needs to know

[[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]] covers the ECL engine's data, systems, controls and owners. This adds what the wider IFRS 9 picture brings.

**Data.**

| Item | Why | Typical problem |
|---|---|---|
| Classification per instrument, with SPPI and business model evidence | Decides scope and measurement | Held in spreadsheets, not on the record |
| Initial recognition date and comparable origination PD | SICR relative test | Missing for old or migrated loans |
| EIR per loan, including fees | Interest, discounting, modification gains and losses | Fees in another system; not recalculated after changes |
| Days past due with consistent counting and materiality | Backstops, default, cure | Systems count differently |
| Forbearance, watchlist, default and cure history | Triggers and probation | Only today's flag kept |
| POCI flag and credit-adjusted EIR | POCI measurement | Not captured for bought portfolios |
| Undrawn limits and behavioural life | Revolving EAD and lifetime | Limits held only in the card platform |
| Scenario paths and weights | Forward-looking ECL | Unversioned files |
| Last period's stage and allowance per account | Movement table, back-testing | Overwritten monthly |
| Write-offs and recoveries | Movement table, profit | Only in collections systems |

**Systems.** Source systems; a risk data mart; a classification and EIR engine; a staging rules engine; a calculation engine for term structures, scenarios and discounting; an individual-assessment tool; an overlay register; reconciliation and reporting; and feeds to the ledger, the capital engine and disclosures. Hedge accounting usually has its own treasury or finance system whose adjustments reach the same ledger.

**Controls.** Completeness, including off-balance sheet items, reconciled to the ledger; SPPI and business model review before new products are booked; fixed staging test cases each run (a 31 days past due loan must be stage 2; a POCI loan never stage 1); model and parameter change control with validation sign-off; versioned scenarios; an overlay register; movement analysis by driver; reproducible runs; segregation of duties; and reconciliations of stage 3 to default and non-performing, and of provisions to regulatory expected loss.

**Who owns what.** Finance owns accounting policy and the final number; credit risk owns default, SICR and models; economics owns scenarios; workout owns individual cases; treasury owns hedging and finance its accounting; the impairment committee approves; auditors and supervisors test. The platform team owns the pipes, engines, timetable, controls and evidence, and usually is the only team that sees the whole chain. See [[22 Credit Risk Data, Systems and BCBS 239]] and [[23 Reporting - Regulatory Returns, Pillar 3 and Management Information]].

---

## 27. Related notes

- [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]], the shorter impairment note.
- [[basel-credit-risk-explained-simply]] and [[basel-credit-risk-decision-tree]] for capital.
- [[02 What Credit Risk Is]], [[10 Internal Ratings, Scorecards and PD Models]] and [[11 Collateral and Security]] for PD, LGD and EAD.
- [[05 Retail Lending]] and [[08 Trade Finance and Guarantees]] for products.
- [[13 Credit Governance - Committees, Authorities and the Three Lines]] and [[21 Model Risk Management and Validation]] for governance.
- [[15 Monitoring, Early Warning and Watchlist]] and [[16 Problem Loans, Restructuring and Recovery]] for triggers, default, forbearance and write-off.
- [[18 Regulatory Capital and Basel - the Short Version]], [[19 Counterparty Credit Risk and Derivatives]] and [[20 Stress Testing and ICAAP]].
- [[22 Credit Risk Data, Systems and BCBS 239]], [[23 Reporting - Regulatory Returns, Pillar 3 and Management Information]] and [[28 Master Glossary]].

---

## 28. Glossary

| Term | Meaning |
|---|---|
| 12-month ECL | Expected loss from defaults in the next 12 months. Stage 1. |
| 30 days past due backstop | Rebuttable presumption of SICR once a payment is over 30 days late. |
| Absolute test | SICR test on today's risk level only. |
| Accounting mismatch | Linked items measured differently, so profit swings for no real reason. |
| Accounting standards | Rules for keeping and presenting accounts. |
| Amortisation | Gradual movement of carrying amount as fees are spread over the life. |
| Amortised cost | Cost less repayments, adjusted by the EIR, less the allowance. |
| Asset | Something the bank owns, including loans. |
| Balance sheet | Snapshot of assets, liabilities and equity. |
| BCBS | Basel Committee on Banking Supervision. |
| Behavioural life | Period of real exposure on a revolving facility, used as its lifetime. |
| Benchmark interest modification | Odd rate-setting feature checked under SPPI. |
| Business model test | Why a portfolio is held: hold to collect, hold to collect and sell, or other. |
| Carrying amount | Value shown in the accounts. |
| Cash flow hedge | Hedge of variable future cash flows. |
| Cash flow hedge reserve | Part of OCI holding effective cash flow hedge results. |
| CCF | Credit conversion factor. Share of an undrawn limit expected to be drawn. |
| CECL | Current expected credit losses. US GAAP model: lifetime ECL from day one, no stages. |
| CET1 | Common Equity Tier 1. Highest-quality bank capital. |
| Cliff effect | Jump in provision on moving from 12-month to lifetime ECL. |
| Collective assessment | ECL or SICR assessed for groups of similar loans. |
| Conditional PD | Default chance in a period given survival to its start. Hazard rate. |
| Contingent feature | Contract term changing cash flows if an event occurs. |
| Contract asset | Amount earned but not yet billed. |
| Convertible bond | Bond exchangeable for shares. Fails SPPI. |
| Credit-adjusted EIR | EIR for POCI assets, based on cash flows after expected losses. |
| Credit-impaired | In default. Stage 3. |
| Cumulative PD | Default chance from now to a date. |
| Cure | Moving to a better stage. |
| Default | 90 days past due (rebuttable) or unlikely to pay. |
| Derecognition | Removing an item from the balance sheet. |
| Derivative | Contract whose value depends on something else. |
| Discount factor | 1 / (1 + rate) to the power of years. |
| Dividend | Payment to shareholders. |
| EAD | Exposure at default. |
| ECL | Expected credit loss. The IFRS 9 provision. |
| EIR | Effective interest rate. Discounts expected cash flows to the initial carrying amount. |
| Embedded derivative | Derivative-like feature inside a contract. |
| Equity | Assets minus liabilities; also shares. |
| Equity kicker | Upside share attached to a loan. Fails SPPI. |
| Expected loss (regulatory) | Basel one-year PD x LGD x EAD, through-the-cycle PD, downturn LGD. |
| Fair value | Price in an orderly sale today. |
| Fair value hedge | Hedge of an item's value; both sides in profit. |
| Fair value option | Irrevocable choice of FVTPL to remove a mismatch. |
| FASB | Financial Accounting Standards Board. |
| Financial guarantee | Promise to pay if a borrower does not. |
| Financial instrument | Contract involving money. |
| Forbearance | Concession because of financial difficulty. |
| Forward | Agreement to trade later at a fixed price. |
| FVOCI (debt) | Fair value through OCI for debt; recycled on sale; impaired. |
| FVOCI (equity) | Elected for shares; never recycled; no impairment. |
| FVTPL | Fair value through profit or loss. |
| General approach | The three-stage model. |
| Gross carrying amount | Amount before the allowance. |
| Hedge accounting | Optional accounting showing hedges with hedged items. |
| Hedge ratio | Size of instrument relative to item. |
| Hedged item | What is protected. |
| Hedging instrument | What protects, usually a derivative. |
| Hold to collect | Held for contractual cash flows. Amortised cost. |
| Hold to collect and sell | Collecting and selling integral. FVOCI. |
| IAS | International Accounting Standard. |
| IAS 39 | Previous financial instruments standard, incurred-loss model. |
| IASB | International Accounting Standards Board. |
| IFRS | International Financial Reporting Standards. |
| IFRS 7 | Financial instruments disclosure standard. |
| IFRS 9 | Financial instruments standard, effective 1 January 2018. |
| Impairment | Value reduction for expected credit losses. |
| Impairment charge | Income statement cost of a higher allowance. |
| Impairment committee | Senior forum approving the provision. |
| Impairment gain | Profit from a lower allowance, notably on POCI. |
| Income statement | Account of a period's profit. The P&L. |
| Incurred-loss model | IAS 39 approach: provide only after a loss event. |
| Individual assessment | ECL estimated loan by loan. |
| Ineffectiveness | Non-offsetting part of a hedge. |
| Interest | Payment for lending. |
| Investment grade | BBB minus or better. |
| IRB | Internal ratings-based approach. |
| LGD | Loss given default. |
| Liability | Something the bank owes. |
| Lifetime ECL | Expected loss over remaining life. Stages 2 and 3, POCI, simplified. |
| Lifetime PD | Cumulative PD to the end of the life. |
| Loan commitment | Promise to lend. |
| Loss allowance | The provision. |
| Loss event | IAS 39 trigger for provisioning. |
| Low credit risk exemption | Optional stage 1 for roughly investment-grade exposures. |
| Macro hedging | Hedging whole portfolios. |
| Management overlay | Adjustment for risks models miss. |
| Marginal PD | Default chance in a future period, seen from today. |
| Materiality threshold | Minimum overdue amount that starts the days past due count. |
| Modification | Change to contractual cash flows. |
| Modification gain or loss | Change from discounting new cash flows at the original EIR. |
| Net carrying amount | Gross less allowance. |
| Net investment hedge | Hedge of currency risk on a foreign operation. |
| Non-performing | Regulatory term aligned with stage 3. |
| OCI | Other comprehensive income. |
| Option | Right, not duty, to trade at a set price. |
| Origination PD | PD at initial recognition. |
| Own credit | Value change in own liabilities from own creditworthiness. |
| P&L | Profit and loss account. |
| PCD | Purchased credit deteriorated. CECL's POCI. |
| PD | Probability of default. |
| PD term structure | PDs for each future period. |
| PMA | Post-model adjustment. |
| POCI | Purchased or originated credit-impaired. |
| Point-in-time | Reflecting current conditions and forecasts. |
| Prepayment feature | Right to repay early. |
| Principal | Amount lent. |
| Probation | Wait before a cure counts. |
| Procyclicality | Amplifying the economic cycle. |
| Profit-share loan | Interest tied to profits. Fails SPPI. |
| Provision | See loss allowance. |
| Provision matrix | Loss rates by ageing bucket. |
| Rating migration matrix | How often borrowers move between grades in a year. |
| Rebalancing | Adjusting a hedge ratio without stopping. |
| Rebuttable presumption | Rule applying unless evidence shows otherwise. |
| Reclassification | Moving category on a business model change. |
| Recovery after write-off | Cash collected after write-off, booked as a gain. |
| Recycling | Moving an amount from OCI into profit. |
| Relative test | SICR test comparing now with origination. |
| Remeasurement | Allowance change from a new horizon on stage transfer. |
| Revolving facility | Line that can be drawn and redrawn. |
| SA | Standardised approach. |
| Satellite model | Links economic variables to PD, LGD, EAD. |
| Scenario | Weighted economic forecast path. |
| SICR | Significant increase in credit risk since initial recognition. |
| Significant financing component | Payment terms amounting to a loan. |
| Simplified approach | Lifetime ECL without staging for receivables. |
| SPPI | Solely payments of principal and interest. |
| Stage 1 / 2 / 3 | Performing / SICR / credit-impaired. |
| Stage movement table | Allowance reconciliation by stage. |
| Survival | Probability of no default so far. |
| Swap | Exchange of payment streams. |
| Through-the-cycle | Averaged over an economic cycle. |
| Trade receivable | Money owed for goods or services delivered. |
| Transitional relief | Temporary easing of IFRS 9's capital impact. |
| Translation reserve | OCI for foreign operation currency effects. |
| US GAAP | US Generally Accepted Accounting Principles. |
| Watchlist | Borrowers under closer monitoring. |
| Write-off | Removing an unrecoverable loan from the balance sheet. |
