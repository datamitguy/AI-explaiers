# Pricing, RAROC and Return on Capital

**Why this matters to you.** A bank that measures risk perfectly but prices it wrongly still goes broke, only more slowly. Pricing is where credit risk meets money: the interest rate on a loan has to cover what it costs the bank to borrow the money, the losses it expects, the capital it must tie up, the people and systems that run the loan, and a profit on top. The tool banks use to check this is **risk-adjusted return on capital** (RAROC), and its cousins return on risk-weighted assets and economic profit. Every one of these needs the same inputs the rest of this vault describes (PD, LGD, EAD, RWA, funding cost, operating cost) delivered to a pricing tool at the moment a relationship manager is sitting with a customer. The platform owns that delivery, the governance of the tool, and the monitoring that shows whether the prices the bank actually charged were the prices the model said it needed.

---

## Table of contents

1. [Pricing a loan from scratch](#1-pricing-a-loan-from-scratch)
2. [Funds transfer pricing](#2-funds-transfer-pricing)
3. [Risk-adjusted return on capital: the full worked example](#3-risk-adjusted-return-on-capital-the-full-worked-example)
4. [Return on risk-weighted assets and other cousins](#4-return-on-risk-weighted-assets-and-other-cousins)
5. [Economic capital versus regulatory capital](#5-economic-capital-versus-regulatory-capital)
6. [Hurdle rates](#6-hurdle-rates)
7. [Why a thin-margin mortgage can beat a fat-margin corporate loan](#7-why-a-thin-margin-mortgage-can-beat-a-fat-margin-corporate-loan)
8. [Relationship pricing, cross-sell and fee income](#8-relationship-pricing-cross-sell-and-fee-income)
9. [Pricing tools and their governance](#9-pricing-tools-and-their-governance)
10. [Pricing, risk appetite and capital allocation](#10-pricing-risk-appetite-and-capital-allocation)
11. [Why mispricing causes losses in the long run](#11-why-mispricing-causes-losses-in-the-long-run)
12. [How pricing models are monitored](#12-how-pricing-models-are-monitored)
13. [Common mistakes and misunderstandings](#13-common-mistakes-and-misunderstandings)
14. [What a platform lead needs to know about this](#14-what-a-platform-lead-needs-to-know-about-this)
15. [Related notes](#15-related-notes)

---

## 1. Pricing a loan from scratch

Go back to the lemonade stand, but this time you are lending your friends pocket money. Your friend wants to borrow 10 coins for a year. What should you charge?

First, where do the 10 coins come from? You borrowed them from your older sister, who charges you 4% a year. So the loan costs you 0.4 coins just in interest to her. That is your **cost of funds**.

Second, some friends do not pay back. From experience, about 1 in 50 friends vanishes with the money, and when they do you usually get about half back by selling the bike they bought. So on a 10-coin loan you expect to lose 1/50 x 1/2 x 10 = 0.1 coins per year. That is your **expected loss**, the same PD x LGD x EAD formula as in [[02 What Credit Risk Is]].

Third, your parents insist that for every 10 coins you lend, you keep 1 coin of your own money aside in case a bad year hits and several friends vanish at once. That coin cannot be spent on sweets. You want at least 12% a year on it for the sacrifice, so 0.12 coins. That is your **cost of capital**.

Fourth, keeping the notebook, chasing late payers and buying pens costs you about 0.05 coins per loan. **Operating cost**.

Fifth, you want to make something for your trouble: say 0.03 coins. **Margin**.

Add them up: 0.4 + 0.1 + 0.12 + 0.05 + 0.03 = 0.7 coins on a 10-coin loan, which is 7%. Charge less and, averaged over many friends and many years, you lose money. Charge more and your friends borrow from someone else.

That is exactly how a bank prices a loan. The grown-up version, with the illustrative numbers used throughout this note:

![[24-loan-pricing-build.svg]]
*The building blocks of a loan's interest rate. Each layer covers a cost the bank actually bears; the customer rate is the sum. Numbers are illustrative.*

| Building block | What it covers | Illustrative value on a 10 million, 5-year corporate loan | Where it comes from |
|---|---|---|---|
| Cost of funds | What the bank pays to borrow the money for the same term, including liquidity costs | 4.00% | Treasury, via funds transfer pricing (section 2) |
| Expected loss | PD x LGD, the average annual loss on loans like this | 1.5% x 40% = 0.60% | Rating models in [[10 Internal Ratings, Scorecards and PD Models]] and [[11 Collateral and Security]] |
| Cost of capital | The return shareholders require on the capital this loan ties up | 0.77% (8% of RWA at a 12% hurdle; section 3 shows why the true figure is higher) | RWA from [[18 Regulatory Capital and Basel - the Short Version]], hurdle rate from the board |
| Operating cost | Origination, servicing, monitoring, collections, systems, people | 0.50% | Finance cost allocation |
| Margin and relationship adjustment | Profit above the hurdle, competitive position, relationship value | 0.30% | Business judgement within policy |
| **All-in rate** | | **6.17%** | |

A bank usually quotes this as a **margin over a base rate**: here the base (interbank or central bank reference rate) is embedded in the 4.00% cost of funds; if the base is 3.50% then the customer sees "base plus 2.67%." The margin has to cover the bank's own funding spread over base plus everything else.

---

## 2. Funds transfer pricing

A bank's treasury borrows money (deposits, bonds, interbank loans) and lends it internally to the business units that make loans. The internal price it charges is the **funds transfer price** (FTP). It has three main parts:

- **The base rate** for the term of the loan, read off the market yield curve. A five-year loan is priced off five-year money, not overnight money, because the bank must fund it for five years (or accept the risk that funding costs rise). This is **matched-maturity** FTP.
- **The bank's own credit spread**: the extra the market charges the bank over the risk-free rate to lend it money for that term. A weaker bank pays more and so must charge its customers more.
- **A liquidity premium** for the cost of holding liquid assets against the loan (regulatory liquidity rules require banks to hold buffers against the risk that funding dries up) and for any undrawn commitment that could be drawn at an awkward moment.

FTP is also paid *to* units that raise deposits, so a branch that gathers cheap deposits earns the difference between what it pays depositors and the FTP rate. This makes the lending side and the deposit side each see their true economics. Because FTP is set by treasury and applies to every product, it is one of the most important numbers in the bank and is governed by an asset and liability committee.

---

## 3. Risk-adjusted return on capital: the full worked example

**RAROC** answers one question: after taking account of expected losses, what return does this loan earn on the capital it ties up, and is that return above what shareholders require?

> RAROC = (revenue minus operating cost minus expected loss minus tax) divided by capital

Walk through the 10 million, 5-year corporate term loan. All numbers are illustrative and annual.

**Step 1: the exposure and the risk.** Fully drawn, so EAD = 10,000,000. Internal rating gives PD 1.5%. The loan is secured on plant and machinery; the LGD model gives 40%. Maturity 5 years.

**Step 2: expected loss.** PD x LGD x EAD = 1.5% x 40% x 10,000,000 = 60,000 per year, or 0.60% of exposure.

**Step 3: capital.** Suppose the bank is on the foundation IRB approach and the regulatory formula, with these inputs, gives a risk weight of 80% (plausible for this grade and maturity; see [[basel-credit-risk-explained-simply]] section 13 for how the formula works). RWA = 80% x 10,000,000 = 8,000,000. The simple stack in section 1 used the 8% regulatory minimum, which is why its cost of capital line was only 0.77%. A real bank holds more: its target capital ratio, including buffers and management headroom, is 12% of RWA (illustrative), so **capital allocated = 12% x 8,000,000 = 960,000**, and the hurdle is applied after tax. That gap between the simple stack and the real capital is exactly why a loan that looks fully priced on the back of an envelope can fail the RAROC test. (Some banks use economic capital here instead; section 5.)

**Step 4: revenue.** The customer pays 6.17%. The FTP cost of funds is 4.00%. Net interest margin = 2.17% x 10,000,000 = 217,000. Add an arrangement fee of 0.50% paid up front, spread over 5 years: 50,000 divided by 5 = 10,000 per year. Total revenue = 227,000.

**Step 5: operating cost.** 0.50% x 10,000,000 = 50,000.

**Step 6: the profit line.**

| Line | Amount per year |
|---|---|
| Net interest margin | 217,000 |
| Fees (amortised) | 10,000 |
| **Revenue** | **227,000** |
| Minus operating cost | (50,000) |
| Minus expected loss | (60,000) |
| **Risk-adjusted profit before tax** | **117,000** |
| Minus tax at 25% (illustrative) | (29,250) |
| **Risk-adjusted profit after tax** | **87,750** |

**Step 7: RAROC.** 87,750 divided by 960,000 = **9.1%**.

**Step 8: compare to the hurdle.** If the bank's hurdle is 12% after tax (section 6), this loan **does not clear it**. It earns a positive accounting profit but destroys shareholder value, because the shareholders could have earned more on the 960,000 elsewhere.

**Step 9: what would fix it?** The pricing tool can show the levers:

| Lever | Change | New RAROC (approx.) |
|---|---|---|
| Raise the margin by 0.40% to 2.57% | Revenue plus 40,000 | 12.3% |
| Take extra collateral so LGD falls to 25% | Expected loss falls to 37,500; RWA also falls (say to 6,000,000, capital 720,000) | 14.5% |
| Shorten the tenor to 3 years | Lower maturity reduces RWA (say to 7,000,000, capital 840,000) | 10.4% |
| Add 20,000 a year of cash management fees from the relationship | Revenue plus 20,000 | 10.7% |
| Combine a 0.25% margin increase with the cash management fees | Revenue plus 45,000 | 12.7% |

This is the conversation a relationship manager and a credit officer have every day, and the pricing tool is the thing in the middle of it.

![[24-raroc-decision.svg]]
*How RAROC is built and used. A deal below hurdle on its own may still be approved if the whole relationship clears the hurdle, but only as a documented exception.*

One subtlety: the capital in the denominator is money the bank must hold, and it earns something itself (it is invested in safe assets). Many banks add a **capital benefit** to revenue: capital x risk-free rate. At 3.5% on 960,000 that is 33,600, which lifts the RAROC above to about 11.8%. Whether to include it, and at what rate, is a policy choice that must be consistent across the bank.

---

## 4. Return on risk-weighted assets and other cousins

**Return on risk-weighted assets** (RoRWA) is the simpler sibling: risk-adjusted profit divided by RWA rather than by capital. On the example: 87,750 divided by 8,000,000 = 1.10%. If the bank's target CET1 ratio is 12% and its hurdle return on equity is 12%, the RoRWA hurdle is 12% x 12% = 1.44%, so the same conclusion. RoRWA is popular because RWA is a published, regulatory number and the ratio is comparable across banks.

**Economic profit** (or economic value added) expresses the same thing in money rather than a percentage: risk-adjusted profit minus (capital x hurdle rate). On the example: 87,750 minus (960,000 x 12%) = 87,750 minus 115,200 = **minus 27,450** per year. A negative number means the deal is destroying value. Money is often more persuasive than percentages in a credit committee.

**Return on equity** (RoE) at the whole-bank level is net profit divided by shareholders' equity. RAROC is the attempt to push that measure down to the individual loan, so that the bank's RoE is the sum of its parts.

| Measure | Formula | Best for |
|---|---|---|
| RAROC | Risk-adjusted profit / capital | Deal and portfolio decisions |
| RoRWA | Risk-adjusted profit / RWA | Comparing across banks and business lines |
| Economic profit | Risk-adjusted profit minus capital x hurdle | Showing value created or destroyed in money |
| RoE | Net profit / equity | Whole bank, investors |

---

## 5. Economic capital versus regulatory capital

The capital in the RAROC denominator can be one of two things.

**Regulatory capital** is what the Basel rules and the local regulator require: RWA times the target ratio. It is objective, published, and what the bank actually has to hold. Its weakness is that it is a rulebook number: it does not capture concentration (a 10 million loan to a borrower the bank already has 500 million with is treated the same as one to a new name), it treats some risks crudely (standardised approach weights), and it ignores diversification.

**Economic capital** is the bank's own estimate of the capital it needs to survive a very bad year at a chosen confidence level (say 99.9%, or whatever matches the bank's target rating), using its own portfolio model. It captures concentration and diversification: a loan that adds to an existing concentration consumes more economic capital; a loan in a new sector or country consumes less. It is the basis of the [[20 Stress Testing and ICAAP]] internal assessment.

Most banks price on **whichever is higher** for the deal, or on regulatory capital with an economic-capital adjustment for concentration. After the Basel III final reforms with the output floor (see [[18 Regulatory Capital and Basel - the Short Version]]), regulatory capital is binding for most banks, so pricing has shifted towards the regulatory number, with economic capital used as a concentration overlay and for internal allocation.

| | Regulatory capital | Economic capital |
|---|---|---|
| Set by | Rulebook and supervisor | The bank's own model |
| Captures concentration | No (except via large exposure limits) | Yes |
| Captures diversification | No | Yes |
| Comparable across banks | Yes | No |
| Validated by | Regulator approval of models | Internal validation; supervisor reviews in ICAAP |
| Used in pricing | Nearly always, at least as a floor | Often, as an overlay or alternative |

---

## 6. Hurdle rates

The **hurdle rate** is the minimum RAROC a deal must earn. It is derived from the return shareholders require, which in turn comes from the bank's cost of equity: roughly the risk-free rate plus a premium for owning bank shares. Banks typically set hurdles somewhere in the region of 10% to 15% after tax, varying by bank, country, and interest rate environment, and sometimes by business line (a lower hurdle for a stable retail franchise, a higher one for volatile leveraged finance). The number is set by the board or the asset and liability committee and reviewed annually.

Hurdle rates cause arguments. Set the hurdle too high and the bank turns away good business and shrinks. Set it too low and the bank grows by taking on value-destroying loans. Some banks allow deals below hurdle in exchange for a documented relationship case (section 8), with a cap on how much sub-hurdle business any unit may book.

---

## 7. Why a thin-margin mortgage can beat a fat-margin corporate loan

This is the point of the whole discipline, and it is counter-intuitive the first time.

Compare two loans of 1 million each, illustrative numbers.

| | Residential mortgage | Unsecured corporate loan |
|---|---|---|
| Customer margin over cost of funds | 1.20% | 3.00% |
| PD | 0.5% | 2.5% |
| LGD | 15% (house, 60% loan-to-value) | 45% |
| Expected loss | 0.075% = 750 | 1.125% = 11,250 |
| Operating cost | 0.30% = 3,000 | 0.60% = 6,000 |
| Risk weight | 20% | 110% |
| RWA | 200,000 | 1,100,000 |
| Capital at 12% | 24,000 | 132,000 |
| Revenue | 12,000 | 30,000 |
| Risk-adjusted profit before tax | 12,000 minus 3,000 minus 750 = 8,250 | 30,000 minus 6,000 minus 11,250 = 12,750 |
| After tax at 25% | 6,188 | 9,563 |
| **RAROC** | **25.8%** | **7.2%** |

The corporate loan earns more than twice as much margin and more profit in absolute terms, yet the mortgage earns three and a half times the return on capital, because it consumes less than a fifth of the capital and loses almost nothing. A bank with a fixed amount of capital can write five mortgages for every corporate loan of this kind, and earn 5 x 6,188 = 30,940 against 9,563.

This is why banks fight so hard over mortgage market share, why capital-light businesses are valued so highly, and why the risk weight is a commercial number, not just a regulatory one. It is also why the conversation in a credit committee is not "is the margin good?" but "is the return on the capital good?"

---

## 8. Relationship pricing, cross-sell and fee income

A loan is rarely the only thing a bank does with a customer. The same corporate may hold deposits (cheap funding), run its payments through the bank (fees), buy foreign exchange hedges (trading revenue), use trade finance ([[08 Trade Finance and Guarantees]]), and pay the bank to arrange a bond. **Relationship pricing** means evaluating the loan in the context of all of it.

Two ways this is done:

- **Relationship RAROC**: compute RAROC on the whole relationship, all products, all revenue, all capital. A loan at 9% on its own may sit inside a relationship earning 16% overall, and be approved on that basis.
- **Cross-sell expectations**: approve the loan below hurdle on the explicit expectation of future ancillary revenue, with the expectation recorded and tracked. If the ancillary business does not arrive within, say, twelve months, the exception is reviewed and the loan may be repriced at the next opportunity.

The danger is obvious. Relationship managers are rewarded for volume and may be optimistic about cross-sell that never materialises. Good practice: relationship RAROC uses *actual* revenue from the last twelve months, not forecasts; cross-sell promises are logged, named and time-limited; and the share of sub-hurdle lending each unit may carry is capped in the risk appetite statement.

**Fee income** improves returns disproportionately because it consumes no capital and carries no credit risk. In the example in section 3, 20,000 of cash management fees lifted RAROC by 1.5 percentage points. Commitment fees on undrawn facilities, arrangement fees, agency fees in syndications ([[04 Commercial and Corporate Lending]]), and guarantee fees all matter. But fees must be real: a fee that is simply a rebranded margin, or that is "waived in year two," should not be counted.

---

## 9. Pricing tools and their governance

The **pricing tool** (or pricing calculator, deal RAROC tool) is the application a relationship manager uses to work through the numbers above before quoting a customer. Inputs: customer identifier (which pulls the rating and existing relationship), product, amount, tenor, collateral, fees, proposed margin. Outputs: expected loss, capital, RAROC, economic profit, hurdle comparison, and the levers that would fix a shortfall.

Because it drives revenue, it is a model under [[21 Model Risk Management and Validation]] and needs:

- **Controlled inputs**: PD and LGD from the approved rating systems, not typed in; FTP from treasury's curve, not guessed; risk weights from the same logic as the capital engine; operating cost allocations from finance. A pricing tool whose inputs are editable by the user is a tool for producing the answer the user wants.
- **Version control** of the methodology, parameters and hurdle rates, with an approval trail.
- **Consistency with the capital engine**: the RWA the pricing tool predicts at origination should match what the capital engine books at month-end for the same deal. Differences mean one of them is wrong.
- **Audit trail**: every quote saved with its inputs, outputs and the user, so that the price actually charged can be compared later with the price the tool recommended.
- **Override and exception workflow**: pricing below hurdle requires approval at a defined authority level, recorded with a reason, and reported.

Governance usually sits with a pricing committee or the asset and liability committee for methodology and hurdles, with credit risk owning the risk inputs and finance owning cost and FTP inputs.

---

## 10. Pricing, risk appetite and capital allocation

Pricing is the mechanism by which the bank's [[14 Risk Appetite, Limits and Concentration]] becomes real in individual decisions. If the appetite says "we want to reduce commercial real estate," the simplest way is to raise the hurdle, or add a concentration charge to economic capital, for that sector: deals that are marginal become unattractive and the book shrinks without anyone having to refuse a customer outright. If the bank wants to grow in small business lending, it may lower the hurdle temporarily or subsidise the operating cost allocation.

**Capital allocation to business lines** is the same logic one level up. The board has a fixed amount of capital and allocates it to business lines in the annual plan: so much to retail, so much to corporate, so much to markets. Each line is then measured on the RAROC it earns on its allocation, and lines that consistently beat the hurdle get more capital next year. This makes capital the scarce resource that disciplines growth, which is exactly what the regulator wants. The allocation uses the same RWA and economic capital numbers as deal pricing, so inconsistency between the two is a governance problem.

A subtlety that trips people: **regulatory capital is held at the group level**, with buffers that do not neatly divide by business line. The allocation process has to decide how to apportion buffers, diversification benefits and the output floor effect. There is no single right answer, and the method should be documented and stable so that business lines are not whipsawed by methodology changes.

---

## 11. Why mispricing causes losses in the long run

A loan that is priced below its risk does not lose money immediately. The borrower pays interest; the loan looks profitable in the accounts; the relationship manager is paid a bonus. The loss arrives years later, in the bad year, when defaults cluster and the thin margins collected in the good years turn out not to have built up enough to cover them.

Three mechanisms:

**Adverse selection.** If a bank underprices risk for a segment, it attracts the riskiest borrowers in that segment, because the borrowers who know they are risky go where the price is lowest. The bank ends up with a worse book than it modelled, at a price set for the average. Price correctly and the riskiest borrowers go elsewhere.

**Expected loss is an average.** A 0.60% expected loss does not mean 0.60% every year. It means something like 0.2% in seven years and 2% in three. If the margin only just covers 0.60%, there is nothing left over in the good years to absorb the 2% years, and the capital has to take the hit. Pricing must cover expected loss *and* the cost of the capital that absorbs the variance.

**Compounding through growth.** Underpriced lending grows fast because it wins deals. The book is at its largest exactly when the downturn arrives. Several well-known bank failures and near-failures followed this pattern: rapid growth in a segment where the bank was the cheapest lender, followed by losses that exceeded all the margin ever earned on the segment.

The same logic in reverse explains why conservative, "boring" banks with disciplined pricing tend to outlast their aggressive competitors.

---

## 12. How pricing models are monitored

Pricing models are monitored on three questions.

**Are the inputs right?** PD and LGD feeding the tool should match the rating systems; FTP should match treasury's curve; operating costs should match the latest cost allocation; hurdle rates should be the approved ones. A quarterly reconciliation of tool parameters against their sources.

**Is the tool being used?** The share of deals priced through the tool, the share approved below hurdle, by unit and by approver; the ageing of cross-sell promises; the distribution of margin achieved versus margin recommended. A unit that consistently books 2% margin where the tool says 2.5% is either facing a market the tool misunderstands or is ignoring the tool.

**Were the predictions right?** Back-testing, the same idea as in [[21 Model Risk Management and Validation]]: for deals priced three years ago, compare the expected loss assumed with the loss actually experienced, the capital assumed with the capital actually consumed (RWA at origination versus RWA booked), and the relationship revenue promised with the revenue delivered. This is the only way to know whether the bank's "9.1% RAROC" deals really earned 9.1%.

The results go to the pricing committee and feed changes to methodology, hurdles and the tool itself under change control.

---

## 13. Common mistakes and misunderstandings

- **"High margin means good deal."** Margin ignores capital and expected loss. The mortgage example in section 7 shows a 1.2% margin beating a 3% margin.
- **"Expected loss is already in the provision, so do not price for it."** The provision books it in the accounts; the price has to collect it from the customer. Both are needed.
- **"Capital is free because the bank already has it."** Shareholders require a return on it, and capital used here cannot be used elsewhere.
- **"RAROC is a precise number."** It depends on PD, LGD, risk weight, hurdle, cost allocation and tax assumptions, every one of which is an estimate. Use it to compare and to set direction, not to split hairs between 11.8% and 12.1%.
- **"Economic capital is more accurate, so price on it."** It is more granular, but if regulatory capital is what the bank must actually hold (as it usually is post output floor), pricing below regulatory capital means pricing below what the deal really costs.
- **"Relationship pricing justifies anything."** Only with actual, measured, time-limited ancillary revenue and a cap on sub-hurdle exposure.
- **"Cost of funds is the central bank rate."** The bank funds itself at its own spread over the risk-free rate, for the term of the loan, plus liquidity costs. Pricing off the overnight rate for a five-year loan is a classic error.
- **"The pricing tool is a sales aid."** It is a model, with all the governance that implies.
- **"We will reprice later."** Loan contracts fix the margin for years. Mispriced at origination usually means mispriced to maturity.

---

## 14. What a platform lead needs to know about this

**The pricing tool is a real-time consumer of your risk data.** Unlike the month-end engines, it needs the current rating, the current relationship exposure and revenue, the current FTP curve and the current parameters, at the moment of the conversation. That means an integration layer from the customer master, the rating engine, the warehouse's relationship revenue view, and treasury's curves, with a service level for availability during business hours.

**Consistency with the capital engine is a control.** The risk weight logic in the pricing tool must be the same code or the same tested implementation as the capital engine, or reconciled to it regularly. A pricing tool that says 80% risk weight and a capital engine that books 95% for the same deal means the bank is systematically underpricing.

**Parameters are governed configuration.** Hurdle rates, tax rates, cost allocations, capital ratios, FTP curves and capital benefit rates are parameters with owners and approval trails. Store them as versioned data with effective dates; never hard-code them; log which version each quote used.

**Store every quote.** The audit trail (inputs, outputs, user, timestamp, approval status, final price charged) is the raw material for the monitoring in section 12 and for any dispute about why a deal was approved. Link quotes to the facility identifier once the deal is booked so that origination-time predictions can be compared with booked outcomes.

**Build the back-testing.** The comparison of expected loss, capital and revenue at origination against actuals three years later is a warehouse query across quotes, facilities, ratings, defaults, RWA history and revenue. Nobody else can build it; it is one of the most valuable analyses the platform can deliver.

**Who owns what.**

| Thing | Owner | Platform role |
|---|---|---|
| Pricing methodology and hurdle rates | Pricing committee or asset and liability committee, with finance | Implement as governed configuration |
| Risk inputs (PD, LGD, EAD, risk weights) | Credit risk | Deliver from approved systems in real time; reconcile to capital engine |
| Funds transfer pricing curves | Treasury | Integrate the feed; version it |
| Cost allocations and tax | Finance | Integrate; version |
| The pricing tool as a model | Model owner in the business, validated by model risk | Build, host, change-control, audit trail |
| Exception approvals | Credit and business authorities per the delegated authority matrix | Workflow and reporting |
| Monitoring and back-testing | Pricing committee and credit risk | Build and run the analytics |
| Capital allocation to business lines | Finance and the board | Provide the RWA and economic capital data by business line |

---

## 15. Related notes

- [[01 What a Bank Is and How It Makes Money]]: the net interest margin this note takes apart.
- [[02 What Credit Risk Is]]: expected loss, the second building block.
- [[10 Internal Ratings, Scorecards and PD Models]] and [[11 Collateral and Security]]: where PD and LGD come from.
- [[14 Risk Appetite, Limits and Concentration]]: how pricing enforces appetite.
- [[18 Regulatory Capital and Basel - the Short Version]]: the capital in the denominator.
- [[20 Stress Testing and ICAAP]]: economic capital and the internal capital assessment.
- [[21 Model Risk Management and Validation]]: the pricing tool as a governed model.
- [[22 Credit Risk Data, Systems and BCBS 239]]: the data feeds the tool depends on.
- [[23 Reporting - Regulatory Returns, Pillar 3 and Management Information]]: new business quality and pricing MI.
- [[27 A Platform Lead's First 90 Days]] and [[28 Master Glossary]].
- [[basel-credit-risk-explained-simply]] and [[basel-credit-risk-decision-tree]]: the last box in the decision tree is this note.
