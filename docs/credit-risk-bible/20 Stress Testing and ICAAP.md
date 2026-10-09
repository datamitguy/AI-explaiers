# Stress Testing and ICAAP

**Why this matters to you.** A stress test asks a simple question with a very expensive answer: if the economy went badly wrong, would this bank still have enough capital to keep going? The answer decides how much capital the regulator makes the bank hold, whether it can pay dividends, how big its risk appetite and limits can be, and sometimes whether the chief executive keeps their job. Every year the bank also writes a long self-assessment called the internal capital adequacy assessment process, or ICAAP, which uses stress testing to prove to the board and the supervisor that it has enough capital for all its risks. For a platform lead, stress testing is one of the heaviest workloads you will carry: it takes the whole loan book, pushes it through dozens of models under several made-up futures, three to five years at a time, and has to do it reproducibly, under deadline, and again whenever someone asks "what if?".

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

Every school has a fire drill. Nobody thinks the school is on fire. The bell rings, everyone files out, the teachers count heads in the playground, and the head teacher finds out things that would be disastrous to discover during a real fire: the back staircase is blocked by a stack of chairs, one class did not hear the bell, the register is out of date so nobody knows whether everyone got out.

A bank stress test is a fire drill for money. Nobody thinks the recession is coming next year. But the bank pretends it is: it writes down a story where unemployment doubles, house prices fall by a quarter and interest rates jump, and then it works out, loan by loan, what would happen to its losses, its profits and its capital. The point is not to predict the future. The point is to find the blocked staircase while there is still time to move the chairs: a concentration in commercial property that would wipe out a year of profit, a model that has never been tested in a downturn, a capital plan that only works if nothing goes wrong.

There is a second lesson from the fire drill. If the drill takes three hours because nobody can find the register, the drill itself has failed, even if the building is fine. Regulators care just as much about whether the bank *can* run a stress test quickly and reliably as about the answer it gets. That is where the platform comes in.

## What a stress test is

A **stress test** is an exercise that estimates how a bank's losses, earnings, balance sheet, capital and liquidity would behave under hypothetical adverse conditions. The conditions are chosen to be **severe but plausible**: bad enough to be a real test, but not so extreme that nobody takes the result seriously (an asteroid strike is severe but tells you nothing useful).

Every stress test has the same four parts:

| Part | What it is | Example |
|---|---|---|
| Starting point | A snapshot of the bank's balance sheet on a given date | All loans, securities, deposits and capital as at 31 December |
| Shock or scenario | What goes wrong | Unemployment rises from 4% to 9% over two years |
| Transmission | Models that translate the shock into numbers | Satellite models that turn unemployment into higher probability of default |
| Outcome measure | What you look at to judge pass or fail | The lowest point of the Common Equity Tier 1 (CET1) ratio over the horizon |

Most of this note is about **credit risk stress testing**, because loans are usually the largest source of stress losses for a commercial bank. But a full stress test also covers market risk (trading losses), counterparty risk (see [[19 Counterparty Credit Risk and Derivatives]]), operational risk (fines, fraud), interest rate risk in the banking book, net interest income, fees and costs. The answer that matters is the combination of all of them, expressed as a capital ratio path, as described in [[18 Regulatory Capital and Basel - the Short Version]].

## Why regulators require them after 2008

Before the 2008 global financial crisis, stress tests were small, owned by a single team and mostly academic. Scenarios were mild, because a severe one produced an answer nobody wanted to act on. The crisis exposed three things:

1. **Healthy-looking capital ratios were not enough.** Banks with comfortable ratios in 2007 needed rescues in 2008. The ratios measured today's risk, not tomorrow's losses.
2. **Nobody could add up the risk quickly.** Many banks could not say within days what their total exposure was to a failing counterparty. That led directly to the data principles in [[22 Credit Risk Data, Systems and BCBS 239]].
3. **Markets did not trust bank numbers.** In 2009 United States supervisors ran a public stress test on the largest banks, told the weak ones how much capital to raise, and published the results. Confidence returned faster there, and supervisors elsewhere took note.

Since then, supervisory stress testing has become a core tool of regulation: to set capital buffers, decide whether banks may pay dividends, compare banks on the same scenario and look at the system as a whole. Banks must also run their own stress tests as part of the ICAAP and use them in risk management. The Basel Committee publishes stress testing principles; each country's regime differs in detail.

## Types of stress test: sensitivity, scenario and reverse

