# Stress Testing and ICAAP

**Why this matters to you.** A stress test asks a simple question with an expensive answer: if the economy went badly wrong, would this bank still have enough capital? The answer decides how much capital the regulator demands, whether dividends can be paid, and how large risk appetite and limits can be. Every year the bank also runs its internal capital adequacy assessment process, or ICAAP, a self-assessment that uses stress testing to show the board and supervisor it has enough capital for all its risks. For a platform lead, this is one of the heaviest workloads you will carry: the whole loan book pushed through dozens of models under several imagined futures, three to five years at a time, reproducibly, under deadline, and again whenever someone asks "what if?".

## Table of contents

1. [The fire drill version](#the-fire-drill-version)
2. [What a stress test is](#what-a-stress-test-is)
3. [Why regulators require them after 2008](#why-regulators-require-them-after-2008)
4. [Types of stress test: sensitivity, scenario and reverse](#types-of-stress-test-sensitivity-scenario-and-reverse)
5. [Baseline, adverse and severely adverse scenarios](#baseline-adverse-and-severely-adverse-scenarios)
6. [The macro variables](#the-macro-variables)
7. [How macro variables turn into credit losses](#how-macro-variables-turn-into-credit-losses)
8. [A worked example: three years of adverse scenario](#a-worked-example-three-years-of-adverse-scenario)
9. [The main regulatory exercises](#the-main-regulatory-exercises)
10. [The ICAAP step by step](#the-icaap-step-by-step)
11. [The ILAAP in brief](#the-ilaap-in-brief)
12. [Pillar 2 add-ons](#pillar-2-add-ons)
13. [How stress testing feeds risk appetite and limits](#how-stress-testing-feeds-risk-appetite-and-limits)
14. [Modelling approaches](#modelling-approaches)
15. [The link to IFRS 9 scenarios](#the-link-to-ifrs-9-scenarios)
16. [What a stress testing platform needs](#what-a-stress-testing-platform-needs)
17. [Typical pain points](#typical-pain-points)
18. [Common mistakes and misunderstandings](#common-mistakes-and-misunderstandings)
19. [What a platform lead needs to know about this](#what-a-platform-lead-needs-to-know-about-this)
20. [Related notes](#related-notes)

## The fire drill version

Nobody thinks the school is on fire during a fire drill. But when the bell rings and everyone files out, the head teacher discovers things that would be disastrous to find out in a real fire: the back staircase is blocked by chairs, one class did not hear the bell, the register is out of date.

A bank stress test is a fire drill for money. The bank pretends a recession is coming, writes down a story where unemployment doubles and house prices fall by a quarter, and works out loan by loan what would happen to its losses, profits and capital. The point is not to predict the future. It is to find the blocked staircase while there is time to move the chairs: a commercial property concentration that would wipe out a year of profit, a model never tested in a downturn, a capital plan that only works if nothing goes wrong.

And if the drill takes three hours because nobody can find the register, the drill has failed even if the building is fine. Regulators care as much about whether the bank *can* run a stress test quickly and reliably as about the answer. That is where the platform comes in.

## What a stress test is

A **stress test** estimates how a bank's losses, earnings, capital and liquidity would behave under hypothetical adverse conditions that are **severe but plausible** (an asteroid strike is severe but tells you nothing useful). Every stress test has four parts:

| Part | What it is | Example |
|---|---|---|
| Starting point | Balance sheet snapshot | All positions as at 31 December |
| Scenario | What goes wrong | Unemployment rises from 4% to 9% |
| Transmission | Models that turn the shock into numbers | Satellite models raising probability of default |
| Outcome measure | How pass or fail is judged | Lowest Common Equity Tier 1 (CET1) ratio over the horizon |

This note focuses on **credit risk stress testing**, because loans are usually a commercial bank's largest source of stress losses. A full stress test also covers market, counterparty (see [[19 Counterparty Credit Risk and Derivatives]]) and operational risk, interest income, fees and costs, combined into one capital ratio path (see [[18 Regulatory Capital and Basel - the Short Version]]).

## Why regulators require them after 2008

Before the 2008 global financial crisis, stress tests were small, owned by a single team and mostly academic. Scenarios were mild, because a severe one produced an answer nobody wanted to act on. The crisis exposed three things:

1. **Healthy-looking capital ratios were not enough.** Banks with comfortable ratios in 2007 needed rescues in 2008. The ratios measured today's risk, not tomorrow's losses.
2. **Nobody could add up the risk quickly.** Many banks could not say within days what their total exposure was to a failing counterparty. That led directly to the data principles in [[22 Credit Risk Data, Systems and BCBS 239]].
3. **Markets did not trust bank numbers.** In 2009 United States supervisors ran a public stress test on the largest banks, told the weak ones how much capital to raise, and published the results. Confidence returned faster there, and supervisors elsewhere took note.

Supervisory stress testing is now a core regulatory tool for setting buffers, approving dividends and comparing banks. Banks must also run their own as part of the ICAAP. The Basel Committee publishes principles; national regimes differ in detail.

## Types of stress test: sensitivity, scenario and reverse

There are three families, and a mature bank runs all of them.

### Sensitivity analysis

A **sensitivity test** changes one thing and holds everything else still. "What if house prices fall 20%?" "What if every corporate is downgraded one notch?" It is quick and isolates drivers, but in real downturns things go wrong together.

**Illustrative example.** The mortgage book is 30,000 (all figures in millions, illustrative). Drop house prices 20% with nothing else changing, and loans that were above 80% loan-to-value fall into negative equity. Expected loss rises from 30 to 75: the house price fall alone costs about 45.

### Scenario analysis

A **scenario test** tells a coherent multi-year story with many variables moving together: falling gross domestic product (GDP), rising unemployment, falling property prices, a stock market crash. Scenarios can be **historical** (replay 2008) or **hypothetical** (an energy shock, or a disorderly climate transition, see [[25 Climate, ESG and Emerging Credit Risks]]). Almost all regulatory exercises are scenario tests.

### Reverse stress testing

A **reverse stress test** asks "what would break us?". The bank starts from failure (capital below the minimum, or a business model no longer viable) and works backwards.

**Illustrative example.** The bank has CET1 capital of 10,000 and risk-weighted assets (RWA) of 80,000. If non-viability is a 6% CET1 ratio and RWA would inflate to 90,000 in a deep stress, capital must fall to 5,400, a net loss of 4,600. What would produce that? Perhaps a 50% commercial property collapse, the failure of the two largest corporate borrowers and a 30% house price fall. The value is the conversation: is that truly implausible, or is the bank closer to the edge than it thought? Reverse tests are especially good at exposing concentrations (see [[14 Risk Appetite, Limits and Concentration]]).

| Type | Question | Weakness | Typical use |
|---|---|---|---|
| Sensitivity | What if one thing moves? | Ignores things moving together | Limits, model checks |
| Scenario | What if this story happens? | Slow, depends on the story | Regulatory exercises, ICAAP |
| Reverse | What would break us? | Many possible answers | ICAAP, recovery planning |

## Baseline, adverse and severely adverse scenarios

Exercises use a small family of scenarios, each a full path for every variable over three years (regulators) or three to five (ICAAP).

- **Baseline.** The expected path, close to the central forecast. Not a stress at all, but the comparison point.
- **Adverse.** A meaningful downturn of the kind seen perhaps once every decade or two.
- **Severely adverse.** A very deep downturn, at or beyond the worst in modern history. The probability is rarely stated precisely. Most capital buffers are set from this one.

Naming varies by regime, and banks add their own scenarios. Illustrative paths for one country:

| Variable (peak to trough over 3 years) | Baseline | Adverse | Severely adverse |
|---|---|---|---|
| Real GDP | +1.5% a year | -2% cumulative | -5% cumulative |
| Unemployment rate (starting at 4%) | 4.2% | 7% | 9.5% |
| Residential house prices | +3% a year | -15% | -30% |
| Commercial property prices | +1% a year | -25% | -40% |
| Policy interest rate (starting at 4%) | 3.5% | 5.5% or 1% (depends on the story) | 6% or 0.5% |
| Equity market | +5% a year | -30% | -50% |

Rates can go either way: a stagflation story pushes them up, hurting floating-rate borrowers; a demand collapse pushes them down, squeezing the bank's margin. The story matters, not just the severity.

## The macro variables

The **macroeconomic variables** that matter most for credit risk:

| Variable | Plain words | Why it matters for credit losses |
|---|---|---|
| GDP growth | How fast the economy grows or shrinks | Companies earn less in a recession, so business defaults rise |
| Unemployment | Share of people who cannot find a job | People who lose jobs stop paying mortgages and cards. The biggest driver of retail losses |
| House prices | What homes are worth | Lower prices mean lower mortgage recoveries, so loss given default rises |
| Interest rates | The cost of borrowing | Higher repayments push up defaults for floating-rate and highly indebted borrowers; also changes the bank's interest income |
| Commercial property prices | Value of offices, shops, warehouses | Big falls cause both defaults (refinancing fails) and high losses on commercial real estate loans |
| Exchange rates, equity prices, credit spreads, commodities | Currency values, markets, oil and gas | Hurt borrowers with currency mismatches or sector exposure; drive trading and counterparty losses |

International banks need paths for every country where borrowers live (see [[26 Sovereign, Bank and Country Risk]]).

## How macro variables turn into credit losses

A scenario is numbers about the economy; the bank needs numbers about its loans. The translation runs through four channels.

![[20-scenario-to-loss.svg]]
*How a macroeconomic scenario flows through satellite models into shifts in PD, rating migration, LGD and EAD, then into impairments, RWA and income, and finally into a capital ratio path that either clears the hurdle or does not.*

### Channel 1: probability of default rises

The **probability of default** (PD), introduced in [[02 What Credit Risk Is]] and modelled in [[10 Internal Ratings, Scorecards and PD Models]], goes up when the economy weakens, but unevenly. Unsecured consumer lending reacts sharply to unemployment; construction, hotels and commercial property to GDP and property prices; utilities barely move. Countries are hit differently too. So the stress uses PD shifts by **sector and country**, not one multiplier for the whole book.

| Segment (illustrative) | Baseline annual PD | Adverse peak PD | Main driver |
|---|---|---|---|
| Prime mortgages | 0.5% | 1.2% | Unemployment, interest rates |
| Credit cards and personal loans | 3.0% | 6.5% | Unemployment |
| Small business | 2.0% | 5.0% | GDP, interest rates |
| Large corporate, investment grade | 0.3% | 0.9% | GDP, credit spreads |
| Large corporate, sub-investment grade | 2.5% | 7.0% | GDP, interest rates |
| Commercial real estate | 1.5% | 8.0% | Commercial property prices, interest rates |

### Channel 2: rating migration

Higher PDs show up as **downgrades**: BBB-equivalent borrowers become BB, some Bs default. Migration matters three times over. It raises expected losses. It moves loans from Stage 1 to Stage 2 under International Financial Reporting Standard 9 (IFRS 9), where the provision becomes lifetime (see [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]]), often the largest stress impairment in year 1. And under the internal ratings-based (IRB) approach, a worse rating means a higher risk weight, so RWA inflates just as capital falls. It is modelled with **stressed migration matrices** shifted towards downgrades.

### Channel 3: collateral values fall, so LGD rises

**Loss given default** (LGD) depends on what the collateral fetches when sold (see [[11 Collateral and Security]]). After a 30% house price fall, a 70% loan-to-value mortgage becomes 100%, and a forced sale at a discount leaves the bank short. Commercial property is worse. One defaulted mortgage:

| | Before stress | After 30% house price fall |
|---|---|---|
| Loan balance | 140,000 | 140,000 |
| House value | 200,000 | 140,000 |
| Forced sale discount (20%) and costs (5%) | 50,000 | 35,000 |
| Net recovery | 150,000, capped at 140,000 owed | 105,000 |
| Loss | 0 | 35,000 |
| LGD | close to 0% (floors apply in practice) | 25% |

### Channel 4: exposure at default rises because borrowers draw down

**Exposure at default** (EAD) is the amount owed at default. In a crisis, companies draw every committed line and consumers max out cards before they stop paying, so the **credit conversion factor** (the share of an undrawn limit drawn before default) rises. In early 2020 many large companies drew their revolving facilities in full within days.

### Putting the channels together

For each segment and each year of the scenario:

> Stressed loss = stressed PD x stressed LGD x stressed EAD

plus the change in provisions caused by stage transfers, applied using the bank's expected credit loss (ECL) engine under IFRS 9 or current expected credit loss (CECL) rules. The same stressed parameters feed the RWA calculation and the projection of net interest income (defaulted loans stop paying interest). All three flow into the capital ratio.

## A worked example: three years of adverse scenario

A mid-sized bank starts the stress at 31 December with CET1 capital of 10,000 and RWA of 80,000, a CET1 ratio of 12.5%. The **hurdle rate** for the exercise (the ratio the bank must stay above in every year) is 7%, made up of its minimum requirements and some buffers. All numbers are illustrative.

### Step 1: the loan book and stressed cumulative losses

The scenario is the adverse column from the table above: unemployment to 7%, house prices down 15%, commercial property down 25%, GDP down 2%. The satellite models produce stressed PDs, LGDs and EADs per segment, and the loss engine produces three-year cumulative impairments:

| Portfolio | Exposure | Three-year stressed loss rate | Stressed impairment |
|---|---|---|---|
| Residential mortgages | 30,000 | 1.5% | 450 |
| Credit cards and personal loans | 8,000 | 12.0% | 960 |
| Small business | 12,000 | 7.0% | 840 |
| Large corporate | 25,000 | 6.0% | 1,500 |
| Commercial real estate | 7,000 | 20.0% | 1,400 |
| **Total** | **82,000** | **6.3%** | **5,150** |

Commercial real estate is 8.5% of the book but 27% of the losses: exactly what a stress test exists to surface.

### Step 2: spreading it over the years

Year 1 carries stage transfers and early unsecured defaults; year 2 peaks with corporate and property defaults; year 3 recovers.

| | Year 1 | Year 2 | Year 3 |
|---|---|---|---|
| Pre-provision profit (income minus costs, already reduced by the scenario) | 1,200 | 1,000 | 1,100 |
| Credit impairments | 1,800 | 2,400 | 950 |
| Profit before tax | -600 | -1,400 | 150 |
| Tax (25% on profits; no credit assumed on losses for simplicity) | 0 | 0 | -38 |
| Profit after tax | -600 | -1,400 | 112 |

### Step 3: RWA inflation

With a **static balance sheet** (a common regulatory assumption that the book does not grow or shrink), downgrades and defaults push RWA from 80,000 to 86,000 in year 1 and 90,000 in year 2, easing to 88,000 in year 3 as defaulted loans are written off.

### Step 4: the capital path, before and after management actions

In its plan the bank intends to pay a dividend of 400 each year. First, the result with no management actions:

| | Start | Year 1 | Year 2 | Year 3 |
|---|---|---|---|---|
| CET1 at start of year | | 10,000 | 9,000 | 7,200 |
| Profit after tax | | -600 | -1,400 | 112 |
| Dividend | | -400 | -400 | -400 |
| CET1 at end of year | 10,000 | 9,000 | 7,200 | 6,912 |
| RWA | 80,000 | 86,000 | 90,000 | 88,000 |
| **CET1 ratio** | **12.5%** | **10.5%** | **8.0%** | **7.9%** |

The trough is 7.9% in year 3, clearing the 7% hurdle by only 0.9 points, too thin for the board.

Now apply a credible **management action** within the bank's control: cancel the dividend from year 2.

| | Start | Year 1 | Year 2 | Year 3 |
|---|---|---|---|---|
| CET1 at end of year | 10,000 | 9,000 | 7,600 | 7,712 |
| RWA | 80,000 | 86,000 | 90,000 | 88,000 |
| **CET1 ratio** | **12.5%** | **10.5%** | **8.4%** | **8.8%** |

The trough is now 8.4% in year 2. The **drawdown**, start ratio minus trough, is 12.5% minus 8.4% = 4.1 points. Supervisors watch it closely because it measures how much capital the bank burns in stress, whatever its starting point.

### Step 5: what the bank does with the answer

- The 4.1 point drawdown informs the **Pillar 2 buffer** (see below).
- The board cuts the commercial property limit (see [[14 Risk Appetite, Limits and Concentration]]).
- Validation checks whether the commercial property LGD model was ever tested on a 25% fall (see [[21 Model Risk Management and Validation]]).
- The capital plan is revised to keep 1.5 points of headroom at the trough.

## The main regulatory exercises

Details change by year and country, so treat these descriptions as generic.

| Exercise (generic) | Approach | Used for |
|---|---|---|
| Central bank annual stress test of the largest domestic banks | Common severe scenario run on banks' own models, challenged and adjusted by the supervisor | Bank buffers, system view, dividend decisions |
| European Banking Authority (EBA) EU-wide exercise, typically every two years | Common methodology, static balance sheet, banks' own models within strict constraints, results published by bank | Informs Pillar 2 guidance; not formally pass or fail |
| United States Federal Reserve programme for large bank holding companies | The Federal Reserve projects losses with its own supervisory models on detailed bank data, under baseline and severely adverse scenarios; banks also submit capital plans | Setting each bank's **stress capital buffer**, which feeds its capital requirement and limits on distributions |

For a platform lead the common features matter most: fixed start date, prescribed scenario, templates with thousands of cells, a short submission window, rounds of questions needing re-runs, and every number explainable back to loan-level data.

## The ICAAP step by step

The **internal capital adequacy assessment process**, or ICAAP, is the bank's own annual assessment of how much capital it needs for all its risks, now and over the planning horizon, under normal and stressed conditions. It sits in **Pillar 2** of the Basel framework (Pillar 1 is the minimum capital formulas; Pillar 3 is public disclosure; see [[basel-credit-risk-explained-simply]]). It is "internal" because the bank does it itself, using its own judgement, and the supervisor then reviews it. The resulting document is often a few hundred pages with many appendices.

![[20-icaap-cycle.svg]]
*The annual ICAAP cycle: from risk identification through quantification, capital planning, stress testing and management actions, to board sign-off, supervisory review and the use of results throughout the year.*

### 1. Risk identification

The bank builds a **risk inventory** of every risk it faces, not only those Pillar 1 covers: concentration risk, interest rate risk in the banking book, pension risk, business and strategic risk, reputational risk, climate risk, model risk and others, each with an owner. The analogy is a household listing every way its finances could go wrong, not just the mortgage: a job loss, the car breaking down, a leaking roof.

### 2. Materiality assessment

Each risk is assessed against **materiality** criteria (potential loss compared with capital, likelihood, mitigation). Material risks are quantified; immaterial ones are documented and revisited next year. Supervisors look hard at risks declared immaterial, because that is an easy way to understate capital needs.

### 3. Quantification

For each material risk, the bank estimates the capital needed today. For credit risk it starts from Pillar 1 (see [[18 Regulatory Capital and Basel - the Short Version]]) and asks what Pillar 1 misses, chiefly concentration, since Pillar 1 assumes a well-diversified book. Many banks also run an **economic capital** model as a comparison. Risks with no Pillar 1 charge get their own quantification.

### 4. Capital planning over three to five years

The bank projects balance sheet, earnings, RWA, dividends and capital in the **base case** over three to five years, from the strategic plan and budget. A common supervisory criticism is an ICAAP plan that does not match the bank's own budget.

### 5. Stress testing

The bank runs severe but plausible scenarios over the same horizon, designed around its own vulnerabilities: a property crash for a property-heavy lender, a regional downturn for a regional bank. It adds reverse stress tests and sensitivities. The output is a capital path like the worked example.

### 6. Management actions

The bank sets out what it would do: cancel dividends, stop buybacks, slow lending, sell a portfolio, issue Additional Tier 1 (AT1) capital, cut costs. Supervisors only credit actions that are **credible** in a stressed market, **timed**, **quantified** and **within the bank's control**. "We will sell the card book at a profit mid-recession" is not credible. Results are usually shown before and after actions.

### 7. Assessment against hurdles

If capital stays above the hurdles in every year of every scenario, the plan is adequate. If not, the bank goes back to step 4: more capital, lower risk appetite or a different strategy. This loop is the point of the exercise.

### 8. Board challenge and sign-off

The board owns the ICAAP, approving scope and scenarios at the start and the document at the end, usually through the board risk committee. Supervisors expect minutes showing genuine challenge (see [[13 Credit Governance - Committees, Authorities and the Three Lines]]).

### 9. Submission

The ICAAP document and appendices (risk inventory, model documentation, scenario narratives, capital plan) go to the supervisor, often with the ILAAP. Timing and format vary by country.

### 10. Supervisory review

The supervisor reviews the ICAAP within its **supervisory review and evaluation process** (SREP in Europe; other countries use other names). It assesses business model, governance, risks, capital and liquidity against its own benchmarks and peers, then sets bank-specific **Pillar 2 requirements** and guidance in a letter that is one of the most important documents the bank receives each year.

### The use test

Supervisors want the ICAAP used, not filed: stress results informing risk appetite, capital allocation, pricing (see [[24 Pricing, RAROC and Return on Capital]]), limits and strategy. This is the **use test**.

## The ILAAP in brief

The **internal liquidity adequacy assessment process**, or ILAAP, is the sister of the ICAAP, but for liquidity: does the bank have enough cash and easily sold assets to survive deposits leaving, markets closing and lines being drawn? It is the difference between being rich and having cash in your pocket: you can own a valuable house and still be unable to buy lunch.

The ILAAP covers the funding profile, the liquidity buffer, liquidity stress tests (from a few days to a year), the survival horizon, intraday liquidity and the contingency funding plan. It is owned by treasury, but links to credit risk through drawdowns: the committed lines that raise EAD in a credit stress also drain cash in a liquidity stress, and the credit platform often supplies the undrawn commitment data.

## Pillar 2 add-ons

Pillar 1 is the same formula for every bank, so it cannot capture everything about a particular one. Pillar 2 tops it up in two layers. Names differ by jurisdiction (Pillar 2A and 2B in some, Pillar 2 requirement and guidance in others), but the shape is common:

| Layer | Covers | Set by | How binding |
|---|---|---|---|
| Pillar 2 requirement | Risks Pillar 1 misses or under-covers: concentration, interest rate risk in the banking book, pension risk, model weaknesses | Supervisory judgement informed by the ICAAP and benchmarks | Binding, like a minimum |
| Pillar 2 buffer or guidance | A cushion to absorb severe stress without breaching requirements | The stress drawdown, adjusted for what the stress missed and overlap with other buffers | Expected to be held; dipping into it triggers close engagement |

In the worked example, a 4.1 point drawdown, partly covered by other buffers, might lead to a Pillar 2 buffer of, say, 1 to 2 points (illustrative; calibration methods are each supervisor's own). The point: **stress results become a capital number**, so stress test quality has a direct cost. In the American regime the stress capital buffer plays this role, calculated from the Federal Reserve's own test.

## How stress testing feeds risk appetite and limits

Stress testing quantifies much of the bank's **risk appetite** (see [[14 Risk Appetite, Limits and Concentration]]), with metrics such as:

- "CET1 ratio must remain above X% under the bank's internal severe stress scenario."
- "Stressed losses on commercial real estate must not exceed Y% of CET1."

These cascade into portfolio limits. If commercial real estate produces 1,400 of the 5,150 stressed loss (27%) and appetite says no sector may contribute more than 20%, the limit is cut until it complies. Sector and country limits are often sized so their stressed loss fits an allocated share of capital.

Stress results also shape day-to-day credit management: tighter underwriting for high-stress portfolios, closer monitoring of borrowers that would be downgraded sharply (see [[15 Monitoring, Early Warning and Watchlist]]), and pricing that charges for stressed capital. The **recovery plan** uses reverse stress testing to set **recovery indicators** that trigger escalation as capital or liquidity weakens.

## Modelling approaches

### Satellite models

The workhorse of credit stress testing is the **satellite model**, so called because it orbits the main risk models. It is a statistical relationship, fitted on history, between macro variables and a risk parameter. A simple example:

> Change in credit card default rate = 0.6 x change in unemployment rate + 0.2 x change in policy interest rate

If unemployment rises 3 points and rates 1 point, the default rate rises 0.6 x 3 + 0.2 x 1 = 2.0 points, say from 3.0% to 5.0%. Real models add lags (unemployment hurts defaults two or three quarters later), more variables, and segments by product, sector and country; some shift a credit cycle index that moves the whole PD term structure. LGD satellites link collateral values to recoveries; EAD satellites link drawdowns to the economy. The hard part is data: long histories including a real downturn, which many portfolios and products lack.

### Top-down versus bottom-up

| | Top-down | Bottom-up |
|---|---|---|
| How | Apply stressed loss rates to whole portfolios or segments | Recalculate each loan or borrower individually with stressed parameters |
| Used by and strengths | Supervisors and quick ad hoc tests; fast, comparable across banks | Banks for regulatory exercises and the ICAAP; captures the actual mix, collateral and ratings |
| Weaknesses | Misses the detail of the specific book | Slow, data hungry, many models to orchestrate |
| Platform impact | A spreadsheet or small model can do it | Needs the full loan-level engine, run many times |

The largest corporates are often stressed **name by name**: analysts re-rate each one under the scenario (see [[09 Credit Analysis - Reading a Borrower]]), because a model cannot know that one airline has hedged its fuel or one property company refinances in year 2.

### Challenger models

A **challenger model** is an independent second model that checks the main ("champion") one. If the champion says small business losses rise 2.5 times and a challenger on different data says 4 times, someone must explain the gap. Supervisors use their own challengers, so banks build theirs to see the challenge coming (see [[21 Model Risk Management and Validation]]).

### Expert overlays

Where models miss something (a sector unusually exposed to the scenario's story, a product with no history, a known weakness), experts adjust the output. Like the post-model adjustments in [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]], overlays need a rationale, method, owner, approval and record. Supervisors distrust overlays that reduce losses.

## The link to IFRS 9 scenarios

Accounting provisions under International Financial Reporting Standard 9 (IFRS 9) or CECL already use macroeconomic scenarios and satellite models (see [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]]), so most banks deliberately reuse that machinery:

| | IFRS 9 / CECL provisioning | Stress testing |
|---|---|---|
| Purpose | Unbiased expected loss for the accounts | Loss under one severe scenario, for capital adequacy |
| Scenarios | Several, probability-weighted | Each assessed on its own, no weighting |
| Horizon | Loan lifetime | Three to five years |
| Frequency | Monthly or quarterly | Annual exercises plus ad hoc tests |
| Output | Provision balance and charge | Impairment path, RWA path, capital ratio path |

A stress projection must estimate IFRS 9 provisions at the end of each stress year, running the ECL engine as if each year had happened, with loans moving between stages. The year 2 provision depends on the scenario from year 3 onwards, a forecast within a forecast, so simplifying rules are used, often prescribed by the regulatory methodology. Sharing machinery also buys consistency: if the ECL and stress engines disagree about how unemployment affects the card book, a supervisor will spot it.

## What a stress testing platform needs

![[20-stress-platform.svg]]
*A stress testing platform in three layers: data (position snapshot, macro history, scenario library), execution (model orchestration, overlays, aggregation) and output and control (results and templates, audit trail, re-run capability).*

| Capability | What it means | Why it matters |
|---|---|---|
| Data snapshots | Frozen, reconciled copy of every loan, collateral item, rating and limit at the start date | Every re-run must start from the same point |
| Scenario management | Versioned library of scenarios (regulatory, internal, reverse, ad hoc) with approvals | Scenarios change mid-exercise; you must know which version produced which result |
| Model orchestration | Satellite, PD, LGD, EAD, migration, ECL, RWA and income models run in order, per scenario and year | Dozens of models; manual hand-offs are the commonest source of error |
| Overlays | Controlled expert adjustments with rationale and approval | Must flow consistently into every downstream number |
| Aggregation | Results by legal entity, portfolio, country, sector, scenario and year | Regulators want entity templates; the board wants the group view |
| Templates and reconciliation | Regulator formats and board packs from one result set, tied to the ledger and returns | See [[23 Reporting - Regulatory Returns, Pillar 3 and Management Information]] |
| Audit trail | Each run records data, model, parameter, scenario and overlay versions and approvers | "How did you get this number?" comes months later |
| Run times and re-runs | Full run in hours; quick what-ifs on one variable, model or overlay | The board asks "what if property falls 35%?" the day before sign-off |

The best platforms share the data layer and model library with the ECL and regulatory capital engines, so stress testing is the same machinery run on a different future.

## Typical pain points

- **The snapshot is never quite right.** Start-date data arrives late, has gaps (missing collateral values or ratings) or changes after cut-off. Every fix means a re-run.
- **Models scattered across tools.** Satellite models in one language, PD in another, ECL in a vendor engine, RWA in a separate calculator, joined by hand.
- **Spreadsheets in the critical path** for overlays, aggregation and templates: hard to version, audit or trust.
- **Long run times.** Tens of millions of accounts over several years and scenarios can take days on older infrastructure.
- **Late scenario changes and supervisory questions** demanding unplanned breakdowns by product, vintage, sector and country.
- **Inconsistency with other numbers.** Stress baseline versus budget, stress ECL versus quarter-end ECL, stress RWA versus the regulatory return.
- **Key-person risk.** A handful of people understand the whole chain.
- **Scenarios beyond history** push models where they were never tested, so results lean on overlays.

## Common mistakes and misunderstandings

- **"A stress test is a forecast."** It is a deliberately bad story. It does not predict losses of 5,150; it estimates them *if* that scenario happened.
- **"Passing means the bank is safe."** It means surviving that scenario under those assumptions. A different crisis might hit very differently, which is why reverse stress testing exists.
- **Looking at the end ratio, not the trough.** Capital often recovers by year 3. The test is the lowest point.
- **Ignoring RWA inflation.** Losses shrink the top of the ratio while migration grows the bottom.
- **Treating management actions as free.** Cutting dividends hits the share price; crisis sales lose money. Supervisors credit only credible actions.
- **Confusing the ICAAP with the supervisory test.** One uses the regulator's scenario and rules; the other is the bank's own assessment of all material risks with tailored scenarios. They should be consistent, not identical.
- **Thinking Pillar 2 is optional.** Pillar 2 requirements are binding capital requirements, not suggestions.
- **Weighting stress scenarios like IFRS 9 scenarios.** Stress scenarios are assessed one at a time. Probability weighting is for accounting provisions.
- **Treating stress testing as a once-a-year project.** Supervisors expect the capability to be used all year. A platform that can only run once a year with a team of 40 is itself a finding.
- **Trusting models because they are models.** Beyond the history they were fitted on, expert judgement is doing much of the work, and that should be visible.

## What a platform lead needs to know about this

**Data.** The same loan-level data as the ECL and regulatory capital engines (see [[22 Credit Risk Data, Systems and BCBS 239]]), frozen at the start date: balances, limits, schedules, ratings, collateral with valuation dates, sector and country codes, IFRS 9 stage, legal entity. Plus long macro and default histories for model fitting, and the scenario paths. The foundation is an immutable, reconciled, versioned snapshot kept for years. Expect templates to demand granularity source systems do not hold cleanly.

**Systems.** A scenario repository, a model execution layer (in-house and vendor), the ECL and RWA calculators run in "projection mode", a net interest income tool owned by finance or treasury, an overlay tool, aggregation and template generation. The goal is one orchestrated pipeline that runs a scenario end to end on models and data shared with provisioning and capital reporting, with parallel scenarios and fast partial re-runs.

**Controls.** Start-position reconciliation to the ledger and returns; version control of snapshots, scenarios, models and parameters; validation evidence from [[21 Model Risk Management and Validation]] for every model; an approved overlay register; automated output checks (losses rise as scenarios worsen, totals reconcile across templates); a per-run audit trail; segregation so whoever runs the engine cannot change parameters; evidence of board challenge. Supervisors and internal audit review the process, not just the results.

**Who owns what.** The board owns the ICAAP. The chief risk officer owns stress testing, usually through a coordinating team. Economics designs scenarios. Credit risk modelling builds the models; validation checks them. Finance owns balance sheet, income projections and the capital plan; treasury owns the ILAAP. Credit officers provide name-by-name views; business lines propose management actions. Regulatory reporting fills templates. The platform team owns snapshots, orchestration, schedule, audit trail and re-runs, and is often the only team that sees the whole chain.

**The calendar.** Know when scenarios are published, submissions are due, question rounds and ICAAP board dates fall, and the SREP letter arrives. These collide with quarter-end provisioning for the same people and infrastructure. You will be asked: "if the regulator changes the house price path on Monday, how quickly can we re-submit?". Have a measured answer.

## Related notes

- [[02 What Credit Risk Is]] for PD, LGD and EAD.
- [[09 Credit Analysis - Reading a Borrower]] for name-by-name stress assessment of large borrowers.
- [[10 Internal Ratings, Scorecards and PD Models]] for rating models and migration matrices.
- [[11 Collateral and Security]] for collateral values behind stressed LGD.
- [[13 Credit Governance - Committees, Authorities and the Three Lines]] for board and committee oversight.
- [[14 Risk Appetite, Limits and Concentration]] for how stressed losses set appetite and limits.
- [[15 Monitoring, Early Warning and Watchlist]] for using stress vulnerability in monitoring.
- [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]] for shared scenario machinery.
- [[18 Regulatory Capital and Basel - the Short Version]], [[basel-credit-risk-explained-simply]] and [[basel-credit-risk-decision-tree]] for Pillar 1, RWA and the capital stack.
- [[19 Counterparty Credit Risk and Derivatives]] for counterparty stress.
- [[21 Model Risk Management and Validation]] for validating satellite and challenger models.
- [[22 Credit Risk Data, Systems and BCBS 239]] for data architecture.
- [[23 Reporting - Regulatory Returns, Pillar 3 and Management Information]] for templates and disclosures.
- [[24 Pricing, RAROC and Return on Capital]] for using stressed capital in pricing.
- [[25 Climate, ESG and Emerging Credit Risks]] for climate scenario analysis.
- [[26 Sovereign, Bank and Country Risk]] for country dimensions of scenarios.
- [[28 Master Glossary]].
