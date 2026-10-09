# Collateral and Security

**Why this matters to you.** Almost every loan your platform will hold data about has something standing behind it: a house, a factory, a pile of invoices, a parent company's promise. That "something" is what the bank falls back on when the borrower stops paying, and it is the single biggest driver of how much the bank actually loses when things go wrong. Yet collateral data is, in most banks, the messiest data in the whole credit estate: spread across registries, spreadsheets, document archives and the core lending system, with valuations that are years old and legal statuses nobody has checked. If you understand what collateral is, how it is taken and valued, and what the regulator will and will not give credit for, you will understand why the risk team keeps asking for a "collateral management system" and why it is so hard to build one well.

## Table of contents

1. Why collateral exists
2. Collateral, security and guarantees: three different things
3. The types of collateral in detail
4. The legal forms: how the bank gets a grip on the asset
5. Registration, perfection, priority and ranking
6. Guarantees and why letters of comfort are weak
7. Valuation: who, how often, and which value
8. Haircuts and loan-to-value
9. Monitoring and margin calls
10. The Basel eligibility rules in plain words
11. Collateral management systems and the data they must hold
12. A worked example from start to finish
13. Common failures
14. Common mistakes and misunderstandings
15. What a platform lead needs to know about this
16. Related notes

## 1. Why collateral exists

Imagine you lend your bike to a classmate for the weekend. You trust them, mostly, but bikes get lost and classmates move away. So you say: "Leave your games console with me until you bring the bike back." Now, if the bike never comes back, you are not empty-handed. You can keep or sell the console. That console is collateral.

Notice three things about this arrangement, because they are exactly the three things a bank cares about:

- You have to actually be able to **take** the console. If your classmate just promises "I'll give it to you if anything happens," that promise is worth much less than having it in your cupboard.
- The console has to be **worth enough**. If it is a broken ten-year-old model, it does not cover the value of the bike.
- The console's value has to **hold up** over the weekend. If a new model launches on Saturday and the old one becomes worthless, your protection has melted.

In banking, collateral exists for the same reason. [[02 What Credit Risk Is]] explains that a bank's loss on a loan is the probability of default multiplied by the loss given default multiplied by the exposure. Collateral attacks the middle term. A loan to a shaky company with no collateral might lose 60 cents in the pound if the company fails; the same loan secured on a good building might lose only 15 cents. The bank still would rather the borrower just paid, and good credit analysis ([[09 Credit Analysis - Reading a Borrower]]) is always the first defence. There is an old banker's saying that you should never lend against collateral alone, because if you expect to have to sell the collateral, you should not be making the loan. Collateral is the second way out, not the first.

Collateral also does something subtler: it changes the borrower's behaviour. A business owner who has pledged their own house to the bank will work much harder to keep the business alive. This is sometimes called "skin in the game."

## 2. Collateral, security and guarantees: three different things

People use these words loosely. In a bank they have distinct meanings, and your data model should keep them apart.

| Term | What it means | Everyday version |
|---|---|---|
| **Collateral** | A specific asset that the lender can take and sell if the borrower fails to pay. | The games console in your cupboard. |
| **Security** | The legal right that gives the lender a claim over an asset. Collateral is the thing; security is the legal grip on the thing. People say "we took security over the property." | The note your classmate signed saying "you may keep the console if I do not return the bike." |
| **Guarantee** | A promise by a third party (not the borrower) to pay if the borrower does not. There is no asset to sell; there is another person to chase. | Your classmate's older sister saying "if my brother loses your bike, I will pay for it." |
| **Credit support** or **credit enhancement** | An umbrella term for anything that makes a loan safer, including all of the above plus things like insurance and netting. | The whole bundle of arrangements. |

The practical difference between collateral and a guarantee is enormous. With collateral, the bank's recovery depends on the value of an asset and the legal process to sell it. With a guarantee, recovery depends on whether the guarantor is itself able and willing to pay, which means the bank has to analyse the guarantor as if it were a second borrower. A guarantee from a wealthy parent company is excellent. A guarantee from a shell company with no assets is a piece of paper.

The Basel rules, explained in section 10, treat these differently too: collateral reduces the exposure or the loss given default, while a guarantee lets the bank swap the borrower's risk weight for the guarantor's.

![[11-collateral-taxonomy.svg]]
*The family tree of credit protection: collateral (an asset the bank can sell) on one branch, third-party support (a promise) on the other, with the main types under each.*

## 3. The types of collateral in detail

Below is each major type with the practical angle a credit officer would give you: how easy it is to take, how easy to value, how easy to sell, and the catches.

### Cash and deposits

The gold standard. A borrower places money on deposit with the bank, and the bank takes a charge over the deposit so it can be set off against the loan. The value is certain, there is no selling to do, and there is no haircut. The catches are legal: the deposit must be with the lending bank (or the arrangement must be watertight if it is elsewhere), the bank must have a legal right of set-off, and in some countries a deposit charged to secure a loan from the same bank raises odd legal questions that lawyers have to deal with. In practice cash collateral is common in trade finance ([[08 Trade Finance and Guarantees]]) and derivatives ([[19 Counterparty Credit Risk and Derivatives]]), where it is posted as margin.