There are three families, and a mature bank runs all of them.

### Sensitivity analysis

A **sensitivity test** changes one thing at a time and holds everything else still. "What if house prices fall 20%?" "What if every corporate borrower is downgraded by one notch?" "What if interest rates rise 2 percentage points?" It is quick, easy to explain, and good for finding which single factor the bank is most exposed to. Its weakness is that in real downturns things go wrong together: unemployment, house prices and rates move at the same time.

**Illustrative example.** The bank's mortgage book is 30,000 (all figures in millions, illustrative). A sensitivity test drops house prices by 20% with nothing else changing. Loans with a loan-to-value ratio above 80% before the fall now have negative equity. The model says the expected loss on the book rises from 30 to 75. A quick answer: a 20% house price fall costs about 45 of extra provisions on its own.

### Scenario analysis

A **scenario test** tells a coherent story of a whole economy over several years, with many variables moving together in a consistent way. A global recession scenario might combine falling gross domestic product (GDP), rising unemployment, falling house and commercial property prices, a stock market crash and widening credit spreads. Scenarios can be **historical** (replay 2008, or the early 1990s property crash) or **hypothetical** (a new story, such as a sudden energy shock or a disorderly climate transition, see [[25 Climate, ESG and Emerging Credit Risks]]). Almost all regulatory exercises are scenario tests.

### Reverse stress testing

A **reverse stress test** turns the question upside down. Instead of "here is a scenario, what is the loss?", it asks "what scenario would break us?". The bank starts from the outcome (the business model is no longer viable, or capital falls below the regulatory minimum) and works backwards to find the combination of events that would cause it.

**Illustrative example.** The bank has CET1 capital of 10,000 and risk-weighted assets (RWA) of 80,000. Suppose the point of non-viability is a CET1 ratio of 6%, and that in a deep stress RWA would inflate to 90,000. Capital would need to fall to 5,400 (6% of 90,000), a loss of 4,600 after any profits. The team then asks: what would produce 4,600 of net losses? Perhaps a commercial property collapse of 50% combined with the failure of the two largest corporate borrowers and a 30% house price fall. The value is not the number. It is the conversation: is that combination truly implausible, or is the bank closer to the edge than it thought? Reverse stress testing is especially good at exposing concentrations, as described in [[14 Risk Appetite, Limits and Concentration]].

| Type | Question | Strength | Weakness | Typical use |
|---|---|---|---|---|
| Sensitivity | What if one thing moves? | Quick, clear, isolates drivers | Ignores things moving together | Limit setting, daily risk management, model checks |
| Scenario | What if this story happens? | Realistic, joined up | Slow, depends on the scenario chosen | Regulatory exercises, ICAAP, capital planning |
| Reverse | What would break us? | Finds hidden vulnerabilities | Hard to quantify, many possible answers | ICAAP, recovery planning, board discussion |

## Baseline, adverse and severely adverse scenarios

Most exercises use a small family of scenarios, each a full path for every variable over the horizon (usually three years for regulators, three to five for the ICAAP).

- **Baseline.** The expected path of the economy, usually close to the central bank's or the bank's own forecast. It is not a stress at all. It is the starting comparison, and it is the same idea as the base case in the capital plan.
- **Adverse.** A meaningful downturn, of the sort that happens perhaps once every decade or two. A recession, rising unemployment, falling asset prices.
- **Severely adverse.** A very deep downturn, at or beyond the worst seen in modern history, perhaps a one-in-25 or one-in-50-year event, though the probability is rarely stated precisely. This is the scenario most capital buffers are set from.

Naming varies. The American programme uses "baseline" and "severely adverse"; the European exercise uses "baseline" and "adverse" where the adverse is severe; many banks add their own idiosyncratic scenarios on top. Illustrative paths for one country:

| Variable (peak to trough over 3 years) | Baseline | Adverse | Severely adverse |
|---|---|---|---|
| Real GDP | +1.5% a year | -2% cumulative | -5% cumulative |
| Unemployment rate (starting at 4%) | 4.2% | 7% | 9.5% |
| Residential house prices | +3% a year | -15% | -30% |
| Commercial property prices | +1% a year | -25% | -40% |
| Policy interest rate (starting at 4%) | 3.5% | 5.5% or 1% (depends on the story) | 6% or 0.5% |
| Equity market | +5% a year | -30% | -50% |

