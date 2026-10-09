# Credit Analysis - Reading a Borrower

**Why this matters to you.** Everything else in this vault (ratings, capital, provisions, limits, pricing) is built on top of one activity: a person sitting down with a company's numbers and story and deciding whether it will pay the money back. That activity is credit analysis. If the analysis is wrong, every model downstream is confidently wrong. As a platform lead you will be asked to build or buy the tools analysts use (spreading software, ratio engines, credit paper templates, workflow), and you cannot do that well unless you understand what an analyst is actually trying to find out, which numbers matter, where they come from, and why experienced analysts distrust some of them.

## Table of contents

1. [The question credit analysis answers](#the-question-credit-analysis-answers)
2. [The five Cs of credit](#the-five-cs-of-credit)
3. [The three financial statements from scratch](#the-three-financial-statements-from-scratch)
4. [How the three statements link](#how-the-three-statements-link)
5. [The key ratios](#the-key-ratios)
6. [The working capital cycle](#the-working-capital-cycle)
7. [Cash flow forecasting and sensitivities](#cash-flow-forecasting-and-sensitivities)
8. [Qualitative analysis](#qualitative-analysis)
9. [Peer comparison](#peer-comparison)
10. [Sources and uses](#sources-and-uses)
11. [Group structures and parent support](#group-structures-and-parent-support)
12. [Red flags and financial statement manipulation](#red-flags-and-financial-statement-manipulation)
13. [The credit paper](#the-credit-paper)
14. [Common mistakes and misunderstandings](#common-mistakes-and-misunderstandings)
15. [What a platform lead needs to know about this](#what-a-platform-lead-needs-to-know-about-this)
16. [Related notes](#related-notes)

## The question credit analysis answers

Suppose a friend asks to borrow 50 coins to be repaid in a year. Before you say yes, you ask yourself a few things without really thinking about it. Do they usually keep their promises? Do they get enough pocket money to pay me back? What do they want it for? Have they already borrowed from three other people? If they cannot pay, is there anything they could give me instead?

Credit analysis is that, done carefully, in writing, with numbers. The output is a recommendation (lend or not, how much, on what terms), an internal rating (see [[10 Internal Ratings, Scorecards and PD Models]]), and a document that someone with authority can approve (see [[13 Credit Governance - Committees, Authorities and the Three Lines]]). It is done at origination and repeated at least once a year for as long as the loan lasts (see [[03 The Credit Lifecycle]]).

The two questions underneath everything are:

1. **Will they pay?** This is about cash. Not profit, not assets, cash. A company repays loans with cash. Everything in the analysis is ultimately a way of estimating future cash and how reliable it is.
2. **If they do not, what do we get back?** This is about security, ranking and recovery, covered in [[11 Collateral and Security]] and [[16 Problem Loans, Restructuring and Recovery]]. This note is about the first question.

## The five Cs of credit

Generations of bankers have used a five-word checklist to make sure nothing is forgotten.

| C | The question | Everyday version | Where it shows up in this note |
|---|---|---|---|
| **Character** | Are the people honest and competent? Do they pay their debts? | Does your friend keep promises? | Qualitative analysis, red flags |
| **Capacity** | Does the business generate enough cash to service the debt? | Do they get enough pocket money? | Ratios, cash flow forecasting |
| **Capital** | How much of the owners' own money is in the business? | Have they saved anything themselves, or is it all borrowed? | Leverage ratios, balance sheet |
| **Collateral** | What can the bank take if things go wrong? | Would they give you their bike? | [[11 Collateral and Security]] |
| **Conditions** | What is the purpose of the loan, and what is happening in the industry and the economy? | What is the money for, and is the school about to ban lemonade stands? | Qualitative analysis, sources and uses |

Some banks add a sixth, **Cash flow**, or replace Collateral with **Coverage**. The list is less a method than a reminder: a borrower with wonderful numbers and a dishonest owner is a bad credit, and so is an honest owner in an industry that is disappearing.

## The three financial statements from scratch

Companies report their finances in three linked tables. If you have never seen them, start with a toy example and come back to the real thing.

### The toy company

Meet **Fizz Ltd**, which makes and sells fizzy lemonade to shops. We will use its figures for the year just ended (all amounts in thousands, made up but realistic for a small manufacturer).

### The income statement (profit and loss account)

This answers: **over the year, how much did the company earn?** It is a flow, like a film of the year.

| Line | Fizz Ltd | Plain meaning |
|---|---|---|
| Revenue (sales, turnover) | 1,000 | Everything sold, whether or not the customer has paid yet |
| Cost of sales | (600) | Lemons, sugar, bottles, factory wages |
| **Gross profit** | **400** | What is left after making the product |
| Operating expenses (selling, admin, rent, head office) | (250) | The cost of running the business |
| **EBITDA** | **150** | Earnings before interest, tax, depreciation and amortisation |
| Depreciation and amortisation | (40) | The yearly wearing-out of machines (depreciation) and intangible assets such as software or brands (amortisation). Not cash; the cash was spent when the machine was bought. |
| **EBIT (operating profit)** | **110** | Earnings before interest and tax |
| Interest expense | (20) | Paid to the bank |
| **Profit before tax** | **90** | |
| Tax | (22) | |
| **Net income (net profit, earnings)** | **68** | What the owners earned |

Lenders care about **EBITDA** and **EBIT** more than net income, because they want to see the earnings available *before* the company pays them (interest) and before items that are not cash.

### The balance sheet (statement of financial position)

This answers: **on the last day of the year, what did the company own and owe?** It is a snapshot, a photograph at midnight on 31 December.

The rule that gives it its name: **assets = liabilities + equity**. Everything the company owns was paid for either with borrowed money (liabilities) or with the owners' money (equity, which includes profits kept in the business). It always balances.

| | End of last year | End of this year | Plain meaning |
|---|---|---|---|
| **Assets** | | | |
| Cash | 50 | 60 | Money in the bank |
| Trade receivables (debtors) | 120 | 130 | Invoices customers have not paid yet |
| Inventory (stock) | 100 | 105 | Lemons, bottles, finished lemonade in the warehouse |
| Fixed assets (property, plant and equipment) | 400 | 420 | Factory and machines, at cost less depreciation to date |
| **Total assets** | **670** | **715** | |
| **Liabilities** | | | |
| Trade payables (creditors) | 120 | 122 | Bills from suppliers not yet paid |
| Bank debt | 400 | 385 | Loans |
| **Total liabilities** | **520** | **507** | |
| **Equity** | **150** | **208** | Owners' money: share capital plus retained profits |
| **Total liabilities + equity** | **670** | **715** | Balances with total assets |

Equity went up by 58: net income of 68 less a dividend of 10 paid to the owners.

Two groupings an analyst uses constantly: **current assets** (cash, receivables, inventory: things that turn into cash within a year, here 295) and **current liabilities** (payables and any debt due within a year, here 122 plus whatever part of the bank debt is due in the next 12 months, say 50, so 172). **Working capital** is current assets minus current liabilities. Fizz's trade working capital (receivables plus inventory minus payables) is 130 + 105 - 122 = 113, up from 100 last year.

### The cash flow statement

This answers: **over the year, where did the cash actually come from and go to?** It reconciles the opening cash (50) to the closing cash (60). It is the statement lenders trust most, because cash is hard to fake.

| Section | Fizz Ltd | Plain meaning |
|---|---|---|
| Net income | 68 | Start from profit |
| Add back depreciation and amortisation | 40 | Not cash |
| Less increase in working capital | (13) | Receivables up 10 and inventory up 5 absorbed cash; payables up 2 released cash |
| **Cash from operating activities** | **95** | Cash the business generated |
| Capital expenditure (capex) | (60) | Bought machines |
| **Cash from investing activities** | **(60)** | |
| Debt repaid | (15) | |
| Dividends paid | (10) | |
| **Cash from financing activities** | **(25)** | |
| **Net change in cash** | **10** | 50 becomes 60 |

Two measures lenders calculate from this:

- **Free cash flow** = operating cash flow minus capex = 95 - 60 = 35. This is what is genuinely available to repay debt and pay dividends.
- **Cash available for debt service** = operating cash flow before interest (95 + 20 = 115), minus tax already in there, minus maintenance capex. Different banks define it differently; what matters is to use one definition consistently.

## How the three statements link

The three statements are one system seen from three angles, and the links are where analysts catch errors and manipulation.

![[09-three-statements-link.svg]]
*How Fizz Ltd's three statements connect. Net income flows into both the cash flow statement and equity; depreciation leaves the income statement and reduces fixed assets but is added back to cash; capex, repayments and the net cash change all land on the balance sheet.*

The links to remember:

- **Net income** from the income statement goes to the top of the cash flow statement and into equity on the balance sheet (less dividends).
- **Depreciation** reduces profit on the income statement, reduces fixed assets on the balance sheet, and is added back on the cash flow statement because no cash left.
- **Capex** on the cash flow statement adds to fixed assets on the balance sheet.
- **Changes in working capital** (the difference between this year's and last year's receivables, inventory and payables on the balance sheet) appear in operating cash flow.
- **Debt repaid or raised** on the cash flow statement changes bank debt on the balance sheet; **interest** on that debt appears on the income statement.
- **Net change in cash** on the cash flow statement equals the change in cash on the balance sheet.

A company whose profit rises every year while its operating cash flow does not is the single most common warning sign in credit analysis, and the links are how you see it: profit is going into receivables and inventory, not into the bank.

## The key ratios

A ratio is just one number divided by another, chosen so that companies of different sizes can be compared and so that trends show. There are hundreds; a credit analyst leans on about a dozen, in five families.

![[09-ratio-families.svg]]
*The five ratio families and the question each answers, with Fizz Ltd's numbers. Thresholds are illustrative; what counts as good depends on the industry.*

### Leverage: how much debt?

**Debt to EBITDA** = total debt / EBITDA. Fizz: 385 / 150 = 2.6x. Using net debt (debt minus cash): 325 / 150 = 2.2x. This says "it would take 2.2 years of EBITDA to repay all debt." Rough guide for an ordinary company: under 2x is conservative, 2x to 3.5x is normal, above 4x is leveraged (see [[07 Leveraged and Acquisition Finance]]), above 6x is distressed unless the business is very stable. Utilities and property companies run much higher because their earnings are steady.

**Gearing** = debt / equity. Fizz: 385 / 208 = 1.85x, or 185%. Some banks use debt / (debt + equity): 385 / 593 = 65%. This says how much of the company's funding is borrowed. High gearing means the owners have little at stake and the lenders carry most of the risk. The useful version adjusts equity for intangible assets (**tangible net worth**), since goodwill and brands may be worth nothing in a liquidation.

### Coverage: can it pay the interest and the instalments?

**Interest cover** = EBIT / interest (some use EBITDA / interest). Fizz: 110 / 20 = 5.5x. Below 2x is worrying; below 1x means the company is not earning enough to pay interest and is living off its balance sheet.

**Debt service coverage ratio (DSCR)** = cash available for debt service / (interest + scheduled principal). Fizz: cash available roughly 115 - 22 tax - 50 maintenance capex = 43; debt service = 20 + 15 = 35; DSCR = 1.2x. That is tighter than the interest cover suggested, because principal repayments and capex eat cash. (In [[06 Specialised Finance - Project, Object, Commodities, Real Estate]] the DSCR is the central ratio and is defined slightly differently.)

**Fixed charge cover** = (EBIT + lease or rent payments) / (interest + lease or rent payments). For companies that rent rather than own (retailers, airlines), rent is really a kind of interest, and this ratio stops them looking artificially unleveraged. Modern accounting (IFRS 16) puts most leases on the balance sheet as debt anyway, which has made comparisons across years and countries harder; the analyst must know which basis the numbers are on.

### Liquidity: can it pay the bills due soon?

**Current ratio** = current assets / current liabilities. Fizz: 295 / 172 = 1.7x. Above 1 means there is more coming in within the year than going out. Below 1 is not always fatal (supermarkets run below 1 because customers pay cash and suppliers are paid later), but it needs explaining.

**Quick ratio** (acid test) = (current assets minus inventory) / current liabilities. Fizz: 190 / 172 = 1.1x. Inventory is removed because it may not sell. Below 1 means the company depends on selling stock to pay bills.

Liquidity ratios are snapshots and easy to flatter at year end. Analysts also look at **headroom**: how much of its committed bank facilities the company has not yet drawn, plus cash. A company with 10 of cash and 200 of undrawn committed facilities is liquid; one with 50 of cash and everything drawn may not be.

### Profitability: does it make money?

**Gross margin** = gross profit / revenue. Fizz: 40%. Says how much pricing power the company has over its costs.

**EBITDA margin** = EBITDA / revenue. Fizz: 15%. **Net margin** = net income / revenue: 6.8%. Margins are most useful against the company's own history and its peers. A falling gross margin usually means competition or input cost pressure; a falling EBITDA margin with stable gross margin means overheads are running away.

**Return on assets** = EBIT / total assets. Fizz: 110 / 715 = 15%. **Return on capital employed** = EBIT / (debt + equity): 110 / 593 = 19%. These say how efficiently the company uses the money invested in it. A return below the interest rate the company pays is a business that destroys value by borrowing.

### Working capital efficiency: how long is cash tied up?

**Debtor days** (days sales outstanding) = receivables / revenue x 365. Fizz: 130 / 1,000 x 365 = 47 days. Customers take about 47 days to pay.

**Stock days** (days inventory outstanding) = inventory / cost of sales x 365. Fizz: 105 / 600 x 365 = 64 days.

**Creditor days** (days payables outstanding) = payables / cost of sales x 365. Fizz: 122 / 600 x 365 = 74 days. Fizz takes 74 days to pay its suppliers.

These are explained in the next section. Here is the whole set in one table:

| Family | Ratio | Formula | Fizz Ltd | Good (illustrative, ordinary company) | Worrying |
|---|---|---|---|---|---|
| Leverage | Net debt / EBITDA | (debt - cash) / EBITDA | 2.2x | below 3x | above 4x to 5x |
| Leverage | Gearing | debt / equity | 185% | below 100% | above 200% to 300% |
| Coverage | Interest cover | EBIT / interest | 5.5x | above 3x | below 2x |
| Coverage | DSCR | cash for debt service / debt service | 1.2x | above 1.3x | below 1.1x |
| Coverage | Fixed charge cover | (EBIT + rent) / (interest + rent) | n/a | above 2x | below 1.3x |
| Liquidity | Current ratio | current assets / current liabilities | 1.7x | above 1.2x | below 1.0x |
| Liquidity | Quick ratio | (current assets - stock) / current liabilities | 1.1x | above 1.0x | below 0.7x |
| Profitability | EBITDA margin | EBITDA / revenue | 15% | stable or rising | falling for 2+ years |
| Profitability | Return on capital employed | EBIT / (debt + equity) | 19% | above the cost of debt | below the cost of debt |
| Working capital | Cash conversion cycle | stock days + debtor days - creditor days | 37 days | stable | rising fast |

Every threshold above is a rule of thumb. Industry matters enormously: a software company has no stock and few fixed assets; a steel maker has huge fixed assets and thin margins; a bank's balance sheet is nothing like any of them (see [[26 Sovereign, Bank and Country Risk]]). Banks keep **industry benchmark** tables and their rating models weight ratios differently by sector.

## The working capital cycle

Lemonade stand version: on Monday you buy lemons from the shop on credit (you will pay next week). You make lemonade and sell it on Saturday to the school canteen, which pays you the following Friday. For almost two weeks you have spent money (or owe it) and have nothing back. If the stand grows, that gap grows with it, and someone has to fund it.

![[09-working-capital-cycle.svg]]
*The working capital cycle: cash goes out to suppliers, sits in stock and then in unpaid invoices, and comes back from customers. The cash conversion cycle is the number of days the bank or the owners must fund.*

For a company: it buys raw materials (creating payables), holds them and turns them into products (inventory), sells on credit (receivables), and finally collects cash. The **cash conversion cycle** = stock days + debtor days - creditor days. For Fizz: 64 + 47 - 74 = 37 days. (The diagram uses a slightly different illustrative set: 60 + 45 - 32 = 73.) Fizz must fund 37 days' worth of its cost base at all times. A growing company needs more of it every year, which is why fast-growing, profitable companies run out of cash: the profit is in the warehouse and the debtors' ledger.

What the analyst looks for:

- **Trend.** Debtor days rising from 45 to 70 means customers are paying slower (perhaps because they are in trouble, or because the company is offering long terms to win sales, or because some invoices are disputed or fictitious).
- **Stock days rising** means goods are not selling: obsolescence, over-ordering, or a demand slump.
- **Creditor days rising** can mean the company is stretching its suppliers because it is short of cash. Suppliers eventually stop supplying.
- **Seasonality.** A toy maker's year-end balance sheet (after Christmas) looks nothing like its September one. Analysts ask for monthly figures or peak borrowing requirements.
- **The facility.** Working capital is usually financed with an overdraft, a revolving credit facility, or a borrowing base or receivables facility (see [[06 Specialised Finance - Project, Object, Commodities, Real Estate]] and [[08 Trade Finance and Guarantees]]). The analyst checks that the facility size matches the peak need and that the facility is not quietly funding losses.

## Cash flow forecasting and sensitivities

History tells you what the company has done; the loan will be repaid from what it does next. Every serious credit analysis includes a **forecast**, usually three to five years, of the income statement, balance sheet and cash flow statement, built in a spreadsheet model.

The forecast starts from the company's own budget or business plan, which the analyst treats with polite suspicion (management plans are optimistic by nature). The analyst then builds a **bank case** with more cautious assumptions, and runs **sensitivities**:

| Sensitivity | What it tests | Typical size |
|---|---|---|
| Revenue down | Demand shock, loss of a customer | 10% to 25% |
| Margin down | Input costs up, pricing pressure | 2 to 5 percentage points |
| Interest rates up | Floating-rate debt cost | 2 to 3 percentage points |
| Working capital stretch | Customers pay slower, stock builds | +15 to +30 days |
| Capex overrun | Investment project costs more | 20% to 30% |
| Delayed project or acquisition | Earnings arrive later | 1 year |
| Combined downside | Several of the above together | A plausible bad year |

For each case the analyst looks at the same questions: does the company still cover its interest and instalments (DSCR above 1), does it still comply with the covenants (see [[12 Loan Documentation, Covenants and Conditions]]), does it run out of facility headroom, and in which year. A credit that only works in the management case is a credit that does not work.

Worked example. Fizz asks for a new 100 loan to buy a bottling line that will add 200 of revenue at a 20% EBITDA margin from next year. The bank case assumes only 150 of extra revenue at 15%, giving extra EBITDA of 22.5 instead of 40. Debt rises to 485 and EBITDA to about 172, so net debt / EBITDA is 2.5x in the bank case and 2.2x in management's. The downside case (revenue 15% below bank case, margin 2 points lower) gives EBITDA of about 135, leverage of 3.1x, and interest cover of about 3.5x. The DSCR in the downside year 2 falls to 1.05x, which is tight, so the analyst proposes a lighter repayment schedule in years 1 and 2 and a covenant of net debt / EBITDA below 3.5x. That is how the forecast shapes the deal, not just the decision.

## Qualitative analysis

Numbers are the past; the qualitative story is why the future might differ. This is the part of credit analysis that models cannot do well, and the part where experienced analysts earn their keep.

**Management.** Who runs the company? Track record, depth (is it a one-person show?), succession, integrity (any history of litigation, regulatory trouble, aggressive accounting?), and incentives (do they own shares, are they paid for growth at any cost?). Analysts meet management, visit sites, and talk to the relationship manager, who knows the people. Owner-managed businesses bring key-person risk and the question of whether the owner is taking too much money out.

**Industry.** Is the industry growing, mature or shrinking? Cyclical (construction, cars, steel) or stable (food, utilities)? Regulated? Exposed to technology change, to commodity prices, to one big customer group (suppliers to supermarkets), to government spending? Banks keep **industry risk ratings** that feed the rating model, and set industry limits (see [[14 Risk Appetite, Limits and Concentration]]).

**Competitive position.** Within the industry, is this company a leader or a follower? Does it have something hard to copy: a brand, patents, a location, a cost advantage, customer contracts, scale? **Porter's five forces** is the standard checklist, and it works: how strong are the existing competitors, how easy is it for new ones to enter, how easy is it for customers to switch to a substitute, how much power do customers have over price, and how much power do suppliers have? A company squeezed on all five (a small manufacturer selling to supermarkets, buying from a global chemicals group, with cheap imports arriving) will have thin, volatile margins no matter how good management is.

**Customers and suppliers.** Concentration (one customer at 40% of sales is a credit risk in itself), contract length, dependence on a single supplier or country.

**Strategy and the purpose of the loan.** Does the plan make sense? Is the loan for something that generates cash to repay it (a machine, an acquisition with a clear rationale) or for something that does not (a dividend, repaying another lender, filling a hole)?

**Country and legal.** Where does the company earn, where does it hold its assets, and can the bank enforce its rights there? See [[26 Sovereign, Bank and Country Risk]].

**Environmental, social and governance factors**, increasingly: carbon exposure, regulatory risk, reputational issues. See [[25 Climate, ESG and Emerging Credit Risks]].

The qualitative assessment is written up in words, scored in the rating model as a set of questions, and should drive the analyst's willingness to **override** the model where the numbers miss something important (see [[10 Internal Ratings, Scorecards and PD Models]]).

## Peer comparison

A 15% EBITDA margin is excellent for a food distributor and terrible for a software company. The only way to know is to compare with peers: three to five companies in the same industry and of similar size, ideally from the bank's own portfolio (where it has the data) or from public filings. The comparison table in a credit paper usually shows revenue, growth, EBITDA margin, leverage, interest cover and return on capital for each. Being an outlier in either direction is interesting: much higher margins than peers may mean a genuine advantage or may mean aggressive accounting.

Peer data is also how the rating model was calibrated in the first place, so an analyst who understands where a borrower sits among its peers can predict what the model will say and spot when it has gone wrong.

## Sources and uses

For any new loan, the credit paper shows a simple two-column table: where the money is coming from (**sources**) and where it is going (**uses**). The two must add up.

| Uses | | Sources | |
|---|---|---|---|
| New bottling line | 100 | New bank term loan | 80 |
| Installation and working capital | 20 | Owners' cash injection | 20 |
| Repay existing overdraft | 30 | Cash on hand | 30 |
| **Total** | **150** | **Total** | **150** |

This looks trivial, and it catches a great deal: loans that quietly refinance other lenders, uses that do not generate cash, owners contributing less than they claim, and the real purpose of the money. In acquisitions and buyouts (see [[07 Leveraged and Acquisition Finance]]) it is the central table.

## Group structures and parent support

Most borrowers of any size are not one company but a **group**: a parent (holding company) with subsidiaries, sometimes dozens, in several countries. The analyst must know:

- **Which entity is borrowing?** The parent, an intermediate holding company, or an operating subsidiary? Each has a different balance sheet and different access to the group's cash.
- **Where is the cash generated and where are the assets?** A loan to a holding company whose only asset is shares in subsidiaries is **structurally subordinated**: the subsidiaries' own creditors get paid first from the subsidiaries' assets, and the holding company gets only what is left. Lenders fix this with guarantees from the operating companies, or by lending directly to them.
- **Consolidated versus entity accounts.** The group's consolidated accounts add everything together. A strong consolidated picture can hide a weak borrowing entity, and vice versa.
- **Intercompany flows.** Loans, dividends, management charges and transfer pricing between group companies can move cash and profit around. Lenders use covenants to restrict leakage (see [[12 Loan Documentation, Covenants and Conditions]]).

**Parent support** comes in grades, and the grade matters for the rating and for capital:

| Form of support | Legal force | Credit effect |
|---|---|---|
| Guarantee from the parent | Binding; parent must pay if the subsidiary does not | Rating can be lifted to the parent's; under Basel, substitution of the guarantor's PD or risk weight (see [[basel-credit-risk-explained-simply]]) |
| Letter of comfort or awareness | Usually not binding; a statement that the parent knows about the loan and intends to keep the subsidiary solvent | Some rating uplift at most; no capital benefit |
| Implicit support (strategic importance, shared name) | None | A judgement input to the rating; parents do abandon subsidiaries |
| Cross-default and cross-guarantees within the group | Binding | Pulls the whole group into default together; good for the lender's ranking, bad for contagion |

The connected-counterparty rules in [[14 Risk Appetite, Limits and Concentration]] require all these entities to be grouped for limit purposes, which makes the group structure a data problem as much as a credit one.

## Red flags and financial statement manipulation

Companies in trouble, or run by people with something to hide, produce numbers that look fine until they do not. Analysts learn a catalogue of warning signs.

**Red flags in the numbers:**

- Profit rising while operating cash flow is flat or falling (the classic).
- Receivables growing faster than sales; debtor days creeping up.
- Inventory growing faster than cost of sales.
- Capitalised costs rising (expenses moved to the balance sheet as "development" or "software" assets so they do not hit profit).
- Large or growing "other" or "exceptional" items every single year.
- Gross margin jumping without an obvious reason.
- Frequent changes of accounting policy, year end, or auditor; a qualified audit opinion; a small auditor for a large company.
- Late filing of accounts.
- Big gaps between the budget presented last year and the actual outcome.
- Related-party transactions: sales to or purchases from companies owned by the directors.
- Complex structures with no commercial reason: offshore entities, circular ownership.
- Reliance on short-term debt that must be refinanced constantly.

**Red flags in behaviour:**

- Management reluctant to provide information, or providing it late.
- Requests for urgent facility increases, especially at quarter or year end.
- Covenant breaches that are explained away.
- Key staff leaving (finance director especially).
- Bouncing payments, suppliers calling the bank, county court judgements, tax arrears.
- A sudden change in the story: a new strategy every meeting.

**How statements are manipulated** (knowing this is not cynicism; it is the job):

| Technique | How it works | How to spot it |
|---|---|---|
| Premature revenue recognition | Booking sales before goods are delivered or contracts are final | Receivables and unbilled revenue rising; cash flow lagging |
| Channel stuffing | Pushing stock to distributors at year end with the right to return | Spike in Q4 sales, returns in Q1 |
| Capitalising expenses | Treating running costs as investment | Intangible assets growing; capex far above depreciation with no visible new assets |
| Understating provisions | Not reserving for bad debts, warranties, lawsuits | Provision balance falling while the business grows |
| Off-balance-sheet debt | Leases, supply chain finance, factoring, joint ventures | Notes to the accounts; "trade payables" that are really bank debt |
| Round-tripping | Selling to and buying from a related party to create revenue | Related-party notes; customers that are also suppliers |
| Window dressing | Collecting cash and delaying payments just before year end | Monthly figures look different from year-end figures |
| Outright fraud | Invented customers, forged bank confirmations | Only caught by verification: calling customers, checking bank balances directly |

For a bank, the practical defences are: insist on audited accounts, read the notes and the audit report, ask for monthly management accounts and compare them with the annual ones, verify key facts independently (bank statements, customer confirmations, site visits), watch cash rather than profit, and escalate early to [[15 Monitoring, Early Warning and Watchlist]].

## The credit paper

The credit paper (credit memo, credit application, credit submission) is the document the analyst writes and the approver reads. A good one answers the approver's questions in the order they would ask them and makes the recommendation defensible years later, when someone is asking why the bank lent to a company that failed. Its structure varies by bank but almost always covers:

1. **Summary and recommendation.** What is being asked for (amount, product, tenor, pricing, security), the proposed rating, the key risks and the key mitigants, and the recommendation. One page. Many approvers read only this.
2. **The borrower.** Who they are, ownership and group structure, history, what they do, where.
3. **Purpose and sources and uses.** What the money is for and where the rest comes from.
4. **Industry and competitive position.** The qualitative analysis.
5. **Management.** Who, track record, integrity.
6. **Financial analysis.** Three to five years of historical statements, spread into the bank's standard format, the key ratios, the trends, and commentary on each statement. Peer comparison.
7. **Forecast and sensitivities.** The bank case, the downside cases, covenant headroom in each.
8. **Structure, security and documentation.** Facilities, ranking, collateral and its valuation, guarantees, covenants, conditions precedent. See [[11 Collateral and Security]] and [[12 Loan Documentation, Covenants and Conditions]].
9. **Rating.** The model output, any override and its justification, the resulting PD, LGD and expected loss. See [[10 Internal Ratings, Scorecards and PD Models]].
10. **Risk and return.** Exposure, RWA, capital consumed, pricing and whether it clears the return hurdle. See [[24 Pricing, RAROC and Return on Capital]].
11. **Portfolio and policy.** Fit with risk appetite, industry and country limits, connected exposures, any policy exceptions and why they are acceptable. See [[14 Risk Appetite, Limits and Concentration]].
12. **Key risks and mitigants**, as a table, and the **conditions** of approval.
13. **Appendices.** Full spreads, valuation reports, legal and other due diligence.

What a good one looks like: it leads with the conclusion; it says what could go wrong and why the bank would still get paid; it uses the bank's numbers, not the borrower's; it is specific ("the top customer is 35% of sales under a contract expiring in 18 months") rather than generic ("customer concentration is a risk"); it flags every policy exception explicitly; and it is short enough to read. What a bad one looks like: twenty pages of copied company history, ratios without commentary, a forecast that is the management case with a different font, and risks listed without mitigants or with mitigants that are really hopes.

In many banks the paper is generated partly by a system (spreading tool produces the ratio tables and charts, the rating tool produces the rating section, the pricing tool produces the return section) and partly written by hand. The annual review is a shorter version focused on what changed.

## Common mistakes and misunderstandings

- **Analysing profit instead of cash.** Profit is an opinion; cash is a fact. The cash flow statement comes first.
- **Trusting the management case.** Build a bank case. If the deal does not work in the bank case, it does not work.
- **Ratios without context.** A ratio is only meaningful against the company's own trend, its peers, and the industry. Thresholds in policy manuals are starting points.
- **Ignoring the notes to the accounts.** Off-balance-sheet debt, contingent liabilities, related parties and accounting policies live in the notes. The front pages are the marketing.
- **Confusing the borrowing entity with the group.** The consolidated accounts may be strong and the borrower may be an empty shell.
- **Treating a letter of comfort as a guarantee.** It is not, and the capital rules do not recognise it.
- **Using stale accounts.** A set of audited accounts can be 9 to 18 months old by the time it is analysed. Ask for management accounts.
- **Mistaking a liquidity problem for a solvency problem, or the reverse.** A profitable company can run out of cash (growth, seasonality); an unprofitable one can be cash-rich for a while (running down working capital, selling assets). The remedies are different.
- **Forgetting the working capital cycle when a company grows.** Growth consumes cash.
- **Letting the rating model replace the analysis.** The model is a summary of the analysis, not a substitute for it. Analysts who stop thinking because the model said "pass" are the ones regulators write about.

## What a platform lead needs to know about this

**Data.** The analyst's raw material is financial statements, and the first job of the platform is to capture them in a consistent structure: a **spreading** tool that takes accounts (PDF, XBRL, data from a provider) and maps them into the bank's standard template (a chart of a few hundred lines), with adjustments the analyst makes recorded and auditable. The spread is the source of the ratios, the rating model inputs, the covenant tests and the peer comparisons, so its quality determines everything downstream. Key data items: statement date, period length, audited or management, accounting standard (IFRS, US GAAP, local), currency, consolidated or entity, the full spread, analyst adjustments and their reasons, and the link to the legal entity and group in the customer master. Forecasts and sensitivities should be stored as structured data, not only as spreadsheets attached to a document, so that they can be compared with actuals later (the budget versus actual check is one of the best early warning tools, and almost no bank can run it automatically).

**Systems.** A typical landscape: a spreading and financial analysis tool (several market vendors); a rating tool (often the same vendor or built in-house; see [[10 Internal Ratings, Scorecards and PD Models]]); a credit workflow and paper-generation system; a document store; external data feeds (company registries, credit bureaus, agency ratings, news, industry benchmarks); and the customer and group master. The common failures: statements keyed in by hand with no validation (the balance sheet does not balance, the cash flow does not reconcile), ratios defined slightly differently in the spreading tool, the rating model and the covenant system so that the same company gets three different leverage numbers, and forecasts living only in spreadsheets on shared drives.

**Controls.** Four-eyes review of spreads; automatic checks that statements balance and reconcile; a single ratio dictionary used by every system; independent credit review of papers (see [[13 Credit Governance - Committees, Authorities and the Three Lines]]); annual review deadlines tracked and overdue reviews reported; policy exceptions flagged in the system, not just in the paper; override logging; and sample testing by credit review and internal audit of whether the analysis matches the data. See [[22 Credit Risk Data, Systems and BCBS 239]] for the data governance side.

**Who owns what.** Relationship managers gather the information and often write the first draft. Credit analysts (first line in some banks, second line in others; the arrangement varies) do the analysis and the rating. Credit officers or committees approve. Credit risk policy owns the ratio definitions and thresholds. Model risk owns the rating model. Finance owns the chart of accounts the spreads map to. The platform team owns the tools and the data flow between them, and is therefore the one that notices when the definitions disagree.

## Related notes

- [[00 Start Here]]
- [[01 What a Bank Is and How It Makes Money]]
- [[02 What Credit Risk Is]]
- [[03 The Credit Lifecycle]]
- [[04 Commercial and Corporate Lending]]
- [[05 Retail Lending]]
- [[06 Specialised Finance - Project, Object, Commodities, Real Estate]]
- [[07 Leveraged and Acquisition Finance]]
- [[08 Trade Finance and Guarantees]]
- [[10 Internal Ratings, Scorecards and PD Models]]
- [[11 Collateral and Security]]
- [[12 Loan Documentation, Covenants and Conditions]]
- [[13 Credit Governance - Committees, Authorities and the Three Lines]]
- [[14 Risk Appetite, Limits and Concentration]]
- [[15 Monitoring, Early Warning and Watchlist]]
- [[16 Problem Loans, Restructuring and Recovery]]
- [[22 Credit Risk Data, Systems and BCBS 239]]
- [[24 Pricing, RAROC and Return on Capital]]
- [[25 Climate, ESG and Emerging Credit Risks]]
- [[26 Sovereign, Bank and Country Risk]]
- [[28 Master Glossary]]
- [[basel-credit-risk-explained-simply]]
- [[basel-credit-risk-decision-tree]]