### Financial securities

Government bonds, corporate bonds, listed shares, units in investment funds, gold. These are good collateral because they have an observable market price every day and can be sold quickly. The quality varies enormously: a bond issued by a strong government is almost as good as cash; shares in a small listed company can halve in a week. That is why haircuts (section 8) range from near zero to 25% or more. The catch is custody: the bank must either hold the securities itself or have a legal arrangement with the custodian so that the borrower cannot sell them from underneath the bank.

### Residential property

Houses and flats. The backbone of [[05 Retail Lending]]. Well understood, with deep markets, professional valuers, and public land registries in most developed countries. Catches: values move with the economy (and fall exactly when borrowers are losing jobs, which is the worst possible correlation), selling a repossessed home takes months and is politically and legally sensitive, and in many countries there are strong consumer protections that slow enforcement.

### Commercial property

Offices, shops, warehouses, hotels. Core to [[06 Specialised Finance - Project, Object, Commodities, Real Estate]]. Valued mostly on the rent it produces, so the value depends on tenants, lease lengths and the state of the sector. Much more volatile than residential: office values in a city can fall 30% to 40% in a downturn, and the market can freeze entirely so that there is no buyer at any sensible price. Specialist valuers are essential.

### Land

Land with planning permission for development is valuable; land without it may be worth very little. Agricultural land is a different market again. Land produces no income while it sits there, so a borrower in trouble cannot use it to pay interest. Valuation is subjective and the market is thin.

### Plant and machinery

Factory equipment, production lines, printing presses. The problem is that much of it is specialised: a machine built to make one company's product has few other buyers. Often it is bolted to the floor and expensive to remove. Values drop sharply in a forced sale, so haircuts are large (50% or more is not unusual). The bank needs an asset register, serial numbers, and a valuer who understands that industry.

### Vehicles

Cars, vans, trucks, buses. A big category in retail (car loans) and in asset finance. Values are well understood from trade guides, there are liquid second-hand markets, and most countries have a registry for charges over vehicles. The catch is that vehicles move: they can be driven across a border, sold privately, or simply hidden. Depreciation is fast and predictable.

### Ships and aircraft

The classic "object finance" collateral. Both have international registries where mortgages are recorded, and both have active second-hand markets with specialist brokers. Values swing with the shipping and airline cycles. Enforcement means physically arresting a ship in a friendly port or repossessing an aircraft, both of which need specialist lawyers and a bit of luck about where the asset is on the day.

### Receivables

The invoices a business is owed by its customers. If a factory has sold goods worth 2 million to supermarkets and the supermarkets have not yet paid, those 2 million of invoices are an asset that can be assigned to the bank. Receivables are the basis of invoice finance and borrowing-base lending ([[04 Commercial and Corporate Lending]]). Their value depends on the creditworthiness of the customers who owe the money and on whether the invoices are genuine and undisputed. Monitoring is intensive: the bank needs a fresh debtor list every month, or every week, and checks for concentration (one customer owing most of it) and ageing (invoices more than 90 days old are usually excluded).

### Inventory

Stock: raw materials, work in progress, finished goods. Hard collateral. Finished goods with a wide market (grain, metal, branded consumer goods) can be good. Work in progress is nearly worthless. Fashion stock is worthless next season. Inventory can be sold, moved or spoil, and the bank rarely has physical control, so it relies on periodic stock counts and field examinations. Commodity finance, where the bank controls the goods in a warehouse through a warehouse receipt, is the well-behaved version of this.

### Intellectual property

Patents, trademarks, brands, software, music catalogues. Increasingly common as more company value sits in intangibles. Extremely hard to value, with no standard market, and the value often evaporates if the business that uses it fails. Few banks give much weight to it outside specialist lending. Useful mainly as "blocking" security: the bank takes it so that the borrower cannot give it to someone else.

### Shares in subsidiaries

In a group of companies, the parent often pledges its shares in the operating subsidiaries. This is standard in [[07 Leveraged and Acquisition Finance]]. The value of the shares is simply the value of the subsidiary, which is exactly what the bank was worried about in the first place, so this security is only as good as the business. Its real purpose is control: by enforcing a share pledge, the bank can take over the subsidiary and sell it as a going concern rather than breaking it up.