Notice that rates can go either way. A stagflation story (prices rising, economy shrinking) pushes rates up, which hurts borrowers with floating-rate loans; a classic demand collapse pushes rates down, which squeezes the bank's interest margin. The story matters, not just the severity.

## The macro variables

The **macroeconomic variables**, or macro variables, are the numbers that describe the economy in the scenario. The ones that matter most for credit risk:

| Variable | Plain words | Why it matters for credit losses |
|---|---|---|
| GDP growth | How fast the economy grows or shrinks | Companies earn less in a recession, so business defaults rise |
| Unemployment | Share of people who cannot find a job | People who lose jobs stop paying mortgages and cards. The biggest driver of retail losses |
| House prices | What homes are worth | Lower prices mean lower mortgage recoveries, so loss given default rises |
| Interest rates | The cost of borrowing | Higher repayments push up defaults for floating-rate and highly indebted borrowers; also changes the bank's interest income |
| Commercial property prices | Value of offices, shops, warehouses | Big falls cause both defaults (refinancing fails) and high losses on commercial real estate loans |
| Exchange rates, equity prices, credit spreads, commodities | Currency values, markets, oil and gas | Hurt borrowers with currency mismatches or sector exposure; drive trading and counterparty losses |

Scenarios are usually specified for several countries, because an international bank's losses depend on the economy where each borrower lives, as covered in [[26 Sovereign, Bank and Country Risk]].

## How macro variables turn into credit losses

This is the mechanism at the heart of credit stress testing. A scenario is just a set of numbers about the economy; the bank needs numbers about its own loans. The translation happens in four channels.

![[20-scenario-to-loss.svg]]
*How a macroeconomic scenario flows through satellite models into shifts in PD, rating migration, LGD and EAD, then into impairments, RWA and income, and finally into a capital ratio path that either clears the hurdle or does not.*

### Channel 1: probability of default rises

The **probability of default** (PD), introduced in [[02 What Credit Risk Is]] and modelled in [[10 Internal Ratings, Scorecards and PD Models]], goes up when the economy weakens. But it does not go up evenly. Unsecured consumer lending reacts quickly and strongly to unemployment. Construction, hotels, retail and commercial property react strongly to GDP and property prices. Utilities and food producers barely move. A borrower in a country hit hard by the scenario suffers more than one in a country hit lightly. So the stress uses PD shifts by **sector and country**, not a single multiplier for the whole book.

| Segment (illustrative) | Baseline annual PD | Adverse peak PD | Main driver |
|---|---|---|---|
| Prime mortgages | 0.5% | 1.2% | Unemployment, interest rates |
| Credit cards and personal loans | 3.0% | 6.5% | Unemployment |
| Small business | 2.0% | 5.0% | GDP, interest rates |
| Large corporate, investment grade | 0.3% | 0.9% | GDP, credit spreads |
| Large corporate, sub-investment grade | 2.5% | 7.0% | GDP, interest rates |
| Commercial real estate | 1.5% | 8.0% | Commercial property prices, interest rates |

### Channel 2: rating migration

Higher PDs show up as borrowers being **downgraded** on the bank's internal rating scale. A BBB-equivalent borrower becomes BB, a BB becomes B, some Bs default. Migration matters three times over. It raises expected losses. It moves loans from Stage 1 to Stage 2 under International Financial Reporting Standard 9 (IFRS 9), where the provision becomes lifetime rather than 12-month (see [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]]), which is often the largest single source of stress impairment in the first year. And for banks on the internal ratings-based (IRB) approach, a worse rating means a higher risk weight, so RWA inflates just as capital is falling. Stress testers model this with **migration matrices** that are "stressed" (shifted towards downgrades) according to the scenario.

### Channel 3: collateral values fall, so LGD rises

**Loss given default** (LGD) depends heavily on what the collateral is worth when the bank sells it (see [[11 Collateral and Security]]). If house prices fall 30%, a mortgage that had a loan-to-value of 70% now has one of 100%, and a forced sale at a further discount leaves the bank short. Commercial property is worse, because values fall further and buyers disappear. A simple illustration for one defaulted mortgage:

| | Before stress | After 30% house price fall |
|---|---|---|
| Loan balance | 140,000 | 140,000 |
| House value | 200,000 | 140,000 |
| Forced sale discount (20%) and costs (5%) | 50,000 | 35,000 |
| Net recovery | 150,000, capped at 140,000 owed | 105,000 |
| Loss | 0 | 35,000 |
| LGD | close to 0% (floors apply in practice) | 25% |

