# Credit Portfolio Management and Risk Transfer

**Why this matters to you.** Most of this vault looks at credit risk one loan at a time: is this borrower good, is this collateral enough, is this loan priced right? But a bank does not fail because of one loan. It fails because too many of its loans go bad together, or because one giant loan does. **Credit portfolio management** (CPM) is the team that looks at the whole book and asks: are we too heavy in one name, one sector, one country? Are we using our capital well? If not, what can we sell, insure or hedge? Its tools (loan sales, credit default swaps, credit insurance, guarantees, synthetic securitisation) all change the shape of the bank's risk without necessarily changing who the bank lends to. For a platform lead, risk transfer is a data problem in disguise: every hedge has to be linked to the loans it protects, tested for eligibility, reported to regulators and investors, and kept in step as loans repay, amend and default. If that link breaks, the bank either holds too much capital or, worse, claims relief it is not entitled to.

## Table of contents

1. [The pocket money version](#the-pocket-money-version)
2. [What a credit portfolio management function does](#what-a-credit-portfolio-management-function-does)
3. [The toolkit at a glance](#the-toolkit-at-a-glance)
4. [Loan sales and secondary loan trading](#loan-sales-and-secondary-loan-trading)
5. [Credit default swaps used as hedges](#credit-default-swaps-used-as-hedges)
6. [Credit insurance and guarantees](#credit-insurance-and-guarantees)
7. [Synthetic securitisation and significant risk transfer](#synthetic-securitisation-and-significant-risk-transfer)
8. [True-sale securitisation and originate-to-distribute](#true-sale-securitisation-and-originate-to-distribute)
9. [Portfolio models in plain words](#portfolio-models-in-plain-words)
10. [A whole-portfolio worked example](#a-whole-portfolio-worked-example)
11. [How risk transfer is recognised for capital](#how-risk-transfer-is-recognised-for-capital)
12. [The accounting interplay](#the-accounting-interplay)
13. [Data and systems](#data-and-systems)
14. [Common mistakes and misunderstandings](#common-mistakes-and-misunderstandings)
15. [What a platform lead needs to know about this](#what-a-platform-lead-needs-to-know-about-this)
16. [Related notes](#related-notes)

## The pocket money version

You have saved 100 coins and lent them to friends. Lending one coin each to a hundred friends is safe: a few will forget, most will pay. But you have lent 40 coins to your cousin Alex, because Alex always asks nicely. If Alex's family moves away, you lose almost half your savings.

You have choices:

- **Sell part of the loan.** Your older sister agrees to take over 20 coins of what Alex owes, paying you 19 now. You lose one coin, but your worry halves. That is a **loan sale**.
- **Buy insurance.** Your aunt agrees that if Alex never pays, she will pay you instead, in return for a coin a month. Alex never knows. That is a **credit default swap** or **credit insurance**.
- **Insure the middle slice of all your loans.** You tell a rich neighbour: "I will take the first 2 coins of losses across all my loans myself. You cover the next 10 coins of losses. I will pay you 3 coins a year." That is a **synthetic securitisation**, and the slice you insured is the **mezzanine tranche**.
- **Lend differently next time.** Stop lending Alex more, and lend to new friends. That is **steering origination**.

A credit portfolio manager notices the Alex problem and picks the cheapest fix.

## What a credit portfolio management function does

### Portfolio, not loan by loan

Every loan can pass its own credit test and the bank can still be in danger, because what matters is **how loans behave together**: ten good loans to ten shipping companies tend to go bad at the same time. CPM looks at the book as an investment manager looks at a fund: concentrations, correlations, capital used and returns earned.

### The mandate

| Objective | What it means | Typical measure |
|---|---|---|
| Control concentration | Keep single names, sectors, countries within appetite | Largest exposures, sector shares, Herfindahl index (see [[14 Risk Appetite, Limits and Concentration]]) |
| Manage capital | Free up regulatory and economic capital so the bank can lend more or return it | Risk-weighted assets (RWA) released, capital ratios |
| Improve returns | Exit or hedge exposures that earn less than their cost of capital | Risk-adjusted return on capital (RAROC), see [[24 Pricing, RAROC and Return on Capital]] |
| Protect against tail events | Buy protection on the names or sectors that would hurt most in a crisis | Stress losses, economic capital contributions |

### Operating models

Banks organise CPM differently, which changes who owns the data: an **advisory** team that analyses and recommends; a **hedging desk** with its own budget and profit and loss account (P&L), needing trade capture and a hedge register; a **transfer model** in which business lines transfer loans economically to CPM at an internal price; or a **capital management** team in finance or treasury focused on RWA and securitisation programmes.

Whatever the model, CPM sits in the **first line** (it takes and manages risk) and is challenged by the risk function in the second line (see [[13 Credit Governance - Committees, Authorities and the Three Lines]]).

## The toolkit at a glance

![[36-cpm-toolkit.svg]]
*The CPM toolkit in three families: move the loan out entirely, keep the loan but buy protection on it, or shape what new lending comes in.*

| Tool | Funded or unfunded? | Who takes the risk | Client knows? | Speed |
|---|---|---|---|---|
| Loan sale (assignment) | Funded: the buyer pays cash for the loan | Buyer, fully | Usually yes; consent may be needed | Weeks |
| Sub-participation | Funded | Buyer takes the loan's risk, plus risk on the selling bank | Often no | Days to weeks |
| Single-name credit default swap (CDS) | Unfunded: protection seller pays only if there is a default | Protection seller | No | Days, if the name trades |
| Index CDS | Unfunded | Protection seller, on a basket of names | No | Hours |
| Credit insurance | Unfunded | Insurer | Usually no | Weeks |
| Export credit agency or development bank guarantee | Unfunded | Government agency or development bank | Usually yes, arranged at origination | Months, at deal start |
| Synthetic securitisation | Funded (credit-linked notes) or unfunded (guarantee) | Investors in the protected tranche | No | Months |
| True-sale securitisation | Funded | Investors in the notes | Varies | Months |

**Funded** means the cash is already paid over, so the protector cannot fail to pay. **Unfunded** means a promise to pay later, so the bank swaps borrower risk for protector risk.

## Loan sales and secondary loan trading

### How loans change hands

Corporate loans, especially syndicated ones (see [[04 Commercial and Corporate Lending]] and [[07 Leveraged and Acquisition Finance]]), trade in a **secondary loan market**. There are two main methods:

| Method | What happens | Effect |
|---|---|---|
| **Assignment** (or novation) | The buyer becomes the lender of record; the borrower now owes the buyer directly | Clean exit; may need the borrower's or agent's consent under the loan agreement |
| **Sub-participation** | The seller stays the lender of record but passes the economics (payments and losses) to the buyer, who pays cash up front | Borrower need not know; the buyer is exposed to the borrower and to the selling bank |

Standard documentation comes from industry bodies: the **Loan Market Association** (LMA) in Europe, Middle East and Africa, and the **Loan Syndications and Trading Association** (LSTA) in the United States. Loan trades settle slowly compared with bonds, often taking weeks, because consents and transfer documents must be processed.

### Par and distressed

Healthy loans trade near **par** (100% of face value); troubled loans trade as **distressed** debt at deep discounts, bought by specialist funds. Bulk sales of non-performing loans are covered in [[16 Problem Loans, Restructuring and Recovery]].

### Worked example: selling a slice

The bank holds 180 million of a loan to Name A, a large manufacturer, against a single-name limit of 120 million. The loan trades at 99.25.

- Sell 60 million: proceeds 60 x 0.9925 = 59.55 million.
- Loss on sale: 0.45 million (if the loan was held at par).
- Exposure falls to 120 million, back at the limit. The RWA on 60 million disappears.

The catch: Name A's treasurer may notice, and the bank loses the margin on the 60 million. So CPM often prefers to **keep the loan and hedge it**.

## Credit default swaps used as hedges

### How a CDS works

A **credit default swap** (CDS) is a contract in which the **protection buyer** pays a regular **premium** (the CDS **spread**, quoted in basis points a year on the notional; a basis point is 0.01%) to a **protection seller**. If a **credit event** happens to the **reference entity** (a named company or government), the seller pays the buyer the loss: notional minus the recovery value of the reference entity's debt.

It is house insurance for a loan, except anyone can buy it, even without owning the house. As a hedge, the bank buys protection on a borrower it lends to.

| Term | Meaning |
|---|---|
| Reference entity | The company or government whose default triggers payment |
| Credit events | Usually bankruptcy, failure to pay and, depending on the contract, restructuring |
| Settlement | Mostly cash settlement after an industry auction sets the recovery price |
| Maturity | Standard dates; five years is the most traded tenor |

**Index CDS** reference a basket of names (for example the 125 investment-grade European or North American companies in the main indices). CPM uses them to hedge broad sectors or a whole portfolio cheaply, accepting that the basket will not match the bank's own loans (**basis risk**).

### Worked example: hedging Name A

Instead of selling, the bank buys 60 million of five-year protection on Name A at a spread of 100 basis points (1%) a year from a highly rated bank.

- Premium: 60 x 1% = 0.6 million a year.
- If Name A defaults and recovery is 40%, the protection seller pays 60 x (1 minus 0.40) = 36 million, offsetting the loss on 60 million of the loan.
- Capital, using the **substitution approach** (illustrative risk weights): 60 million at Name A's 100% = 60 million of RWA becomes 60 million at the protection seller's 20% = 12 million. RWA saved: 48 million. At an illustrative 10% capital requirement, 4.8 million of capital is freed.
- Cost of capital relief: 0.6 / 4.8 = 12.5% a year. If the bank's hurdle rate is above that, hedging is cheaper than holding capital; if below, it is not.

### The traps

- **Maturity mismatch.** If the loan runs five years and the CDS three, regulatory recognition is reduced (see [[#How risk transfer is recognised for capital]]).
- **Restructuring.** Many CDS contracts exclude restructuring as a credit event. The loan could be restructured at a loss with no payout, so capital recognition is reduced.
- **Entity mismatch.** The loan is to a subsidiary, the CDS references the parent. A subsidiary default may not trigger the CDS.
- **Counterparty risk.** The protection seller could fail exactly when needed, especially if it is correlated with the borrower (**wrong-way risk**, see [[19 Counterparty Credit Risk and Derivatives]]).
- **Accounting mismatch.** The CDS is marked to market daily; the loan is not (see [[#The accounting interplay]]).
- **Liquidity.** Only larger names have liquid single-name CDS.

## Credit insurance and guarantees

### Credit insurance

**Credit insurance**, often called **non-payment insurance** in banking, is a policy from an insurance company that pays the bank if a borrower fails to pay. Insurers write it through specialist markets for trade finance, project finance and corporate loans (see [[08 Trade Finance and Guarantees]]). Banks like it because it covers names with no CDS market, insurers rarely trade it away, and policies can cover a portfolio.

For capital relief the policy must behave like a guarantee (see the requirements table below). Traditional policy conditions (notification deadlines, waiting periods, exclusions for fraud or disputes) can break those tests, so banks negotiate specific wording, obtain legal opinions, and often debate eligibility with the second line and supervisors.

### Export credit agencies and development banks

An **export credit agency** (ECA) is a government-backed body that guarantees or insures loans to foreign buyers of its country's exports. A **multilateral development bank** (MDB), such as the World Bank group, guarantees or co-lends for development goals. Cover often runs to most of the loan and is arranged at origination.

**Worked example (illustrative).** A 100 million loan to a power utility in an emerging market, risk weight 100%, RWA 100 million. An ECA guarantees 95%. If the ECA's guarantee earns the risk weight of its sovereign, say 0% in your jurisdiction, RWA becomes 95 x 0% + 5 x 100% = 5 million. Whether the 0% applies depends on the guarantor, the currency and local rules; check. Large exposure reporting must now show the guaranteed part against the guarantor (see [[26 Sovereign, Bank and Country Risk]]).

## Synthetic securitisation and significant risk transfer

This is the most powerful and most technical CPM tool, so we build it from scratch.

### Step 1: a pool and its slices

Take 1,000 million of corporate loans the bank wants to keep (good clients, good margins) but which use too much capital: the **reference portfolio**.

Now imagine slicing the possible losses into layers, called **tranches**, like floors of a building in a flood:

- The **first loss** tranche takes the first losses, say from 0% to 1% of the pool (10 million). The ground floor floods first.
- The **mezzanine** tranche takes losses from 1% to 7.5% (65 million). Only a serious flood reaches it.
- The **senior** tranche takes losses above 7.5% (925 million). Only a catastrophe reaches the top floors.

The loans are not moved; only the **risk of loss** is sliced. That is what "synthetic" means: in a **true-sale** securitisation the loans are sold to a vehicle; in a **synthetic** one the bank keeps them and buys protection on a slice of their losses.

### Step 2: sell protection on the mezzanine

The bank finds investors (specialist credit funds, pension funds, insurers) to take the mezzanine risk. Two routes:

- **Funded, through credit-linked notes** (CLNs). Investors buy notes for 65 million in cash. The bank (or a vehicle) holds the cash as collateral. The notes pay a coupon. If losses on the pool exceed 1%, the note principal is written down by the excess, up to 65 million, and the bank keeps that cash. The bank has no counterparty risk because the money is already there.
- **Unfunded, through a guarantee or CDS.** An eligible guarantor (a highly rated insurer or a development bank) promises to pay the mezzanine losses. No cash moves up front, so the bank carries counterparty risk on the guarantor.

![[36-srt-structure.svg]]
*A synthetic securitisation: the bank keeps 1,000m of loans, tranches the risk, keeps the first loss and senior slices, and buys protection on the mezzanine slice by selling credit-linked notes to investors, paying them a coupon for taking the risk.*

### Step 3: significant risk transfer

The bank's goal is capital relief. Regulators allow it only if the deal moves a **significant** share of the risk to third parties: **significant risk transfer** (SRT). If the bank kept the mezzanine itself, or protected it in a way that would not hold up in a crisis, there would be no real transfer and no relief. Market participants often call these deals "SRT trades" or "capital relief trades".

### Worked example: capital relief

All numbers illustrative; real risk weights depend on the approach the bank uses for the tranches (see [[basel-credit-risk-explained-simply]], "Way 5").

**Before.** 1,000 million of corporate loans, average risk weight 60% under the bank's internal ratings-based approach.

- RWA = 1,000 x 60% = 600 million.
- Capital at an illustrative 10% requirement = 60 million.

**After.**

| Tranche | Size | Who holds the risk | Risk weight (illustrative) | RWA |
|---|---|---|---|---|
| First loss 0% to 1% | 10m | Bank | 1250% | 125.0m |
| Mezzanine 1% to 7.5% | 65m | Investors, cash collateralised | 0% (protected by cash held) | 0 |
| Senior 7.5% to 100% | 925m | Bank | 15% (the senior floor in this example) | 138.75m |
| **Total** | **1,000m** | | | **263.75m** |

- RWA released: 600 minus 263.75 = **336.25 million**.
- Capital released at 10%: **33.6 million**.
- Cost: coupon of, say, 7% a year on 65 million = **4.55 million a year**.
- Cost of capital relief: 4.55 / 33.6 = **13.5% a year**.

Check the senior figure: 925 x 0.15 = 138.75. The first loss at 1250% means capital equal to the whole tranche at the 8% minimum (1250% x 8% = 100%); at a 10% requirement it costs slightly more than the tranche itself, which is why some banks sell the first loss too or deduct it from capital.

**Is it worth it?** If the bank's cost of equity is, say, 12%, then paying 13.5% for relief is only slightly expensive. The deal makes sense if the freed 33.6 million is redeployed into new lending that earns more than 13.5% on capital, or if the bank needs the relief to meet a capital target, or if the pool is concentrated and the protection also reduces tail risk. CPM runs exactly this comparison for each deal.

### Why supervisors scrutinise SRT

Capital relief from SRT is a judgement, not an entitlement. Supervisors worry that:

- The **risk transferred** is smaller than the **capital released** (for example, if the protected tranche is too thin, or the bank retains risk through side arrangements).
- Features of the deal claw risk back: **premiums that rise** if the pool deteriorates, **clean-up calls** or **time calls** that let the bank end the deal early when it suits it, **excess spread** the bank promises to put up first, or **implicit support** (a bank quietly compensating investors).
- The **counterparty** on unfunded protection is weak or correlated with the pool.
- **Replenishment** (new loans added to the pool during its life) brings in worse loans.

Banks typically notify their supervisor in advance with detailed analysis, and some jurisdictions apply quantitative tests of how much mezzanine or first loss risk must be transferred. Rules vary and change often; see [[35 Regulatory Landscape and Change Calendar]].

## True-sale securitisation and originate-to-distribute

### True-sale securitisation, briefly

In a **true-sale** securitisation, the bank sells a pool of loans (mortgages, car loans, credit cards, corporate loans) to a **special purpose vehicle** (SPV), a company set up only to hold them. The SPV pays for them by issuing tranched notes to investors. The bank gets cash (funding) as well as risk transfer, which is why it is popular for retail assets. Collateralised loan obligations (CLOs) are the leveraged-loan version, usually run by asset managers. Rules generally require the originator to keep some **risk retention** (often 5% of the risk, in one of several permitted forms) so that it has "skin in the game".

| | Synthetic | True sale |
|---|---|---|
| Loans leave the balance sheet? | No | Yes, if accounting derecognition tests are met |
| Provides funding? | Only if funded notes are issued | Yes |
| Typical assets | Corporate and small business loans the bank wants to keep | Mortgages, auto loans, cards, leveraged loans |
| Main motive | Capital relief, concentration | Funding plus capital relief |

### Originate-to-distribute

**Originate-to-hold** means making a loan and keeping it. **Originate-to-distribute** means making loans intending to sell most of them, through syndication at the start (see [[07 Leveraged and Acquisition Finance]]) or later through sales or securitisation. Banks set a **final hold** (the amount they intend to keep) for each deal.

The risk sits in the gap: if the bank has underwritten a 1,000 million loan intending to hold 100 million, and the market shuts before it can sell the rest, it is stuck with 900 million it did not want (a "hung" deal). Several banks were caught this way in 2007 and 2008. Lenders who expect to sell may also take less care, one reason for risk retention rules.

## Portfolio models in plain words

CPM decisions rest on **portfolio models**, which estimate how losses on the whole book behave, not just each loan.

### Expected loss, unexpected loss and economic capital

Each loan has an **expected loss** (EL) of probability of default (PD) x loss given default (LGD) x exposure at default (EAD) (see [[02 What Credit Risk Is]]). Expected losses simply add up. What does not add up simply is the **bad year**. A portfolio model simulates thousands of possible years, each with different defaults, and builds a **loss distribution**. The bank then reads off a high percentile, such as the loss exceeded only once in 1,000 years (99.9%). **Economic capital** (EC) is that tail loss minus the expected loss: the cushion the bank's own model says it needs (see [[24 Pricing, RAROC and Return on Capital]]).

### Concentration, with numbers

Two portfolios, each 1,000 million, each with PD 1% and LGD 50%, so EL = 1,000 x 1% x 50% = 5 million in both.

| | Portfolio A: 100 loans of 10m, independent | Portfolio B: one loan of 1,000m |
|---|---|---|
| Expected loss | 5m | 5m |
| Loss at the 99.9% level | About 5 defaults x 10m x 50% = 25m | 1,000m x 50% = 500m (default happens with 1% probability, which is more than 0.1%) |
| Economic capital (tail minus EL) | About 20m | About 495m |

For Portfolio A, the number of defaults among 100 independent loans with 1% PD averages one; five or more defaults in a year happens only about 0.4% of the time and six or more about 0.05%, so the 99.9% level is about five defaults. Same expected loss, capital needs 25 times apart. That is why CPM worries about the largest names first.

### Correlation

Real borrowers are not independent. In a recession, many default together. Models capture this with **correlation**, usually through a few shared **factors** (the economy, the sector, the country) that every borrower responds to. Higher correlation leaves expected loss unchanged but fattens the tail. In Portfolio A, with moderate correlation, the 99.9% year might bring 12 defaults instead of 5 (illustrative), more than doubling economic capital. Ten shipping loans have high correlation with each other; ten loans across ten unrelated industries have low correlation.

### Contributions and why they matter

The model also shows each loan's **contribution** to the tail; a large name in a concentrated sector can contribute several times its share of exposure. Names ranked by contribution and RAROC become the hedging list.

### Regulatory models do not see this

The Basel internal ratings-based formula (see [[10 Internal Ratings, Scorecards and PD Models]] and [[18 Regulatory Capital and Basel - the Short Version]]) deliberately assumes a portfolio of **infinitely many small loans** driven by **one** economic factor. It cannot see name or sector concentration. So concentration is captured instead by large exposure limits, internal appetite limits and **Pillar 2** capital in the bank's internal capital adequacy assessment process (ICAAP, see [[20 Stress Testing and ICAAP]]). Portfolio models are the bank's tool for this gap, and they are models subject to validation (see [[21 Model Risk Management and Validation]]).

## A whole-portfolio worked example

![[36-before-after.svg]]
*A CPM review in practice: the portfolio model highlights a single-name and a sector concentration; CPM hedges the name it wants to keep, sells the sector loans it does not, and runs a synthetic securitisation for capital, checking eligibility before claiming relief.*

**Before.** A 5,000 million corporate book with RWA of 3,000 million (average 60%). Name A is 180 million against a 120 million limit. Shipping is 700 million, 14% of the book, against a 10% appetite.

**Actions.**

| Action | Exposure effect | RWA effect (illustrative) | Cost |
|---|---|---|---|
| Buy 60m five-year CDS on Name A (from a 20% risk-weighted bank) | Name A net 120m, at the limit | Minus 48m | 0.6m a year premium |
| Sell 250m of shipping loans at 97 | Shipping 450m of a 4,750m book, about 9.5% | Minus 200m (at 80% risk weight) | 7.5m loss on sale (250 x 3%) |
| Synthetic securitisation of 1,000m mid-market loans, as above | No change in exposure | Minus 336m | 4.55m a year coupon |
| **Total** | | **Minus about 584m** | |

Check: 48 + 200 + 336.25 = 584.25. RWA falls from 3,000 to about 2,416 million, freeing about 58 million of capital at 10%. CPM presents this to the credit and capital committees with costs and residual risks (CDS basis, protection seller risk, supervisory acceptance of the securitisation).

## How risk transfer is recognised for capital

The Basel framework recognises risk transfer in two main ways. The details are in [[basel-credit-risk-explained-simply]] (the credit risk mitigation section and "Way 5" on securitisation) and [[11 Collateral and Security]]; this is the general shape.

### Guarantees and credit derivatives: credit risk mitigation

For single exposures protected by a guarantee, insurance policy or CDS, the usual approach is **substitution**: the protected part of the exposure takes the risk weight of the protection provider instead of the borrower (under internal ratings approaches, the PD or LGD may be adjusted instead, depending on the approach and jurisdiction). To count, the protection must broadly be:

| Requirement | Plain meaning |
|---|---|
| Direct | A claim on the protection provider for this exposure |
| Explicit | Tied to specific exposures or a defined pool |
| Irrevocable | The provider cannot cancel it, except for the buyer's non-payment |
| Unconditional | No clauses that let the provider avoid paying promptly after default |
| Eligible provider | Sovereigns, banks, well-rated companies and insurers, development banks, as defined in the rules |
| Legally certain | Enforceable in all relevant jurisdictions, supported by legal opinions |

**Adjustments.** Recognition is reduced for:

- **Maturity mismatch**: protection shorter than the loan. Protection with less than one year left counts for nothing. Otherwise it is scaled down by (t minus 0.25) / (T minus 0.25), where t is the protection's remaining years and T the loan's (capped at five). For the Name A hedge, if the CDS had three years left and the loan five: (3 minus 0.25) / (5 minus 0.25) = 2.75 / 4.75 = 0.58, so only about 35 million of the 60 million counts.
- **Currency mismatch**: protection in a different currency from the loan attracts a haircut.
- **Missing restructuring credit event**: Basel recognises only a portion of the hedge (60% under the Basel text) when restructuring is not covered.

### Tranched protection: the securitisation framework

Protection on a **tranche** of a pool (a synthetic securitisation) falls under the **securitisation framework**, not ordinary credit risk mitigation. The bank must meet operational requirements (significant risk transfer, no implicit support, limits on calls, eligible protection, legal opinions) and then calculates capital on the tranches it keeps using the securitisation hierarchy of approaches. If the requirements are not met, the bank calculates capital as if the securitisation did not exist. Some jurisdictions also offer a lower-capital "simple, transparent and standardised" (STS) label, which the European Union extended to certain balance-sheet synthetic securitisations.

### Large exposures and other metrics

Recognised protection moves exposure to the provider for **large exposure** purposes, so heavy buying from one insurer creates a new concentration. Leverage ratio exposure is generally not reduced, because the loans stay on the balance sheet.

## The accounting interplay

Accounting and regulatory capital answer different questions, so a risk transfer can work for one and not the other.

**Derecognition.** Under the international accounting standard for financial instruments, IFRS 9 (International Financial Reporting Standards), a bank removes a loan from its balance sheet only if it transfers the rights to the cash flows and substantially all the risks and rewards, or loses control. A sale by assignment usually achieves this; a synthetic securitisation never does. United States accounting has its own, similar tests.

**Measurement mismatch.** Loans are usually held at amortised cost, with expected credit loss provisions (see [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]]). A CDS is a derivative held at fair value, so its value swings through P&L every day. A bank that hedges well can still show P&L volatility because the hedge moves and the loan does not. IFRS 9 offers an option in some cases to measure the hedged credit exposure at fair value to reduce this mismatch; banks use it selectively.

**Provisions.** Protection that is integral to the loan's contract terms (such as a guarantee arranged as part of the loan) can generally reduce the expected credit loss. Protection bought separately (a CDS, a later insurance policy, a synthetic securitisation) usually cannot reduce the provision; any recovery is recognised separately. So the bank may hold a full provision on a loan whose loss is in fact covered.

Always ask finance how a hedge will be accounted for before it is executed.

## Data and systems

### What must be tracked

| Data item | Why |
|---|---|
| Hedge-to-underlying link: each protection instrument linked to the exposures it covers (one-to-one, one-to-many or pool) | Without it, no capital relief can be calculated or evidenced |
| Protection provider legal entity, rating, risk weight, sector | Substitution, counterparty limits, large exposures, wrong-way risk |
| Coverage amount and percentage, amortisation schedule | Loans repay; hedges may not, creating over- or under-hedging |
| Start and end dates of loan and protection | Maturity mismatch adjustment |
| Currencies | Currency mismatch haircut |
| Credit events covered, governing law, legal opinion status | Eligibility for capital recognition |
| Eligibility decision and its reason, by exposure and date | Audit trail for regulators |
| SRT reference portfolio flag per loan, tranche boundaries, replenishment criteria | Securitisation capital, investor reporting, loss allocation |
| Credit event notices and loss allocations | Payment claims under the protection |

### Typical systems

- **Credit derivative trades** are booked in a trading system (often owned by markets technology), while the **loans** live in lending systems. Joining them needs common counterparty identifiers, usually the legal entity identifier (LEI), and a mapping maintained by someone (see [[22 Credit Risk Data, Systems and BCBS 239]] and [[32 The Credit Risk Data Model]]).
- **Insurance and guarantees** are often recorded in collateral systems as a type of credit protection, sometimes only in documents. Structured fields for conditions and expiry are frequently missing.
- **A hedge or protection register** sits on top, holding links and eligibility. In many banks this starts as a spreadsheet and should not stay one (see [[30 Operational Risk]] on end-user computing).
- **The capital engine** applies substitution and maturity adjustments for single-name protection, and a separate **securitisation calculator** handles tranches.
- **Investor reporting** for synthetic securitisations needs regular loan-level reference portfolio data, often checked by an independent **verification agent**.
- **Regulatory reporting** includes securitisation templates, credit risk mitigation templates and Pillar 3 disclosures (see [[23 Reporting - Regulatory Returns, Pillar 3 and Management Information]]).

### Controls

- Reconcile the hedge register to the trading system and to the protection documents monthly.
- Flag any loan that repays, amends, extends or defaults while it is hedged or in a reference portfolio, and re-test eligibility.
- Alert when protection is within a year of expiry (it stops counting) or when the provider is downgraded.
- Test that every loan in an SRT pool meets the eligibility criteria on inclusion and that removed loans are removed everywhere.

## Common mistakes and misunderstandings

- **"Hedged means risk-free."** The bank swaps borrower risk for protection seller risk, plus basis, maturity and documentation risk.
- **"Synthetic securitisation sells the loans."** It does not. The loans, the clients and the accounting stay; only part of the loss risk moves.
- **"The bank keeps the safe bits, so it is fine."** Retaining the first loss means keeping the riskiest slice, which is why it carries such a high risk weight.
- **"Capital relief is automatic once the deal is signed."** It depends on meeting requirements and, for SRT, on supervisory acceptance. Features like rising premiums or early calls can wipe it out.
- **"Index CDS hedge my loans."** They hedge the market, not your names. The gap is basis risk.
- **"A good hedge has a stable P&L."** A CDS hedging an amortised-cost loan creates P&L volatility even when it works perfectly.
- **"The regulatory model handles concentration."** The internal ratings-based formula assumes perfect granularity. Concentration needs portfolio models, limits and Pillar 2.
- **"Once hedged, always hedged."** Loans repay and protections expire on different schedules. Hedges drift.

## What a platform lead needs to know about this

**The link is the product.** The single most valuable thing your platform provides CPM is a reliable, auditable link between every protection instrument and the exposures it covers, with eligibility decided by rules, not by memory. Without it, capital relief cannot be evidenced, and a supervisor or auditor will disallow it.

**Expect three data worlds to meet.** Lending systems (loans), markets systems (CDS and credit-linked notes) and collateral or document systems (guarantees and insurance). Each uses different identifiers and update cycles. Agree on the LEI or a group-wide counterparty identifier as the join key and own the mapping.

**Lifecycle events are where it breaks.** Prepayments, amendments, maturity extensions, defaults, restructurings, provider downgrades and protection expiries all change eligibility or coverage. Build event-driven re-checks rather than quarterly ones.

**SRT programmes are long-running data products.** A synthetic securitisation may last five to ten years, with monthly or quarterly investor reports, loss claims and replenishment tests. Treat each programme as a product with an owner, a data specification, controls and a runbook (see [[38 Platform Lead Toolkit - Runbooks, Metrics and Templates]]).

**Change and regulation.** Rules on SRT, securitisation and credit risk mitigation change often and differ by jurisdiction. Track them on the change calendar (see [[35 Regulatory Landscape and Change Calendar]]) and build eligibility rules as configurable parameters, delivered under the change controls in [[34 Delivering Change in a Regulated Risk Platform]].

**Portfolio models** need sector, country and group hierarchy for every exposure; gaps in sector codes become gaps in concentration analysis.

**Who owns what.**

| Area | Typical owner |
|---|---|
| Portfolio strategy, hedging and sales decisions | CPM (first line) |
| Concentration limits, challenge of hedging strategy | Credit risk (second line) |
| CDS and CLN trade booking | Markets operations and technology |
| Guarantee and insurance documents, legal opinions | Legal and credit documentation teams |
| Eligibility rules and capital calculation | Regulatory capital team, with your platform implementing them |
| SRT supervisory notification and evidence | Capital management or treasury, with CPM |
| Accounting treatment | Finance |
| Hedge register, data links, investor reporting data | Your platform (or shared with CPM), increasingly |

## Related notes

- [[02 What Credit Risk Is]] for concentration, expected and unexpected loss.
- [[04 Commercial and Corporate Lending]] for syndicated loans and the corporate book.
- [[07 Leveraged and Acquisition Finance]] for underwriting, syndication and final holds.
- [[10 Internal Ratings, Scorecards and PD Models]] for PD and the internal ratings-based approach.
- [[11 Collateral and Security]] for credit risk mitigation principles.
- [[14 Risk Appetite, Limits and Concentration]] for concentration limits and the Herfindahl index.
- [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]] for provisions.
- [[18 Regulatory Capital and Basel - the Short Version]] for RWA and capital management.
- [[19 Counterparty Credit Risk and Derivatives]] for counterparty risk on protection sellers.
- [[22 Credit Risk Data, Systems and BCBS 239]] for identifiers and lineage.
- [[24 Pricing, RAROC and Return on Capital]] for economic capital and hurdle rates.
- [[26 Sovereign, Bank and Country Risk]] for export credit agencies and sovereign guarantors.
- [[32 The Credit Risk Data Model]] for modelling protection and hedge links.
- [[35 Regulatory Landscape and Change Calendar]] for changing SRT and securitisation rules.
- [[basel-credit-risk-explained-simply]] for credit risk mitigation and securitisation ("Way 5").
- [[basel-credit-risk-decision-tree]] for where securitisation sits in the Basel structure.
- [[28 Master Glossary]].