| Type | Ease of valuation | Ease of sale | Typical haircut (illustrative) | Main catch |
|---|---|---|---|---|
| Cash | Certain | None needed | 0% | Legal set-off right |
| Government bonds | Daily price | Hours | 0.5% to 8% depending on term | Custody |
| Listed shares | Daily price | Days | 15% to 30% | Volatility, concentration |
| Residential property | Good | Months | 20% to 30% | Correlated with recession |
| Commercial property | Fair, rent-based | Months to years | 30% to 50% | Market can freeze |
| Land | Poor | Slow | 40% to 60% | No income, planning risk |
| Plant and machinery | Poor | Slow | 50% to 80% | Specialised, hard to move |
| Vehicles | Good | Weeks | 20% to 40% | Can disappear |
| Ships and aircraft | Fair, specialist | Months | 25% to 50% | Cyclical, location |
| Receivables | Fair, monthly | Rolling | 20% to 30% of eligible | Disputes, concentration |
| Inventory | Poor | Variable | 50% to 100% | Spoils, moves |
| Intellectual property | Very poor | Very slow | Often 100% | Value tied to the business |
| Shares in subsidiaries | Equals the business | Sale of business | Often 100% for capital | Circular with the loan itself |

All haircuts above are illustrative of practice, not regulatory numbers. Every bank sets its own in its credit policy ([[13 Credit Governance - Committees, Authorities and the Three Lines]]).

## 4. The legal forms: how the bank gets a grip on the asset

Security is created by a legal document that gives the lender rights over an asset. The names vary by country (the terms below are mainly from English-law practice, which is used in a great deal of international lending), but the concepts recur everywhere.

| Legal form | What it is | Typically used for |
|---|---|---|
| **Mortgage** | The borrower transfers legal title to the asset to the lender (or grants a legal charge, in modern practice), subject to the borrower's right to get it back on repayment. The strongest form. | Land and buildings, ships, aircraft |
| **Fixed charge** | The lender gets a claim over a specific, identified asset, and the borrower cannot sell or deal with it without the lender's consent. | Specific machinery, specific property, specific bank accounts |
| **Floating charge** | A claim over a shifting pool of assets (stock, receivables, cash) that the borrower may keep dealing with in the ordinary course of business. On enforcement the charge "crystallises" and fixes onto whatever is in the pool at that moment. Ranks behind fixed charges and, in many countries, behind certain preferred creditors. | Whole-business security in a debenture |
| **Pledge** | The lender takes physical possession of the asset (or documents of title to it) until the loan is repaid. | Gold, securities held by the bank, warehouse receipts for commodities |
| **Lien** | A right to retain an asset already in the lender's possession until a debt is paid. Arises by law or contract rather than by a specific grant. | Banker's lien over documents, repairer's lien over a ship |
| **Assignment** | The borrower transfers its rights under a contract (for example, the right to be paid by its customers, or the right to insurance proceeds) to the lender. | Receivables, insurance, project contracts |
| **Security interest** | The general term, used in the United States and many other jurisdictions, for any of the above. Created by a security agreement and perfected by filing. | Everything, under a unified code |
| **Debenture** | Not a separate form but a single document that bundles fixed charges and a floating charge over all of a company's assets. | Standard for corporate borrowers in English-law practice |

The everyday analogy: a mortgage is like your classmate handing you the actual keys to the console with a note saying it is yours until the bike comes back. A fixed charge is a signed note that names the console. A floating charge is a note that says "whatever is in my bedroom on the day the bike goes missing." A pledge is the console sitting in your cupboard. A guarantee is the sister.

### Cross-collateralisation

Cross-collateralisation means one asset secures several loans, or several assets secure one loan, or both. A debenture does this by nature: everything the company owns secures everything it owes the bank. It is powerful because any surplus from one asset can be used against any shortfall on another facility. It is also where data goes wrong: a collateral system has to be able to say "this building secures facilities A, B and C, and facility A is also secured by this guarantee," and most older systems can only store one collateral record per loan.

## 5. Registration, perfection, priority and ranking

Signing a security document is not enough. The bank also has to make the security effective against the rest of the world, especially against the borrower's other creditors and any insolvency official. This is called **perfection**.

For most assets, perfection means **registration** in a public registry within a deadline:

- Land: the land registry (in England, the Land Registry; equivalents exist in most countries).
- Company assets: the companies registry (in England, Companies House, usually within 21 days of the charge being created, after which it may be void against a liquidator).
- Ships: the ship registry of the flag state.
- Aircraft: the national aircraft registry and, for many countries, the international registry under the Cape Town Convention.
- Vehicles, equipment and receivables: a general security register in countries that have one (the United States' Uniform Commercial Code filing system, Australia's Personal Property Securities Register, and similar).

For pledges, perfection is possession. For some assets, it is notice: telling the counterparty on a contract that the rights have been assigned.

Why does this matter so much? Because the security is largely about what happens in insolvency, and insolvency is a queue. **Priority** or **ranking** is your place in the queue:

