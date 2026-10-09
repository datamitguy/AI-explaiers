# Risk Appetite, Limits and Concentration

**Why this matters to you.** A bank can be careful about every single loan and still be destroyed by the sum of them. If every loan is to a shipping company, or every mortgage is in one city, or half the book is to one conglomerate, then one bad year in that one place takes the whole bank down. Risk appetite is the board's answer to "how much of what kind of risk are we willing to carry," and limits are how that answer is enforced, loan by loan, every day. Your platform will almost certainly include a limit system, or feed one, and the two questions you will be asked most are "how much exposure do we have to X" and "are we inside our limits." Both are far harder to answer than they sound, because they depend on adding up exposures correctly across products, entities and countries. This note explains what the numbers mean so that you can build the adding-up properly.

## Table of contents

1. What risk appetite is
2. The risk appetite statement and its metrics
3. Cascading appetite into limits
4. The types of limits
5. Limit utilisation, breaches and escalation
6. Concentration risk and why diversification matters
7. The Basel large exposures rule and connected counterparties
8. The Herfindahl index explained simply
9. Correlation and wrong-way risk
10. Stress-based limits
11. How limits are implemented in systems
12. Reporting limits to committees
13. A worked example
14. Common mistakes and misunderstandings
15. What a platform lead needs to know about this
16. Related notes

## 1. What risk appetite is

Imagine your parents give you 50 of pocket money to run a lemonade stand for the summer. Before you start, they sit you down: "We are happy for you to lose up to 10 of it trying things out. Do not spend more than 15 on any one idea. Do not buy anything from the kid down the road who sold you the broken skateboard. And tell us every Sunday how it is going." That conversation is a risk appetite statement. It does not tell you which lemons to buy. It tells you how much you are allowed to lose, where you may not go, and how you report.

A bank's **risk appetite** is the amount and type of risk the board is willing to accept in pursuit of its strategy. It sits between two other ideas:

- **Risk capacity** is the maximum risk the bank *could* absorb before it breaches regulatory capital minimums or runs out of liquidity. It is a hard ceiling set by the bank's resources.
- **Risk appetite** is how much of that capacity the board *chooses* to use. Always less than capacity, to leave a buffer.
- **Risk profile** is the risk the bank *actually* has today. The board wants profile inside appetite inside capacity.

The idea that the board must set an explicit appetite, in writing and in numbers, became a regulatory expectation after the 2008 crisis, when it emerged that many boards could not say how much risk their banks were running. The Financial Stability Board's "Principles for an Effective Risk Appetite Framework" (2013) is the reference document most regulators point to. Chapter [[13 Credit Governance - Committees, Authorities and the Three Lines]] explains the board's role; this note is about the content.

## 2. The risk appetite statement and its metrics

The **risk appetite statement** (RAS) is the board-approved document. A good one has three layers:

1. **Qualitative statements.** Plain-language principles. "We lend to customers we understand, in markets where we have a presence. We do not lend to businesses whose primary purpose is speculation. We will not take credit risk we cannot measure."
2. **Quantitative metrics with thresholds.** For each metric: a target or appetite level, a trigger (amber) and a limit (red). The metrics for credit risk typically include:

| Metric | What it measures | Illustrative appetite |
|---|---|---|
| Common Equity Tier 1 ratio | Capital against risk-weighted assets ([[18 Regulatory Capital and Basel - the Short Version]]) | Stay above 12.5%, trigger at 13% |
| Expected loss as a percentage of exposure | Average annual loss rate across the book ([[02 What Credit Risk Is]]) | Not more than 0.6% |
| Credit losses in a severe stress | Loss under the bank's own stress scenario ([[20 Stress Testing and ICAAP]]) | Not more than 3% of exposure, so that CET1 stays above the minimum plus buffer |
| Non-performing loan ratio | Share of the book in default | Not more than 3% |
| Largest single-name exposure | As a percentage of Tier 1 capital | Not more than 15% (tighter than the regulatory 25%) |
| Sector concentration | Share of the book in any one sector | No sector above 15%; commercial real estate not above 12% |
| Country concentration | Share outside the home market, and by country | No single foreign country above 5% of exposure |
| Rating grade mix | Share of the book in weak grades | Not more than 10% in grades 8 and below |
| Unsecured share | Share of exposure with no eligible collateral | Not more than 40% of corporate exposure |
| Leveraged lending | Share and maximum leverage multiples | Not more than 5% of the book, no new deals above 6x |

