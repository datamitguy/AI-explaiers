# What a Bank Is and How It Makes Money

**Why this matters to you.** You have joined a credit risk team, and everything that team does only makes sense once you understand the machine it sits inside. A bank is a surprisingly simple business at its core (take money in, lend it out, keep the difference) wrapped in a surprisingly complicated set of rules about how much of its own money it must keep in reserve. Credit risk is the single biggest reason those rules exist. If you understand where a loan sits on the bank's balance sheet, why a few percentage points of bad loans can sink a bank, and which teams argue with each other about lending decisions, you will understand why your platform matters and who will be shouting at you when it goes down.

## Table of contents

1. [The lemonade stand version](#the-lemonade-stand-version)
2. [Deposits and loans: the two halves of the machine](#deposits-and-loans-the-two-halves-of-the-machine)
3. [Net interest margin: the main way a bank earns](#net-interest-margin-the-main-way-a-bank-earns)
4. [Fee income: the other way a bank earns](#fee-income-the-other-way-a-bank-earns)
5. [The balance sheet: what a bank owns and owes](#the-balance-sheet-what-a-bank-owns-and-owes)
6. [Equity, capital and leverage](#equity-capital-and-leverage)
7. [The income statement: a year in the life](#the-income-statement-a-year-in-the-life)
8. [A worked example: Lemonade Bank](#a-worked-example-lemonade-bank)
9. [Liquidity versus solvency](#liquidity-versus-solvency)
10. [Bank runs and why banks are regulated](#bank-runs-and-why-banks-are-regulated)
11. [The main divisions of a bank](#the-main-divisions-of-a-bank)
12. [Where the credit risk team sits and who it talks to](#where-the-credit-risk-team-sits-and-who-it-talks-to)
13. [Common mistakes and misunderstandings](#common-mistakes-and-misunderstandings)
14. [What a platform lead needs to know about this](#what-a-platform-lead-needs-to-know-about-this)
15. [Related notes](#related-notes)

## The lemonade stand version

Imagine you run a lemonade stand and your friends trust you to look after their pocket money. You promise two things: they can have it back whenever they ask, and you will pay them a little extra each month for the favour. While you hold their money you do not leave it in a jar. You lend it to other children who want to buy a bike, and you charge them more than you pay your friends. The gap is your profit.

That is a bank. Everything else in this note is detail on top of that picture:

- The pocket money your friends hand you is **deposits**.
- The money you lend to the bike-buyers is **loans**.
- The "little extra" you charge or pay is **interest**.
- The money you put into the stand from your own savings, so that you can absorb a bike-buyer disappearing without short-changing your friends, is **capital** (also called **equity**).

The catch, and the reason your job exists, is that the money a bank lends out is mostly not its own. If enough bike-buyers never pay back, the bank cannot return its friends' deposits. That is how banks fail, and when a big bank fails, a whole country can have a bad decade. Governments therefore write detailed rules about how banks lend. The best-known set of those rules is described in [[basel-credit-risk-explained-simply]] and [[18 Regulatory Capital and Basel - the Short Version]].

## Deposits and loans: the two halves of the machine

### Deposits: money the bank owes

When you put 100 into a bank account, the bank does not keep your 100 in a drawer with your name on it. It records that it **owes** you 100 and then uses the money. From the bank's point of view, your deposit is a debt. Banks group deposits into types because they behave differently:

| Type of deposit | What it is | How quickly it can leave | What the bank pays |
|---|---|---|---|
| Current account (US: checking) | Everyday money for bills and salary | Instantly | Little or nothing |
| Savings or instant access | Money set aside but available on demand | Instantly or within a day | A modest rate |
| Notice or fixed-term deposit | Money locked up for 30 days, a year, or longer | Only at the end of the term (or with a penalty) | A higher rate |
| Corporate and wholesale deposits | Large sums from companies, pension funds, other banks | Often instantly, and these customers move fast | Close to market rates |

The mix matters. A bank funded mostly by sleepy household current accounts has cheap, sticky money. A bank funded by big corporate deposits that chase the best rate has expensive, flighty money. Treasury (described later) spends its life worrying about this.

### Loans: money the bank is owed

The other half is lending. A loan is a promise by a borrower to repay the bank, with interest, on an agreed schedule. The bank treats that promise as something it owns, because the money is coming back to it. The main families are:

| Loan family | Who borrows | Typical size | Typical life | Covered in |
|---|---|---|---|---|
| Mortgages | Households buying homes | Tens or hundreds of thousands | 20 to 35 years | [[05 Retail Lending]] |
| Credit cards, personal loans, car finance | Households | Hundreds to tens of thousands | Months to 7 years | [[05 Retail Lending]] |
| Small and medium-sized enterprise (SME) and mid-market lending | Businesses | Thousands to tens of millions | 1 to 10 years | [[04 Commercial and Corporate Lending]] |
| Large corporate and syndicated loans | Big companies | Hundreds of millions upwards | 3 to 7 years | [[04 Commercial and Corporate Lending]] |
| Specialised finance | A project, a ship, a building | Tens of millions upwards | 5 to 25 years | [[06 Specialised Finance - Project, Object, Commodities, Real Estate]] |
| Trade finance | Importers and exporters | Varies widely | Weeks to months | [[08 Trade Finance and Guarantees]] |

Besides loans, a bank also lends by **buying bonds**. A bond is a loan chopped into tradeable pieces: when a government or company issues a bond, whoever buys it has lent the issuer money. From a credit risk point of view, a bond is a loan that happens to be easy to sell on.

## Net interest margin: the main way a bank earns

Go back to the stand. You pay your friends 1 coin per 100 per year. You charge bike-buyers 5 coins per 100 per year. On every 100 coins that pass through, you keep 4. That gap is called the **net interest margin**, usually shortened to **NIM**.

In banking language:

- **Interest income** is everything the bank earns on loans and bonds.
- **Interest expense** is everything it pays on deposits and other borrowing.
- **Net interest income** (**NII**) is the difference.
- **Net interest margin** is net interest income divided by the assets that earn interest, expressed as a percentage.

For most ordinary banks, net interest income is well over half of all revenue. A typical NIM for a high-street bank is somewhere in the low single digits of a percent, often between 1% and 3%, though it varies a great deal by country and by the kind of lending. That sounds tiny, but it is earned on an enormous pile of money. A bank with 100 billion of loans and a 2% margin earns 2 billion a year before costs.

Two things squeeze the margin:

1. **Competition.** If every bank wants to lend to the same safe borrower, the price of that loan falls.
2. **Bad loans.** If 1 in 100 borrowers does not pay, that is 1 coin lost per 100 lent, which eats a quarter of your 4-coin margin. That is why credit risk is not a side show. It is the main thing that decides whether the margin ends up as profit or as loss.

Notice an uncomfortable fact: the riskiest loans pay the highest interest. A bank that wants a fat margin is tempted to lend to people more likely to default. Half of credit risk management is stopping that temptation from quietly growing.

## Fee income: the other way a bank earns

Banks also charge for doing things, not just for lending. This is **non-interest income** or **fee income**. Examples:

| Fee type | What you are paying for | Which division earns it |
|---|---|---|
| Account and card fees | Running your account, foreign transactions, overdraft usage | Retail |
| Arrangement and commitment fees | Setting up a loan, keeping an unused credit line open | Commercial and corporate |
| Trade finance fees | Issuing a letter of credit or guarantee | Corporate and trade finance |
| Advisory and underwriting fees | Helping a company sell shares or bonds, advising on a takeover | Investment banking |
| Trading income | Buying and selling currencies, bonds, derivatives for customers | Markets |
| Wealth and asset management fees | Managing investments for customers | Wealth |
| Insurance commissions | Selling insurance alongside loans | Retail and commercial |

Fee income is attractive to a bank because, unlike a loan, a fee does not sit on the balance sheet for years waiting to go wrong. But some fee businesses carry their own credit risk. A guarantee, for example, earns a fee today and may turn into a loan tomorrow if the customer fails. See [[08 Trade Finance and Guarantees]].

## The balance sheet: what a bank owns and owes

A **balance sheet** is a snapshot, on one day, of everything a business owns and everything it owes. It always has two sides that add up to the same total, which is why it is called a balance sheet.

- **Assets** are things the business owns or is owed. For a bank, the biggest asset by far is its loans, because the borrowers owe the bank money.
- **Liabilities** are things the business owes to others. For a bank, the biggest liability is deposits, because the bank owes that money back.
- **Equity** (also called shareholders' funds or capital) is what is left when you subtract liabilities from assets. It is the owners' share.

Newcomers find the bank balance sheet upside down compared with their own. For you, your bank deposit is an asset (money you have). For the bank, that same deposit is a liability (money it owes). For you, your mortgage is a liability. For the bank, it is an asset. Keep this flip in your head and most bank accounting stops being confusing.

![[01-bank-balance-sheet.svg]]
*A simplified bank balance sheet as stacked boxes. Assets on top total 100; liabilities and equity below also total 100. Loans are the biggest asset, deposits the biggest liability, and equity is the thin cushion that absorbs loan losses first.*

Here is the same picture as a table, using illustrative numbers for a made-up bank:

| Assets (what it owns) | Amount | Liabilities and equity (where the money came from) | Amount |
|---|---|---|---|
| Cash and reserves at the central bank | 10 | Customer deposits | 70 |
| Government and other bonds | 15 | Wholesale funding and bonds issued | 15 |
| Loans to customers | 65 | Subordinated debt | 5 |
| Other (buildings, systems, derivatives) | 10 | Equity (capital) | 10 |
| **Total** | **100** | **Total** | **100** |

Some vocabulary you will hear around the balance sheet:

- **Funded** versus **unfunded**. A funded exposure is a loan where the money has gone out of the door and sits on the balance sheet. An unfunded exposure is a promise (a credit line not yet drawn, a guarantee) that is not on the balance sheet yet but could become a loan. Unfunded items are called **off-balance sheet**. Credit risk cares about both. See [[02 What Credit Risk Is]].
- **Banking book** versus **trading book**. The banking book is the pile of loans and bonds the bank intends to keep. The trading book is the pile it intends to buy and sell. Credit risk mostly lives in the banking book. [[basel-credit-risk-explained-simply]] explains the split.
- **Provisions**. Money set aside on the balance sheet against loans the bank expects to lose on. Provisions reduce the value of the loan asset. Covered in [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]].

## Equity, capital and leverage

Look again at the table. The bank owns 100 of assets but only 10 of that is its own money. The other 90 belongs to depositors and other lenders. The ratio between assets and equity is called **leverage**. Here it is 10 to 1.

Why does this matter? Because losses hit equity first. If 5 of the 65 of loans turn bad and are never repaid, assets fall to 95. The bank still owes 90. Equity falls from 10 to 5. The owners have lost half their money, but every depositor is still whole. If 12 of loans go bad, assets fall to 88, the bank owes 90, and it is **insolvent**: it cannot pay everyone back even if it sells everything. At 10 to 1 leverage, losing just over a tenth of your loans is fatal.

This is why bank regulation is obsessed with capital. The Basel rules, summarised in [[18 Regulatory Capital and Basel - the Short Version]], force banks to hold capital in proportion to how risky their loans are, measured through **risk-weighted assets** (**RWA**). The riskier the lending, the bigger the cushion required. Your credit risk team produces the numbers (probability of default, loss given default, exposure at default) that feed that calculation, which is why your data pipeline ends up in front of regulators.

A note on words. In everyday speech "capital" means any money used in a business. In banking it has a precise meaning: the part of the balance sheet that can absorb losses without the bank breaking a promise to anyone. The best quality piece is ordinary shares plus profits the bank has kept, called **Common Equity Tier 1** (**CET1**).

## The income statement: a year in the life

The balance sheet is a snapshot. The **income statement** (also called the profit and loss account, or **P&L**) is the film: what happened over a year. A bank's income statement reads roughly like this, with illustrative numbers:

| Line | Amount | What it means |
|---|---|---|
| Interest income | 5.0 | Earned on loans and bonds |
| Interest expense | (2.0) | Paid on deposits and borrowing |
| **Net interest income** | **3.0** | The margin |
| Fee and commission income | 1.2 | Fees, trading, advisory |
| **Total income** | **4.2** | |
| Operating costs | (2.4) | Staff, branches, technology, your platform |
| **Pre-provision profit** | **1.8** | What is left before bad loans |
| Impairment charge (credit losses) | (0.6) | Money set aside for loans going bad |
| **Profit before tax** | **1.2** | |
| Tax | (0.3) | |
| **Profit after tax** | **0.9** | Paid out as dividends or kept as capital |

The line to stare at is **impairment charge**, sometimes called **loan loss provisions** or **expected credit loss charge**. It is credit risk's direct line on the income statement. In a calm year it might eat a fifth of pre-provision profit. In a bad year, like 2008 or 2020, it can eat all of it and more, and the bank reports a loss. The size of that line is driven by models and processes your team runs, which is covered in [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]].

The **cost to income ratio** (operating costs divided by total income, here 2.4 divided by 4.2, about 57%) is the number executives use to judge how efficient the bank is. Technology spend sits inside those costs, so expect every platform investment to be weighed against it.

## A worked example: Lemonade Bank

Let us build a tiny bank from scratch with round numbers.

**Day one.** Two founders put in 10 of their own money. The bank has assets of 10 (cash) and equity of 10.

**Week one.** Customers deposit 90. Assets are now 100 (all cash), liabilities 90, equity 10.

**Month one.** The bank keeps 15 in cash and bonds for safety and lends out 85 across mortgages, business loans and credit cards. Assets are still 100 (15 liquid, 85 loans), liabilities 90, equity 10.

**Year one, income.** The loans earn an average of 6%: 85 x 6% = 5.1. The deposits cost an average of 2%: 90 x 2% = 1.8. Net interest income is 3.3. The bank also earns 0.7 in fees. Total income 4.0. Running costs are 2.3. Pre-provision profit is 1.7.

**Year one, credit losses.** Of the 85 lent, borrowers owing 1.3 default. The bank expects to recover 0.5 of that from selling houses and cars, so the loss is 0.8. The impairment charge is 0.8. Profit before tax is 1.7 minus 0.8 = 0.9. After tax at 25%, profit is about 0.7.

**What happens to the profit.** The founders pay themselves a dividend of 0.3 and keep 0.4 in the bank. Equity is now 10.4. The bank's capital cushion grew because it was profitable and did not pay everything out. This is the normal, healthy way banks build capital.

**A bad year instead.** Suppose a recession hits and borrowers owing 6 default, with only 2 recovered. The loss is 4. Pre-provision profit of 1.7 minus 4 gives a loss of 2.3. Equity falls from 10 to 7.7. The bank survives, but its leverage has gone from 10 to 1 to about 13 to 1, and regulators will demand it rebuild. If the loss had been 12 instead of 4, equity would be gone and the bank would have failed.

Notice the asymmetry. The good year added 0.4 to equity. The bad year removed 2.3. It takes six good years to recover from one bad one. That is the mathematics behind every cautious credit officer you will meet.

## Liquidity versus solvency

Two words that sound similar and are often muddled.

**Solvency** is whether you have more than you owe. Lemonade Bank with assets of 100 and liabilities of 90 is solvent. If loan losses pushed assets below 90, it would be insolvent. Solvency is a question about the balance sheet as a whole.

**Liquidity** is whether you have cash on the day you need it. Lemonade Bank is solvent, but 85 of its 100 assets are loans that will not be repaid for years. If depositors suddenly asked for 30 back tomorrow, the bank only has 15 in cash and bonds. It is solvent but **illiquid**. It would have to sell loans in a hurry at bad prices, or borrow from other banks or the central bank.

The school version: you own a bike worth 200 but have 2 in your pocket, and the ice-cream van only takes cash. You are solvent (your stuff is worth more than you owe) but illiquid (you cannot buy the ice cream right now).

The two problems feed each other. A bank that is illiquid and has to sell loans at a discount makes losses, which can make it insolvent. A bank that is rumoured to be insolvent sees depositors flee, which makes it illiquid. Regulators therefore set rules for both: capital rules for solvency and liquidity rules (the **liquidity coverage ratio** and **net stable funding ratio**, which require banks to hold enough easy-to-sell assets to survive 30 days of outflows and to fund long loans with long money) for liquidity. Credit risk is mainly a solvency topic, but a big wave of defaults can trigger a liquidity crisis as well.

## Bank runs and why banks are regulated

A **bank run** is what happens when many depositors try to withdraw at once. Because the bank has lent most of the money out, it cannot pay everyone, even if it is perfectly solvent. The first people in the queue get their money; the last do not. Knowing this, everyone rushes to be first, which guarantees the run. It is a self-fulfilling panic.

Historically runs involved queues outside branches. Modern runs happen on phones: in 2023 a mid-sized American bank lost tens of billions of deposits in a single day through app withdrawals, far faster than any physical queue could manage.

Governments have built three layers of defence:

1. **Deposit insurance.** The state promises to repay depositors up to a limit (the limit varies by country) even if the bank fails. If your money is safe either way, you have no reason to run.
2. **Central bank lending.** The central bank acts as "lender of last resort," lending cash to a solvent-but-illiquid bank against its good loans as collateral, so the bank can meet withdrawals.
3. **Prudential regulation.** Rules about how much capital and liquidity a bank must hold, how it must manage risk, and how it will be wound down if it fails. The capital part is where Basel and your credit risk team come in.

Why regulate so heavily, when we do not regulate lemonade stands? Three reasons:

- **Other people's money.** The bank is playing with deposits, not its own cash. Depositors cannot realistically check whether their bank is lending wisely.
- **Contagion.** Banks lend to each other and hold each other's bonds. One failure spreads.
- **The economy runs through them.** Payments, salaries, mortgages and business lending all stop when a bank stops.

So the deal is: the state protects depositors and stands behind the bank in a crisis, and in exchange the bank submits to supervision, holds capital against its risks, and reports in enormous detail. Credit risk is the biggest of those risks for almost every ordinary bank, which is why your team's data ends up in regulatory returns described in [[23 Reporting - Regulatory Returns, Pillar 3 and Management Information]].

## The main divisions of a bank

"The bank" is thousands of people. Here is the usual shape of a large universal bank. Smaller banks collapse some of these together; names vary a lot.

| Division | What it does | How it makes money | Main risk it creates |
|---|---|---|---|
| **Retail banking** | Current accounts, savings, mortgages, credit cards, personal loans, for individuals and tiny businesses | Net interest margin on a huge number of small loans, plus account and card fees | Credit risk on many small, statistically managed loans |
| **Commercial (or business) banking** | Lending and accounts for SMEs and mid-sized companies | Margin on loans and overdrafts, fees, cash management | Credit risk assessed case by case |
| **Corporate and investment banking (CIB)** | Lending to large companies, syndicated loans, bond and share issuance, takeover advice, trading in bonds, currencies and derivatives | Fees, trading income, margin on big loans | Credit risk on large names, counterparty risk, market risk |
| **Wealth and private banking** | Investments and lending for wealthy individuals | Management fees, margin on lending against investments | Credit risk against financial collateral, conduct risk |
| **Treasury** | Manages the bank's own cash, funding, liquidity and capital; sets internal interest rates between divisions | Not a profit centre in the usual sense; manages the gap between what the bank pays and earns | Liquidity risk, interest rate risk |
| **Risk** | Independent oversight of all the risks above: credit, market, liquidity, operational, model, compliance | Does not earn; its job is to say no, or "yes, but" | Owns the frameworks that measure risk |
| **Finance** | Keeps the books, produces the balance sheet and income statement, files regulatory returns, calculates provisions with Risk | Does not earn | Reporting accuracy |
| **Operations** | Opens accounts, processes payments, services loans, manages collateral and documents, runs collections | Does not earn | Operational risk |
| **Technology and data** | Builds and runs the core banking systems, data warehouses, risk engines, channels | Does not earn | Operational and cyber risk |
| **Internal audit** | Checks that everyone else is following the rules; reports to the board, not the executives | Does not earn | None, by design |
| **Compliance and legal** | Make sure the bank follows laws: anti-money laundering, conduct, sanctions, contracts | Does not earn | Regulatory and conduct risk |

The bank organises risk management into what everyone calls the **three lines of defence**:

- **First line**: the businesses that take risk (retail, commercial, CIB, treasury). They own their risks and are supposed to manage them day to day.
- **Second line**: the independent risk and compliance functions, led by the **Chief Risk Officer** (**CRO**). They set policy, approve big exposures, measure, challenge and report.
- **Third line**: internal audit, which checks that the first two lines are doing what they claim.

This structure is covered properly in [[13 Credit Governance - Committees, Authorities and the Three Lines]].

## Where the credit risk team sits and who it talks to

![[01-bank-org-map.svg]]
*A simplified organisation map. Credit risk sits in the second line under the Chief Risk Officer. Dashed lines show its main working relationships: deals and data from the front-line businesses, provisions and risk-weighted assets to Finance, models and data to Technology.*

The credit risk function is normally part of the second line under the CRO. Inside it you will typically find several sub-teams, and your platform will serve most of them:

| Credit risk sub-team | What they do all day | What they need from a platform |
|---|---|---|
| **Credit sanctioning / credit officers** | Review and approve or decline individual lending proposals above the front line's own authority | A workflow tool with the proposal, the rating, the exposure, the history, and a clear audit trail of who approved what |
| **Credit policy** | Write the rules: what the bank will and will not lend against, maximum loan-to-value, required covenants | Policy rules encoded in decision engines; evidence that exceptions are tracked |
| **Credit risk modelling / analytics** | Build and maintain probability of default, loss given default and exposure models, scorecards | Clean historical data, a model execution environment, version control, monitoring |
| **Portfolio management** | Watch the whole book: concentrations, sector trends, limits, early warning | Aggregated exposure data, limits monitoring, dashboards |
| **Provisioning / impairment** | Calculate expected credit losses with Finance each quarter | Model outputs, staging logic, scenario data, reconciliation to the ledger |
| **Credit risk reporting** | Produce management information, regulatory returns, board packs | Reliable, reconciled, lineage-tracked data on a deadline |
| **Problem loans / workout** | Manage borrowers in trouble, restructure, recover | Case management, collateral records, recovery tracking |

Who credit risk talks to, and about what:

- **Relationship managers and the front line** bring deals and want them approved. Credit risk is the second opinion. The relationship is cooperative on a good day and adversarial on a bad one. Both sides use the same platform, which is why access control and audit trails matter.
- **Finance** needs the impairment numbers for the income statement and the risk-weighted assets for capital ratios. The quarterly close is the moment when credit risk's data must reconcile to the general ledger to the penny. Expect late nights.
- **Treasury** needs to know how much capital the loan book consumes so it can plan funding and capital issuance.
- **Operations** holds the loan records, collateral records and collections processes that credit risk's data comes from. If Operations enters a collateral value wrongly, credit risk's loss given default is wrong.
- **Technology and data** builds the plumbing. Credit risk is one of the heaviest data consumers in the bank, pulling from the core banking system, collateral systems, customer systems, bureau feeds, market data and finance ledgers. The regulatory expectation that this plumbing is accurate, complete and timely is described in [[22 Credit Risk Data, Systems and BCBS 239]].
- **Model risk management and validation** independently check the models the credit modelling team builds. See [[21 Model Risk Management and Validation]].
- **Internal audit** and **the regulator** inspect everything above, including the platform. Regulators visit, ask for evidence, and issue findings that must be fixed by a deadline.
- **The board risk committee** sets the risk appetite (how much credit risk the bank is willing to take) and receives reports showing whether the bank is inside it. See [[14 Risk Appetite, Limits and Concentration]].

## Common mistakes and misunderstandings

- **"A deposit is the bank's money."** It is not. It is a debt. The bank owes it back. The bank's own money is equity, which is a small fraction of the total.
- **"Banks lend out deposits."** Mostly true in spirit, but the order is often reversed: when a bank makes a loan, it credits the borrower's account, creating a new deposit. Lending creates deposits as much as deposits allow lending. Either way, the bank must fund the loan with something, and capital rules limit how much it can lend.
- **"A bank with lots of assets is safe."** Assets are only worth what borrowers repay. A bank with 100 of loans and 90 of deposits is one bad year from failure. What matters is the quality of assets relative to the thin equity cushion.
- **"Liquidity and solvency are the same thing."** A solvent bank can still fail from a run; an illiquid bank is not necessarily broke. The remedies are different (central bank lending versus new capital).
- **"Credit losses are an occasional surprise."** They are an expected, continuous cost of lending, budgeted every quarter. The surprise is only their size in a bad year. See [[02 What Credit Risk Is]].
- **"Fee businesses have no credit risk."** Guarantees, letters of credit and undrawn credit lines earn fees and still carry credit risk because they can turn into loans.
- **"Risk is the department that says no."** Risk's job is to make sure the bank takes the risks it intends to take, at a price that pays for them, and not the ones it does not. Most proposals are approved, often with conditions.
- **"Higher interest income is always good."** Higher interest usually means higher risk. A rising margin can be the first sign that the bank is quietly moving down the quality ladder.

## What a platform lead needs to know about this

**Data.** The balance sheet and income statement are built from the same records your platform serves. The loan balance in the core banking system, the collateral value in the collateral system, the customer's rating in the rating system and the provision in the impairment engine must all describe the same loan on the same date. The single hardest recurring problem in credit risk data is that these systems disagree, and someone has to reconcile them. Learn early which system is the "golden source" for each field, and where the reconciliations live. [[22 Credit Risk Data, Systems and BCBS 239]] goes deep on this.

**Systems.** Expect a landscape, not a system: a core banking platform (often old, often several, one per product or legacy acquisition), a customer master, a collateral register, a rating or scoring engine, a decision engine for retail, a limits system, an impairment engine, a regulatory capital engine, a data warehouse or lake, and a reporting layer on top. Your platform may be one of these or the glue between them.

**Calendar.** The bank runs on cycles that will shape your release schedule: month-end and quarter-end close (Finance needs impairment and RWA numbers), the annual budget, regulatory return deadlines, stress testing windows ([[20 Stress Testing and ICAAP]]), and model recalibration cycles. Deploying a change to a risk calculation the week before quarter-end is how people lose friends.

**Controls.** Because the output goes to the regulator and the published accounts, everything your platform does needs an audit trail: who changed what calculation, when, who approved it, and what the number was before. Change management, access control, segregation of duties (the person who builds the model should not be the person who approves it) and reconciliation controls will be inspected by internal audit and by the regulator.

**Who owns what.** Credit risk owns the methodology and the numbers. Finance owns the ledger and the published figures. Technology owns the platform's availability and security. Operations owns the source data quality. The data office (if there is one) owns data standards and lineage. When something is wrong, the first argument is always about whose problem it is; a clear ownership map saves weeks. [[27 A Platform Lead's First 90 Days]] has a checklist for finding these owners.

**Money.** Your platform's cost sits in the "operating costs" line and competes with branches, marketing and everything else. The case for investment is usually made in terms of regulatory findings avoided, capital saved through better models (a lower RWA frees capital the bank can lend out), faster credit decisions (more lending, same risk), or lower losses (better early warning). Learn to translate technical improvements into those four currencies.

## Related notes

- [[00 Start Here]]
- [[02 What Credit Risk Is]]
- [[03 The Credit Lifecycle]]
- [[04 Commercial and Corporate Lending]]
- [[05 Retail Lending]]
- [[13 Credit Governance - Committees, Authorities and the Three Lines]]
- [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]]
- [[18 Regulatory Capital and Basel - the Short Version]]
- [[22 Credit Risk Data, Systems and BCBS 239]]
- [[27 A Platform Lead's First 90 Days]]
- [[28 Master Glossary]]
- [[basel-credit-risk-explained-simply]]
- [[basel-credit-risk-decision-tree]]