1. Costs of the insolvency process itself.
2. Holders of fixed charges and mortgages, in order of registration (first registered, first paid) unless they have agreed otherwise.
3. In many countries, certain preferred creditors (employees' wages, some taxes), and sometimes a ring-fenced slice set aside for unsecured creditors.
4. Floating charge holders.
5. Unsecured creditors, sharing what is left in proportion.
6. Shareholders, who usually get nothing.

An unregistered charge typically drops from step 2 to step 5. That is the difference between recovering most of the loan and recovering a few pence in the pound. [[16 Problem Loans, Restructuring and Recovery]] walks through the waterfall in detail.

Where several lenders have security over the same assets, they usually sign an **intercreditor agreement** that fixes the ranking by contract rather than by registration date (see [[12 Loan Documentation, Covenants and Conditions]]). A "second charge" or "second lien" is security that has contractually agreed to rank behind a first charge.

## 6. Guarantees and why letters of comfort are weak

A guarantee is a contract in which the guarantor promises to pay the lender if the borrower does not. Types you will see:

- **Parent company guarantee**: the parent of a group guarantees a subsidiary's borrowing. Extremely common. The bank analyses the parent's own credit and, crucially, checks that the parent has the legal capacity and the corporate approvals to give it ("corporate benefit" rules in some countries restrict a company guaranteeing debts that do not benefit it).
- **Personal guarantee**: an individual, usually the owner-director of a small business, guarantees the company's loans. Valuable mostly for the behavioural effect; the individual's assets may be modest or already pledged to someone else, and enforcing against a person's home is slow and sensitive. Many banks cap the amount or take supporting security (a second charge over the director's house) to give it teeth.
- **Cross-guarantees**: every company in a group guarantees every other company's debts. Standard in group facilities. The bank then looks at the group as one credit, which is one of the reasons connected counterparties ([[14 Risk Appetite, Limits and Concentration]]) are grouped together.
- **Bank guarantees and standby letters of credit**: a third-party bank promises to pay. Covered in [[08 Trade Finance and Guarantees]].

A **letter of comfort** (or letter of awareness, or keep-well letter) is different. It is a letter from a parent saying things like "it is our policy that our subsidiaries meet their obligations" or "we are aware of the facility and support the subsidiary's business." It is deliberately written not to be a legally binding promise to pay. It makes the relationship manager feel better, and in some cultures carries real moral weight, but in a courtroom it is usually worth nothing. Regulators give it zero credit. Credit committees should treat it as information about the parent's attitude, not as security. If the parent is willing to be bound, it should sign a guarantee; if it refuses, that refusal is itself a signal.