3. **Governance.** Who owns each metric, how often it is measured, what happens at amber and at red, and when the statement is reviewed (usually annually, and whenever strategy changes).

The important design principle is that the metrics should be **measurable from the bank's systems** at the frequency promised. An appetite metric that can only be computed once a year by a project team is decoration. Many risk appetite statements fail this test, and the platform lead is often the person who has to say so.

## 3. Cascading appetite into limits

The board's statement is a handful of numbers for the whole bank. To make it bite, it must be translated into limits that an individual credit officer or trading desk can see and be stopped by. This is the **cascade**:

- The board sets "no sector above 15% of exposure."
- The group risk function converts that to a monetary sector limit (15% of a 100 billion book is 15 billion for, say, commercial real estate) and divides it between divisions: 9 billion to the corporate bank, 4 billion to the commercial bank, 2 billion to the markets business.
- Each division splits its share between regions or desks.
- Within a desk, the limit shows up as a pre-deal check: "this facility would take commercial real estate in the northern region to 101% of its limit; refer to the regional head of credit."

The cascade has to work in both directions. Utilisation measured at the bottom is summed upward so that the board sees the whole picture against its appetite. If the sums at the bottom use different definitions of "exposure" from the top (one includes undrawn commitments, the other does not; one nets collateral, the other does not), the cascade is broken, and the bank will discover this at the worst moment.

![[14-appetite-cascade.svg]]
*The cascade from board appetite to desk limits: group metrics become sector, country and single-name limits, divided across divisions and down to customer facility limits and pre-deal checks, with utilisation reported back up.*

## 4. The types of limits

A **limit** is a maximum amount of exposure permitted to a defined thing. Banks run many kinds at once, and any one loan is tested against several.

| Limit type | Defined on | Purpose | Typical owner |
|---|---|---|---|
| **Single-name** (obligor, counterparty) | One legal entity | Caps loss if that entity fails | Credit officer per the authority grid |
| **Group** (connected counterparties) | All entities under common control or economic dependence | Same, but recognising that connected entities fail together (section 7) | Credit committee |
| **Sector** (industry) | All exposures in an industry code | Caps loss from a sector downturn | Portfolio risk, group credit committee |
| **Country** | All exposures to borrowers in, or dependent on, a country ([[26 Sovereign, Bank and Country Risk]]) | Caps loss from a country crisis, transfer restrictions, war | Country risk committee |
| **Product** | A product type: leveraged loans, commercial real estate, unsecured personal loans, derivatives | Caps growth in riskier or less understood products | Group credit committee |
| **Tenor** (maturity) | Exposure beyond a given maturity, per name or per portfolio | Longer exposures carry more uncertainty | Credit officer, portfolio risk |
| **Rating grade** | Exposure in each internal rating grade or below a grade ([[10 Internal Ratings, Scorecards and PD Models]]) | Caps the share of weak credits | Portfolio risk |
| **Collateral type** | Exposure secured by one collateral type, or unsecured | Caps dependence on one asset class ([[11 Collateral and Security]]) | Portfolio risk |
| **Portfolio expected loss** | Sum of probability of default times loss given default times exposure | A direct appetite metric | CRO |
| **Risk-weighted assets** or capital consumption | RWA by division or product | Links lending to the capital it uses ([[24 Pricing, RAROC and Return on Capital]]) | CFO and CRO jointly |
| **Settlement and pre-settlement** | Daily settlement amounts and derivative exposure per counterparty ([[19 Counterparty Credit Risk and Derivatives]]) | Trading-specific | Credit officer for financial institutions |
| **Underwriting and pipeline** | Commitments not yet syndicated or signed | Caps exposure to deals that might not distribute ([[07 Leveraged and Acquisition Finance]]) | Underwriting committee |