### Channel 4: exposure at default rises because borrowers draw down

**Exposure at default** (EAD) is the amount owed when the borrower defaults. Companies in trouble draw on every committed credit line they have, because cash is king in a crisis; consumers max out credit cards before they stop paying. In stress, the **credit conversion factor**, the share of an undrawn limit expected to be drawn before default, goes up. During the early weeks of the pandemic in 2020, many large companies drew their revolving credit facilities in full within days, which showed how fast this can happen.

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

Look at commercial real estate: 8.5% of the book produces 27% of the losses. That is exactly the kind of finding a stress test exists to surface.

### Step 2: spreading it over the years

Losses are not even. Year 1 is dominated by stage transfers and the first wave of unsecured defaults; year 2 is the peak as corporate and property defaults come through; year 3 sees recovery begin.

| | Year 1 | Year 2 | Year 3 |
|---|---|---|---|
| Pre-provision profit (income minus costs, already reduced by the scenario) | 1,200 | 1,000 | 1,100 |
| Credit impairments | 1,800 | 2,400 | 950 |
| Profit before tax | -600 | -1,400 | 150 |
| Tax (25% on profits; no credit assumed on losses for simplicity) | 0 | 0 | -38 |
| Profit after tax | -600 | -1,400 | 112 |

### Step 3: RWA inflation

As borrowers are downgraded and defaults rise, RWA grows. The bank also assumes its balance sheet stays the same size (a **static balance sheet**, which is a common regulatory assumption). RWA goes from 80,000 to 86,000 in year 1 and 90,000 in year 2, then eases to 88,000 in year 3 as defaulted loans are written off.

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

The trough is 7.9% in year 3. That clears the 7% hurdle, but only by 0.9 percentage points, which the board will consider too thin.

Now the bank applies a **management action**: cancel the dividend from year 2 onwards, a decision that is within its control, quick to execute and credible.

| | Start | Year 1 | Year 2 | Year 3 |
|---|---|---|---|---|
| CET1 at end of year | 10,000 | 9,000 | 7,600 | 7,712 |
| RWA | 80,000 | 86,000 | 90,000 | 88,000 |
| **CET1 ratio** | **12.5%** | **10.5%** | **8.4%** | **8.8%** |

The trough is now 8.4% in year 2. The **drawdown**, the fall from the starting ratio to the trough, is 12.5% minus 8.4% = 4.1 percentage points. That drawdown is the number supervisors look at most closely, because it measures how much capital the bank burns in stress, independent of where it started.

### Step 5: what the bank does with the answer

- The 4.1 point drawdown informs the size of the **Pillar 2 buffer** the supervisor will expect (see below).
- The concentration in commercial real estate leads the board to cut the commercial property limit in the risk appetite statement (see [[14 Risk Appetite, Limits and Concentration]]).
- Model validation is asked to check whether the commercial property LGD model has ever been tested on a 25% fall (see [[21 Model Risk Management and Validation]]).
- The capital plan is revised to keep at least 1.5 points of headroom over the hurdle at the stressed trough.

## The main regulatory exercises

Supervisors run their own stress tests on the banks they oversee. The details change from year to year and from country to country, so treat the descriptions below as generic.

| Exercise (generic) | Approach | Used for |
|---|---|---|
| Central bank annual stress test, covering the largest domestic banks | Supervisor sets a common severe scenario; banks run it on their own models; the supervisor challenges and adjusts, sometimes with its own models | Bank-specific buffers, system-wide view, dividend decisions, published results |
| European Banking Authority (EBA) EU-wide exercise, typically every two years with the European Central Bank and national supervisors | Common methodology and templates, mostly static balance sheet, banks' own models within strict constraints, supervisory quality assurance, results published by bank | Informing each bank's Pillar 2 guidance; market transparency. Not formally pass or fail |
| United States Federal Reserve programme for large bank holding companies | The Federal Reserve projects losses with its own supervisory models on detailed bank data, under baseline and severely adverse scenarios; banks also submit capital plans | Setting each bank's **stress capital buffer**, which feeds its capital requirement and limits on distributions |

Common features matter more to a platform lead than the differences: a fixed starting date, a prescribed scenario, prescribed templates with thousands of cells, a short submission window (often a few months), several rounds of supervisory questions requiring re-runs, and a requirement to explain every number back to loan-level data.

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

