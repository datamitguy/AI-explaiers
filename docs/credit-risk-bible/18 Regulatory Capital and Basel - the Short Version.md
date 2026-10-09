# Regulatory Capital and Basel - the Short Version

**Why this matters to you.** Regulatory capital is the reason most of the credit risk platform exists. The models, the data, the quarterly runs, the regulatory returns: nearly all of it is there to answer one question the regulator asks every quarter, "how much of your own money are you holding against the risk in your loans?" This note is a condensed companion to [[basel-credit-risk-explained-simply]] and [[basel-credit-risk-decision-tree]]. Those two files walk through every box in the Basel decision tree from zero. This one assumes you have read them, compresses the rulebook into tables, and then adds what they do not cover: how capital is actually managed day to day, how the risk-weighted asset calculation runs as a quarterly process, what goes wrong, and a map of which chapter of the rulebook covers what.

## Table of contents

1. [The lemonade stand version](#the-lemonade-stand-version)
2. [The purpose of capital](#the-purpose-of-capital)
3. [The Basel editions](#the-basel-editions)
4. [The formula: exposure x risk weight = RWA](#the-formula-exposure-x-risk-weight--rwa)
5. [The three approaches in one table](#the-three-approaches-in-one-table)
6. [Credit risk mitigation in one table](#credit-risk-mitigation-in-one-table)
7. [Capital ratios and buffers](#capital-ratios-and-buffers)
8. [The leverage ratio](#the-leverage-ratio)
9. [The output floor](#the-output-floor)
10. [Large exposures](#large-exposures)
11. [The three pillars and Pillar 2 add-ons](#the-three-pillars-and-pillar-2-add-ons)
12. [How capital is managed day to day](#how-capital-is-managed-day-to-day)
13. [How the RWA calculation runs as a quarterly process](#how-the-rwa-calculation-runs-as-a-quarterly-process)
14. [The typical issues](#the-typical-issues)
15. [A map of the Basel chapters](#a-map-of-the-basel-chapters)
16. [A worked example](#a-worked-example)
17. [Common mistakes and misunderstandings](#common-mistakes-and-misunderstandings)
18. [What a platform lead needs to know about this](#what-a-platform-lead-needs-to-know-about-this)
19. [Related notes](#related-notes)

## The lemonade stand version

You run a lemonade stand with 100 coins of your friends' pocket money and 10 coins of your own. You lend all 110 out. If 5 coins of loans vanish, your own 10 coins absorb the loss and every friend is repaid. Your 10 coins are **capital**. The rules in this note are about how big that 10 has to be, given how risky your loans are, and about the paperwork of proving it every three months.

## The purpose of capital

Capital is the bank's own money, mostly shareholders' funds and retained profits, that absorbs losses before depositors and other creditors lose anything. Expected losses are supposed to be covered by provisions and pricing (see [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]] and [[24 Pricing, RAROC and Return on Capital]]). Capital is for the **unexpected** loss: the bad year when far more borrowers fail than the models predicted. The regulatory framework sets a minimum and the bank's own planning sets a target above it.

Capital has quality layers:

| Layer | What it is | Absorbs losses when |
|---|---|---|
| Common Equity Tier 1 (CET1) | Ordinary shares, share premium, retained earnings, less deductions (goodwill, deferred tax assets, the expected loss shortfall) | Always, continuously, as losses hit profit |
| Additional Tier 1 (AT1) | Perpetual bonds that convert to shares or are written down if CET1 falls below a trigger (often 5.125% or 7%); coupons can be cancelled | When the bank is in serious trouble but still open |
| Tier 2 | Long-dated subordinated bonds that absorb losses only in resolution or liquidation; some eligible provisions | When the bank has failed |

Tier 1 is CET1 plus AT1. Total capital is Tier 1 plus Tier 2.

## The Basel editions

| Edition | When | One-line summary |
|---|---|---|
| Basel I | 1988 | 8% of crudely risk-weighted assets |
| Basel II | 2004 | Internal models allowed; three pillars |
| Basel 2.5 | 2009 | Patched trading book and securitisation after the crisis |
| Basel III | 2010 onwards | More and better capital, buffers, leverage ratio, liquidity ratios |
| Basel III final reforms ("Basel 3.1", "Basel IV", "endgame") | Published 2017, in force 2023 to 2028 by country | Reined in models, output floor, revised standardised approach, SA-CCR, new operational risk method |

Each country or bloc transposes the rulebook into law with local variations (the European Union's Capital Requirements Regulation, the United Kingdom's Prudential Regulation Authority rulebook, the United States agencies' rules). When someone says "Basel says", check which local version they mean. Timelines and some numbers differ.

## The formula: exposure x risk weight = RWA

Everything in Pillar 1 credit risk reduces to:

> Risk-weighted assets (RWA) = sum over all exposures of (exposure at default x risk weight)

and then

> Minimum capital = 8% of RWA (plus buffers)

The exposure at default (EAD) is the amount at risk: the drawn balance for a loan, notional times a credit conversion factor for a commitment, a formula output for a derivative. The risk weight is either read from a table (standardised approach) or produced by a formula from the bank's own estimates (internal ratings-based approach). [[basel-credit-risk-explained-simply]] walks through each step; [[basel-credit-risk-decision-tree]] draws it.

## The three approaches in one table

| | Standardised approach (SA) | Foundation IRB (F-IRB) | Advanced IRB (A-IRB) |
|---|---|---|---|
| Who estimates what | Nothing; risk weights from a table | Bank estimates PD; LGD, EAD and maturity set by the rulebook | Bank estimates PD, LGD, EAD and maturity |
| Keyed on | External ratings, loan-to-value bands, fixed weights by class | Internal rating grade mapped to PD | Internal models for all parameters |
| Available for | Everyone | Corporates, banks, sovereigns (not retail) | Retail, SMEs, mid-sized corporates; not banks, financials or corporates with group revenue above EUR 500 million; not equity |
| Permission needed | No | Yes, from the regulator | Yes, stricter |
| Input floors | Not applicable | PD floor 0.05% | PD 0.05% (0.10% QRRE revolvers); LGD floors (for example 25% unsecured corporate); EAD floors |
| Typical users | Smaller banks; odd portfolios at big banks | Large banks for large corporates and banks | Large banks for mortgages, cards, SME, mid-corporates |
| Output | RWA = EAD x table risk weight | RWA = EAD x K(PD, LGD, M) x 12.5 | Same formula, own inputs |
| Expected loss comparison | Not applicable (provisions reduce EAD instead) | Provisions versus EL; shortfall deducted from CET1 | Same |

Illustrative SA risk weights, from [[basel-credit-risk-explained-simply]]: 0% for strong sovereigns, 20% for AAA to AA corporates, 100% for unrated corporates, 85% for unrated SMEs, 75% for regulatory retail, 20% to 70% for residential mortgages depending on loan-to-value, 150% for defaulted exposures (100% if provisions cover at least 20%).

## Credit risk mitigation in one table

| Mitigant | SA treatment | IRB treatment | Key condition |
|---|---|---|---|
| Eligible financial collateral (cash, gold, government and good bonds, listed shares) | Simple approach: substitute collateral risk weight (20% floor). Comprehensive approach: subtract haircut-adjusted value from EAD | Comprehensive approach adjusts EAD or LGD; A-IRB may model | Legal certainty; daily or regular revaluation; haircuts for volatility and currency mismatch |
| Guarantees and credit derivatives | Substitute guarantor's risk weight on covered portion | Substitute guarantor's PD (and LGD under A-IRB) | Guarantor must be eligible; unconditional and irrevocable; maturity mismatch reduces benefit |
| On-balance sheet netting | Net loans against deposits | Same | Enforceable netting agreement |
| Physical collateral (property, ships, machinery) and receivables | Not recognised (except real estate via LTV buckets) | F-IRB: lower supervisory LGD; A-IRB: own LGD estimate | Valuation, legal charge, insurance, monitoring |
| Derivatives netting (ISDA) | Enters the SA-CCR exposure, not a separate step | Same | Enforceable close-out netting opinion per jurisdiction |

See [[11 Collateral and Security]] for the practical side of collateral and [[19 Counterparty Credit Risk and Derivatives]] for netting.

## Capital ratios and buffers

![[18-capital-stack.svg]]
*An illustrative CET1 stack for one bank. The Pillar 1 minimum sits at the bottom, Pillar 2A on top, then the combined buffers, then the bank's own management buffer. The exact sizes vary by bank and country.*

| Requirement | Level (% of RWA) | Capital quality | What happens if breached |
|---|---|---|---|
| Pillar 1 CET1 minimum | 4.5% | CET1 | Regulator intervenes; licence at risk |
| Pillar 1 Tier 1 minimum | 6.0% | Tier 1 | Same |
| Pillar 1 total capital minimum | 8.0% | Total | Same |
| Pillar 2A (or Pillar 2 requirement) | Bank-specific, set by supervisor | Mostly CET1 | Treated like the minimum |
| Capital conservation buffer | 2.5% | CET1 | Restrictions on dividends, AT1 coupons and bonuses |
| Countercyclical buffer | 0% to 2.5%, set by each country | CET1 | Same |
| G-SIB or D-SIB buffer | 1.0% to 3.5% (G-SIB), set locally (D-SIB) | CET1 | Same |
| Pillar 2B or stress buffer | Bank-specific, from stress tests | CET1 | Supervisory conversation, not automatic restrictions in most regimes |
| Management buffer | Bank's own choice, often 1% to 2% | CET1 | Internal escalation |

The sum of the minimum, Pillar 2A and the buffers is often called the **maximum distributable amount (MDA) threshold**, because dipping below it triggers automatic limits on what the bank may pay out. A large bank typically operates with a CET1 ratio of 12% to 15% against an MDA threshold of 10% to 12%. The gap is the headroom that treasury and the board watch most closely.

## The leverage ratio

> Leverage ratio = Tier 1 capital / total leverage exposure, minimum 3%

Total leverage exposure is everything at face value with no risk weights: loans, securities, derivatives (via SA-CCR style add-ons), securities financing transactions, and off-balance sheet items at simple conversion factors. G-SIBs face a higher minimum (3% plus half their G-SIB buffer). The leverage ratio is the backstop against risk weights being wrong, and for banks with large low-risk-weight books (mortgages, government bonds, repo) it can be the binding constraint rather than the risk-based ratio.

## The output floor

Under the final reforms, total RWA may not be lower than **72.5% of what the standardised approach would give** for the whole bank, phased in from 50% in 2023 to 72.5% in 2028 under the Basel schedule, with local timelines differing. The practical consequence is that every IRB bank must run a complete parallel SA calculation each quarter for every exposure, even those it models. Where the floor binds, it is a bank-wide add-on, so it cannot be attributed cleanly to individual loans, which complicates pricing (see [[24 Pricing, RAROC and Return on Capital]]).

## Large exposures

No single counterparty or group of connected counterparties may exceed **25% of Tier 1 capital**, or 15% for exposures between G-SIBs. Exposure is measured after eligible credit risk mitigation, and the rules for identifying connected clients (control and economic dependence) are demanding. This is a hard limit, breached rarely and reported immediately. Internal concentration limits in [[14 Risk Appetite, Limits and Concentration]] usually sit well below it.

## The three pillars and Pillar 2 add-ons

**Pillar 1** is the mechanical minimum: credit, market and operational risk, each with a formula. **Pillar 2** is the supervisory review: the bank's internal capital adequacy assessment process (ICAAP), described in [[20 Stress Testing and ICAAP]], and the supervisor's own review (SREP), which produces bank-specific add-ons. **Pillar 3** is public disclosure, described in [[23 Reporting - Regulatory Returns, Pillar 3 and Management Information]].

Pillar 2 add-ons come in two flavours. **Pillar 2A** (or the Pillar 2 requirement) covers risks Pillar 1 misses or understates: credit concentration, interest rate risk in the banking book, pension risk, operational risk beyond the formula, model weaknesses. It is added to the minimum and treated as hard. **Pillar 2B** (or Pillar 2 guidance, or a stress capital buffer) is set from stress test results and is the amount the bank should hold so that it stays above the minimum in a severe but plausible scenario. The names and mechanics differ by country; the shape is the same.

## How capital is managed day to day

Capital is not just calculated; it is managed, by the treasury function and the finance and risk functions together, under board oversight.

**Capital planning.** Every year the bank produces a **capital plan**: a three to five year forecast of capital resources (profits after dividends, new issuance) against capital requirements (RWA growth from lending plans, regulatory changes such as the output floor, buffer changes), under a base case and stress scenarios. The plan shows the projected CET1 ratio each year against the MDA threshold and the board's target, and it is the backbone of the ICAAP in [[20 Stress Testing and ICAAP]].

**Target and risk appetite.** The board sets a target CET1 ratio and a minimum below which escalation happens, as part of the risk appetite framework in [[14 Risk Appetite, Limits and Concentration]]. Capital headroom is tracked monthly, with forecasts to quarter end.

**Dividend policy.** Dividends and share buybacks reduce CET1, so they are decided against the capital plan. Most banks state a payout ratio and a target range, and the regulator can object. Below the MDA threshold, payouts are restricted automatically.

**Issuing AT1 and Tier 2.** Treasury issues AT1 and Tier 2 bonds to fill the Tier 1 and total capital layers more cheaply than with equity, timing issuance to market windows and to the maturity or call dates of existing instruments. AT1 is expensive and its coupons can be cancelled, which investors watch closely.

**RWA management.** The quickest way to improve a capital ratio is often to reduce RWA rather than raise capital: sell or securitise portfolios, buy credit protection on concentrated exposures (significant risk transfer), fix data so that collateral and guarantees are recognised, reprice or exit low-return, high-RWA business. RWA optimisation is a permanent activity at large banks and generates many of the requests a platform team receives.

**Allocation.** Capital is allocated to business lines so that each is charged for the capital it consumes, and returns are measured against it; see [[24 Pricing, RAROC and Return on Capital]].

## How the RWA calculation runs as a quarterly process

![[18-rwa-quarterly-process.svg]]
*The quarterly regulatory capital production cycle, from data collection through classification, calculation, adjustment, sign-off and submission. Week numbers are illustrative; most regulators allow roughly four to six weeks after quarter end.*

**Week 1: data collection.** On the reporting date, snapshots are taken from every source system: loan and deposit systems, trading and derivatives systems, collateral systems, the customer master, the rating and scoring systems, the provisioning engine. Balances are reconciled to the general ledger so that nothing is missing and nothing is double counted. Reference data (country, sector, legal entity identifiers, group hierarchies, external ratings) is refreshed.

**Weeks 1 to 2: classification and enrichment.** Each exposure is assigned its exposure class, its approach (SA, F-IRB or A-IRB, according to the bank's permissions), its default status, its credit risk mitigation (eligible collateral and guarantees linked and valued), its netting set for derivatives, and the parameters it needs (external rating or PD, LGD, maturity, credit conversion factor). A data quality gate checks for unrated counterparties, missing collateral values, unknown countries, invalid product codes. Issues are either fixed at source or given a conservative default treatment (for example, treat as unrated corporate at 100%, or ignore the collateral) that is logged with an owner.

**Weeks 2 to 3: calculation and adjustment.** The calculation engine runs the SA tables, the IRB formula, SA-CCR for derivatives, the comprehensive approach for repos, the securitisation methods, the CCP rules, and the full parallel SA for the output floor. Manual adjustments are applied for known gaps (a late trade feed, a portfolio not yet on the engine), each with an owner, rationale and expiry date. Variance analysis explains the movement from last quarter by driver: volume, migration, parameter changes, methodology changes, foreign exchange, data fixes.

**Weeks 3 to 4: review, sign-off and submission.** Finance, risk and the internal control function review. The chief financial officer and chief risk officer attest. The returns are submitted to the regulator in the prescribed templates, the Pillar 3 disclosures are prepared, and the numbers feed the published results. Reporting is covered in [[23 Reporting - Regulatory Returns, Pillar 3 and Management Information]].

Between quarters, many banks run monthly or even daily estimates for management, and the same engine is used for forecasting, stress testing and pricing. The quarterly regulatory run is the one that must be perfect.

## The typical issues

| Issue | Effect | Usual cause |
|---|---|---|
| Unrated counterparties | SA defaults to 100% or 150%; IRB cannot run without a PD | Rating not assigned, expired, or not linked to the exposure |
| Missing or stale collateral data | Mitigation not recognised, RWA too high | Collateral held in a separate system with no link to the facility; valuations out of date |
| Misclassification of exposure class | Wrong risk weight or wrong IRB formula | Bad sector or customer type codes; SME thresholds not applied; real estate not separated from retail |
| Wrong default flag | Defaulted loans at performing weights or vice versa | Days past due computed inconsistently; unlikeliness-to-pay flags not fed through |
| Guarantees not recognised | Lost substitution benefit | Guarantor not identified, not rated, or guarantee document not eligible |
| Netting agreements not mapped | Derivatives measured gross, exposure overstated | Legal data not in the system; netting opinions not maintained |
| Off-balance sheet items miscoded | Wrong credit conversion factor | Commitments recorded without the cancellability terms |
| Group hierarchy gaps | Large exposure limits and connected-client rules wrong; SME revenue tests wrong | Customer master not maintained; legal entity identifiers missing |
| Manual adjustments that never expire | Numbers depend on spreadsheets; audit findings | No ownership or retirement plan |
| Output floor parallel run incomplete | Floor miscalculated | SA treatment not implemented for every exposure the bank models |

Each of these is a data problem before it is a calculation problem, which is why [[22 Credit Risk Data, Systems and BCBS 239]] matters so much.

## A map of the Basel chapters

![[18-basel-chapter-map.svg]]
*The Basel consolidated framework by chapter. The grey chapters are outside credit risk but touch it.*

| Chapter code | Covers | Where it is explained in this vault |
|---|---|---|
| SCO | Scope of application, which entities consolidate | [[01 What a Bank Is and How It Makes Money]] |
| CAP | Definition of capital: CET1, AT1, Tier 2, deductions | This note |
| RBC | Risk-based capital requirements, buffers, output floor | This note |
| CRE20 to CRE22 | Standardised approach and credit risk mitigation | [[basel-credit-risk-explained-simply]] |
| CRE30 to CRE36 | IRB approach: rules, minimum requirements, formulae | [[basel-credit-risk-explained-simply]], [[10 Internal Ratings, Scorecards and PD Models]] |
| CRE40 to CRE45 | Securitisation | [[basel-credit-risk-explained-simply]] |
| CRE50 to CRE54 | Counterparty credit risk: SA-CCR, IMM, CCPs | [[19 Counterparty Credit Risk and Derivatives]] |
| CRE60 | Equity investments in funds | [[basel-credit-risk-explained-simply]] |
| CRE70 | Settlement risk | [[basel-credit-risk-explained-simply]] |
| MAR | Market risk, including CVA risk (MAR50) | [[19 Counterparty Credit Risk and Derivatives]] |
| OPE | Operational risk | Out of scope |
| LEV | Leverage ratio | This note |
| LEX | Large exposures | This note, [[14 Risk Appetite, Limits and Concentration]] |
| LCR, NSF | Liquidity coverage ratio, net stable funding ratio | [[20 Stress Testing and ICAAP]] (briefly) |
| SRP | Supervisory review process (Pillar 2) | [[20 Stress Testing and ICAAP]] |
| DIS | Disclosure (Pillar 3) | [[23 Reporting - Regulatory Returns, Pillar 3 and Management Information]] |

## A worked example

A mid-sized bank at a quarter end. Illustrative numbers.

**Resources.** CET1 capital 6.0 billion after deductions (including a 0.1 billion expected loss shortfall deduction). AT1 1.0 billion. Tier 2 1.5 billion. Tier 1 is 7.0 billion; total capital 8.5 billion.

**RWA.** Credit risk RWA from the engine: 38 billion under the bank's mix of A-IRB (mortgages, retail), F-IRB (corporates) and SA (sovereigns, odd bits). Counterparty credit risk 2 billion. Market risk 3 billion. Operational risk 5 billion. CVA 1 billion. Total before floor: 49 billion.

**Output floor.** Full SA RWA for everything would be 70 billion. The floor at the current phase-in of, say, 65% gives 45.5 billion, below 49 billion, so it does not bind this quarter. Treasury notes that at 72.5% the floor would be 50.75 billion and would bind, and plans for it.

**Ratios.** CET1 ratio 6.0 / 49 = 12.2%. Tier 1 ratio 14.3%. Total capital ratio 17.3%.

**Requirements.** Pillar 1 CET1 4.5%, Pillar 2A 1.5% (of which CET1 portion 0.85%), conservation buffer 2.5%, countercyclical buffer 1.0%, D-SIB buffer 1.0%. MDA threshold for CET1 is roughly 4.5 + 0.85 + 2.5 + 1.0 + 1.0 = 9.85%. Headroom: 12.2% minus 9.85% = 2.35 percentage points, or about 1.15 billion of CET1. The board target is 12.5%, so the bank is slightly below target and the capital plan shows retained earnings closing the gap within two quarters, provided RWA growth stays within plan.

**Leverage.** Total leverage exposure 180 billion. Leverage ratio 7.0 / 180 = 3.9%, above the 3% minimum, with headroom of 1.6 billion of Tier 1. Comfortable.

**Large exposures.** Largest group exposure after mitigation 1.2 billion, which is 17% of Tier 1, under the 25% limit.

**Management actions considered.** A planned 0.5 billion dividend would reduce CET1 to 5.5 billion and the ratio to 11.2%, still above the threshold but further from target. Treasury proposes a securitisation of 3 billion of mortgages to cut RWA by about 0.8 billion, and a data clean-up of unrated SME counterparties expected to reduce RWA by 0.3 billion. Both go into the plan.

## Common mistakes and misunderstandings

- **Thinking the minimum is 8%.** The 8% is total capital under Pillar 1 only. With CET1 requirements, Pillar 2A and buffers, a real bank's binding CET1 threshold is typically 10% to 13%, and it operates above that.
- **Treating buffers as untouchable.** Buffers are meant to be used in a stress. The cost is restricted payouts, not closure. In practice banks are very reluctant to dip into them because of the market signal.
- **Confusing RWA with exposure.** RWA is exposure times risk weight. A bank with 200 billion of loans might have 80 billion of RWA.
- **Assuming IRB always lowers capital.** It usually does for good-quality books, but the output floor, input floors and the expected loss shortfall deduction can offset it, and for poor-quality books IRB can be higher than SA.
- **Forgetting the parallel SA run.** Every IRB bank now needs full SA numbers for every exposure, for the floor.
- **Treating Pillar 2 as soft.** Pillar 2A is as hard as Pillar 1 in most regimes.
- **Ignoring the leverage ratio.** For low-risk-weight businesses it can be the binding constraint.
- **Thinking capital is "set aside" in a vault.** It is a claim on the liability side of the balance sheet, not a pile of cash. The bank lends it out like everything else.
- **Thinking the quarterly number is produced by one system.** It is produced by a chain of systems and people, and the manual adjustments are where the risk sits.

## What a platform lead needs to know about this

**Data.** The capital engine needs, for every exposure, the fields the decision tree asks for: exposure class, approach, drawn and undrawn amounts with commitment terms, default status, external rating or internal PD, LGD and maturity where modelled, collateral and guarantee links with eligibility and valuation, netting set membership, counterparty hierarchy for large exposures and SME tests, country and sector, and the provision balance. The same exposure must carry both its IRB and its SA treatment for the output floor. Most of the difficulty is in linkage (facility to collateral, counterparty to group) and in reference data (ratings, legal entity identifiers, country codes). [[22 Credit Risk Data, Systems and BCBS 239]] sets out the expectations.

**Systems.** A typical chain is: source systems, a regulatory data mart, a classification and enrichment layer, the calculation engine (vendor or in-house), an adjustments tool, a reporting tool that fills the regulatory templates, and the Pillar 3 production. The engine must be able to re-run quickly with changed inputs, support what-if analysis for capital planning and pricing, and keep every quarter's inputs and outputs for audit. Model parameters (PD, LGD, EAD models from [[10 Internal Ratings, Scorecards and PD Models]]) are deployed under change control with validation evidence from [[21 Model Risk Management and Validation]].

**Controls.** Reconciliation of exposures to the ledger; data quality gates with thresholds and documented default treatments; approach assignment checked against the bank's permissions; a register of manual adjustments with owners and expiry; variance analysis by driver each quarter; independent review before sign-off; and traceability from any number in a return back to the source records. Regulators inspect this chain and expect the bank to be able to answer "where did this number come from?" for any cell in a return.

**Who owns what.** Finance (regulatory reporting) usually owns the production process and the returns. Credit risk owns the models, the default definition and the classification rules. Treasury owns capital planning, issuance and the capital plan. The business lines own the data at source and the RWA they consume. The second line reviews; internal audit tests; the regulator inspects. The platform team owns the pipes, the engine, the schedule and the evidence, and is the group that can explain the whole chain.

**The questions to ask early.** Which approach applies to which portfolio, and where is that mapping kept? How many manual adjustments are in the latest quarter, and how old is the oldest? How long does a full re-run take? Can the SA parallel run be produced for every exposure? Where does the collateral link break?

## Related notes

- [[basel-credit-risk-explained-simply]] for the full walk-through of every box in the decision tree.
- [[basel-credit-risk-decision-tree]] for the diagram itself.
- [[01 What a Bank Is and How It Makes Money]] for why capital exists.
- [[02 What Credit Risk Is]] for PD, LGD and EAD.
- [[10 Internal Ratings, Scorecards and PD Models]] for the IRB inputs.
- [[11 Collateral and Security]] for mitigation in practice.
- [[14 Risk Appetite, Limits and Concentration]] for internal capital and concentration limits.
- [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]] for the provision and expected loss link.
- [[19 Counterparty Credit Risk and Derivatives]] for SA-CCR and CCPs.
- [[20 Stress Testing and ICAAP]] for Pillar 2 and capital planning under stress.
- [[21 Model Risk Management and Validation]] for model approval.
- [[22 Credit Risk Data, Systems and BCBS 239]] for the data expectations.
- [[23 Reporting - Regulatory Returns, Pillar 3 and Management Information]] for the returns and disclosures.
- [[24 Pricing, RAROC and Return on Capital]] for how capital is charged to deals.
- [[28 Master Glossary]].