Limits come in flavours: **hard** limits that cannot be exceeded without the limit owner's prior approval, **soft** limits or **guidelines** that trigger a review rather than a block, and **advisory** limits used for planning. A **temporary limit** or **excess** is an approved breach with an expiry date.

## 5. Limit utilisation, breaches and escalation

**Utilisation** is current exposure divided by the limit, as a percentage. The measurement of exposure needs a definition, and this is where most of the complexity lives: drawn balances plus undrawn commitments (at full value, or at a credit conversion factor), plus derivative exposure (at mark-to-market plus an add-on), plus guarantees issued, plus settlement exposure, converted to the reporting currency at today's rate, possibly net of eligible collateral, possibly net of credit protection bought. Each bank defines this in policy, and each limit type may use a different definition. The limit system must store the definition alongside the limit.

A **breach** (or excess) is utilisation above 100%. Breaches are of two kinds:

- **Active breach**: a new transaction took the exposure over the limit. This should have been blocked by a pre-deal check, so an active breach is both a risk event and a control failure.
- **Passive breach**: nothing new was done, but the exposure grew by itself: the currency moved, a derivative's value rose, a rating downgrade dropped the counterparty into a tighter limit band, two customers merged, or a limit was reduced. Passive breaches are expected and need a plan, not a disciplinary process.

**Escalation** is the pre-agreed process for what happens as utilisation rises:

| Zone | Utilisation (illustrative) | Action |
|---|---|---|
| Green | Below 85% | None; report |
| Amber | 85% to 100% | Warn the business and credit; new exposure needs credit sign-off; plan for headroom |
| Red, within tolerance | 100% to 110% | Escalate to the limit owner within one business day; temporary excess approved or exposure reduced within a set period |
| Red, beyond tolerance | Above 110% | Escalate to the next level up and to the CRO; reported to the risk committee; remediation plan with dates |

Every breach is logged with the cause, the owner, the decision (reduce, temporary excess, raise the limit), the timeline, and the closure. Repeat breaches on the same limit are a signal that either the limit is wrong or the business is ignoring it.

![[14-limit-breach-flow.svg]]
*The limit breach escalation flow: utilisation is checked, warnings fire in the amber zone, breaches are classified as active or passive, escalated to the limit owner, resolved by reduction, temporary excess or a raised limit, and reported to committees.*

## 6. Concentration risk and why diversification matters

**Concentration risk** is the risk that comes from having too many eggs in one basket. The formal definition: the risk that a single exposure, or a group of exposures that tend to go bad together, could produce losses large enough to threaten the bank's health.

Here is why diversification matters, with numbers.

Suppose a bank has 100 million to lend, and every borrower it can find has a 2% probability of default per year with a 50% loss given default. Expected loss is the same whatever the bank does: 100 million times 2% times 50% equals 1 million a year. But expected loss is the average; what the bank's capital protects against is the bad year.

**Option A: one borrower.** Lend all 100 million to one company. In 98 years out of 100 the bank loses nothing. In 2 years out of 100 it loses 50 million. Average 1 million, but the bank cannot survive a 50 million loss if its capital is 10 million.

**Option B: ten borrowers, 10 million each, independent of each other.** Each has a 2% chance of default. The chance that none default in a year is 0.98 to the power 10, about 82%. The chance that exactly one defaults is about 17% (loss 5 million). Two or more: about 1.6% (loss 10 million or more). Three or more: about 0.09%. So in 99.9% of years the loss is at most 10 million. The bank with 10 million of capital survives all but one year in a thousand.