The **internal liquidity adequacy assessment process**, or ILAAP, is the sister of the ICAAP, but for liquidity: does the bank have enough cash and easily sold assets to survive a period of stress in which deposits leave, markets close and committed lines are drawn? The analogy is the difference between being rich and having cash in your pocket. You can own a house worth a fortune and still be unable to buy lunch if your wallet is empty and the banks are shut.

The ILAAP covers the funding profile, the liquidity buffer, liquidity stress tests (from a few days to a year), the survival horizon, intraday liquidity and the contingency funding plan. It is owned by treasury, but links to credit risk through drawdowns: the committed lines that raise EAD in a credit stress also drain cash in a liquidity stress, and the credit platform often supplies the undrawn commitment data.

## Pillar 2 add-ons

Pillar 1 is a formula that every bank applies the same way. It cannot capture everything about a particular bank. Pillar 2 tops it up, generally in two layers. The names differ by jurisdiction (for example, some regimes speak of Pillar 2A and Pillar 2B, others of Pillar 2 requirement and Pillar 2 guidance), but the shape is common:

| Layer | What it covers | How it is set | How binding |
|---|---|---|---|
| Pillar 2 requirement | Risks not covered, or not fully covered, by Pillar 1: credit concentration, interest rate risk in the banking book, pension risk, some operational risk gaps, model weaknesses | Supervisor's judgement informed by the bank's ICAAP quantification and its own benchmarks | Binding. Breaching it is treated like breaching a minimum requirement |
| Pillar 2 buffer or guidance | An extra cushion so the bank can absorb a severe stress without falling below its requirements | Informed by the stress test drawdown, adjusted for things the supervisor judges the stress did not capture and for any overlap with other buffers | Not usually a hard minimum, but supervisors expect it to be held, and dipping into it triggers close engagement |

Using the worked example: if the bank's adverse drawdown is 4.1 points, but some of that is already covered by the regulatory combined buffers, the supervisor might set a Pillar 2 buffer of, say, 1 to 2 points. The exact calibration method is each supervisor's own and is not public in full. The point for the platform is that **stress results translate directly into a capital number**, so the quality of the stress test has a direct cost.

In the American regime, the equivalent role is played by the stress capital buffer, which is calculated from the Federal Reserve's own supervisory stress test rather than the bank's internal one.

## How stress testing feeds risk appetite and limits

Stress testing is one of the main ways the bank's **risk appetite** is quantified (see [[14 Risk Appetite, Limits and Concentration]]). A typical risk appetite statement contains metrics such as:

- "CET1 ratio must remain above X% under the bank's internal severe stress scenario."
- "Stressed losses on commercial real estate must not exceed Y% of CET1."
- "Stressed impairments over three years must not exceed Z times one year of pre-provision profit."

From these top-level statements the bank cascades limits down to portfolios. If commercial real estate produces 1,400 of the 5,150 stressed loss, and the board's appetite says no single sector may contribute more than 20% of stressed losses, the commercial real estate limit is cut until it does. Similarly, sector and country limits are often sized so that their stressed loss fits within an allocated share of capital.

Stress testing also feeds day-to-day credit management. Portfolios with high stressed losses get tighter underwriting standards, borrowers that would be downgraded sharply in stress are flagged for closer monitoring (see [[15 Monitoring, Early Warning and Watchlist]]), and pricing models may charge for stressed capital consumption. In the other direction, the bank's **recovery plan** uses reverse stress testing to set **recovery indicators**, early warning thresholds that trigger escalation if capital or liquidity falls towards dangerous levels.

## Modelling approaches

### Satellite models

The workhorse of credit stress testing is the **satellite model**, so called because it orbits the main risk models. It is a statistical relationship, fitted on history, between macro variables and a risk parameter. A simple example:

> Change in credit card default rate = 0.6 x change in unemployment rate + 0.2 x change in policy interest rate

If unemployment rises 3 points and rates rise 1 point, the default rate rises by 0.6 x 3 + 0.2 x 1 = 2.0 points, say from 3.0% to 5.0%. Real satellite models use lags (unemployment this quarter hurts defaults two or three quarters later), several variables, and segments by product, sector and country. They are often built as regressions on historical default rates, or as models that shift a credit cycle index which then moves the whole PD term structure. LGD satellite models typically link collateral values to recovery rates, and EAD satellite models link drawdown behaviour to the economy.

The hard part is data. Satellite models need long histories that include at least one real downturn. Many portfolios were not around in 2008, many products have changed since, and defaults in good years are so rare that the model has little to learn from.

### Top-down versus bottom-up

