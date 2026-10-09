# Specialised Finance - Project, Object, Commodities, Real Estate

**Why this matters to you.** Most of the loans in a bank are to people or to companies, and the bank gets its money back because the person has a salary or the company has a business. Specialised finance is the odd corner where the bank lends against one single thing: a power station that has not been built yet, a ship, a cargo of copper, an office block. If that one thing fails, there is often nothing else to go after. These deals are large (hundreds of millions each), long (up to 25 years), complicated (dozens of contracts and parties), and they have their own data, their own ratios, their own regulatory treatment and usually their own team inside the bank. As a platform lead you will find that your general-purpose credit systems do not fit them well, and that the specialised finance team keeps its real information in spreadsheets and financial models. This note explains what they are doing and why.

## Table of contents

1. [What makes specialised lending different](#what-makes-specialised-lending-different)
2. [Project finance in depth](#project-finance-in-depth)
3. [The ratios: DSCR, LLCR and PLCR](#the-ratios-dscr-llcr-and-plcr)
4. [The cash flow waterfall and reserve accounts](#the-cash-flow-waterfall-and-reserve-accounts)
5. [Step-in rights and direct agreements](#step-in-rights-and-direct-agreements)
6. [The Basel slotting approach](#the-basel-slotting-approach)
7. [Object finance: ships, aircraft and trains](#object-finance-ships-aircraft-and-trains)
8. [Commodities finance](#commodities-finance)
9. [Real estate finance](#real-estate-finance)
10. [Infrastructure and public-private partnerships](#infrastructure-and-public-private-partnerships)
11. [A worked example: a solar farm from start to finish](#a-worked-example-a-solar-farm-from-start-to-finish)
12. [Common mistakes and misunderstandings](#common-mistakes-and-misunderstandings)
13. [What a platform lead needs to know about this](#what-a-platform-lead-needs-to-know-about-this)
14. [Related notes](#related-notes)

## What makes specialised lending different

Imagine your friend wants to borrow money from you to buy a lemonade machine. In a normal loan, you lend to your friend, and if the lemonade machine turns out to be rubbish, your friend still owes you the money and will pay you out of pocket money, birthday money, or whatever else they have. You are lending to the *person*.

Now imagine a different arrangement. Your friend sets up a tiny separate "lemonade company" that owns nothing except the machine. You lend to the lemonade company, not to your friend. The only way you get paid back is if the machine makes lemonade and people buy it. If the machine breaks, your friend can walk away, and the most you can do is take the machine. You are lending to the *thing*.

That second arrangement is specialised lending. The Basel Committee on Banking Supervision (BCBS), the club of regulators that writes the global bank rulebook described in [[18 Regulatory Capital and Basel - the Short Version]] and [[basel-credit-risk-explained-simply]], defines it by four features:

1. The borrower is usually a **special purpose vehicle** (SPV), a company created only to own and run the asset, with no other business and no history.
2. The SPV has little or nothing of value apart from the asset itself.
3. The loan terms give the lender a lot of control over the asset and the cash it generates.
4. The main source of repayment is the cash the asset produces, not the general earning power of some wider business.

The commercial world uses related words you will hear constantly:

| Term | What it means | Everyday version |
|---|---|---|
| Full recourse | If the asset fails, the lender can chase the parent company or sponsor for everything. | Your friend owes you personally. |
| Limited recourse | The sponsor is on the hook for specific, capped things (for example, finishing construction) but not for everything. | Your friend promises to fix the machine if it breaks in the first month, nothing else. |
| Non-recourse | The lender can only look to the SPV and its asset. The sponsor can walk away. | You can only take the machine. |
| Sponsor | The company or fund that sets up the SPV, puts in equity, and usually runs the project. | Your friend. |
| Offtaker | The customer who agrees in advance to buy the output. | The school canteen that promises to buy 50 cups a day. |

Why would a bank ever agree to non-recourse lending? Because the deals are very large, the assets produce predictable cash (a toll road does not go out of fashion), and the bank gets to design the whole structure from scratch with contracts that lock everyone in. Big sponsors also insist on it: an energy company building ten wind farms does not want all ten on its own balance sheet, because if one fails it wants the damage contained.

The sub-types covered in this note are the ones Basel lists as specialised lending: **project finance**, **object finance**, **commodities finance**, and **income-producing real estate** (IPRE), with its riskier cousin **acquisition, development and construction** (ADC) lending. Infrastructure and public-private partnerships are really a flavour of project finance and get a brief section of their own.

The common thread for a credit analyst is this: in ordinary [[04 Commercial and Corporate Lending]] you study the borrower's past. In specialised lending there is no past. You study a **financial model** of the future, and you study the **contracts** that make the future predictable.

## Project finance in depth

Project finance is the purest form. A group of sponsors wants to build something big: a gas-fired power plant, an offshore wind farm, a toll motorway, a liquefied natural gas terminal, a hospital under a government concession. They set up an SPV, put in some equity, borrow the rest from a group of banks, and sign a web of contracts so that every risk sits with the party best able to carry it.

![[06-project-finance-spv.svg]]
*The project company sits at the centre of a web of contracts. Everything the lenders rely on is a contract, not a track record, and the lenders take security over every one of them.*

### The parties

- **Sponsors** own the SPV. They put in equity, often 20% to 40% of the total cost (this varies by sector and country). More equity means the sponsors lose more if things go wrong, which keeps them committed. The bank cares a great deal about who the sponsors are: a sponsor with a strong track record and a reputation to protect behaves differently from a one-off developer.
- **The SPV** or project company borrows the money, owns the asset, and signs every contract. It has no employees to speak of; everything is outsourced by contract.
- **Lenders** are usually a syndicate of banks (see [[04 Commercial and Corporate Lending]] for how syndicates work), sometimes joined by bond investors, export credit agencies, and development banks such as the World Bank's lending arms. One bank acts as **facility agent** (administers the loan) and another, or the same one, as **security agent** (holds the security on behalf of everyone).
- **The EPC contractor** signs an engineering, procurement and construction contract. The important words are usually "fixed price, date certain, turnkey": the contractor promises to deliver a working plant on a set date for a set price, and pays **liquidated damages** (pre-agreed penalties) if late or under-performing. This shifts construction risk away from the SPV and its lenders.
- **The O&M contractor** signs an operations and maintenance contract to run the thing once built.
- **The offtaker** agrees to buy the output under a long-term contract. For a power plant this is a **power purchase agreement** (PPA), often with a government-owned utility, lasting 15 to 25 years, at a fixed or indexed price. This is the single most important contract, because it turns an uncertain future into a predictable cash flow. Some projects are "merchant", meaning they sell at whatever the market price is. Lenders dislike merchant risk and lend less against it.
- **Input suppliers** sign long-term supply contracts (gas supply, for example) so the plant always has fuel at a known price.
- **The host government** grants permits, licences, or a concession (the right to operate a road or an airport for a period). In some countries it also gives guarantees, for example that it will pay if the state utility cannot.
- **Insurers** cover construction risks, delays, business interruption, and sometimes political risks such as expropriation.
- **Independent advisers**: the lenders hire a technical adviser (an engineer who checks the design and the costs), a legal adviser, an insurance adviser, a market adviser (who checks the price assumptions), and a model auditor (who checks the spreadsheet). Their reports are part of the credit file.

### Construction phase versus operations phase

A project has two very different lives, and lenders think about them separately.

**Construction phase.** Money goes out, nothing comes in. The risks are that the plant costs more than planned, is finished late, or does not work when switched on. The main protections are the fixed-price EPC contract, liquidated damages, a **contingency** line in the budget (often 5% to 10% of cost), **cost overrun support** from the sponsors (they promise to put in more equity up to a cap), and **completion guarantees** (a sponsor promises the debt will be repaid if the plant is never completed). Interest during construction is usually not paid in cash but rolled into the loan, which is why the loan balance grows before it shrinks.

**Operations phase.** The plant now produces cash. The risks shift to performance (does it produce as much as promised?), price (is the offtake contract honoured?), cost (do O&M costs run away?), and counterparty risk (does the offtaker go bust?). Repayment is **sculpted** to the forecast cash flow, which is why project loans have unusual repayment profiles.

The moment between the two is called **completion** or **conversion**. Many loans have a **completion test**: the plant must run at a certain output for a certain period before the sponsors are released from their construction-phase promises. Until that test is passed, the deal is really a limited-recourse loan to the sponsors; after it, it becomes a non-recourse loan to the project.

### The financial model

The heart of every project finance credit file is a spreadsheet financial model, often tens of thousands of cells, that forecasts every cash flow from today to the final repayment date, sometimes 25 years out. It contains:

- **Inputs**: construction cost, timetable, output (for a wind farm, the energy yield from the wind study), the offtake price, operating costs, inflation, interest rates, tax, and the debt terms.
- **The base case**: the lenders' agreed central forecast, usually somewhat more cautious than the sponsors' own forecast.
- **Sensitivities**: what if construction is a year late, what if output is 10% below the forecast, what if costs are 20% higher, what if interest rates rise 2 percentage points, what if the offtaker pays late. Each sensitivity produces a new set of ratios. The bank checks that the loan survives all reasonable ones.
- **The debt sizing**: how much can be borrowed is worked out backwards from the cash flow. The bank says "we need a minimum debt service coverage ratio of 1.30 in every year of the base case", and the model tells you the largest loan that satisfies that. This is the opposite of ordinary lending, where the borrower asks for an amount and the bank checks it.

## The ratios: DSCR, LLCR and PLCR

Ordinary corporate ratios such as debt to EBITDA (explained in [[09 Credit Analysis - Reading a Borrower]]) do not mean much for a project, because the project has no history and its debt is designed to be high. Project lenders use three cover ratios instead. All three use **CFADS**, cash flow available for debt service, which is revenue minus operating costs minus tax minus any maintenance spending, in other words the cash that is genuinely left to pay the bank.

**Debt service coverage ratio (DSCR)** = CFADS in a period divided by the debt service (interest plus scheduled principal) due in that period.

Pocket money version: you earn 13 coins a week from chores and your loan repayment is 10 coins a week. Your DSCR is 1.30. You have 3 coins of slack. If you earn 10 coins, DSCR is 1.00 and one bad week means a missed payment.

Typical minimum DSCRs that lenders require in the base case (illustrative; they vary by country, sector and market mood):

| Project type | Typical minimum DSCR | Why |
|---|---|---|
| Hospital or school under a government availability payment | 1.15 to 1.25 | Revenue is almost certain; government pays for the building being available, not for its use. |
| Contracted power (long PPA, strong offtaker) | 1.25 to 1.40 | Price is fixed; volume risk is low. |
| Toll road with traffic risk | 1.40 to 1.80 | Nobody knows how many cars will come. |
| Merchant power (no offtake contract) | 1.80 to 2.50 or more | Price and volume both uncertain. |

A DSCR is also used as the **distribution test**: sponsors can only take dividends if the DSCR (looking back and often also looking forward) is above a lock-up level, say 1.15. And it is used as a **default trigger**: if DSCR falls below, say, 1.05, the loan is in default even though no payment has been missed yet.

**Loan life coverage ratio (LLCR)** = the present value of all CFADS from now until the final loan repayment date, divided by the debt outstanding now.

This answers "over the whole remaining life of the loan, is there enough cash in total?" A DSCR tells you about one year; an LLCR tells you about the whole stretch. Lenders want it comfortably above 1, typically 1.30 to 1.60 at the start.

**Project life coverage ratio (PLCR)** = the present value of all CFADS over the whole life of the project (including years after the loan is due to be repaid), divided by the debt outstanding now.

This answers "if things go wrong, is there a tail of cash flow after the loan matures that could be used to repay it late?" The gap between the loan maturity and the end of the project (or the offtake contract) is called the **tail**, and lenders like a tail of several years as a safety margin. A PLCR comfortably above the LLCR means there is a tail.

Worked example. A project has debt of 500 outstanding. The remaining loan life is 10 years and the base case CFADS is 80 a year. The project is expected to run for 15 years in total, so there is a 5-year tail. Using a 6% discount rate (illustrative):

- Present value of 80 a year for 10 years is roughly 589. LLCR = 589 / 500 = 1.18.
- Present value of 80 a year for 15 years is roughly 777. PLCR = 777 / 500 = 1.55.
- Annual debt service, if the loan is repaid in level instalments, is about 68. DSCR = 80 / 68 = 1.18.

An LLCR of 1.18 is thin for most sectors. The bank would probably ask for a smaller loan, say 420, which lifts the LLCR to 1.40 and the DSCR to about 1.40 as well.

## The cash flow waterfall and reserve accounts

In an ordinary loan, the company gets its revenue in its own bank account and decides what to do with it. In project finance, the lenders do not trust the SPV with that decision. Every penny of revenue lands in a **project account** controlled by the security agent, and it can only be spent in a fixed order. That order is the **cash flow waterfall**.

![[06-cash-flow-waterfall.svg]]
*The waterfall: cash fills each bucket in order before any spills into the next. Sponsors get paid last, and only if the distribution test is passed.*

Lemonade stand version: your takings go into a jar your mum controls. She pays for the lemons first, then your loan to your uncle, then she puts some in a rainy-day pot, and only then do you get pocket money, and only if the stand is doing well enough.

The typical order:

1. **Operating costs and taxes.** The plant must keep running, so these come first. Lenders accept this because a plant that stops running produces nothing.
2. **Senior debt interest and fees.**
3. **Senior debt scheduled principal.**
4. **Debt service reserve account (DSRA).** A cash cushion, usually equal to the next 6 months (sometimes 12) of debt service, kept in a locked account. If there is a bad period, the bank is paid from the DSRA while everyone works out what went wrong. It must be topped back up before anything flows further down.
5. **Maintenance reserve account (MRA).** Savings for big predictable costs such as a turbine overhaul every five years, so that the cost does not land in one year and crush the DSCR.
6. **Subordinated debt and shareholder loans.** Sponsors often put part of their equity in as a loan to the SPV for tax reasons; it is paid after the banks.
7. **Distributions to sponsors**, but only if the **distribution test** is passed: no default is outstanding, the DSRA is full, the historic and projected DSCR are above the lock-up level, and so on.

If the test fails, the deal is in **lock-up**: the cash stays in the SPV's accounts. Many agreements have a **cash sweep**: if lock-up lasts beyond a set time, trapped cash is used to prepay the loan.

Other reserve accounts you will meet: a **construction** or **cost overrun** account, a **decommissioning** reserve (to dismantle an oil platform at the end), and a **change in law** reserve.

## Step-in rights and direct agreements

If the EPC contractor goes bust halfway through building, the SPV's contract is worthless. If the SPV itself defaults and the lenders enforce their security, the offtaker might argue that its contract was with the SPV and it can now walk away. Both outcomes destroy the asset's value.

So lenders sign **direct agreements** with every important contract party. The direct agreement says, roughly: "If the SPV defaults, you will tell us before you terminate your contract, you will give us a period to fix the problem, and you will accept us or a company we nominate stepping into the SPV's shoes." These are **step-in rights**. They are what make it possible for a bank to take over a half-built power station, finish it with a new contractor, and sell it, rather than being left with a pile of concrete.

The practical point for credit: the security package in project finance is not just a mortgage over the land. It is a charge over every bank account, every contract, every permit, the shares in the SPV, and the insurances, plus direct agreements. The legal adviser's job is to make sure that whole package is enforceable in the country where the project sits. See [[11 Collateral and Security]].

## The Basel slotting approach

Under the Basel rules, specialised lending has its own regulatory treatment, because the normal internal ratings-based (IRB) models, which estimate a probability of default (PD) from a company's financial history, do not work for an SPV with no history. The rulebook (chapter CRE33 of the consolidated framework) gives banks two options:

- If the bank can convince its regulator that it can estimate PD for these deals (usually only the largest project finance banks, with decades of data), it uses the normal IRB formula.
- Otherwise it uses the **supervisory slotting criteria approach**, usually just called **slotting**. The bank assesses each deal against a long checklist of qualitative factors and puts it into one of five slots. Each slot has a fixed risk weight.

The five slots:

| Slot | Plain meaning | Risk weight (project, object, commodities, IPRE; illustrative of the current BCBS text) |
|---|---|---|
| Strong | Everything is in the lender's favour: strong sponsors, firm contracts, high cover ratios, robust structure. | 70% (50% if remaining maturity is under 2.5 years, at supervisory discretion) |
| Good | Mostly favourable with minor weaknesses. | 90% (70% for short maturity) |
| Satisfactory | Acceptable but with real weaknesses that need watching. | 115% |
| Weak | Serious problems; likely to run into trouble. | 250% |
| Default | Has defaulted. | 0% risk weight, but the bank must provision for the expected loss (50% of the exposure under the standard text) |

Risk weights for ADC-type "high-volatility commercial real estate" are higher in each slot. The exact numbers differ slightly between the Basel text and national versions, so check your own regulator's rulebook; the ones above are illustrative of the shape.

The checklist behind the slots has five headings, and each heading has sub-criteria written as descriptions of what strong, good, satisfactory and weak look like:

1. **Financial strength**: market conditions, cover ratios (DSCR, LLCR, PLCR), leverage, stress test resilience.
2. **Political and legal environment**: country risk, enforceability of contracts, permit risk.
3. **Transaction characteristics**: technology risk, construction risk (EPC contract quality, completion guarantees), operating risk (O&M contractor quality), offtake risk (contract strength and offtaker credit quality), supply risk.
4. **Strength of sponsor**: track record, financial strength, incentives.
5. **Security package**: assignment of contracts, pledge of assets, control over cash flow (the waterfall), covenant quality, reserve funds.

The slotting assessment is done by the analyst, scored by a template, reviewed by an independent credit officer, and the slot drives the capital charge through the standard RWA formula (exposure times risk weight; see [[18 Regulatory Capital and Basel - the Short Version]]). Slotting is one of the few places in a big bank where capital depends directly on a human checklist rather than a statistical model, which is why regulators inspect slotting files closely and why consistency between analysts matters. It also matters for the output floor described in [[basel-credit-risk-explained-simply]], because the standardised approach treats most of these loans as plain unrated corporates.

## Object finance: ships, aircraft and trains

Object finance is lending to buy a physical, movable asset whose earnings repay the loan: ships, aircraft, railway rolling stock (locomotives and wagons), sometimes satellites or drilling rigs. The borrower is again usually an SPV, often registered in a jurisdiction chosen for its ship registry or aircraft law.

Bike version: you lend your friend money to buy a bike that they rent out to other kids by the hour. If the rental income dries up, you take the bike and sell it. Two things matter: how much rental income is contracted, and what the bike will be worth second-hand.

The two pillars of object finance are therefore:

**Employment of the asset.** A ship on a **charter** (a contract to hire the ship to a cargo owner) for five years at a fixed day rate is like a PPA: predictable cash. A ship trading on the **spot market** earns whatever today's freight rate is, which for some ship types swings by a factor of five within a couple of years. For aircraft, the equivalent is the **lease** to an airline: an operating lease (the lessor keeps the asset at the end) or a finance lease (the airline effectively buys it over time). The credit quality of the charterer or airline is often more important than the quality of the asset.

**Asset value.** Ships and aircraft have active second-hand markets and independent valuers. Lenders track the **loan-to-value ratio** (LTV): loan outstanding divided by the current appraised value. Covenants typically require LTV below, say, 70% to 80%, tested twice a year, with the borrower required to prepay or add collateral if breached. The risk at the end of the loan is **residual value risk**: the loan has a balloon (a large final payment) that is meant to be repaid by selling or refinancing the asset, and if the asset is worth less than the balloon, the lender is exposed. Aircraft values depend on the type (a popular narrow-body plane holds value far better than an out-of-production wide-body), age, maintenance status, and the state of the airline industry. Ship values depend on the type, age, the order book of new ships (too many new ships means low freight rates and low values), and scrap steel prices as a floor.

| Asset | Typical loan tenor | Typical starting LTV (illustrative) | Main risks |
|---|---|---|---|
| Aircraft (new, popular type) | 10 to 12 years | 70% to 80% | Airline default, residual value, re-leasing cost, jurisdiction for repossession |
| Ship (bulk carrier, tanker) | 5 to 10 years | 50% to 65% | Freight rate cycle, charterer default, oversupply, environmental rules making old ships obsolete |
| Rolling stock | 15 to 25 years | 70% to 85% | Operator default, limited second-hand market (a train only fits certain tracks) |

Object finance has a legal dimension that credit analysts spend a lot of time on: can you actually get the asset back? Ships can be arrested (seized by court order) in most ports under maritime law. Aircraft repossession is governed by an international treaty called the Cape Town Convention in countries that have adopted it, which makes lenders much more comfortable. Trains are hard to repossess because they are often essential public services.

Regulatory treatment is the same as project finance: slotting, or IRB if approved. Many banks run separate internal rating models for shipping and aviation that combine the charterer's or airline's rating with the LTV and the asset type.

## Commodities finance

Commodities finance is short-term lending to buy, store, process and sell physical goods: oil, metals, grain, coffee, cotton. The borrower is a **trader** (a company that buys and sells commodities, often with thin margins and huge volumes) or a producer. Repayment comes from selling the goods, so the loan is **self-liquidating**: the thing you lent against turns into the cash that repays you, usually within 30 to 180 days.

Lemonade version: you lend your friend money on Monday to buy lemons and sugar. They make lemonade and sell it on Saturday, and you are repaid from the takings. If they never sell, you can take the lemons (but they will go off, and you will have to sell them cheaply).

The three classic structures:

**Transactional (structured commodity trade finance).** The bank finances one specific shipment. It pays the supplier, takes control of the goods through documents of title (the bill of lading, explained in [[08 Trade Finance and Guarantees]]), and is repaid when the buyer pays, often directly into the bank's account. Each transaction is approved and tracked separately. Risks: the goods are not what the documents say, the buyer does not pay, the price falls between purchase and sale (price risk is usually hedged with futures, and the bank checks the hedges), and the goods are lost or damaged (insurance).

**Pre-export finance.** A bank lends to a producer in, say, a developing country, against the future export of its production. The buyer abroad agrees to pay for the goods into an account controlled by the bank, outside the producer's country. This gets around country risk (the producer's government may stop money leaving, but the money never enters). The risk is **performance risk**: will the producer actually produce and ship? See [[26 Sovereign, Bank and Country Risk]].

**Borrowing base facilities.** A revolving loan whose maximum size is recalculated regularly from the value of the borrower's eligible inventory and receivables, each discounted by an **advance rate** (a haircut). Advance rates reflect how easy it is to turn the asset into cash: cash 100%, good receivables 80% to 90%, inventory in approved warehouses 50% to 75%, goods in transit less. The borrower submits a **borrowing base certificate** weekly or monthly, and the bank sends **field examiners** to check that the stock and the invoices really exist.

![[06-borrowing-base.svg]]
*Borrowing base mechanics: eligible collateral times advance rates gives the base; availability is the lower of the base and the facility limit; a shortfall must be cured.*

Key documents and controls:

- **Warehouse receipts**: a document issued by a warehouse operator saying "we hold 5,000 tonnes of copper for the account of X." The bank takes a pledge over the receipt and so over the metal. The risk is the warehouse: there have been major frauds where the same metal was pledged to several banks, or did not exist. Banks use **collateral management agreements** with independent inspection companies who physically count and lock the stock.
- **Bills of lading**: documents of title for goods at sea.
- **Marking to market**: the collateral is revalued at current commodity prices, often daily, and the borrowing base shrinks when prices fall.
- **Hedging**: the bank requires the borrower to lock in the sale price with futures or forwards, and checks that the hedges are in place and with reputable counterparties (see [[19 Counterparty Credit Risk and Derivatives]]).

Commodities finance is low-margin, high-volume, operationally intensive, and fraud-prone. Losses, when they happen, tend to be sudden and total, because by the time the bank discovers the goods are missing, the trader is already insolvent.

## Real estate finance

Real estate is the biggest category of specialised lending by volume in most banks, and the one with the longest record of causing banking crises (the United States savings and loan crisis in the 1980s, Sweden and Japan in the early 1990s, Ireland and Spain in 2008, and others). The rulebook treats it as its own exposure class, separate from corporates, as explained in [[basel-credit-risk-explained-simply]].

### Investment versus development

**Income-producing real estate (IPRE)** or investment lending: the borrower owns a finished building that is let to tenants, and the rent repays the loan. Office blocks, shopping centres, warehouses, blocks of flats, hotels (hotels are a hybrid because the income is from an operating business).

**Development lending**, which Basel calls **acquisition, development and construction (ADC)**: the borrower is buying land and building something that does not yet exist. Nothing produces income until the building is finished and sold or let. This is the riskiest kind of real estate lending, because it combines construction risk, letting risk and market risk, and because the exit (sale or refinancing) depends on market conditions years in the future.

### The key measures for investment property

**Loan-to-value (LTV)** = loan divided by the current appraised value of the property. A 65 million loan on a 100 million building has an LTV of 65%. Lower is safer: if the value falls 30%, the lender is still covered. Typical maximum LTVs at origination (illustrative): 50% to 65% for prime offices and logistics, lower for secondary property or hotels. Valuation is by an independent, regulated valuer, repeated every one to three years and whenever the lender is worried.

**Interest cover ratio (ICR)** = net rental income divided by interest. Net rental income is rent received minus non-recoverable costs (management fees, empty-space costs). A building earning 6 million of net rent with an interest bill of 3 million has an ICR of 2.0x. Covenants often require at least 1.5x to 2.0x. When interest rates rise sharply, as they did in 2022 and 2023, ICRs fall across whole portfolios even though nothing has changed in the buildings, which is one of the ways real estate lending turns bad.

**Debt yield** = net rental income divided by the loan. It is like a DSCR that ignores the interest rate, which makes it useful when rates are moving. A debt yield below about 7% to 8% (illustrative) is where many lenders start to worry.

The **tenants** matter as much as the building. Questions the analyst asks: Who are they? What is their credit quality? When do their leases expire (the **weighted average unexpired lease term**, WAULT)? Are the rents above or below market (an above-market rent will fall when the lease ends)? Is there a single tenant whose departure would empty the building? A building let for 15 years to a government department is a quasi-sovereign bond; a multi-let building with leases ending in two years is a bet on the letting market.

### The key measures for development

- **Loan-to-cost (LTC)**: loan divided by total development cost. Lenders usually fund 60% to 75% of cost, with the developer putting in the land and some cash first ("equity first").
- **Loan-to-gross-development-value (LTGDV)**: loan divided by the expected value when finished. Typically capped at 55% to 65%.
- **Pre-lets and pre-sales**: how much of the building is already let or sold before building starts. A development that is 70% pre-let to a strong tenant is far safer than a speculative one. Many lenders will not fund speculative offices at all in a weak market.
- **Construction risk**: fixed-price building contract, contingency, an independent **monitoring surveyor** who checks progress before every drawdown, so the bank only releases money for work actually done.
- **Exit**: the loan is repaid by selling the building or refinancing it with an investment loan. The analyst tests what happens if the sale takes two years longer and prices are 20% lower.

Worked example. A developer wants to build a warehouse. Land costs 10, construction 30, fees and interest 5, total cost 45. Expected value when finished and let: 60. The bank lends 30: LTC is 67%, LTGDV is 50%. The developer has put in 15 of equity (the land plus 5 of cash). If the finished value turns out to be only 45 (a 25% fall), the bank's 30 loan is still covered with an LTV of 67%. If the developer also runs 20% over budget and the building takes a year longer, cost is 54 and the bank has been asked to fund the extra 9; this is where cost-overrun guarantees from the developer's parent come in. ADC lending is where [[16 Problem Loans, Restructuring and Recovery]] gets most of its real estate cases.

### Regulatory and accounting treatment

Under the standardised approach, real estate risk weights come straight from LTV bands, with a separate, higher table where repayment depends materially on the property's cash flows (IPRE) rather than the borrower's other income, and a higher weight again for ADC (with a lower weight available where there is substantial pre-sale or equity). Under IRB, IPRE can be slotted like project finance or modelled; a special "high-volatility commercial real estate" category gets harsher treatment. Real estate also matters heavily for [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]] because the collateral value drives the loss given default, and for [[20 Stress Testing and ICAAP]] because a property price shock is in every regulator's stress scenario.

## Infrastructure and public-private partnerships

Infrastructure is the general word for roads, bridges, railways, airports, ports, water, energy networks, hospitals and schools. Much of it is financed by project finance, and in many countries it is done through **public-private partnerships (PPPs)**, sometimes called the private finance initiative (PFI) in the United Kingdom or concessions elsewhere.

In a PPP, a government wants a hospital. Instead of borrowing to build it, the government signs a 25-year contract with an SPV: the SPV designs, builds, finances and maintains the hospital, and the government pays an annual **availability payment** as long as the hospital is available and up to standard, with deductions if it is not. The SPV borrows from banks against that payment stream. Because the payer is the government and the payment does not depend on how many patients turn up, these are among the safest project loans, with DSCRs as low as 1.15 accepted.

Other PPPs carry **demand risk**: a toll road where the SPV's revenue depends on traffic. Traffic forecasts have a poor record (several famous toll roads attracted half the forecast traffic), so lenders demand much higher cover ratios and often some government support, such as a minimum revenue guarantee.

Infrastructure loans are long (20 to 30 years), which makes them hard for banks to fund under liquidity rules, so a large share is now provided by insurers, pension funds and infrastructure debt funds, often alongside banks who do the construction phase and then sell down. Basel gives some infrastructure loans a modest capital discount in certain jurisdictions (the European Union has an "infrastructure supporting factor"); this varies by country and is worth checking with your regulatory team.

## A worked example: a solar farm from start to finish

A sponsor wants to build a 100 megawatt solar farm. Illustrative numbers.

**Cost**: 90 million, including panels, grid connection, land, fees and interest during construction. Construction will take 15 months under a fixed-price EPC contract with a reputable contractor and liquidated damages of up to 15% of the contract price for delay.

**Revenue**: a 20-year PPA with the national utility at a fixed, inflation-linked price. The energy yield study (by an independent engineer) gives an expected output in a typical year; the lenders use the **P90** case, the output exceeded in 90% of years, which is about 8% below the expected (P50) case. The P90 case gives revenue of about 11 million a year after the first year.

**Costs**: O&M contract at 1.2 million a year, insurance, land rent, and a maintenance reserve for inverter replacement in year 12. CFADS in the base case: about 9 million a year.

**Debt sizing**: the lenders require a minimum DSCR of 1.30 on the P90 case and an 18-year loan with a 2-year tail to the end of the PPA. Working backwards, annual debt service can be at most 9 / 1.30 = 6.9 million. At an all-in interest rate of 6% (illustrative) over 18 years, that supports a loan of roughly 75 million. The lenders also cap the loan at 80% of cost, which is 72 million, and the lower of the two limits wins. So the loan is 72 million and the sponsor puts in 18 million of equity. The DSCR on the base case comes out at about 1.35.

**Sensitivities**: at P99 output (a very bad year) the DSCR falls to about 1.15, still above the 1.05 default trigger. With a one-year construction delay the model shows the DSRA plus liquidated damages cover the gap. With O&M costs 25% higher, the DSCR is 1.28, meaning distributions would be locked up at a 1.30 lock-up level but the loan would still be paid.

**Structure**: SPV in the host country, security over everything, direct agreements with the EPC and O&M contractors and the utility, 6-month DSRA funded at completion, distributions only if historic and projected DSCR exceed 1.20, cash sweep if lock-up lasts more than two test dates.

**Slotting**: strong sponsor, contracted revenue with a state utility (but in a country rated below investment grade, which pulls the political score down), proven technology, strong security package, DSCR 1.35 with LLCR 1.45. The analyst proposes **Good**; the credit officer agrees. Risk weight 90%. RWA on the 72 million is 64.8 million; at a 10.5% capital ratio (see [[18 Regulatory Capital and Basel - the Short Version]]), about 6.8 million of capital is tied up. The margin and fees are checked against that capital in [[24 Pricing, RAROC and Return on Capital]].

**Monitoring**: quarterly compliance certificates with the DSCR calculation, an annual site visit by the technical adviser, annual model update, a watchlist trigger if any DSCR falls below 1.20 (see [[15 Monitoring, Early Warning and Watchlist]]).

## Common mistakes and misunderstandings

- **Thinking the sponsor is the borrower.** In non-recourse deals, the sponsor's rating tells you about their willingness to support the project, not their obligation to. The credit is on the SPV and its contracts. The exception is during construction, when sponsor completion support is usually in place.
- **Reading DSCR like a corporate interest cover.** A corporate interest cover of 1.3x would be alarming. A project DSCR of 1.3x can be perfectly normal because the loan is deliberately sized to that number and the cash flow is contracted.
- **Treating the model's base case as the truth.** The model is a set of assumptions. The credit judgement is about the sensitivities and about who checked the inputs.
- **Forgetting that a reserve account is already counted.** A DSRA protects against timing problems, not against a project that fundamentally does not work. Analysts sometimes double-count it in cover ratios.
- **Confusing LTV with LTC and LTGDV in development lending.** They answer different questions and can give very different numbers on the same deal.
- **Assuming commodities collateral is safe because it is physical.** The physical asset is only as good as the documents, the warehouse and the inspection regime.
- **Ignoring refinancing risk.** Many real estate and object finance loans end with a balloon that must be refinanced. A loan that was fine for seven years can fail at maturity because the market will not refinance it.
- **Putting these deals into the general corporate rating model.** The outputs are meaningless. They need the slotting template or a sector-specific model.
- **Ignoring the tail.** A loan that matures in the same year the offtake contract ends has no safety margin.

## What a platform lead needs to know about this

**Data.** Specialised finance deals do not fit the standard loan data model. A single deal has dozens of counterparties (sponsors, offtaker, contractors, guarantors), several facilities (construction loan, term loan, letters of credit, hedging lines), covenants that are ratios calculated from a model rather than from accounts, and reserve accounts that are part of the structure. Key fields you will need to capture and that are often missing from the core loan system: the slot (strong to weak) and its assessment date, the cover ratios at each test date, the asset valuation and date, LTV at each test, the phase (construction or operations), the completion date, the offtaker's identity and rating (for concentration), the country of the asset (for country risk), the collateral management agreement details for commodities, and the borrowing base certificate history.

**Systems.** Expect to find: the core banking or loan system holding only the facility and balance; a deal-level financial model in a spreadsheet maintained by the front office or an adviser; a covenant monitoring tool (often also a spreadsheet); a collateral or valuation register; and a trade finance platform for the commodities side. The slotting assessment often lives in a document rather than a system, which makes it hard to report on or to audit. The regulatory capital engine needs the slot as an input, and the link between "the analyst's slotting form" and "the risk weight in the RWA calculation" is one of the first things an auditor or regulator will trace. If that link is a manual re-key, it is a control weakness.

**Controls.** Independent review of slotting; a second pair of eyes on the financial model (model audit); valuation independence (the valuer must be instructed by the bank, not the borrower); field examinations and collateral inspections for commodities with a rotation of inspection firms; sanctions and dual-use checks on commodities (see [[08 Trade Finance and Guarantees]]); covenant test tracking with automatic flags to [[15 Monitoring, Early Warning and Watchlist]]; and concentration tracking by sector, by offtaker, by country, and by asset type (an airline failing hits every aircraft loan where it is the lessee; see [[14 Risk Appetite, Limits and Concentration]]).

**Who owns what.** Front office (the specialised finance team) originates and structures and owns the model. Credit risk (often a dedicated specialised lending credit team) approves, assigns the slot, and reviews annually. Independent advisers report to the lenders. Legal owns the security package. Regulatory reporting owns the RWA calculation and needs the slot. Model risk owns any internal rating models used instead of slotting (see [[21 Model Risk Management and Validation]]). Finance owns the IFRS 9 provisions, which for these deals depend heavily on the collateral valuation. For the regulatory data lineage rules that apply to all of this, see [[22 Credit Risk Data, Systems and BCBS 239]].

## Related notes

- [[00 Start Here]]
- [[02 What Credit Risk Is]]
- [[04 Commercial and Corporate Lending]]
- [[07 Leveraged and Acquisition Finance]]
- [[08 Trade Finance and Guarantees]]
- [[09 Credit Analysis - Reading a Borrower]]
- [[10 Internal Ratings, Scorecards and PD Models]]
- [[11 Collateral and Security]]
- [[12 Loan Documentation, Covenants and Conditions]]
- [[14 Risk Appetite, Limits and Concentration]]
- [[15 Monitoring, Early Warning and Watchlist]]
- [[16 Problem Loans, Restructuring and Recovery]]
- [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]]
- [[18 Regulatory Capital and Basel - the Short Version]]
- [[19 Counterparty Credit Risk and Derivatives]]
- [[22 Credit Risk Data, Systems and BCBS 239]]
- [[24 Pricing, RAROC and Return on Capital]]
- [[25 Climate, ESG and Emerging Credit Risks]]
- [[26 Sovereign, Bank and Country Risk]]
- [[28 Master Glossary]]
- [[basel-credit-risk-explained-simply]]
- [[basel-credit-risk-decision-tree]]