**Option C: one hundred borrowers, 1 million each, independent.** The loss in a very bad year (one in a thousand) is roughly 4 million. The outcome has become predictable; it clusters close to the 1 million average.

Same expected loss, wildly different tail risk. That is diversification. Capital is held for the tail, so diversification directly reduces the capital a bank needs for a given amount of lending, which is why concentration is penalised in Pillar 2 ([[18 Regulatory Capital and Basel - the Short Version]]).

The catch is the word "independent." If the hundred borrowers are all farmers in one valley and a drought comes, they default together, and option C behaves like option A. This is **correlation**, covered in section 9. Concentration is really about correlated exposure, and there are several kinds:

- **Single-name concentration**: too much to one borrower or group.
- **Sector concentration**: too much to one industry.
- **Geographic concentration**: too much in one region or country.
- **Collateral concentration**: too many loans backed by the same kind of asset, so that a fall in that asset's price hurts recoveries everywhere at once.
- **Product concentration**: too much in one product with its own risk profile.
- **Indirect concentration**: exposures to different names that depend on the same thing (every supplier of one car maker; every borrower whose income comes from one employer).

## 7. The Basel large exposures rule and connected counterparties

The regulatory floor under single-name concentration is the **large exposures** framework (chapter LEX of the Basel consolidated framework; see [[basel-credit-risk-explained-simply]] section 16). In plain words:

- A **large exposure** is any exposure to a single counterparty or group of connected counterparties that is 10% or more of the bank's Tier 1 capital. Large exposures must be reported to the supervisor.
- The **limit** is 25% of Tier 1 capital to any single counterparty or group of connected counterparties.
- Between global systemically important banks, the limit is 15%.
- Exposures to sovereigns and central banks are generally exempt; exposures to other banks have some special treatment; intraday exposures are excluded.
- Exposure is measured broadly: drawn, undrawn, derivatives, guarantees, securities held. Eligible credit risk mitigation can reduce it, but then the exposure is shifted to the protection provider, who may themselves become a large exposure.

The crucial concept is **connected counterparties**. Two or more entities count as one if either:

1. **Control**: one controls the other, or both are controlled by the same third party (a parent and its subsidiaries; two companies owned by the same individual). Control is presumed above 50% ownership, and may exist below it through board control or dominant influence.
2. **Economic interdependence**: one is so dependent on the other that if one fails, the other probably will too. The Basel text gives examples: 50% or more of one entity's revenue or expenses come from the other; one guarantees the other's debts; they share a common source of funding; the insolvency of one would make the other unable to pay.

Identifying connections is hard and is mostly a data problem. Ownership data lives in corporate registries and commercial databases, is incomplete, changes, and crosses borders. Economic dependence data lives in the credit analysis of each borrower ([[09 Credit Analysis - Reading a Borrower]]) and is rarely captured in a structured way. Most banks have a **group hierarchy** or **customer hierarchy** in a master data system, maintained by a customer data team with input from relationship managers and credit, and reviewed at each annual review. Errors in that hierarchy go straight into the regulatory return.

![[14-connected-counterparties.svg]]
*A worked example of a connected counterparty group: companies under common ownership, an entity owned by the same individual, and a supplier economically dependent on the group are added together against one limit.*

In the diagram, the bank has four separate customer records with exposures of 12, 8, 15 and 3 million. Seen separately, none is a large exposure for a bank with 200 million of Tier 1 capital (10% would be 20 million). Added together as one group of connected counterparties they come to 38 million, which is 19% of Tier 1: a reportable large exposure, within the 25% limit but close enough that the bank's own tighter internal limit (say 15%) is breached. The supplier is the subtle case: it is not owned by the group, but 90% of its sales go to one group company, so if that company fails, the supplier fails too. It belongs in the group for limit purposes.

## 8. The Herfindahl index explained simply