| | Top-down | Bottom-up |
|---|---|---|
| How | Apply stressed loss rates to whole portfolios or segments | Recalculate each loan or borrower individually with stressed parameters |
| Who uses it | Supervisors checking banks, banks for quick or ad hoc scenarios | Banks for regulatory exercises and the ICAAP |
| Strengths | Fast, simple, easy to compare across banks | Captures the bank's actual mix, collateral and ratings; links to IFRS 9 and RWA engines |
| Weaknesses | Misses the detail of the specific book | Slow, data hungry, many models to orchestrate |
| Platform impact | A spreadsheet or small model can do it | Needs the full loan-level engine, run many times |

Large corporate exposures are sometimes stressed **name by name**: credit analysts take the biggest borrowers and re-rate them under the scenario using their knowledge of each business (see [[09 Credit Analysis - Reading a Borrower]]), because a statistical model cannot know that a particular airline has hedged its fuel or that a particular property company has refinancing due in year 2.

### Challenger models

A **challenger model** is a second, independent model built to check the main ("champion") model. If the satellite model for small business PD says losses rise 2.5 times in the scenario, and a simpler challenger built on different data says 4 times, someone needs to explain the gap. Supervisors increasingly use their own challenger models on bank data, so banks build their own to see the challenge coming. The model governance around champions and challengers is covered in [[21 Model Risk Management and Validation]].

### Expert overlays

When models cannot capture something, experts adjust the output. Examples: a sector the model treats like any other but which is unusually exposed to the scenario's story (energy-intensive industries in an energy shock); a new product with no history; a known model weakness. Overlays are the stress testing cousin of the post-model adjustments in [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]] and need the same discipline: written rationale, quantification method, owner, approval and a record of who changed what. Supervisors are suspicious of overlays that reduce losses.

## The link to IFRS 9 scenarios

The bank's accounting provisions under International Financial Reporting Standard 9 (IFRS 9) or CECL already use macroeconomic scenarios and satellite models, as described in [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]]. So stress testing and provisioning share a great deal of machinery, and most banks deliberately reuse it:

| | IFRS 9 / CECL provisioning | Stress testing |
|---|---|---|
| Purpose | Unbiased, probability-weighted estimate of expected loss for the accounts | Loss under a specific severe scenario for capital adequacy |
| Scenarios | Base, upside, downside, severe, with probability weights | Baseline, adverse, severely adverse, each assessed on its own (no weighting) |
| Horizon | Lifetime of each loan, with reversion to long-run averages | Three to five years of projection |
| Frequency | Every quarter or month | Annually for regulators and the ICAAP, more often for internal and ad hoc tests |
| PD basis | Point-in-time, forward-looking | Point-in-time, conditioned on the stress path |
| Output | Provision balance and charge | Impairment path, RWA path, capital ratio path |

In a stress projection, the bank must work out what its IFRS 9 provisions would be at the end of each stress year, which means running the expected credit loss engine as if each year had happened, with loans moving between stages. This is one of the biggest technical challenges in stress testing: the provision at the end of year 2 depends on what the scenario looks like from year 3 onwards, which is a forecast within a forecast. Banks and supervisors handle it with simplifying rules, and the approach is often prescribed in the regulatory methodology.

The practical benefit of sharing machinery is consistency: if the ECL engine and the stress engine disagree about how a 2-point rise in unemployment affects the card book, someone in the supervisory team will spot it.

## What a stress testing platform needs

![[20-stress-platform.svg]]
*A stress testing platform in three layers: data (position snapshot, macro history, scenario library), execution (model orchestration, overlays, aggregation) and output and control (results and templates, audit trail, re-run capability).*

