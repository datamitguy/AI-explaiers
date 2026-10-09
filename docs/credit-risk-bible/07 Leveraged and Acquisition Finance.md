# Leveraged and Acquisition Finance

**Why this matters to you.** Leveraged finance is the part of the bank that lends to companies that already owe a lot of money, usually because a private equity fund has just bought them with borrowed money. The loans are big, the margins are fat, the borrowers are fragile by design, and the losses when things go wrong are large and public. Regulators watch this business more closely than almost any other kind of lending, and they ask for data that most core banking systems do not hold: leverage multiples at origination, adjusted earnings, how much of a deal the bank underwrote versus how much it kept. As a platform lead you will meet this team early, because they generate a disproportionate share of regulatory questions, concentration limit breaches and urgent management information requests.

## Table of contents

1. [What leverage means](#what-leverage-means)
2. [Private equity and the leveraged buyout](#private-equity-and-the-leveraged-buyout)
3. [EBITDA and its add-backs](#ebitda-and-its-add-backs)
4. [Leverage multiples](#leverage-multiples)
5. [The capital stack](#the-capital-stack)
6. [Term loan A versus term loan B](#term-loan-a-versus-term-loan-b)
7. [Covenants and covenant-lite](#covenants-and-covenant-lite)
8. [Underwriting versus holding, and syndication risk](#underwriting-versus-holding-and-syndication-risk)
9. [Collateralised loan obligations](#collateralised-loan-obligations)
10. [Regulatory guidance on leveraged lending](#regulatory-guidance-on-leveraged-lending)
11. [Acquisition finance for corporates and bridge loans](#acquisition-finance-for-corporates-and-bridge-loans)
12. [Why these loans are watched so closely](#why-these-loans-are-watched-so-closely)
13. [A worked example from start to finish](#a-worked-example-from-start-to-finish)
14. [Common mistakes and misunderstandings](#common-mistakes-and-misunderstandings)
15. [What a platform lead needs to know about this](#what-a-platform-lead-needs-to-know-about-this)
16. [Related notes](#related-notes)

## What leverage means

Imagine you want to buy a bike that costs 100 coins, rent it out to other kids, and sell it in three years. You have 20 coins. You borrow 80 from a friend at 5 coins a year interest.

The bike earns 15 coins a year in rent. You pay 5 to your friend and keep 10. After three years you have kept 30, you sell the bike for 100, repay the 80, and walk away with 20 (your original stake) plus 30 (kept rent) plus 20 (what is left of the sale after repaying the loan), which is 70 coins from a 20 coin stake. You more than tripled your money.

Now imagine you had bought the bike with your own 100 coins and no borrowing. You would have earned 45 in rent and sold for 100: 145 from 100, a gain of 45%. Decent, but nothing like tripling.

That is **leverage**. Borrowing to buy something magnifies the return on your own money. It also magnifies the loss. If the bike can only be sold for 70, the all-cash buyer loses 30 of 100. The leveraged buyer gets 70, repays 80, and has to find 10 more; their entire 20 coin stake is gone and then some. Leverage turns a 30% fall in asset value into a total wipe-out of the equity.

In banking, "leverage" means how much debt a company carries relative to its earnings or its own capital. A **leveraged loan** is a loan to a company that carries a lot of it. There is no single legal definition, but the common markers are: total debt above about four times annual earnings (measured as EBITDA, explained below), a rating in the sub-investment-grade range (BB+ or lower, see [[10 Internal Ratings, Scorecards and PD Models]]), the borrower being owned by a private equity fund, or the loan margin being well above what an ordinary company pays. Regulators tend to say that if any of these is true, you should treat it as leveraged.

A leveraged borrower is fragile because almost all of its cash flow is spoken for. An ordinary company that has a bad year cuts its dividend. A leveraged company that has a bad year misses an interest payment.

## Private equity and the leveraged buyout

A **private equity** (PE) fund is a pool of money raised from pension funds, insurers, sovereign wealth funds and wealthy individuals, run by a management firm (the **sponsor**, confusingly the same word used in [[06 Specialised Finance - Project, Object, Commodities, Real Estate]] for a different role). The fund buys whole companies, tries to make them more valuable over three to seven years, and sells them. Its returns come from three things: growing the company's earnings, selling at a higher multiple of earnings than it paid, and leverage.

A **leveraged buyout** (LBO) is how the fund buys a company. It sets up a new holding company, puts in equity (typically 40% to 60% of the price in recent years, less in boom years), borrows the rest from banks and investors, and uses the total to pay the seller. The borrowed money is then owed by the company that was just bought (technically by the new holding company, secured on the operating company's assets and cash flows). In other words, the company borrows the money that is used to buy itself.

The parties:

| Party | Role | What they want |
|---|---|---|
| Sponsor (private equity firm) | Buys the company, controls the board, decides the financing | Maximum debt at the lowest cost with the fewest restrictions |
| Target or portfolio company | The business being bought; becomes the borrower | To keep operating; management often gets a slice of the equity |
| Mandated lead arrangers (MLAs) | Banks that structure, underwrite and distribute the loan | Fees, a manageable final hold, a happy sponsor for the next deal |
| Lenders of record after syndication | Banks, collateralised loan obligations, credit funds, insurers | Yield, security, protection in the documents |
| High-yield bond investors | Buy the bonds that sit alongside or below the loans | Yield; less interested in control |
| Rating agencies | Rate the company and each layer of debt | Fees; their rating drives who can buy |
| Lawyers, accountants, consultants | Due diligence reports (financial, legal, commercial, tax) | Fees |

The whole thing is a repeat game. A sponsor does dozens of deals and brings its banks along. A bank that is difficult on one deal may not be invited to the next. That dynamic explains a lot of the behaviour in this market, including the slow weakening of lender protections over the last 20 years.

## EBITDA and its add-backs

Everything in leveraged finance is measured against **EBITDA**: earnings before interest, tax, depreciation and amortisation. Take the company's profit, then add back the interest it paid (because we want to see what is available to pay interest), the tax (because tax depends on how the deal is structured), and depreciation and amortisation (because these are accounting charges for wearing out machines and intangible assets, not cash leaving the building). What is left is a rough measure of the cash the business generates from operating, before paying its lenders, the taxman, or investing in itself. [[09 Credit Analysis - Reading a Borrower]] goes through this from scratch.

Lemonade stand version: you took 100 coins in sales, spent 60 on lemons, sugar and cups, so your EBITDA is 40. The fact that your stand (which cost 20) is slowly wearing out, and that you owe your uncle 5 in interest, is dealt with separately.

The catch is that in leveraged finance, nobody uses plain EBITDA. They use **adjusted EBITDA**, which is EBITDA plus a list of **add-backs**: items the sponsor argues are one-off or will go away, so that "normal" earnings are higher than the accounts show. Typical add-backs:

- Costs of the deal itself (lawyers, advisers).
- Restructuring costs (redundancies that will "save money next year").
- **Synergies** or **cost savings** that have been *planned* but not yet achieved ("we will close two warehouses and save 5 million a year").
- Pro forma earnings of businesses just acquired, as if they had been owned all year.
- Losses from discontinued operations.
- Management fees paid to the sponsor.
- "Non-recurring" items that have a habit of recurring.

Why does this matter so much? Because every number in the deal is a multiple of EBITDA. If the sponsor can add 20% to EBITDA through add-backs, it can borrow 20% more at the same stated leverage multiple. Studies of deals after the fact have repeatedly found that a large share of projected add-backs never materialise. Regulators, in their guidance, say that banks should use their own view of EBITDA for risk purposes, justify every add-back, and record the difference between the marketing number and the bank's number.

A bank's credit paper for a leveraged deal will typically show three EBITDA figures: reported (from the accounts), sponsor-adjusted (from the marketing materials), and bank-adjusted (the bank's own view, usually somewhere in between), and will calculate leverage on all three.

## Leverage multiples

The headline ratio is **total debt divided by EBITDA**, usually written as a multiple such as "5.5x". A company with 550 of debt and 100 of EBITDA is levered 5.5x: it would take five and a half years of all its operating cash, with no tax, no investment and no interest, to repay its debt.

Variants you will see:

| Ratio | Formula | What it tells you |
|---|---|---|
| Senior leverage | Senior secured debt / EBITDA | How much debt ranks ahead of or alongside the bank |
| Total leverage | All debt / EBITDA | The full burden |
| Net leverage | (Debt minus cash) / EBITDA | Slightly flattering; cash on the balance sheet could repay debt |
| Opening leverage | Leverage on day one of the deal | What the bank signed up to |
| Interest cover | EBITDA / cash interest | Can it pay the interest; worry below about 2.0x |
| Fixed charge cover | (EBITDA minus capex minus tax) / (interest plus scheduled repayments) | Can it pay everything it must pay; worry below about 1.1x |
| Cash conversion | (EBITDA minus capex minus working capital change) / EBITDA | How much of EBITDA actually turns into cash |

What is "too much" varies by era and sector. In the 2000s before the financial crisis, deals above 6x total leverage were common; after 2008 they fell to 4x to 5x; by the late 2010s and early 2020s they were back above 6x, with 7x not unusual for software companies with recurring revenue. Regulators (see below) have used "6x" as a line that should be exceptional, but it is a line in guidance, not law, and it varies by jurisdiction.

The deeper point is that leverage multiples are only meaningful alongside the quality of the EBITDA. A 6x loan to a company with 95% subscription revenue and 40% margins is a different animal from a 6x loan to a cyclical manufacturer.

## The capital stack

A leveraged buyout is financed with several layers of debt and equity, ranked by who gets paid first if the company fails. This ranking is the **capital stack** (or capital structure). Think of it as a queue at the school canteen: the people at the front definitely get lunch, the people at the back only eat if there is food left.

![[07-lbo-capital-stack.svg]]
*An illustrative buyout capital stack. The layers at the top are paid first in a liquidation and earn the least; equity is at the bottom and absorbs the first loss.*

From safest to riskiest:

**Super senior revolving credit facility (RCF).** A working capital line the company can draw and repay. Often ranks ahead of everything else in the security waterfall, because it is needed to keep the business alive day to day. Usually provided by the relationship banks and rarely sold on.

**Senior secured term loans (first lien).** The bulk of the debt. Secured on substantially all the company's assets (shares in subsidiaries, bank accounts, intellectual property, receivables), hence "first lien". Split into term loan A and term loan B, explained in the next section.

**Second lien.** Secured on the same assets, but by agreement (an **intercreditor agreement**, see [[12 Loan Documentation, Covenants and Conditions]]) paid only after the first lien lenders have been paid in full. Higher margin for the extra risk.

**Mezzanine.** Debt that is unsecured or only loosely secured, ranking below all the senior debt but above equity. Usually provided by specialist funds. Expensive: a cash coupon plus a **PIK** coupon plus sometimes equity **warrants** (the right to buy shares cheaply later). PIK stands for **payment in kind**: the interest is not paid in cash but added to the loan balance, so the debt grows every year. PIK is attractive to the company (no cash out) and dangerous for everyone (the pile gets bigger), which is why senior lenders restrict it.

**High-yield bonds.** Instead of (or alongside) term loan B and mezzanine, the company may issue bonds to public investors. Called "high yield" or, less politely, "junk" because they are rated below investment grade. Senior secured notes rank with the term loans; senior unsecured notes rank below them. Bonds are harder to amend than loans (hundreds of anonymous holders) and have "incurrence" rather than "maintenance" covenants (explained below).

**Unitranche.** A single loan that replaces the separate senior and second lien or mezzanine layers, provided by one or a few **private credit** or **direct lending** funds. The borrower sees one tranche at one blended margin; behind the scenes the lenders may split the risk between themselves in an "agreement among lenders". Unitranche grew enormously in the 2010s and 2020s as credit funds took market share from banks, especially for mid-sized deals.

**Preferred equity and shareholder loans.** Instruments the sponsor itself holds that rank above ordinary shares but below all third-party debt. Often structured as loans for tax reasons; senior lenders subordinate them so deeply that they behave like equity.

**Ordinary equity.** The sponsor's and management's shares. Paid last; takes the first loss.

Illustrative pricing (margins over a floating base rate; these move with the market):

| Layer | Typical margin or return | Typical share of purchase price |
|---|---|---|
| RCF | 3% to 4% | 5% |
| Term loan A | 3% to 4% | 5% to 15% |
| Term loan B | 3.5% to 5% | 25% to 40% |
| Second lien | 7% to 9% | 0% to 10% |
| Mezzanine or PIK | 10% to 14% total | 0% to 10% |
| Equity | 20% to 25% target annual return | 35% to 55% |

The price a bank earns on each layer is its compensation for its place in the queue. [[16 Problem Loans, Restructuring and Recovery]] shows what the queue looks like when the food runs out.

## Term loan A versus term loan B

Both are senior secured term loans with the same security and the same ranking. The difference is who buys them and how they repay.

**Term loan A (TLA)** is for banks. It **amortises**: repaid in instalments over 5 to 6 years, often with a modest final balloon. Banks like amortisation because the loan shrinks and the risk falls. It is usually priced slightly lower than TLB. Banks that provide the TLA also usually provide the RCF.

**Term loan B (TLB)** is for institutional investors: collateralised loan obligations (CLOs, below), loan funds, insurers. It is a **bullet** or nearly so: 1% a year token amortisation and the whole amount repaid at maturity, 7 years out. Institutional investors prefer this because they want a steady stream of interest for as long as possible. TLBs are priced a little higher, are often issued at a small discount to face value (the **original issue discount**, OID), and are usually covenant-lite. They trade in a secondary market with daily prices, which means the bank can see what the market thinks of the loan every day, and must mark its underwriting positions to those prices.

In Europe, the equivalents were historically called tranches A, B and C with different maturities; the market has largely converged on the US-style TLA and TLB vocabulary.

## Covenants and covenant-lite

A **covenant** is a promise in the loan agreement. [[12 Loan Documentation, Covenants and Conditions]] has the full story; here is what matters for leveraged loans.

**Maintenance covenants** are tested every quarter: "leverage shall not exceed 5.0x", "interest cover shall not fall below 2.5x". If breached, the loan is in default and the lenders get a seat at the table early, usually while the company is still solvent. They can waive the breach in return for a fee, a higher margin, more equity from the sponsor, or tighter terms.

**Incurrence covenants** are tested only when the company does something: borrows more, pays a dividend, sells a business. "The company may not incur additional debt unless pro forma leverage would be below 5.0x." If the company just quietly deteriorates without doing anything, nothing is triggered.

**Covenant-lite** (cov-lite) means a term loan with only incurrence covenants, no maintenance covenants, imported from the high-yield bond market. By the late 2010s, the great majority of new TLBs in the United States and Europe were cov-lite. Usually only the RCF keeps a maintenance covenant, often a single "springing" leverage test that applies only when the RCF is more than, say, 35% drawn.

Why would lenders accept this? Because there were more investors wanting loans than loans to buy, and the sponsors used that to push terms. The consequence is that lenders find out about trouble later, companies arrive in restructuring with less value left, and recoveries on defaulted leveraged loans have been lower in the 2020s than in earlier cycles. Alongside cov-lite, loan documents have grown "flexible" in other ways: generous EBITDA definitions, permitted baskets for extra debt, and the ability to move assets to subsidiaries outside the lenders' security net (some famous cases involved companies moving their best brands out of reach of their lenders, then borrowing against them again). A credit analyst now spends as long reading the document's definitions as reading the numbers.

## Underwriting versus holding, and syndication risk

A bank in a leveraged deal is often doing two different jobs, and confusing them is the source of most of the big losses in this business.

**Holding** means lending money and keeping the loan on the balance sheet until it is repaid. The risk is credit risk: will the borrower pay?

**Underwriting** means promising the sponsor that the full amount will be available on closing day, regardless of whether other lenders turn up, and then selling most of it to other investors afterwards. The bank earns an arrangement fee (often 1.5% to 3% of the amount) for taking this risk. The risk is **syndication risk** (or distribution risk): what if the market moves, nobody wants the loan at the agreed terms, and the bank is stuck holding far more than it intended at a price below what it paid?

![[07-underwrite-syndicate.svg]]
*The underwrite-and-syndicate flow. The bank commits the whole loan, funds it at closing, then sells it down. Market flex is the safety valve; a hung deal is what happens when the valve is not enough.*

The protections a bank builds in:

- **Market flex.** The commitment letter allows the arrangers to change the terms (raise the margin by up to, say, 1 percentage point, increase the discount, add a covenant, shift amounts between tranches) if that is what it takes to sell the loan. The cost of flex comes out of the arrangement fee first, then out of the bank's pocket.
- **Final hold target.** The credit committee approves the deal on the basis that the bank will keep, say, 25 million of a 250 million underwriting. It approves the underwriting amount separately, with a time limit.
- **Material adverse change clauses** that let the bank walk away if the company or the market deteriorates, though sponsors negotiate these down to almost nothing and banks rarely invoke them for reputational reasons.
- **Underwriting limits**: a separate limit on the total amount of unsold underwritten exposure across all deals, set by the risk appetite framework (see [[14 Risk Appetite, Limits and Concentration]]), because if the market closes it closes for every deal at once.
- **Mark-to-market**: unsold underwritings are valued at the price the market would pay, and the loss (if any) goes through the profit and loss account immediately, which concentrates minds.

A **hung deal** is one that could not be sold. In 2007 and 2008, and again in 2022, banks were left holding tens of billions of underwritten loans that the market no longer wanted, and sold them months later at discounts of 10% to 30%. The loss is not a default; the borrower is still paying. It is a market loss on a credit product, and it hits capital, concentration limits and earnings all at once.

**Best efforts** or **club** deals are the alternative: the banks agree to lend only what they will each hold, and there is no underwriting risk. Sponsors prefer underwritten deals because they need certainty of funds to win auctions.

## Collateralised loan obligations

Who actually buys all that term loan B? Mostly **collateralised loan obligations (CLOs)**. A CLO is a securitisation vehicle (see the securitisation section in [[basel-credit-risk-explained-simply]]): a company that buys a portfolio of 150 to 300 leveraged loans and funds the purchase by issuing its own notes in tranches, from AAA at the top to an unrated equity slice at the bottom. The interest on the loans flows through a waterfall to the notes in order. A CLO manager picks the loans and trades them within rules.

For a bank, CLOs matter in three ways:

1. They are the demand side of the syndication market. When CLO issuance stops (because investors stop buying CLO notes), TLBs cannot be sold and deals hang.
2. Banks themselves buy CLO notes, usually the AAA tranche, as an investment. That is credit exposure to leveraged loans through a securitisation, with its own capital rules.
3. Banks lend to CLOs while they are being built (**warehouse** lines) and to credit funds (**subscription** and **NAV** lines), which is indirect leveraged exposure that can be missed in concentration reporting.

CLOs held up well through the 2008 crisis and the 2020 pandemic shock; their AAA tranches have never suffered a loss. But their behaviour as a herd (all selling downgraded loans at once because of rating-based rules) amplifies market moves in leveraged loans.

## Regulatory guidance on leveraged lending

Because this business has caused large losses before, regulators have issued specific guidance. Two are worth knowing in general terms. Both are "guidance", meaning expectations that supervisors enforce through their review of the bank rather than hard law, and both have been revised over time, so check the current text with your regulatory team.

**United States interagency guidance (2013).** Issued jointly by the Federal Reserve, the Office of the Comptroller of the Currency and the Federal Deposit Insurance Corporation. It asked banks to define leveraged lending, to have a risk appetite and limits for it, to underwrite on the basis that a borrower can repay at least half of its total debt from free cash flow within 5 to 7 years, to view leverage above 6x as raising concerns in most industries, to have a strong pipeline and distribution risk management (limits on underwriting, stress testing the pipeline), to rate these loans realistically (a loan the borrower cannot repay in a reasonable period should carry a criticised rating), and to value and monitor them rigorously. The legal status of this guidance was later softened, but examiners still use its concepts.

**European Central Bank guidance (2017, with later supervisory letters).** For banks it supervises directly in the euro area. It asked banks to adopt a single definition of leveraged transactions (it uses total debt above 4x EBITDA or sponsor ownership as markers), to set a risk appetite and limits for them, to have robust underwriting standards including an internal EBITDA view and a 7-year repayment capacity test, to treat deals above 6x as exceptional and escalated, to manage syndication risk with limits and stress tests, to monitor the portfolio with regular reporting to senior management, and to include leveraged lending in internal capital assessments (see [[20 Stress Testing and ICAAP]]). The ECB later wrote to banks saying it was dissatisfied with how some had implemented the guidance and imposed capital add-ons on several.

**Other jurisdictions.** The United Kingdom's Prudential Regulation Authority has written to banks about leveraged lending several times, focusing on underwriting pipeline risk, exposures to private credit funds, and the aggregation of all leveraged exposures (direct loans, underwritings, CLO holdings, fund financing) into one view. Other regulators have similar expectations.

The common thread is: define it, limit it, underwrite it on your own numbers, watch the pipeline, report it to the board, and make sure you can see all of it in one place. That last point is the platform lead's problem.

## Acquisition finance for corporates and bridge loans

Not all acquisition finance involves private equity. When an ordinary company buys another company, it often borrows to do so, and the bank's analysis is different because the buyer has its own balance sheet and track record (see [[04 Commercial and Corporate Lending]]).

Typical questions: Does the combined company make sense (**strategic rationale**)? What is the leverage of the combined group on day one, and how fast does it come down (**deleveraging path**)? Will the buyer keep its investment-grade rating, and does it care? Are the synergies believable? Is the buyer paying too much? What happens if the deal fails to complete?

**Bridge loans** are the typical structure. A bridge is a short-term loan (6 to 18 months) that provides certain funds at the moment the deal is signed, to be replaced ("taken out") by a bond issue or an equity raising later. The bank underwrites the bridge, earns fees, and expects it to be refinanced before it is ever fully drawn. The risk is that the bond market is shut when the company needs it, the bridge stays drawn, and the bank has a large, lumpy, under-priced exposure. Bridges therefore contain **step-ups**: the margin rises every few months the bridge remains outstanding, to push the borrower into the bond market, and a **securities demand** clause that lets the bank force a bond issue at a given price.

**Certain funds.** In many countries, takeover rules require a buyer of a listed company to prove it has the money before it announces the offer. The bank's commitment must therefore have almost no conditions, which means the credit approval has to be unusually firm and fast, often within days.

**Staple finance.** When a bank is advising a seller, it sometimes offers a pre-packaged loan to whoever buys, "stapled" to the sale documents. This creates obvious conflicts of interest and is tightly controlled.

## Why these loans are watched so closely

- **Loss experience.** Leveraged loans default more often than ordinary corporate loans (annual default rates in the low single digits in normal years, rising to 10% or more in recessions) and, in the cov-lite era, recover less when they do.
- **Concentration and correlation.** The same few sponsors, the same industries, and the same investor base appear in deal after deal. In a downturn they all suffer together.
- **Underwriting risk is a market risk in the banking book.** A hung pipeline can lose a bank more in a quarter than years of defaults.
- **Shadow banking links.** Much of the leverage now sits with private credit funds and CLOs, which borrow from banks. Regulators worry that risk has moved rather than disappeared, and that banks cannot see their full exposure.
- **Reputation.** Leveraged deals make headlines when they fail, and the names of the lending banks appear alongside.
- **Accounting.** Leveraged loans are prime candidates for stage 2 under IFRS 9 (see [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]]) because a modest deterioration takes them close to default triggers.

## A worked example from start to finish

A private equity sponsor agrees to buy a software company for 1,000 (illustrative; think of it as millions). The company's reported EBITDA is 90; sponsor-adjusted EBITDA, with add-backs for restructuring and planned cost savings, is 110. The bank's own adjusted EBITDA accepts some of the add-backs and lands at 100.

**Sources and uses:**

| Uses | | Sources | |
|---|---|---|---|
| Purchase price | 1,000 | Senior term loan B | 450 |
| Fees and expenses | 40 | Second lien | 100 |
| Cash to balance sheet | 10 | Sponsor equity | 480 |
| Management rollover | | Management equity | 20 |
| **Total** | **1,050** | **Total** | **1,050** |

Plus an undrawn RCF of 50.

**Leverage:** senior 4.5x and total 5.5x on the bank's EBITDA of 100; 5.0x and 6.1x on reported EBITDA of 90; 4.1x and 5.0x on the sponsor's 110. The credit paper shows all three. On the bank's numbers, the deal is below the 6x line that both the US and ECB guidance flag, but above it on reported EBITDA, so the paper explains why the add-backs are accepted.

**Repayment capacity test:** free cash flow after tax, capex and interest is forecast at 40 a year, rising to 60 by year 5. Cumulative free cash flow over 7 years is about 350, which is 64% of total debt of 550. The 50% hurdle is met.

**Interest cover:** cash interest of about 40 a year (450 at 5% plus 100 at 8% plus the base rate; illustrative) against EBITDA of 100 gives 2.5x, acceptable. A sensitivity with EBITDA 25% lower (75) gives 1.9x, which is tight, and the paper notes that the company's subscription revenue makes a 25% fall unlikely in a single year.

**Underwriting:** two banks underwrite the 450 TLB and the 100 second lien, 275 each. Each bank's credit committee approves an underwriting of 275 with a target final hold of 25 and a 90-day syndication period. Flex allows the margin to rise by 0.75 percentage points and the OID to widen to 97. Rating agencies assign B+ to the company and B+ to the TLB.

**Syndication:** the book builds to 1.5 times the TLB in two weeks; the deal is priced at the tight end of talk; each bank sells down to 25 of the TLB and keeps 10 of the RCF. Fees of 2.5% on 275, about 6.9 each, less the cost of a small OID, are booked.

**Capital:** the retained 35 per bank, rated internally at the equivalent of B+ with a probability of default of about 3% and an LGD of 35% given first-lien security, consumes RWA of roughly 1.2 times the exposure under the bank's IRB model, so about 42 of RWA and about 4.4 of capital at a 10.5% ratio (see [[18 Regulatory Capital and Basel - the Short Version]]). During the 90-day underwriting period, the full 275 attracted capital, which is why underwriting limits matter.

**Monitoring:** quarterly reporting package from the company; the loan's secondary market price watched daily; an annual review; a watchlist trigger if leverage exceeds 6.5x or the loan trades below 90 (see [[15 Monitoring, Early Warning and Watchlist]]).

## Common mistakes and misunderstandings

- **Using the sponsor's EBITDA.** The bank's own view of EBITDA is the regulatory and credit anchor. If the credit system only stores one EBITDA figure, it will be the wrong one.
- **Confusing the underwriting commitment with the final hold.** Both need approval, both need limits, and the exposure reports must show both while the deal is in syndication.
- **Assuming "senior secured" means safe.** In a 6x deal where 5x is senior secured, the senior lenders are the equity in all but name if EBITDA falls 20%.
- **Treating a cov-lite loan like a covenanted one.** With no maintenance covenants, the bank's early warning has to come from financial reporting and market prices, not from covenant breaches.
- **Missing indirect exposure.** CLO notes, fund financing lines, warehouse lines and derivatives with leveraged borrowers are all leveraged finance exposure.
- **Thinking leverage multiples are comparable across sectors or eras.** They are not. The quality and stability of EBITDA is what makes 6x sane or insane.
- **Ignoring documentation flexibility.** Permitted debt baskets and the ability to move assets away from the security net can double the effective leverage ahead of the bank.
- **Assuming an investment-grade buyer makes acquisition finance low-risk.** The buyer can lose its rating on the day the deal is announced; the bank's rating of the combined group must be forward-looking.

## What a platform lead needs to know about this

**Data.** A leveraged loan record needs fields most loan systems lack: a leveraged transaction flag (according to the bank's regulatory definition, with the reason), sponsor name (as a connected-party group for concentration), opening leverage on reported, sponsor-adjusted and bank-adjusted EBITDA, interest cover and repayment capacity at approval, the tranche type (RCF, TLA, TLB, second lien, mezzanine, unitranche, bridge), lien ranking, covenant type (maintenance or incurrence or cov-lite), underwriting amount and final hold target, syndication status and date, secondary market price, agency ratings, and the industry classification. Regulators ask for all of this, usually at short notice and by sponsor, by industry and by leverage bucket.

**Systems.** You will typically find the syndication desk running its pipeline in a dedicated syndicate or deal management tool (or spreadsheets), the credit approval in a workflow system, the loan itself in a loan servicing system (often a specialist agency platform if the bank is the agent), market prices from a pricing vendor, and the bank's own leverage calculations in the credit paper as a document. Stitching these into one leveraged-finance view, with the underwriting pipeline and the held book side by side, is the recurring request. Marking underwritten positions to market also needs a feed from the pricing vendor into the finance and risk systems.

**Controls.** A clear definition of "leveraged" applied consistently at origination (and a periodic check that nothing has been missed); separate approval and limit frameworks for underwriting and for hold; an underwriting pipeline limit and stress test; an independent EBITDA assessment recorded in the credit paper; documentation review by legal for flexibility terms; secondary price monitoring with triggers; watchlist and IFRS 9 staging rules tuned to leveraged borrowers; regular reporting to the board and to the regulator; and a full-exposure aggregation that includes CLO holdings and fund financing. For the governance framework see [[13 Credit Governance - Committees, Authorities and the Three Lines]].

**Who owns what.** The leveraged finance desk (front office) originates and structures. The syndicate desk prices and distributes and owns the pipeline. Leveraged finance credit (second line) approves and rates. Legal owns documentation. Market risk or finance marks the pipeline. Regulatory reporting answers the supervisor's data requests. Portfolio management monitors the book. The board sets the risk appetite for leveraged lending as a named category.

## Related notes

- [[00 Start Here]]
- [[02 What Credit Risk Is]]
- [[03 The Credit Lifecycle]]
- [[04 Commercial and Corporate Lending]]
- [[06 Specialised Finance - Project, Object, Commodities, Real Estate]]
- [[09 Credit Analysis - Reading a Borrower]]
- [[10 Internal Ratings, Scorecards and PD Models]]
- [[11 Collateral and Security]]
- [[12 Loan Documentation, Covenants and Conditions]]
- [[13 Credit Governance - Committees, Authorities and the Three Lines]]
- [[14 Risk Appetite, Limits and Concentration]]
- [[15 Monitoring, Early Warning and Watchlist]]
- [[16 Problem Loans, Restructuring and Recovery]]
- [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]]
- [[18 Regulatory Capital and Basel - the Short Version]]
- [[20 Stress Testing and ICAAP]]
- [[22 Credit Risk Data, Systems and BCBS 239]]
- [[24 Pricing, RAROC and Return on Capital]]
- [[28 Master Glossary]]
- [[basel-credit-risk-explained-simply]]
- [[basel-credit-risk-decision-tree]]