Banks need a single number that says "how concentrated is this portfolio." The most common is the **Herfindahl-Hirschman index** (HHI, often just "Herfindahl"), borrowed from competition economics.

The recipe: work out each borrower's (or sector's) share of the portfolio, square each share, add the squares up.

- A portfolio with one borrower: share 100% = 1.0; squared, 1.0. HHI = 1.0. Maximum concentration.
- Two equal borrowers: shares 0.5 and 0.5; squared, 0.25 and 0.25. HHI = 0.5.
- Ten equal borrowers: ten times 0.1 squared = ten times 0.01. HHI = 0.1.
- One hundred equal borrowers: HHI = 0.01.

So for equal-sized borrowers, HHI equals 1 divided by the number of borrowers. That gives the useful translation: 1 divided by HHI is the **effective number** of borrowers. A portfolio with HHI 0.04 behaves like 25 equal borrowers, even if it has 500 actual borrowers, because a few big ones dominate.

Worked example. A sector portfolio of 1 billion: one borrower at 300 million, two at 150 million, and the remaining 400 million across 80 borrowers of 5 million each.

- Big borrower: share 0.30, squared 0.09.
- Two mid: share 0.15 each, squared 0.0225 each, total 0.045.
- Eighty small: share 0.005 each, squared 0.000025 each, total 0.002.
- HHI = 0.09 + 0.045 + 0.002 = 0.137. Effective number of borrowers = about 7.3.

Eighty-three borrowers on paper, seven in effect. That is what the index is for. Some supervisors use HHI directly in their Pillar 2 concentration add-on; the bank's own concentration policy often sets an HHI trigger per sector and for the book as a whole. The index is also reported in multiples of 10,000 (the example above would be 1,370) in some conventions; check which your bank uses before comparing numbers.

The HHI is a crude measure because it ignores both the riskiness of each exposure and the correlation between them. More sophisticated portfolio models (credit portfolio models producing economic capital, covered in [[20 Stress Testing and ICAAP]]) handle both, but the HHI survives because everyone can compute it and understand it.

## 9. Correlation and wrong-way risk

**Correlation** is the tendency of things to move together. Two borrowers are correlated if the circumstances that make one default also make the other more likely to default. Everyone in the same industry is correlated through the industry cycle; everyone in the same country through the economy; everyone through the global cycle to some extent. The Basel internal ratings-based formula builds in an "asset correlation" that rises for larger companies (which are more tied to the economy) and falls for retail borrowers (whose defaults are more about personal circumstances), which is one reason retail risk weights are lower ([[basel-credit-risk-explained-simply]] section 11).

Correlation is why sector and country limits exist: they cap the exposure to one source of common shocks. It is also why the bank's own economic capital model gives a diversification benefit for a spread book and a penalty for a concentrated one.

**Wrong-way risk** is a nasty special case: when the exposure to a counterparty grows at the same time as the counterparty's ability to pay shrinks. Examples:

