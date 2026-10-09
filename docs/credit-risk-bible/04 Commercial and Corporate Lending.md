# Commercial and Corporate Lending

**Why this matters to you.** Lending to businesses is where most of a bank's large, individually assessed credit exposures live, and it is where the product zoo is biggest: overdrafts, term loans with three different repayment shapes, revolving facilities, invoice finance, leasing, syndicated loans with their own cast of characters. Each product creates a different kind of exposure, needs different data to assess, and is monitored in a different way. If your platform treats a syndicated revolving credit facility like a personal loan, every number it produces about it will be wrong. This note teaches the products, the structures and the vocabulary so you can read a facility record and understand what you are looking at.

## Table of contents

1. [The lemonade stand needs a bigger fridge](#the-lemonade-stand-needs-a-bigger-fridge)
2. [Who the borrowers are: SME, mid-market, large corporate](#who-the-borrowers-are-sme-mid-market-large-corporate)
3. [The product map](#the-product-map)
4. [Overdrafts](#overdrafts)
5. [Term loans: amortising, bullet, balloon](#term-loans-amortising-bullet-balloon)
6. [Revolving credit facilities](#revolving-credit-facilities)
7. [Working capital finance, asset-based lending, invoice finance](#working-capital-finance-asset-based-lending-invoice-finance)
8. [Equipment finance and leasing](#equipment-finance-and-leasing)
9. [Bilateral, club and syndicated loans](#bilateral-club-and-syndicated-loans)
10. [The dimensions of any facility](#the-dimensions-of-any-facility)
11. [Pricing: base rates, margins and fees](#pricing-base-rates-margins-and-fees)
12. [Covenants by product](#covenants-by-product)
13. [How each product is assessed differently](#how-each-product-is-assessed-differently)
14. [A worked example: structuring a package for one company](#a-worked-example-structuring-a-package-for-one-company)
15. [Common mistakes and misunderstandings](#common-mistakes-and-misunderstandings)
16. [What a platform lead needs to know about this](#what-a-platform-lead-needs-to-know-about-this)
17. [Related notes](#related-notes)

## The lemonade stand needs a bigger fridge

Your lemonade stand is doing well and you want to grow. You have three different money problems, and each needs a different kind of borrowing.

First, some days you sell out before you have been paid by the school fair organiser, who settles up at the end of the month, so you are short of coins to buy lemons tomorrow. You need a little flexible borrowing that goes up and down day by day. That is an **overdraft** or a **working capital** line.

Second, you want a bigger fridge that costs 500 and will last five years. You should borrow 500 now and pay it back over the five years the fridge is useful. That is a **term loan**. Or you could rent the fridge from the shop for a monthly fee and never own it. That is a **lease**.

Third, you want to buy out three rival stands at once for 20,000, which is far more than any one friend will lend you. You need five friends to club together, with one of them organising the paperwork and collecting your repayments on behalf of the group. That is a **syndicated loan**.

Commercial and corporate lending is this picture with real companies, real contracts, and amounts from a few thousand to a few billion.

## Who the borrowers are: SME, mid-market, large corporate

Banks divide business customers by size, because size changes everything about how they are assessed, served and risk-managed. The dividing lines vary by bank and country (the numbers below are illustrative), but the pattern is universal.

| Segment | Typical annual revenue | How many at a large bank | How assessed | Served by | Regulatory treatment |
|---|---|---|---|---|---|
| **Micro and small business** | Under about 2 million | Hundreds of thousands | Scorecards, like retail, with a light human touch for larger requests | Business banking in branches and digital channels | Often treated as retail for capital purposes if the exposure is small |
| **Small and medium-sized enterprise (SME)** | About 2 million to 50 million | Tens of thousands | Rating model plus analyst judgement, standardised proposal | Commercial or business banking relationship managers in regional offices | Corporate SME, with a size discount in the Basel rules |
| **Mid-market** | About 50 million to 500 million | Thousands | Full credit analysis, bespoke structures, often multiple facilities | Commercial banking or corporate banking, dedicated relationship managers | Corporate |
| **Large corporate** | Above about 500 million, often listed, often rated by agencies | Hundreds | Full analysis, syndicated structures, capital markets alternatives | Corporate and investment banking, sector teams | Corporate, with restrictions on the most advanced modelling approaches for the biggest |
| **Multinational and financial institutions** | Billions | Dozens to hundreds | Global relationship, complex group structures, derivatives and trade on top of lending | Global corporate coverage | Corporate or bank class |

Why the split matters for risk:

- **Information.** A small business may only have unaudited accounts a year out of date. A large corporate publishes quarterly, is followed by analysts and rated by agencies. Models and processes must be designed for the data that exists.
- **Diversification.** Thousands of SME loans behave like a statistical portfolio; a hundred large corporate loans do not. One large default is a bad quarter; one SME default is noise.
- **Bargaining power.** A large corporate can go to several banks or to the bond market, so terms are negotiated and covenants looser. An SME takes what its bank offers.
- **Complexity.** Large corporates have group structures with dozens of subsidiaries, several of which may borrow, guarantee each other, or be ring-fenced. Aggregating exposure to the group is hard and is one of the main jobs of a credit platform. [[14 Risk Appetite, Limits and Concentration]] covers the group limit problem.

Basel's definitions, for reference: the standardised rules give a discount to SMEs with group revenue under 50 million euros, and restrict the advanced internal ratings approach for corporates with group revenue above 500 million euros. See [[basel-credit-risk-explained-simply]].

## The product map

![[04-product-taxonomy.svg]]
*The commercial and corporate product family, grouped by purpose: working capital, term debt, asset-backed lending, and multi-lender structures. Most mid-sized companies have several of these at once.*

Four families, organised by what the money is for:

1. **Working capital**: short-term, flexible money for the gap between paying suppliers and being paid by customers. Overdrafts and revolving facilities.
2. **Term debt**: long-term money to buy or build something that will pay for itself over years. Term loans in their various repayment shapes.
3. **Asset-backed**: money tied to and repaid from specific assets. Asset-based lending, invoice finance, equipment finance and leasing.
4. **Multi-lender**: ways of sharing a loan too big for one bank. Club deals and syndicated loans. (These are structures rather than products: a syndicated loan is usually a term loan or revolving facility shared among many banks.)

[[06 Specialised Finance - Project, Object, Commodities, Real Estate]], [[07 Leveraged and Acquisition Finance]] and [[08 Trade Finance and Guarantees]] cover the specialist cousins.

## Overdrafts

An **overdraft** lets a business take its current account below zero up to an agreed limit. It is the simplest and oldest form of business lending.

- **Uncommitted and repayable on demand.** In most jurisdictions the bank can cancel the limit and demand repayment at any time without giving a reason. That makes it legally very safe for the bank, and the Basel rules give unconditionally cancellable commitments a low credit conversion factor as a result. In practice banks rarely pull overdrafts without warning, because the reputational cost is high.
- **Reviewed annually.** The limit has an expiry date, typically twelve months, at which point the bank renews, reduces or withdraws it.
- **Interest charged daily on the overdrawn balance**, usually at a higher margin than a term loan, plus a fee for the limit.
- **Often secured** by a floating charge over the business's assets or a personal guarantee from the owner, especially for smaller businesses.
- **Expected to fluctuate.** A healthy overdraft swings between zero and the limit as cash comes and goes. An overdraft that sits permanently at the limit is a warning sign: it has become **hard-core** borrowing that should really be a term loan, and the business may be living on it.

From a data point of view, an overdraft has a limit, a balance that changes every day, an expiry date and a review date. The exposure the risk team cares about is the limit (what could be drawn), not just today's balance.

## Term loans: amortising, bullet, balloon

A **term loan** is a fixed amount lent for a fixed period (the **tenor**) with an agreed repayment schedule. It is drawn once (or in a few tranches during an **availability period**) and cannot be re-borrowed once repaid. The three repayment shapes:

![[04-repayment-profiles.svg]]
*Three repayment profiles for a 1,000 five-year loan. Amortising repays steadily; balloon repays a little then a lot; bullet repays nothing until the end. The bank's exposure falls fastest under amortising and not at all under bullet.*

**Amortising.** Equal instalments of principal (or equal total payments of principal plus interest, like a repayment mortgage) over the life. The balance falls steadily. Exposure at default shrinks every period, so the later a default happens the less the bank loses. This is the natural shape for lending against an asset that wears out: the loan and the asset decline together.

**Bullet.** Interest only during the life, the whole principal in one payment at maturity. Exposure never falls. The borrower must either have the cash at maturity or **refinance** (take a new loan to repay the old one), so the bank is betting on the borrower's ability to refinance in five years' time, in whatever market conditions exist then. Bullets are common in large corporate and leveraged lending and in bond markets, and are easier for the borrower's cash flow.

**Balloon.** A mix: small instalments during the life (less than full amortisation) and a large final payment. Common in asset finance where the asset will have resale value at the end (a vehicle or aircraft) and the balloon roughly matches that value. The risk is the same as a bullet, scaled down: **refinancing risk** or **residual value risk** at the end.

| Feature | Amortising | Balloon | Bullet |
|---|---|---|---|
| Exposure over time | Falls steadily | Falls slowly, then a cliff | Flat until maturity |
| Borrower cash flow strain | Highest early on | Moderate | Lowest until the end |
| Refinancing risk at maturity | None | Moderate | High |
| Typical use | SME and mid-market term lending, mortgages | Vehicle and equipment finance | Large corporate, leveraged loans, bonds |
| What the assessment focuses on | Can cash flow cover each instalment? | Can cash flow cover instalments, and is the balloon covered by the asset value? | Can the business refinance or accumulate the principal by maturity? |

A term loan's data: amount, drawdown date, maturity, schedule (dates and amounts), interest basis, prepayment terms, purpose, and any **tranches** (a loan split into pieces with different terms, often labelled A, B, C).

## Revolving credit facilities

A **revolving credit facility** (**RCF**, or just a revolver) is a committed limit that the borrower can draw, repay and redraw as often as it likes during the life of the facility, which is typically three to five years. It is like an overdraft but with three big differences:

1. **Committed.** The bank has contractually promised to lend up to the limit whenever asked (subject to the borrower not being in default and certain conditions). The bank cannot cancel on a whim. This is valuable to the borrower and costly to the bank, which must hold capital and liquidity against the undrawn amount.
2. **Drawn in loans, not through a current account.** The borrower sends a utilisation request for, say, 10 million for three months; at the end of the three months it repays or **rolls over** (re-borrows). Each drawing has its own interest period.
3. **Fee for the undrawn part.** Because the commitment costs the bank, the borrower pays a **commitment fee** on whatever is not drawn, typically a fraction (often around a third) of the margin.

RCFs are the workhorse of corporate lending: general corporate purposes, seasonal working capital, a backstop for a company's commercial paper programme, a liquidity cushion that reassures rating agencies. Large corporates often keep a big RCF entirely undrawn for years as insurance.

The risk twist is that a company in trouble draws its RCF to the limit, exactly when the bank would least like to lend. In the 2020 pandemic, companies drew hundreds of billions from RCFs in a few weeks. This is why the exposure at default on a revolver is modelled as drawn plus a share of undrawn (a credit conversion factor), and why the undrawn amount must be in every exposure report, not just the balance. [[02 What Credit Risk Is]] introduces the credit conversion factor.

Variants: a **swingline** (a small sub-limit drawable same-day for emergencies), an **ancillary facility** (a bank's share of the RCF converted into an overdraft or guarantee line at that bank), and a **multi-currency** option.

## Working capital finance, asset-based lending, invoice finance

Working capital is the money tied up in running the business: stock on the shelves, invoices customers have not yet paid, minus what the business owes its own suppliers. A growing business needs ever more of it, and that growth can starve a profitable company of cash. Several products lend against these working capital assets directly.

**Asset-based lending (ABL).** A facility whose limit is recalculated regularly (often weekly or monthly) from a **borrowing base**: a percentage of eligible receivables (invoices owed to the borrower) plus a lower percentage of eligible inventory, sometimes plus plant and property. Illustrative advance rates: 80% to 90% of eligible receivables, 30% to 60% of inventory. The borrower reports its receivables and stock, the bank applies the formula, and the available limit moves up or down. Because the lender tracks the assets closely and has a direct charge over them, ABL can support companies whose profits would not justify a conventional loan. It is monitoring-intensive and relies on the borrower's reporting being honest, so field audits and random checks are part of the control set.

**Invoice discounting.** The business borrows against its unpaid invoices, usually up to 80% to 90% of their value, as it raises them. The business still collects from its customers itself, and the customers may not know the bank is involved (**confidential** invoice discounting). When the customer pays, the advance is repaid and the balance released to the business. The risk is the quality and genuineness of the invoices: disputed, fraudulent or duplicated invoices are the classic losses.

**Factoring.** The business sells its invoices to the bank (the **factor**), which then collects from the customers itself and runs the sales ledger. Customers know and pay the factor directly. Factoring may be **with recourse** (the business bears the loss if a customer does not pay) or **without recourse** (the factor bears it, which makes it partly a credit insurance product and means the factor is really taking credit risk on the business's customers, not the business). Factoring suits smaller businesses that want the collection service; discounting suits larger ones that want to keep control.

**Supply chain finance** (reverse factoring) is the mirror image: a large, well-rated buyer arranges for the bank to pay its suppliers early at a discount based on the buyer's credit, not the supplier's. The bank's credit risk is on the buyer. This product has had its scandals (a large financing firm collapsed in 2021 after it became clear that some "receivables" were for sales that had not happened), and the accounting is debated, so it gets extra scrutiny.

| Product | Who repays the bank | What the bank's risk is really on | Monitoring intensity |
|---|---|---|---|
| ABL | The borrower, from asset realisation | Borrower plus quality of receivables and stock | High: borrowing base reports, field audits |
| Invoice discounting | The borrower's customers, via the borrower | Invoice genuineness, customer concentration, borrower | Medium: ledger reconciliations |
| Factoring without recourse | The borrower's customers directly | The customers (a portfolio of small corporate exposures) | Medium: debtor credit limits |
| Supply chain finance | The large buyer | The buyer | Low on the buyer, high on confirming the trade is real |

## Equipment finance and leasing

When a business needs a machine, a vehicle or a fleet, it can borrow and buy, or it can lease. The main shapes:

**Hire purchase (HP).** The business pays instalments (often with a balloon) and owns the asset at the end after a final option payment. Legally the bank owns the asset until then, which gives strong security: if the customer stops paying, the bank repossesses its own property rather than enforcing a charge. Common for vehicles and plant.

**Finance lease.** The bank buys the asset and leases it to the business for most of its useful life; the business pays rentals that repay the cost plus interest, and typically never owns it (though it may keep using it for a nominal rent or share in the sale proceeds). Economically it is a loan secured on the asset; for accounting it sits on the business's balance sheet as debt.

**Operating lease.** A shorter rental where the bank (lessor) takes **residual value risk**: it expects to get the asset back and sell or re-lease it for a value it has to estimate today. Think of car leasing with a three-year return. The credit risk is on the lessee paying the rentals; the residual value risk is a separate, market-like risk on the asset. Aircraft, rail and vehicle fleets are the big markets.

Equipment finance is assessed on two legs: the lessee's ability to pay and the asset's value and marketability. Assets that are standard, mobile and have a liquid secondhand market (cars, standard trucks, construction equipment) make good collateral; bespoke or immovable assets (a custom production line bolted to the floor) do not. [[11 Collateral and Security]] goes into valuation and haircuts, and [[06 Specialised Finance - Project, Object, Commodities, Real Estate]] covers the big-ticket version (ships, aircraft).

## Bilateral, club and syndicated loans

How many lenders are involved changes the legal structure, the economics and the data.

**Bilateral.** One bank, one borrower, one agreement. The bank controls everything: terms, waivers, enforcement. Most SME and mid-market lending is bilateral. A company may have several bilateral facilities with different banks, each separately documented, which creates the risk that one bank has tighter security or earlier maturity than the others.

**Club deal.** A handful of banks (say two to six) lend together on identical terms under one agreement, each with a known share from the start. No formal syndication process, no underwriting, often no fee for arranging. Common for mid-market companies with several relationship banks that want to share the exposure. One bank usually acts as agent.

**Syndicated loan.** A large loan arranged by one or more banks and sold down to a wider group of lenders, under a single agreement, with a formal process and defined roles. This is the structure for amounts too big for any one bank to hold.

![[04-syndicated-loan-structure.svg]]
*A syndicated loan. The mandated lead arranger structures and distributes the deal; the facility agent runs it day to day; the security agent holds collateral for all lenders; participants each hold a share. The borrower deals with one agent, not a dozen banks.*

The cast:

| Role | What they do | How they are paid | Credit risk position |
|---|---|---|---|
| **Borrower** | Appoints the arranger with a **mandate letter**; signs one facility agreement | Pays all fees and interest | Not applicable |
| **Mandated lead arranger (MLA)** (also bookrunner, coordinator) | Wins the mandate, structures the deal, prepares the **information memorandum**, invites other lenders, allocates shares. May **underwrite** (commit to the full amount and take the risk of selling it down) or act on a **best efforts** basis | Arrangement or underwriting fee (the largest fee, often shared with the top tier of lenders), plus its own share of margin | Holds a share; during underwriting may briefly hold the whole amount (**underwriting risk**) |
| **Facility agent** | After signing, administers the loan: receives drawdown requests, calculates interest, collects and distributes payments, passes information, runs votes on waivers and amendments | An annual agency fee | Usually also a lender, but the agent role itself carries operational rather than credit risk |
| **Security agent / security trustee** | Holds the security on trust for all lenders so it does not have to be re-registered every time a lender sells its share | Small fee | None directly |
| **Participants (syndicate members)** | Each commits a share, funds its share of every drawdown, receives its share of interest | Participation fee (smaller than the arranger's) plus margin on their share | Full credit risk on their share of the borrower |

Key mechanics:

- **Pro rata sharing.** Every drawdown, payment and recovery is shared among lenders in proportion to their commitments. A lender cannot get repaid ahead of the others.
- **Majority lender voting.** Waivers and amendments are decided by lenders holding a set share of commitments, often two thirds, so no single lender can block a sensible restructuring. A few "sacred" terms (margin, maturity, amount) need unanimous consent.
- **Transferability.** Lenders can sell their share in the **secondary market** to other banks or funds, subject to the agreement's rules. Large syndicated loans trade like bonds, and the lender list can change completely over the life of the loan.
- **Standard documents.** In Europe the Loan Market Association (**LMA**) and in the United States the Loan Syndications and Trading Association (**LSTA**) publish standard forms that most syndicated agreements are based on. This standardisation is what makes syndicated loans tradeable.

Why it matters for the platform: a bank's exposure on a syndicated loan is its **share**, not the facility total, but the facility record must hold both, plus the agent, the other lenders (for correlation and for knowing who you will be negotiating with in a restructuring), and whether the bank's role is arranger, agent or participant. During underwriting, the exposure can briefly be the whole amount, and that must be captured. Agent roles create operational obligations and data flows (the agent's notices are the source of truth for balances) that a plain bilateral loan does not have.

## The dimensions of any facility

Every facility, whatever the product, can be described along the same handful of dimensions. Learn these and you can read any facility record.

| Dimension | Options | What it means for risk |
|---|---|---|
| **Committed or uncommitted** | Committed: the bank must lend when asked. Uncommitted: the bank can refuse or cancel | Committed facilities carry exposure on the undrawn amount; uncommitted carry much less |
| **Secured or unsecured** | Secured: the bank has a charge over specific assets or all assets. Unsecured: only the borrower's promise | Secured lowers loss given default, not probability of default |
| **Seniority** | **Senior** (paid first), **subordinated** or **junior** (paid after senior), **mezzanine** (between debt and equity, often with an equity kicker), **equity** (paid last) | Each step down the stack means higher loss given default and higher price |
| **Fixed or floating rate** | Fixed: the rate is set for the life. Floating: base rate plus margin, resetting each interest period | Floating passes interest rate risk to the borrower; a sharp rise in base rates can turn a floating-rate borrower into a credit problem |
| **Tenor** | Months to decades | Longer means more time for things to go wrong and higher capital |
| **Repayment profile** | Amortising, balloon, bullet, revolving | Shapes exposure over time and refinancing risk |
| **Currency** | Borrower's home currency or another | A loan in a currency the borrower does not earn adds foreign exchange risk on top of credit risk |
| **Purpose** | Working capital, capital expenditure, acquisition, refinancing, general corporate purposes | Determines the right product and the covenants |
| **Lender structure** | Bilateral, club, syndicated | Determines control, data flows and share |
| **Ranking among lenders** | Pari passu (equal), structurally senior (lent to the operating company rather than the holding company), intercreditor agreements | Determines where this bank stands against the borrower's other lenders in an insolvency |

Seniority deserves one more word, because the capital stack picture is used everywhere. Think of the borrower's assets in a failure as a bucket of water poured down a staircase: senior secured lenders at the top get their fill first, then senior unsecured, then subordinated, then mezzanine, then shareholders get whatever trickles to the bottom (usually nothing). The lower you lend in the stack, the less you get back and the more you must charge. [[07 Leveraged and Acquisition Finance]] shows a full stack, and [[16 Problem Loans, Restructuring and Recovery]] shows the waterfall in action.

## Pricing: base rates, margins and fees

A floating-rate loan's interest is **base rate plus margin**.

**Base rate** (also reference rate or benchmark) is a published market rate that resets each interest period. Since the retirement of the old interbank offered rates (LIBOR and its cousins) in 2021 to 2023, the benchmarks are mostly **risk-free rates** based on actual overnight transactions: SONIA in sterling, SOFR in US dollars, €STR in euro (with EURIBOR still widely used), and others. These are typically compounded over the interest period, which makes the interest calculation more complex than the old "fix at the start" method. Some lending, especially to smaller businesses, uses the central bank's policy rate or the bank's own published base rate instead.

**Margin** (or spread) is the fixed addition that pays for credit risk, capital, cost and profit. It is quoted in **basis points** (one hundredth of a percent): "SOFR plus 225" means the base rate plus 2.25%. Margins might be 100 to 200 basis points for a strong investment-grade corporate on a revolver, 250 to 450 for a typical mid-market term loan, and 400 to 700 or more for leveraged deals (illustrative only; markets move). A **margin ratchet** moves the margin up or down as the borrower's leverage or rating changes, so pricing tracks risk automatically.

**Fees** are the other half of the economics:

| Fee | Charged on | When | Typical level (illustrative) | Purpose |
|---|---|---|---|---|
| **Arrangement fee** (upfront, front-end) | The facility amount | At signing | 0.25% to 2% or more; highest for syndicated and leveraged deals | Pays for structuring and underwriting work; compensates for capital committed from day one |
| **Commitment fee** | The undrawn amount of a committed facility | Periodically during the life | Often 30% to 40% of the margin | Compensates for holding capital and liquidity against the promise to lend |
| **Utilisation fee** | The drawn amount, when drawings exceed a threshold (say a third or two thirds of the facility) | Periodically | 10 to 50 basis points | Nudges the borrower not to treat a standby revolver as permanent debt |
| **Agency fee** | Flat annual amount | Annually | Tens of thousands | Pays the facility agent for administration |
| **Prepayment fee** | The amount repaid early | On prepayment | 0% to 2%, often declining over time | Compensates the bank for lost income, especially on fixed-rate loans |
| **Waiver or amendment fee** | The facility | When the borrower asks for a change | Varies | Pays for the work and the risk of agreeing a change |

For an unsecured 10 million RCF with a 150 basis point margin, a 35% commitment fee and an average drawing of 4 million, the bank earns roughly 4 million x 1.5% = 60,000 of margin plus 6 million x 0.525% = 31,500 of commitment fee a year, plus the arrangement fee. Whether that is enough depends on the capital the facility consumes, which is the subject of [[24 Pricing, RAROC and Return on Capital]].

## Covenants by product

A **covenant** is a promise in the loan agreement. **Financial covenants** are promises to keep certain ratios within limits, tested periodically. They give the bank an early warning and a legal trigger to renegotiate before things get worse. [[12 Loan Documentation, Covenants and Conditions]] explains them in depth; here is how they vary by product.

| Product | Typical financial covenants | Other typical covenants and conditions |
|---|---|---|
| Overdraft | Often none formally; the bank relies on its right to demand repayment and on monitoring the account | Annual accounts to be provided; personal guarantee; floating charge |
| SME term loan | Debt service cover (cash available for debt service divided by debt service due, say minimum 1.25x); sometimes leverage | Security over the funded asset; no further borrowing without consent; insurance |
| Mid-market RCF or term loan | Leverage (net debt to EBITDA, say maximum 3.0x); interest cover (EBITDA to interest, say minimum 4.0x); sometimes a minimum net worth or capital expenditure cap | Information undertakings (quarterly accounts, compliance certificate); negative pledge (no security to others); restrictions on disposals, acquisitions, dividends; change of control clause |
| Large corporate investment-grade RCF | Often only one or two loose covenants, or none (**covenant-lite**), because the borrower has bargaining power and the bank relies on the rating and the market | Negative pledge; pari passu; cross-default (default on any other debt is a default here); material adverse change |
| Leveraged loan | Historically a full set (leverage, interest cover, cash flow cover, capex), now often a single **springing** leverage covenant tested only when the revolver is heavily drawn | Extensive restrictions on debt, dividends, disposals; see [[07 Leveraged and Acquisition Finance]] |
| Asset-based lending | Borrowing base compliance (drawings never exceed the formula); sometimes a minimum fixed charge cover | Weekly or monthly borrowing base certificates; field audits; dominion over cash (customer payments go to a bank-controlled account) |
| Invoice finance | Concentration limits (no single debtor above a share of the ledger); dilution limits (credit notes and disputes) | Ledger reconciliations; verification of invoices with debtors |
| Equipment finance and leasing | Usually none financial; the asset is the protection | Maintenance, insurance and inspection obligations; restrictions on moving the asset |
| Syndicated term loan | Same as mid-market or leveraged depending on the borrower, but tested against the whole group and reported to the agent for distribution to all lenders | Majority lender waiver mechanics |

Covenant **headroom** is the gap between the actual ratio and the covenant limit. A borrower with leverage of 2.8x against a 3.0x covenant has thin headroom and is one bad quarter from breach. Headroom is tracked as an early warning indicator in [[15 Monitoring, Early Warning and Watchlist]].

## How each product is assessed differently

The credit analysis toolkit in [[09 Credit Analysis - Reading a Borrower]] applies to every business borrower, but the emphasis shifts by product.

| Product | The central question | What the analyst leans on | The classic failure |
|---|---|---|---|
| Overdraft | Is the account behaving like a healthy, fluctuating business account? | Account turnover, swing between credit and debit, returned payments, time at limit | Hard-core overdraft funding losses rather than timing gaps |
| Amortising term loan | Will cash flow cover every instalment, including in a bad year? | Debt service cover from forecasts, sensitivity to lower sales, asset value for the downside | Loan tenor longer than the asset's useful life |
| Bullet or balloon loan | Can the borrower refinance or repay a lump sum in year five? | Leverage trajectory, access to other lenders or markets, asset residual value | Assuming refinancing will be available in any market |
| Revolving facility | What is the worst-case drawing, and can the business still service it? | Peak working capital need, seasonal pattern, liquidity position; model exposure at the limit | Treating undrawn as no exposure; revolver drawn to fund losses |
| Asset-based lending | Are the receivables and stock real, collectable and saleable? | Debtor ageing, concentration, dilution history, stock turnover and obsolescence, field audit results | Fraudulent or disputed invoices; stock that cannot be sold |
| Invoice finance | Are the invoices genuine and are the debtors good? | Debtor credit quality, verification sampling, concentration | Fresh-air invoicing, duplicate financing of the same invoice at two lenders |
| Equipment finance | Will the lessee pay, and what is the asset worth if not? | Lessee cash flow plus asset valuation, secondhand market depth, depreciation curve | Residual value overestimated; bespoke asset with no resale market |
| Syndicated loan (as participant) | Do we trust the arranger's analysis, and does the exposure fit our appetite? | Information memorandum, own analysis of the group, sector limits, the other lenders | Relying on the arranger and the rating without independent work; concentration in a "hot" sector |
| Syndicated loan (as underwriter) | Can we sell this down at the agreed terms before market conditions change? | Market appetite, flex terms (the right to change pricing to sell the deal), hold-level limits | Being stuck with a large unsold position when markets close ("hung" deals) |

The common thread: product determines exposure shape (how much, when, and whether it can grow), which determines what the analysis must stress, which determines what data the platform must hold.

## A worked example: structuring a package for one company

A regional distribution company with 80 million revenue, 7 million EBITDA, and 3 million of existing debt asks its bank for help with three needs: a seasonal working capital peak of 6 million each autumn, a 9 million new warehouse, and 2 million of delivery vans.

**The structure the bank proposes.**

1. A **6 million committed RCF**, three years, SOFR plus 225 basis points, commitment fee 35% of margin, secured by a floating charge over the business and ranking pari passu with the term loan. Expected average drawing 2.5 million, peaking at 6 million in autumn.
2. A **9 million amortising term loan**, ten years with a seven-year amortisation and a 2.7 million balloon at year seven (about 30%, matching a conservative view of warehouse value), SOFR plus 275 basis points, 1% arrangement fee, secured by a first legal charge over the warehouse (valued at 12 million on completion, so loan-to-value 75%).
3. **2 million of hire purchase** over five years with a 20% balloon, fixed rate 7.5%, secured by title to the vans.

**The assessment.** Pro forma total debt is 3 + 6 + 9 + 2 = 20 million at peak, against EBITDA of 7 million: leverage 2.9x at peak, 2.4x on average drawing. Interest cost at peak around 1.3 million: interest cover above 5x. Debt service (interest plus term loan amortisation of about 0.9 million a year plus HP instalments of about 0.35 million) is about 2.5 million against cash available for debt service of about 5 million after tax and maintenance capital expenditure: debt service cover 2.0x. Covenants set at maximum leverage 3.5x and minimum interest cover 3.0x, tested quarterly on a rolling twelve-month basis, giving headroom of roughly 20% on leverage.

**Exposure the platform must record.** Three facilities, one group, one security package shared between two of them with an intercreditor arrangement, a floating-rate base with compounding, a fixed-rate HP, a committed undrawn amount (3.5 million on average) attracting a credit conversion factor, two different collateral types with different haircuts, a balloon in year seven that will need a refinancing conversation in year six, and three different repayment schedules. The sum of the limits is 17 million; the exposure at default for capital purposes is lower (drawn plus converted undrawn); the drawn balance on any given day is lower still. Anyone asking "what is our exposure to this company?" needs to say which of those they mean.

**Pricing check.** Annual income: RCF margin on 2.5 million average plus commitment fee on 3.5 million, roughly 56,000 + 28,000; term loan margin on an average 7 million balance, roughly 190,000; HP interest about 120,000 net of funding; plus the 90,000 arrangement fee spread over the life. About 400,000 a year against expected loss (PD 1.2% at the bank's grade, blended LGD 30%, exposure about 14 million: roughly 50,000) and capital of perhaps 1.1 million. Return on capital comfortably above the hurdle. Approved by a senior credit officer within the ladder described in [[03 The Credit Lifecycle]].

## Common mistakes and misunderstandings

- **"Exposure is the balance."** For committed facilities, undrawn amounts are exposure too. For revolvers, the balance today tells you little about the balance on the day of default.
- **"An overdraft is the same as a revolver."** One is uncommitted and on demand; the other is a binding promise. The capital, the pricing and the legal position are different.
- **"Secured means safe."** Security reduces loss given default, not the chance of default. Banks that lend on collateral value without checking cash flow make losses when the collateral turns out to be hard to sell.
- **"A bullet is just a term loan with a different schedule."** It is a bet on refinancing in a market you cannot see. Treat the maturity date as a credit event to plan for.
- **"The syndicated loan's exposure is the facility amount."** The bank's exposure is its share, except during underwriting when it may briefly be the whole thing. Both must be captured.
- **"The arranger has done the work, so we can rely on it."** Participants are expected to do their own analysis. Regulators have fined banks for not doing so.
- **"Margin is the price."** Fees, especially commitment and arrangement fees, are a big part of the economics, and the price is only right if it covers expected loss and the cost of capital.
- **"Covenants protect the bank from loss."** Covenants give early warning and a seat at the table. By the time a covenant is breached, the loss may already be baked in. They are a trigger, not a shield.
- **"Factoring without recourse is a loan to the client."** It is credit risk on the client's customers. The risk sits on different names from the ones in the client record.
- **"Group exposure is the sum of the borrowing entities."** Guarantees, cross-default and intercreditor arrangements mean exposure to a group is a structural question, not an arithmetic one. See [[14 Risk Appetite, Limits and Concentration]].

## What a platform lead needs to know about this

**The facility data model.** Commercial lending needs a hierarchy: customer group, then legal entity (borrower), then facility (the agreement: RCF, term loan), then drawing or loan (each utilisation under a facility), then schedule and interest period. Collateral attaches to facilities, sometimes shared across several. Guarantees link entities. Syndicated facilities add agent, lender list and share. A flat "loan account" table from the core banking system cannot represent this, and a lot of risk reporting error comes from forcing it to.

**Product-specific fields you must hold.** Committed flag; limit and undrawn amount; cancellability; repayment profile and schedule; balloon amount and date; base rate type and compounding convention; margin and ratchet grid; fee schedule; seniority and ranking; security links and intercreditor status; syndication role and share; covenant definitions, thresholds, test dates and results; borrowing base formula and latest certificate for ABL; residual value for leases. Each of these drives a risk calculation somewhere.

**Systems.** Core banking systems were mostly built for simple loans and overdrafts; RCFs with multi-currency drawings, syndicated agency, ABL borrowing bases and leasing often live in separate specialist systems (loan IQ-style syndication platforms, ABL platforms, lease management systems), which your platform must integrate. The agent bank's notices are the source of truth for syndicated balances, and getting them into systems is often still manual.

**Controls.** Limit checks at every drawing against the facility limit and against group limits; undrawn commitment tracked for capital; covenant test diaries with escalation; borrowing base recalculation before any ABL drawing; interest calculation checks, especially for compounded risk-free rates; reconciliation of the bank's share to the agent's records; benchmark fallback provisions recorded for legacy contracts.

**Who owns what.** Relationship managers and product specialists (ABL, leasing, syndication desks) own the deal and the customer. Credit risk owns the rating, the approval and the limits. Loan operations and the agency team own the facility records and the payments. Legal owns the documents from which the facility terms are extracted. Finance owns the ledger. Your platform typically owns the consolidated exposure view that pulls all of this together for risk and regulatory purposes, which is why it will be asked "what is our exposure to this group?" and must be able to answer in every sense of the word.

## Related notes

- [[00 Start Here]]
- [[01 What a Bank Is and How It Makes Money]]
- [[02 What Credit Risk Is]]
- [[03 The Credit Lifecycle]]
- [[05 Retail Lending]]
- [[06 Specialised Finance - Project, Object, Commodities, Real Estate]]
- [[07 Leveraged and Acquisition Finance]]
- [[08 Trade Finance and Guarantees]]
- [[09 Credit Analysis - Reading a Borrower]]
- [[11 Collateral and Security]]
- [[12 Loan Documentation, Covenants and Conditions]]
- [[14 Risk Appetite, Limits and Concentration]]
- [[15 Monitoring, Early Warning and Watchlist]]
- [[16 Problem Loans, Restructuring and Recovery]]
- [[24 Pricing, RAROC and Return on Capital]]
- [[28 Master Glossary]]
- [[basel-credit-risk-explained-simply]]
- [[basel-credit-risk-decision-tree]]