| Capability | What it means | Why it matters |
|---|---|---|
| Data snapshots | A frozen, reconciled copy of every loan, collateral item, rating and limit as at the stress start date, kept unchanged for the life of the exercise | Every re-run must start from the same point. If the underlying data changes halfway through, results cannot be compared or explained |
| Scenario management | A versioned library of scenarios (regulatory, internal, reverse, ad hoc), each with a full path for every variable, country and quarter, plus who approved it | Scenarios change several times during an exercise; you must know which version produced which result |
| Model orchestration | Running satellite, PD, LGD, EAD, migration, ECL, RWA and income models in the right order, with outputs of one feeding the next, for every scenario and year | A typical bottom-up run involves dozens of models. Manual hand-offs between spreadsheets are the most common source of error |
| Overlays | A controlled place to apply expert adjustments, with rationale and approval, at the right level of granularity | Overlays must flow consistently into every downstream number and report |
| Aggregation | Summing results by legal entity, portfolio, country, sector, scenario and year, with consistent hierarchies | Regulators want templates by entity and portfolio; the board wants the group view |
| Templates and reporting | Producing regulator formats, board packs and management information from the same results | Thousands of template cells must tie back to the same numbers; see [[23 Reporting - Regulatory Returns, Pillar 3 and Management Information]] |
| Reconciliation | Starting positions agree to the general ledger and to regulatory returns; stress year-zero numbers agree to published figures | Supervisors check this first |
| Audit trail | Every run records the data snapshot, model versions, parameters, scenario version, overlays and approvers | Supervisors and auditors ask "how did you get this number?" months later |
| Run times | A full run in hours, not days | Exercises always need several re-runs; slow runs mean late submissions and no time for analysis |
| Re-runs and what-ifs | Ability to change one scenario variable, one model or one overlay and re-run quickly, and to compare results | The board will ask "what if property falls 35% instead of 25%?" the day before sign-off |

The reuse point from the previous section applies here: the best platforms share the data layer and model library with the ECL engine and the regulatory capital engine, so that stress testing is the same machinery run on a different future rather than a separate world.

## Typical pain points

- **The snapshot is never quite right.** Data for the start date arrives late, has gaps (missing collateral values, missing ratings for small borrowers) or changes after the cut-off because someone corrected the ledger. Every fix triggers a re-run.
- **Models built in different places by different people.** Satellite models in one language, PD models in another, ECL in a vendor engine, RWA in a separate calculator. Joining them up is manual and fragile.
- **Spreadsheets in the critical path.** Overlays, aggregation and template filling are often still done in spreadsheets, which are hard to version, hard to audit and easy to break.
- **Long run times.** Loan-level projection of tens of millions of accounts over three to five years and several scenarios can take days on older infrastructure, leaving no time for the questions that matter.
- **Late scenario changes.** Regulators publish clarifications and the board changes the internal scenario late in the cycle. Each change ripples through every model.
- **Supervisory questions.** Rounds of questions asking for breakdowns the bank did not plan for, by product, vintage, sector and country, with tight deadlines.
- **Inconsistency with other numbers.** The stress baseline does not match the budget; the stress ECL does not match the quarter-end ECL; the stress RWA does not match the regulatory return. Each mismatch needs explaining.
- **Key-person risk.** A handful of people understand how the whole chain fits together. When one leaves, the bank loses months.
- **Model weaknesses exposed by the scenario.** A scenario outside historical experience (very high rates, or a property fall larger than any in the data) pushes models where they were never tested, so the results depend on overlays.

## Common mistakes and misunderstandings

- **"A stress test is a forecast."** It is not. The adverse scenario is not what the bank expects; it is a deliberately bad story chosen to test resilience. Saying "the stress test predicts losses of 5,150" is wrong; it estimates losses *if* that scenario happened.
- **"Passing the stress test means the bank is safe."** It means the bank would survive that particular scenario under those assumptions. A different crisis (a cyber attack, a pandemic, a liquidity run) might hit very differently. That is why reverse stress testing exists.
- **Focusing on the end ratio, not the trough.** Capital often recovers by year 3. The test is the lowest point, not where the ratio ends up.
- **Ignoring RWA inflation.** Losses reduce the top of the ratio, but rating migration increases the bottom. Many first-time readers see impairments and forget that RWA rises at the same time.
- **Treating management actions as free.** Cutting dividends hits the share price; selling portfolios in a crisis means selling at a loss. Supervisors give little credit for actions that look convenient rather than credible.
- **Confusing the ICAAP with the supervisory stress test.** The supervisory test uses the regulator's scenario and rules. The ICAAP is the bank's own assessment, with its own scenarios tailored to its own vulnerabilities, covering all material risks. Both matter, and they should be consistent but are not the same.
- **Thinking Pillar 2 is optional.** Pillar 2 requirements are binding capital requirements, not suggestions.
- **Weighting stress scenarios like IFRS 9 scenarios.** Stress scenarios are assessed one at a time. Probability weighting is for accounting provisions.
- **Treating stress testing as a once-a-year project.** Supervisors expect the capability to be used all year, for risk appetite, limits, new products and ad hoc questions. A platform that can only be run once a year with a team of 40 people is itself a finding.
- **Assuming the models are right because they are models.** Satellite models are fitted on limited history. In a scenario beyond that history, expert judgement is doing much of the work, and that should be visible.