- A bank lends to an oil company, secured on oil in storage. Oil prices crash: the company's revenue falls (more likely to default) and the collateral is worth less (bigger loss when it does). Collateral and borrower are correlated.
- A bank buys credit protection on a Spanish company from a Spanish bank. In a Spanish crisis the company defaults and the protection seller is also in trouble. The guarantee fails exactly when needed.
- A bank enters a derivative with a company where the derivative's value to the bank rises when the company's own share price falls (for example, the bank bought a put on the company's shares from the company itself). The worse the company does, the more it owes the bank.

The first and second examples are **general wrong-way risk** (driven by a shared macro factor); the third is **specific wrong-way risk** (driven by the legal or economic structure of the deal itself). Regulators require banks to identify and limit both. The practical control is a policy that forbids or restricts taking collateral or guarantees from parties closely linked to the borrower, and a review of derivatives counterparties for specific wrong-way structures ([[19 Counterparty Credit Risk and Derivatives]]).

## 10. Stress-based limits

A limit measured on today's exposure tells you where you are. A **stress-based limit** asks where you would be after a shock. Examples:

- A country limit set on exposure after a 30% currency devaluation and a two-notch sovereign downgrade.
- A commercial real estate limit set on the loss under a 35% fall in property values, rather than on the exposure.
- A derivative counterparty limit set on potential future exposure (the amount the counterparty could owe after a market move) rather than current mark-to-market.
- A sector limit set so that the loss from that sector in the bank's severe stress scenario stays below a fixed share of capital.

Stress-based limits connect the limit framework to the stress testing and ICAAP process ([[20 Stress Testing and ICAAP]]): the same scenarios that size the capital buffer size the limits. They are harder to compute (a model run rather than a sum) and harder to explain to a relationship manager, but they are the only kind that directly answer the board's question, "could this sink us?"

## 11. How limits are implemented in systems

A **limit management system** (LMS) is the application that stores limits, measures exposure against them, blocks or warns on transactions, and reports. It may be a dedicated product, a module of the core banking or treasury system, or (worryingly often) a combination of a database and spreadsheets.

The core functions:

1. **Limit hierarchy storage.** Limits at every level (board, group, division, desk, customer group, legal entity, facility) with their type, definition of exposure, currency, owner, approval reference, effective and expiry dates, and the parent-child links that make the cascade work.
2. **Exposure aggregation.** Pulling positions from every source system (loans, cards, mortgages, trade finance, treasury, derivatives, securities) into a common exposure measure, converting currencies, applying conversion factors to undrawn amounts, applying collateral where the definition allows, and rolling up through the customer hierarchy to the group level. This is the hard part and depends entirely on the quality of the customer hierarchy and the product mappings ([[22 Credit Risk Data, Systems and BCBS 239]]).
3. **Pre-deal checking.** Before a new facility is approved or a trade executed, the originating system asks the LMS "would this breach anything?" and gets back a yes, no, or warn, with the limits affected. For lending this is usually at approval time and at drawdown; for trading it is at order entry, in milliseconds.
4. **Post-deal measurement.** Recalculating utilisation after each transaction or at end of day.
5. **Breach management.** Detecting breaches, classifying them, routing them to owners, tracking resolution.
6. **Reporting.** Utilisation by level, trend, breaches, headroom, concentration metrics.

**Real-time versus end-of-day.** Trading businesses need real-time checks because a desk can do hundreds of trades a day with one counterparty. Lending businesses have historically been end-of-day or even monthly, because a loan takes weeks to approve. The gap is dangerous: a bank can approve a loan on Monday based on Friday's utilisation, while a derivative desk added 20 million of exposure to the same group on Monday morning. The direction of travel is a single real-time exposure view across the bank, but most banks are somewhere between that and a nightly batch with intraday exceptions.

The other recurring design question is **where the limit lives**. Facility limits (the customer may borrow up to 5 million under this agreement) belong in the loan servicing system. Credit limits (the bank is willing to be exposed to this customer up to 8 million across all products) belong in the LMS. Portfolio limits belong in the LMS. Confusing the first two causes most of the everyday errors: a customer with a 5 million facility and a 3 million derivative line has 8 million of credit limit, not 5.

## 12. Reporting limits to committees

Limits are only a control if someone with authority looks at them. The reporting cycle, in a typical bank:

- **Daily**: breach reports to limit owners and the business; trading limit utilisation to the desk heads and market risk.
- **Weekly**: large exposures and top utilisations to the chief credit officer.
- **Monthly**: the full limit utilisation pack to the group credit committee or executive risk committee: every portfolio limit with utilisation and trend, all breaches and their status, temporary excesses outstanding, concentration metrics (HHI, top 20 names, sector shares), and a watch of names approaching limits ([[23 Reporting - Regulatory Returns, Pillar 3 and Management Information]]).
- **Quarterly**: the risk appetite dashboard to the board risk committee: each appetite metric with its status (green, amber, red), any breaches during the quarter and how they were resolved, proposed changes to limits, and the large exposures regulatory return.
- **Annually**: the review of the risk appetite statement and the whole limit framework, with a recalibration of limits against the new strategy and budget.

Good reporting shows trends and headroom, not just today's number. A limit at 70% utilisation that was at 40% six months ago is more interesting than a limit at 90% that has been there for years.

## 13. A worked example

A bank with Tier 1 capital of 2 billion has these illustrative limits for commercial real estate: a portfolio limit of 12% of total exposure (total exposure 40 billion, so 4.8 billion), a single-group limit of 10% of Tier 1 (200 million), and an internal guideline that no single property city should exceed 30% of the real estate book. The real estate book is currently 4.3 billion (90% of the limit, amber), with 1.4 billion (33%) in the capital city, already over the city guideline on an approved temporary basis expiring in three months.

A relationship manager proposes a new 60 million loan to a developer group that already has 160 million with the bank, secured on a new office building in the capital city.

Pre-deal check results:

- Group limit: 160 plus 60 = 220 million against 200 million. Breach. Needs group credit committee approval to raise the limit or decline.
- Portfolio limit: 4.3 plus 0.06 = 4.36 billion against 4.8 billion, 91%. Amber, no block.
- City guideline: 1.46 of 4.36 billion = 33.5%. Already in breach, under temporary excess; the new deal makes it worse.
- Large exposures: 220 million is 11% of Tier 1, above the 10% reporting threshold, so it becomes a regulatory large exposure, within the 25% cap.
- Sector HHI check: the group would become the largest name in the real estate book at 5% share, raising the sector HHI from 0.021 to 0.024, effective names from 48 to 42.

The credit officer's view: the deal breaches a hard group limit and worsens an existing guideline breach. The committee could raise the group limit to 225 million if the credit quality justifies it and the bank is happy with the concentration, but the city concentration is the real issue; the committee might approve the deal on condition that 100 million of other capital-city exposure is sold down or allowed to run off within six months, and that the temporary city excess is not extended beyond that. The decision, its conditions and the new limit are minuted and loaded into the LMS with an expiry on the condition. Three months later, the limit report to the committee shows whether the sell-down happened.

Notice that all five checks were sums and ratios on data the bank already had. None required a model. The difficulty was entirely in having the right exposure figures, the right group structure and the right limit definitions in one place.

## 14. Common mistakes and misunderstandings

- **Confusing risk appetite with risk capacity.** Appetite is what the board chooses; capacity is what the bank can survive. Appetite must be inside capacity with room to spare.
- **Appetite metrics that cannot be measured.** If it cannot come out of the systems monthly, it is not a control.
- **Measuring single-name limits on the legal entity rather than the connected group.** The regulatory rule and good practice both require the group. Most limit errors are hierarchy errors.
- **Forgetting economic dependence.** A supplier with one customer is connected to that customer even without any ownership link.
- **Mixing exposure definitions across the cascade.** If the desk counts drawn balances and the board counts commitments, the board's number is wrong.
- **Treating a passive breach as a disciplinary matter and an active breach as routine.** It is the other way round: the active breach is the control failure.
- **Temporary excesses that never expire.** An excess with no expiry is a silent limit increase that nobody approved.
- **Believing a portfolio is diversified because it has many borrowers.** Compute the effective number of borrowers. Check sector and collateral correlations.
- **Ignoring wrong-way risk in collateral and guarantees.** Protection from a party correlated with the borrower is worth much less than it appears.
- **Facility limits versus credit limits.** A customer's total credit limit across all products is what matters for concentration; the facility limit is just one component.
- **Lending limits checked end-of-day while trading limits move in real time.** The same counterparty can breach between checks.

## 15. What a platform lead needs to know about this

**Data.** The three data sets that make or break limit management are: the **customer hierarchy** (legal entities, ownership percentages, control flags, economic dependence links, and the resulting group identifiers, with effective dates and a maintenance process); the **exposure measure** (one documented definition per limit type, computed consistently from every product system, with currency conversion, conversion factors and collateral treatment stated); and the **limit register** (every limit with type, level, definition, owner, approval reference, dates, parent link). Add to that the sector and country classification of every borrower (a controlled industry code list, and a country of risk that may differ from country of incorporation; see [[26 Sovereign, Bank and Country Risk]]), the collateral type mapping, and the rating grade.

**Systems.** You will likely find a limit management system fed by nightly extracts from the lending, cards, trade finance and treasury systems; a separate trading limit system with real-time checks; a customer master holding the hierarchy, possibly maintained in more than one place; and a reporting layer producing the committee packs. The reconciliations that matter: total exposure in the LMS versus total exposure in the general ledger and the regulatory capital engine; group membership in the LMS versus the customer master versus the large exposures return; limits in the LMS versus limits in the committee minutes.

**Controls.** Pre-deal checks that cannot be bypassed without a recorded override and approval. Nightly completeness check (did every source system deliver, and does the total reconcile). Hierarchy change control with dual approval and a review at each annual credit review. Automatic expiry of temporary excesses with escalation if not renewed. Breach log with cause codes, ageing, and closure evidence. A monthly reconciliation of the large exposures return to the LMS. Version history on every limit and every hierarchy link.

**Who owns what.** The board owns appetite. The CRO owns the framework and the top-level limits. Portfolio risk owns the cascade, the concentration metrics and the monthly pack. Credit officers own single-name and group limits within authority. The customer data team owns the hierarchy, with credit officers responsible for the connection assessment. Business heads own their utilisation. Regulatory reporting owns the large exposures return. The platform lead owns the LMS, the exposure aggregation, the feeds, the reconciliations and the evidence that pre-deal checks work ([[22 Credit Risk Data, Systems and BCBS 239]]).

**Questions to ask in your first month.** How many customer records have no group identifier? When did the hierarchy last get reviewed, and by whom? Does the LMS exposure total reconcile to the balance sheet, and if not, by how much and why? How many temporary excesses are past their expiry date? Can the LMS block a lending drawdown, or only report it afterwards? Is derivative exposure in the same view as lending exposure for the same group? How are the risk appetite metrics actually produced each quarter?

## 16. Related notes

- [[02 What Credit Risk Is]] for expected and unexpected loss.
- [[04 Commercial and Corporate Lending]] and [[07 Leveraged and Acquisition Finance]] for products with specific limits.
- [[09 Credit Analysis - Reading a Borrower]] for identifying economic dependence.
- [[10 Internal Ratings, Scorecards and PD Models]] for rating grades in limits.
- [[11 Collateral and Security]] for collateral concentration and wrong-way risk in collateral.
- [[12 Loan Documentation, Covenants and Conditions]] for commitments and pipeline exposure.
- [[13 Credit Governance - Committees, Authorities and the Three Lines]] for who approves limits.
- [[15 Monitoring, Early Warning and Watchlist]] for how limit signals feed monitoring.
- [[18 Regulatory Capital and Basel - the Short Version]] for Pillar 2 concentration.
- [[19 Counterparty Credit Risk and Derivatives]] for trading limits and wrong-way risk.
- [[20 Stress Testing and ICAAP]] for stress-based limits and economic capital.
- [[22 Credit Risk Data, Systems and BCBS 239]] for hierarchy and aggregation data.
- [[23 Reporting - Regulatory Returns, Pillar 3 and Management Information]] for the large exposures return and committee packs.
- [[26 Sovereign, Bank and Country Risk]] for country limits.
- [[basel-credit-risk-explained-simply]] section 16 and [[basel-credit-risk-decision-tree]] for the large exposures box.
- [[28 Master Glossary]] for terms.