The practical analysis of any guarantee asks: Is it legally valid and enforceable? Is the guarantor creditworthy? Does the guarantee cover the full amount and the full life of the loan, or is it capped or time-limited? Can the guarantor cancel it? Is it in the same currency as the loan? Is there a cross-border problem (would a court in the guarantor's country enforce it)?

## 7. Valuation: who, how often, and which value

A valuation is a number, and the bank's entire protection rests on it. So who produces it, when, and what does it mean?

**Who values.** Policy at most banks requires an **independent valuer** for anything material: a qualified professional (in property, a chartered surveyor or equivalent) who is not the borrower, not the relationship manager, and not paid on commission for the deal. Banks keep a **panel** of approved valuers, rotate them so that one valuer does not become too cosy with one borrower, and have their own internal valuation team review the reports. Small items (a car, a small flat) may be valued by automated valuation models or indexed from a purchase price. The relationship manager should never be the valuer; that is a basic four-eyes point ([[13 Credit Governance - Committees, Authorities and the Three Lines]]).

**How often.** Rules vary by bank and by country. A typical policy, as an illustration only:

| Collateral | Full revaluation | Desktop or index update | Trigger-based revaluation |
|---|---|---|---|
| Residential property | Every 3 years, or at default | Quarterly by house price index | Loan goes to watchlist, market falls more than a set percentage |
| Commercial property | Annually for large exposures | Semi-annually | Tenant loss, watchlist, market shock |
| Financial securities | Daily from market prices | n/a | Price moves breach margin trigger |
| Receivables | Monthly debtor report | Weekly for borrowing bases | Customer default, disputes |
| Plant, vehicles, ships | Annually or at review | Depreciation schedule | Watchlist, default |

The Basel framework and many national supervisors expect property values to be monitored at least annually for commercial and every three years for residential, with more frequent checks when markets are volatile, but the precise rules depend on the jurisdiction and you should check the local rulebook rather than rely on this table.

**Which value.** This is where beginners trip up. A valuation report usually gives more than one number:

- **Market value** (sometimes "open market value"): what a willing buyer would pay a willing seller after proper marketing. The headline number.
- **Forced-sale value** (or "liquidation value", "90-day value"): what the asset would fetch if it had to be sold quickly, under pressure, by a receiver. Typically 60% to 80% of market value for property, much less for machinery.
- **Mortgage lending value**: used in some countries (notably Germany), a deliberately conservative long-term value that strips out market froth.
- **Vacant possession value** versus **investment value** for a tenanted building.
- **Going concern value** for a whole business, versus **break-up value**.

Banks typically lend against market value but assess recovery (and loss given default, see [[10 Internal Ratings, Scorecards and PD Models]]) against forced-sale value, because if the bank is selling, it is by definition a forced sale.

## 8. Haircuts and loan-to-value

A **haircut** is a percentage shaved off the collateral value to allow for everything that can go wrong between today and the day the bank actually gets the money: price falls, selling costs, legal costs, time, and the simple fact that the bank will be a distressed seller.

A **loan-to-value ratio** (LTV) is the loan amount divided by the collateral value. It is the same idea seen from the other direction: a maximum LTV of 70% is the same as a 30% haircut.

Worked example. A borrower wants a loan secured on a warehouse valued at 10 million market value.

- Bank policy for commercial property: maximum LTV 60%, so the maximum loan is 6 million.
- Forced-sale value from the valuer: 7.5 million.
- Expected costs of enforcement and sale (legal fees, receiver, agents, holding costs over 18 months): 0.8 million.
- Net expected recovery in a forced sale: 7.5 minus 0.8 = 6.7 million.
- If the bank lends 6 million, the expected recovery covers the loan with a cushion of 0.7 million. If commercial property values fall 20% before the sale, forced-sale value drops to 6 million, net recovery is 5.2 million, and the bank loses 0.8 million, a loss given default of about 13%.
- If instead the bank had lent at 80% LTV (8 million), the same scenario loses 2.8 million, a loss given default of 35%.

That arithmetic is the whole reason LTV limits exist. It is also why LTV appears in the Basel standardised approach for real estate ([[basel-credit-risk-explained-simply]] section 10): a lower LTV gets a lower risk weight because the arithmetic above gives a lower loss.

Two other ratios you will meet:

- **Collateral coverage ratio**: collateral value (after haircut) divided by exposure. 1.2x means 20% more haircut-adjusted collateral than loan.
- **Security margin** or **cover**: used in margin lending against securities, as the minimum ratio of collateral to loan that must be maintained.

## 9. Monitoring and margin calls

Collateral is not a one-off event. The bank needs to know, throughout the life of the loan, whether the asset is still there, still owned by the borrower, still insured, still worth enough, and still legally secured.

**Insurance** is often overlooked. If the factory burns down, the collateral is gone. Security documents require the borrower to insure the asset and to note the bank's interest on the policy so that the insurance payout goes to the bank. A collateral system must track insurance expiry dates.

**Revaluation** happens on the schedule in section 7 and on trigger events.

**Margin calls** apply where the collateral value is observable and the agreement allows the bank to demand more. The classic cases are lending against listed securities and derivatives collateral under a credit support annex ([[19 Counterparty Credit Risk and Derivatives]]). The mechanism:

1. The agreement sets a required cover, say collateral worth 140% of the loan.
2. It also sets a **margin trigger**, say 125%, and a **sell-out level**, say 115%.
3. Each day the bank marks the collateral to market. If cover falls below 125%, the bank issues a margin call: the borrower must post more collateral or repay part of the loan, usually within one to three days.
4. If cover reaches 115% and the borrower has not acted, the bank is entitled to sell collateral itself.

Illustration: a loan of 1 million against shares worth 1.4 million (cover 140%). The shares fall 15% to 1.19 million, cover is 119%, below the 125% trigger. Margin call for enough collateral to restore 140%: the borrower must post 0.21 million of additional securities or repay 0.15 million. If the shares keep falling and hit 1.15 million, the bank sells.

For property and other illiquid collateral there is no daily margin call, but the facility agreement ([[12 Loan Documentation, Covenants and Conditions]]) usually has an **LTV covenant**: if a revaluation shows LTV above, say, 70%, the borrower must prepay or add security within a set time. The monitoring process for all of this feeds [[15 Monitoring, Early Warning and Watchlist]].

![[11-collateral-lifecycle.svg]]
*The collateral lifecycle: take the security, perfect it by registration, value it and apply haircuts, monitor and call for margin when cover falls, then either release it when the loan is repaid or enforce it when the borrower defaults.*

## 10. The Basel eligibility rules in plain words

The Basel framework (chapter CRE22 of the consolidated framework, summarised in [[18 Regulatory Capital and Basel - the Short Version]] and [[basel-credit-risk-explained-simply]] section 12) lets banks hold less capital against a loan when it is backed by collateral or a guarantee, but only when strict conditions are met. The idea is simple: a supervisor will not let you count protection that might not work.

**The gateway condition: legal certainty.** Whatever the collateral, the bank must have documentation that is binding on all parties and enforceable in all relevant jurisdictions, must have done enough legal review to be confident of that, must be able to liquidate or take possession in a timely manner, and must have procedures to do so. No legal certainty, no capital credit. The loan is treated as unsecured.

**Financial collateral.** Cash, gold, debt securities rated above a threshold (or unrated bank debt meeting conditions), equities in a main index, and units in funds holding these. Under the **standardised approach** the bank chooses between:

- The **simple approach**: the portion of the loan covered by the collateral gets the collateral's own risk weight instead of the borrower's, subject to a floor of 20% (with exceptions for cash and some repo-style deals). The collateral must be revalued at least every six months and pledged for at least the life of the loan.
- The **comprehensive approach**: the collateral value is reduced by a haircut (supervisory haircuts from a table, or the bank's own estimates with permission), the exposure may be increased by a haircut too, and the net exposure after subtracting adjusted collateral is risk-weighted at the borrower's weight. Currency mismatches get an extra haircut (8% for a ten-day holding period in the standard table). Maturity mismatches reduce the recognised value.

Under the **internal ratings-based approaches** (IRB), only the comprehensive approach is used for financial collateral, and it feeds into the loss given default (LGD) rather than the exposure.

**Physical collateral and receivables.** This is the important asymmetry:

- Under the **standardised approach**, physical collateral and receivables get **no capital credit at all**, except that loans secured on real estate are in their own exposure class where the risk weight is set by the loan-to-value ratio, which is a form of giving credit for the property.
- Under **foundation IRB**, eligible financial receivables, eligible commercial and residential real estate, and "other physical collateral" that meets conditions (liquid markets, public prices, and so on) reduce the supervisory LGD from the unsecured value (40% for senior corporate exposures after the final reforms) to lower values, with minimum collateralisation levels and over-collateralisation requirements to get the full benefit.
- Under **advanced IRB**, the bank's own LGD model reflects all the collateral it holds, within LGD floors that themselves vary by collateral type (the final reforms set floors such as 0% for financial collateral, 10% for receivables and real estate, 15% for other physical collateral, as a blend with the unsecured floor).

**Guarantees and credit derivatives.** Recognised only if the guarantor is an eligible protection provider (sovereigns, banks, and corporates rated above a threshold under the standardised approach, broader under IRB), the guarantee is direct, explicit, irrevocable and unconditional, and it is legally enforceable. The benefit is **substitution**: the protected portion takes the guarantor's risk weight or probability of default.

**On-balance sheet netting.** Deposits with the lending bank, with a legal right of set-off, can be netted against loans.

The precise thresholds and haircut tables change between Basel editions and are adopted with local variations, so treat the numbers above as orientation and check the current local rulebook before building them into a system.

![[11-basel-eligibility.svg]]
*The Basel eligibility decision tree: legal certainty is the gateway, then the type of collateral and the bank's approach determine whether and how the protection reduces capital.*

## 11. Collateral management systems and the data they must hold

A **collateral management system** is the database and workflow that records every piece of security the bank holds, links it to the facilities it secures, keeps its valuation current, and feeds the right numbers to the credit decision, the loss given default models, the expected credit loss calculation ([[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]]) and the regulatory capital engine. In many banks this started life as a module of the core lending system, or as a spreadsheet, and the platform lead inherits the consequences.

The minimum data a system must hold for each collateral item:

| Field group | Fields | Why it matters |
|---|---|---|
| Identity | Unique collateral identifier, type and sub-type (from a controlled taxonomy), description, location, registry reference, asset serial or title number | Everything else hangs off this; type drives haircuts, eligibility and revaluation frequency |
| Ownership and legal | Owner (borrower, guarantor, third party), legal form of security (mortgage, fixed charge, floating charge, pledge, assignment), ranking (first, second), registration status and date, registry confirmation, governing law, perfection deadline, insurance status and expiry | Determines whether the security is enforceable and eligible |
| Valuation | Market value, forced-sale value, mortgage lending value where used, valuation date, valuer identity and independence flag, valuation method (full inspection, desktop, index, automated), next revaluation due date, index series applied | Stale or non-independent values are the commonest audit finding |
| Currency | Currency of the valuation, currency of the facility, exchange rate used | Currency mismatch requires an extra haircut and drives margin calls |
| Haircut and eligible value | Policy haircut, regulatory haircut, eligible value under the standardised approach, eligible value under IRB, eligibility flags with reasons | So the credit, provisioning and capital calculations each use the right number |
| Allocation | Links to every facility and borrower it secures, allocation method (specific, pro rata, waterfall), allocated amount per facility, cross-collateralisation group identifier | Prevents double counting and lets the system compute coverage per facility |
| Monitoring | Trigger thresholds, last check date, margin call history, covenant links, watchlist flag | Drives the lifecycle in section 9 |
| Lifecycle | Status (proposed, taken, perfected, released, under enforcement, sold), dates for each, enforcement proceeds and costs | Proceeds and costs are the raw material for LGD models |

The hardest problem is **allocation**. When one building secures three facilities, and one facility is also secured by a guarantee and some receivables, the system must decide how much of the building's value to count against each facility. Common methods: specific allocation (the credit officer sets it), pro rata by exposure, or a waterfall (fill the senior facility first). Whichever method, the sum of allocations must never exceed the haircut-adjusted value, and the chosen method must be the same one the LGD model and the capital engine assume.

## 12. A worked example from start to finish

A bank agrees a 5 million five-year term loan to a food manufacturer, plus a 2 million revolving working capital line. Security package:

1. A first legal mortgage over the factory, market value 6 million, forced-sale value 4.5 million.
2. A fixed charge over the production line, market value 2 million, forced-sale value 0.6 million.
3. A floating charge over stock and receivables; receivables run at about 1.5 million, stock at 1 million.
4. A guarantee from the parent holding company, which owns the land under a separate company and has net assets of 3 million.
5. A letter of comfort from an overseas shareholder.

**Take and perfect.** Lawyers draft a debenture (fixed charges over the factory and the line, floating charge over the rest), a legal mortgage registered at the land registry, and a charge registered at the companies registry within the 21-day deadline. The guarantee is signed with board minutes from the parent proving authority. The letter of comfort is filed but given no value.

**Value and haircut.** Bank policy haircuts (illustrative): property 30% off market value, machinery 70%, receivables 30% of eligible (eligible means under 90 days and not disputed), stock 60%, guarantee counted at the lower of its cap and the guarantor's net assets, haircut 50%.

| Item | Market value | Haircut | Eligible value |
|---|---|---|---|
| Factory | 6.0m | 30% | 4.2m |
| Production line | 2.0m | 70% | 0.6m |
| Receivables (eligible 1.2m) | 1.2m | 30% | 0.84m |
| Stock | 1.0m | 60% | 0.4m |
| Parent guarantee | 3.0m | 50% | 1.5m |
| Letter of comfort | n/a | 100% | 0 |
| **Total** | | | **7.54m** |

**Allocate.** Total exposure is 7 million (5 million term plus the 2 million line, which policy counts in full). Policy allocates the factory and machinery to the term loan first (4.8 million against 5 million, coverage 96%), the floating charge assets to the revolving line (1.24 million against 2 million, coverage 62%), and the guarantee pro rata. Overall coverage 7.54 divided by 7 is 108%.

**Regulatory treatment.** The bank uses foundation IRB for corporates. The factory is eligible commercial real estate and the receivables are eligible financial receivables, so the supervisory LGD on those portions drops below the 40% unsecured figure. The production line probably fails the "liquid market, public prices" test for other physical collateral and gets no regulatory benefit even though the credit officer gave it 0.6 million of internal value. The parent guarantee only counts if the parent is an eligible guarantor; under foundation IRB an unrated private holding company may qualify, with the parent's own internal rating substituted, but only if that rating is better than the borrower's. The letter of comfort counts for nothing. Note that the internal credit view (coverage 108%) and the regulatory view (partial LGD relief) are different numbers from the same facts, and the system must hold both.

**Monitor.** Factory revalued every year because the exposure is large; receivables reported monthly; stock counted quarterly; insurance checked annually; the parent's accounts reviewed at each annual review. Two years in, the receivables report shows one supermarket customer now owes 60% of the ledger: a concentration trigger fires, the eligible receivables are cut, and the line is reduced from 2 million to 1.5 million until the ledger diversifies.

**Enforce.** Suppose the company fails in year four owing 4.2 million on the term loan and 1.5 million on the line. A receiver sells the factory for 4.3 million after 14 months (costs 0.4 million), the line for 0.3 million, collects 0.9 million of receivables and 0.2 million for stock, and the parent pays 0.8 million before itself running out of money. Total recovery 6.1 million net; total owed 5.7 million plus 0.5 million of accrued interest and costs. The bank is made whole, just. Had the factory mortgage not been registered in time, the bank would have ranked as an unsecured creditor on 4.3 million of the proceeds and lost most of the loan. The recoveries, timings and costs are recorded and become data points for the LGD model ([[10 Internal Ratings, Scorecards and PD Models]]).

## 13. Common failures

These are the things that go wrong in real banks, repeatedly, and they are mostly data and process failures rather than credit judgement failures.

- **Unperfected security.** The charge was signed but never registered, or registered late, or registered against the wrong company in the group. Discovered at the worst possible moment, in the borrower's insolvency. Cause: no system control linking "security taken" to "registration confirmed" with a deadline alarm.
- **Stale valuations.** The property was valued at origination in a boom and never since. The system shows coverage of 130% when reality is 80%. Cause: no revaluation due date, or the date exists but nobody reports on it.
- **Non-independent valuations.** The valuer was chosen and paid by the borrower, or the relationship manager typed in a number. Cause: no valuer panel control and no independence flag.
- **Double-pledging.** The same asset is recorded as security for two unrelated facilities, or the borrower has pledged it to another bank too (which a registry search would have shown). The bank counts the value twice. Cause: no unique collateral identifier and no registry search in the workflow.
- **Wrong currency.** A loan in dollars secured on a building valued in euros, with the exchange rate frozen at origination. The currency moves 20% and nobody notices. Cause: no currency field, or no revaluation of the exchange rate.
- **Lapsed insurance.** The asset is uninsured when it is damaged. Cause: no insurance expiry tracking.
- **Allocation errors.** One building counted at 100% against three facilities at once, so that total allocated collateral exceeds actual collateral. Cause: facility-level collateral records with no shared collateral object.
- **Eligibility confusion.** The internal eligible value is used in the capital calculation, or the regulatory eligible value is used for the credit decision. Cause: one field where two are needed.
- **Guarantees from entities that cannot pay or could not legally give them.** Cause: no analysis of the guarantor as a borrower, and no legal check of capacity.

## 14. Common mistakes and misunderstandings

- **"The loan is fully secured, so there is no risk."** Secured loans still default, enforcement takes years, values fall exactly when defaults rise, and costs eat into proceeds. "Fully secured" is a statement about one valuation on one day.
- **Confusing market value with what the bank will get.** The bank is a forced seller. Always ask for the forced-sale value and subtract costs.
- **Treating a letter of comfort as a guarantee.** It is not legally binding. Zero value for capital and, prudently, zero value for the credit decision.
- **Assuming regulatory eligibility equals credit value.** A machine can be good collateral for the credit decision and ineligible for capital; a parent guarantee can be eligible for capital but worthless if the parent is weak. Hold both views.
- **Assuming the standardised approach gives credit for physical collateral.** It does not, apart from real estate through the LTV buckets.
- **Thinking security is taken once and done.** It has a lifecycle. Each stage has its own controls and its own data.
- **Counting the same asset twice across facilities.** Allocation must be explicit and must sum to no more than the asset's value.
- **Ignoring currency and maturity mismatches.** Both reduce the recognised value under Basel and both are real economic risks.
- **Relying on a share pledge over the borrower's own subsidiary as if it were independent value.** It is the same business the bank is already exposed to; its value is control, not diversification.

## 15. What a platform lead needs to know about this

**Data.** Collateral needs to be its own entity in your data model, not an attribute of a loan. One collateral object, with a unique identifier, linked many-to-many to facilities and to parties (owner, guarantor, valuer). The fields in section 11 are the minimum. The two values that cause the most trouble if missing are the valuation date and the registration status. Make both mandatory and both reportable. Keep history: every valuation, every haircut change, every allocation change, with who made it and when, because the LGD model team and the auditors will both ask.

**Systems.** You will typically find collateral data in the core lending system, a separate collateral module, the document management system (where the signed charges live), a valuation workflow tool, and the trading side's collateral system for derivatives margin. The regulatory capital engine and the expected credit loss engine each pull from somewhere. Your first job is to find out whether they pull from the same place; usually they do not. The second is to make the collateral taxonomy a single controlled list used everywhere, mapped to both the internal policy categories and the Basel categories.

**Controls.** The controls that matter: a perfection deadline alarm with evidence of registration attached; a revaluation due date report, run monthly, with ageing; valuer panel enforcement and an independence flag; a registry search step before any new charge is recorded; a rule that allocations cannot exceed value; a currency revaluation at least monthly; insurance expiry tracking; and a reconciliation between the collateral system and the document archive (does every recorded charge have a signed, registered document behind it?). Internal audit will test every one of these ([[13 Credit Governance - Committees, Authorities and the Three Lines]]).

**Who owns what.** The relationship manager proposes the security. The credit officer decides what is acceptable and what haircut to apply, under policy. Legal or an external law firm drafts, executes and perfects the documents. A loan operations or credit administration team records it in the system, tracks registration and insurance, and often owns the collateral system day to day. The valuation team manages the panel and reviews reports. Risk modelling owns the LGD view and the haircut calibration. Finance and regulatory reporting own the capital and provisioning use of the data. The platform lead owns the plumbing between all of them and, usually, the data quality reporting that shows where the gaps are ([[22 Credit Risk Data, Systems and BCBS 239]]).

**Questions to ask in your first month.** How many collateral records have no valuation date? How many have a valuation more than three years old? How many facilities are flagged "secured" with no linked collateral record? Is there a registration status field, and is it populated from evidence or from someone's memory? Do the capital engine and the provisioning engine use the same collateral values? Can the system show one asset securing several facilities?

## 16. Related notes

- [[02 What Credit Risk Is]] for where loss given default fits.
- [[04 Commercial and Corporate Lending]] and [[05 Retail Lending]] for the products collateral attaches to.
- [[06 Specialised Finance - Project, Object, Commodities, Real Estate]] for ships, aircraft, property and commodities in depth.
- [[07 Leveraged and Acquisition Finance]] for share pledges and security packages in buyouts.
- [[08 Trade Finance and Guarantees]] for bank guarantees and letters of credit.
- [[10 Internal Ratings, Scorecards and PD Models]] for how recoveries feed LGD models.
- [[12 Loan Documentation, Covenants and Conditions]] for the security documents and intercreditor agreements.
- [[13 Credit Governance - Committees, Authorities and the Three Lines]] for who approves haircuts and policy.
- [[15 Monitoring, Early Warning and Watchlist]] for collateral triggers in monitoring.
- [[16 Problem Loans, Restructuring and Recovery]] for enforcement and the creditor waterfall.
- [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]] for collateral in expected loss.
- [[18 Regulatory Capital and Basel - the Short Version]] for the capital rules.
- [[19 Counterparty Credit Risk and Derivatives]] for derivatives margin.
- [[22 Credit Risk Data, Systems and BCBS 239]] for the data standards.
- [[basel-credit-risk-explained-simply]] section 12 and [[basel-credit-risk-decision-tree]] for the mitigation branch.
- [[28 Master Glossary]] for terms.