## What a platform lead needs to know about this

**Data.** The stress test needs the same loan-level data as the ECL engine and the regulatory capital engine (see [[22 Credit Risk Data, Systems and BCBS 239]]), frozen at the start date: balances, limits, schedules, ratings and PDs, collateral with valuation dates, sector and country codes, IFRS 9 stage, and legal entity. It also needs long macro histories for model fitting, historical default and loss data by segment, and the scenario paths. Snapshot management is the foundation: an immutable, reconciled, versioned copy of the starting position, retained for years. Expect the regulatory templates to ask for granularity (sector codes, country of risk, collateral type) that source systems do not hold cleanly.

**Systems.** A typical estate has a scenario repository, a model execution layer (often a mix of in-house code and vendor engines), the ECL and RWA calculators reused in "projection mode", a net interest income projection tool owned by finance or treasury, an overlay tool, an aggregation layer, and a template generator. The strategic goal is a single orchestrated pipeline where one command runs a scenario end to end, and where the same models and data are shared with quarterly provisioning and capital reporting. Run time, parallel runs of several scenarios, and fast partial re-runs are the performance requirements that matter.

**Controls.** Reconciliation of the starting position to the ledger and to the latest regulatory returns; version control of data snapshots, scenarios, models and parameters; model approval evidence from [[21 Model Risk Management and Validation]] attached to every model used; an overlay register with approvals; automated checks on outputs (losses move in the expected direction when the scenario worsens, no portfolio has negative losses, totals reconcile across templates); a full audit trail per run; access control so that whoever runs the engine cannot quietly change a model parameter; and evidence of board challenge. Supervisors and internal audit review the stress testing process itself, not just the results.

**Who owns what.** The board owns the ICAAP and approves scenarios and results. The chief risk officer usually owns stress testing as a process, often through a dedicated stress testing team that coordinates. Economics designs the scenarios. Credit risk modelling builds the satellite and parameter models; model validation checks them. Finance owns the balance sheet and income projections and the capital plan; treasury owns liquidity and the ILAAP. Business lines and credit officers provide name-by-name assessments and management action proposals. Regulatory reporting fills the templates. The platform team owns the data snapshots, the orchestration, the run schedule, the audit trail and the ability to re-run, and as in provisioning it is often the only team that sees the whole chain.

**The calendar.** Know when each exercise lands: regulatory scenario publication, data submission deadlines, supervisory question rounds, ICAAP board dates, the SREP letter. They overlap with quarter-end provisioning and capital reporting, which compete for the same people and infrastructure. The question you will be asked is "if the regulator changes the house price path on Monday, how quickly can we re-submit?". Have a measured answer.

## Related notes

- [[02 What Credit Risk Is]] for PD, LGD, EAD and expected versus unexpected loss.
- [[09 Credit Analysis - Reading a Borrower]] for name-by-name stress assessment of large borrowers.
- [[10 Internal Ratings, Scorecards and PD Models]] for the rating models and migration matrices that stress testing shifts.
- [[11 Collateral and Security]] for collateral values and haircuts that drive stressed LGD.
- [[13 Credit Governance - Committees, Authorities and the Three Lines]] for board and committee oversight.
- [[14 Risk Appetite, Limits and Concentration]] for how stressed losses set appetite and limits.
- [[15 Monitoring, Early Warning and Watchlist]] for using stress vulnerability in monitoring.
- [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]] for the shared scenario and satellite model machinery.
- [[18 Regulatory Capital and Basel - the Short Version]], [[basel-credit-risk-explained-simply]] and [[basel-credit-risk-decision-tree]] for Pillar 1, RWA and the capital stack.
- [[19 Counterparty Credit Risk and Derivatives]] for counterparty stress.
- [[21 Model Risk Management and Validation]] for validating satellite and challenger models.
- [[22 Credit Risk Data, Systems and BCBS 239]] for the data architecture and aggregation principles.
- [[23 Reporting - Regulatory Returns, Pillar 3 and Management Information]] for templates and disclosures.
- [[24 Pricing, RAROC and Return on Capital]] for using stressed capital in pricing.
- [[25 Climate, ESG and Emerging Credit Risks]] for climate scenario analysis.
- [[26 Sovereign, Bank and Country Risk]] for country dimensions of scenarios.
- [[28 Master Glossary]].
