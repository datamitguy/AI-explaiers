# Internal Ratings, Scorecards and PD Models

**Why this matters to you.** A rating is the bank's one-number opinion of how likely a borrower is to fail. That number drives who gets a loan, what they pay, how much capital the bank holds, how much it provisions, which limits apply, and what gets reported to the regulator. Rating models and scorecards are therefore the most scrutinised software in a bank: regulators inspect them line by line, validators test them every year, auditors trace every input, and a flaw in one can cost a bank its permission to use its own models for capital. As a platform lead you will own or support the systems that run these models, feed them data, store their outputs, log overrides, and prove to the regulator that the number on the capital return is the number the model produced. This note explains what the models do and what "good" looks like.

## Table of contents

1. [What a rating is](#what-a-rating-is)
2. [External rating agencies and their scales](#external-rating-agencies-and-their-scales)
3. [Internal master scales and mapping](#internal-master-scales-and-mapping)
4. [Through-the-cycle versus point-in-time](#through-the-cycle-versus-point-in-time)
5. [Rating models versus scorecards](#rating-models-versus-scorecards)
6. [How a corporate rating model is built](#how-a-corporate-rating-model-is-built)
7. [The override process and its governance](#the-override-process-and-its-governance)
8. [How a retail scorecard is built](#how-a-retail-scorecard-is-built)
9. [Measuring discrimination: Gini and KS](#measuring-discrimination-gini-and-ks)
10. [Calibration to default rates](#calibration-to-default-rates)
11. [Rating migration matrices](#rating-migration-matrices)
12. [Low-default portfolios](#low-default-portfolios)
13. [From rating to PD, LGD and EAD](#from-rating-to-pd-lgd-and-ead)
14. [Model monitoring and backtesting](#model-monitoring-and-backtesting)
15. [Regulatory requirements for IRB models in plain words](#regulatory-requirements-for-irb-models-in-plain-words)
16. [Common mistakes and misunderstandings](#common-mistakes-and-misunderstandings)
17. [What a platform lead needs to know about this](#what-a-platform-lead-needs-to-know-about-this)
18. [Related notes](#related-notes)

## What a rating is

In your class there are kids you would lend your bike to without thinking, kids you would lend it to if they promised to be careful, and kids you would not lend it to at all. You have not written anything down, but you have rated them. A rating is that judgement made explicit: a grade on a fixed scale that says how likely someone is to let you down.

In a bank, a **credit rating** (or **risk grade**, or **obligor grade**) is a grade on a scale, assigned to each borrower, meaning "borrowers with this grade default at roughly this rate." Each grade is linked to a **probability of default** (PD), the chance of default in the next year, explained in [[02 What Credit Risk Is]] and [[basel-credit-risk-explained-simply]]. Grade 1 might mean 0.03% PD (3 in 10,000 such borrowers fail in a year); grade 15 might mean 15%.

Two things to keep separate from the start:

- An **obligor rating** (borrower rating) is about the borrower: will this company or person default? It is the same whatever loan they have.
- A **facility rating** is about a particular loan: given the security and ranking, how much would the bank lose? That is the loss given default (LGD) side, covered later and in [[11 Collateral and Security]].

Ratings are used everywhere in the bank: in the approval decision and the level of authority needed (see [[13 Credit Governance - Committees, Authorities and the Three Lines]]), in pricing (see [[24 Pricing, RAROC and Return on Capital]]), in limits (see [[14 Risk Appetite, Limits and Concentration]]), in provisioning (see [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]]), in capital (see [[18 Regulatory Capital and Basel - the Short Version]]), in monitoring (a downgrade is the main early warning trigger, see [[15 Monitoring, Early Warning and Watchlist]]), and in every report to the board and the regulator.

## External rating agencies and their scales

Three companies dominate public credit ratings: **S&P Global Ratings**, **Moody's** and **Fitch**. They rate governments, banks, companies and bonds, publish the ratings, and are paid mostly by the issuers they rate (a conflict of interest that became notorious after 2008). Their scales, from safest to worst:

| S&P and Fitch | Moody's | Plain meaning | Category | Rough one-year default rate (long-run average, illustrative) |
|---|---|---|---|---|
| AAA | Aaa | Almost no chance of default | Investment grade | near 0% |
| AA+, AA, AA- | Aa1, Aa2, Aa3 | Very strong | Investment grade | about 0.02% |
| A+, A, A- | A1, A2, A3 | Strong | Investment grade | about 0.05% |
| BBB+, BBB, BBB- | Baa1, Baa2, Baa3 | Adequate; the lowest investment grade | Investment grade | about 0.15% to 0.25% |
| BB+, BB, BB- | Ba1, Ba2, Ba3 | Speculative | Sub-investment grade (high yield) | about 0.5% to 1% |
| B+, B, B- | B1, B2, B3 | Highly speculative | Sub-investment grade | about 2% to 5% |
| CCC+, CCC, CCC- | Caa1, Caa2, Caa3 | Substantial risk; default likely | Sub-investment grade | 20% to 30% or more |
| CC, C | Ca, C | Default imminent or in progress | Sub-investment grade | very high |
| D (S&P), RD/D (Fitch) | (no symbol; Moody's uses C) | In default | Default | 100% |

The line between **BBB- and BB+** is the most important boundary in finance. Above it is **investment grade**: many funds, insurers and pension schemes are only allowed to hold investment-grade bonds, so a company that drops below (a "fallen angel") sees its borrowing cost jump and its investor base shrink. Below it is **sub-investment grade**, **speculative grade** or **high yield**, which is where [[07 Leveraged and Acquisition Finance]] lives.

Agency ratings also come with an **outlook** (positive, stable, negative) and a **watch** (a review likely to lead to a change within weeks). Agencies rate the long-term and short-term, the issuer and each instrument (a secured bond can be rated higher than the company; a subordinated bond lower).

Under the standardised approach to capital, agency ratings map straight to risk weights (see [[basel-credit-risk-explained-simply]]). Under the internal ratings-based approach they are an input to the bank's own view, a comparison point, and sometimes the basis of a model for borrowers the bank has too little data on.

## Internal master scales and mapping

Each bank has its own **master scale**: a list of grades, each with a PD range and a midpoint PD. A typical corporate master scale has 20 to 25 performing grades plus one or more default grades. Illustrative:

| Internal grade | PD range | Midpoint PD | Approximate agency equivalent |
|---|---|---|---|
| 1 | 0.00% to 0.03% | 0.02% | AAA to AA |
| 2 | 0.03% to 0.05% | 0.04% | AA- to A+ |
| 3 | 0.05% to 0.08% | 0.06% | A |
| 4 | 0.08% to 0.12% | 0.10% | A- |
| 5 | 0.12% to 0.20% | 0.16% | BBB+ |
| 6 | 0.20% to 0.30% | 0.25% | BBB |
| 7 | 0.30% to 0.50% | 0.40% | BBB- |
| 8 | 0.50% to 0.80% | 0.65% | BB+ |
| 9 | 0.80% to 1.20% | 1.00% | BB |
| 10 | 1.20% to 1.80% | 1.50% | BB- |
| 11 | 1.80% to 2.80% | 2.30% | B+ |
| 12 | 2.80% to 4.50% | 3.50% | B |
| 13 | 4.50% to 7.00% | 5.50% | B- |
| 14 | 7.00% to 12.00% | 9.00% | CCC+ |
| 15 | 12.00% to 20.00% | 15.00% | CCC |
| 16 | 20.00% to 100% | 30.00% | CCC- to C |
| D1, D2, D3 | 100% | 100% | Default, by stage of workout |

The master scale is the bank's common language. Every rating model, whether for large corporates, small businesses, banks, sovereigns, project finance or mortgages, produces a PD that is then placed on this one scale, so that a grade 9 bank is as risky as a grade 9 company. The mapping to agency ratings is approximate and is used for communication and benchmarking, not as a rule. Banks are warned by regulators not to simply copy agency ratings into internal grades for borrowers that happen to have one.

Retail portfolios often use a separate master scale with more grades at the high-PD end, or map score bands directly to pools (see [[05 Retail Lending]]).

## Through-the-cycle versus point-in-time

Here is a question that sounds philosophical and turns out to decide billions of capital. If the economy is booming, should a company's rating be better than it was two years ago, even though nothing about the company has changed?

A **point-in-time** (PIT) rating says yes: it tries to predict the actual chance of default in the next 12 months, given everything we know today, including the state of the economy. PIT ratings improve in booms and worsen in recessions for everyone at once. They are accurate at any moment but volatile.

A **through-the-cycle** (TTC) rating says no: it tries to grade the borrower's underlying strength averaged over a full economic cycle, ignoring where we happen to be in it. TTC ratings are stable; a company is downgraded only when its own position deteriorates. They are what agency ratings aim at.

Why it matters:

- **Capital** is meant to be TTC. The Basel rules ask for PDs that are long-run averages, so that capital does not collapse in a boom (when the bank is lending most) and spike in a bust (when raising capital is hardest). A fully PIT capital model would be **procyclical**, amplifying the cycle.
- **Provisions** under IFRS 9 and CECL are meant to be PIT: they are supposed to reflect today's best estimate of loss, including the economic outlook (see [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]]). So banks have to convert their capital PDs into PIT PDs for accounting.
- **Pricing and monitoring** generally want PIT.

In practice every model is a hybrid somewhere on the spectrum, and the bank has to know where its models sit (regulators ask, and validation measures it by seeing how far ratings move with the cycle). A common architecture is: a TTC-leaning rating model for the grade and regulatory PD, plus a separate overlay that adjusts for the economic scenario to produce the PIT PD for IFRS 9 and stress testing (see [[20 Stress Testing and ICAAP]]).

## Rating models versus scorecards

The words are used loosely, but there is a real difference in how the two families work and who they are for.

| | Rating model (wholesale) | Scorecard (retail) |
|---|---|---|
| Used for | Companies, banks, sovereigns, specialised lending | Individuals, very small businesses, credit cards, mortgages, car loans |
| Number of borrowers | Thousands | Millions |
| Defaults available to learn from | Few; sometimes almost none | Many |
| Inputs | Financial statements, qualitative questionnaire, external data | Application data, bureau data, account behaviour |
| Method | Statistical where data allows, blended with expert judgement; often a structured scorecard of ratios and questions with weights set partly by experts | Statistical: logistic regression on historical data; increasingly machine learning with constraints |
| Human involvement | An analyst runs it and may override | Automated; a human only sees exceptions |
| Output | A grade on the master scale | A score (e.g. 300 to 900) mapped to a PD and a decision |
| Frequency | At origination and annually, or on events | At application (application scorecard) and monthly (behavioural scorecard) |
| Examples | Large corporate model, SME model, bank model, project finance slotting template | Credit card application scorecard, mortgage behavioural scorecard, collections scorecard |

The distinction matters because the two families have different failure modes. Rating models fail through inconsistent human judgement and stale financials. Scorecards fail through population drift (the applicants today are not like the applicants the model learned from) and through blind spots in the data.

## How a corporate rating model is built

Imagine designing a scoring sheet for a school fair's lemonade stands, to predict which will still be running at the end of term. You would list the things that matter (sales, costs, money saved, how organised the owner is), give each a score, weight them by importance, and add them up. A corporate rating model is that, with the weights chosen by statistics where possible and by experienced bankers where not.

![[10-rating-model-pipeline.svg]]
*A corporate rating model from inputs to final grade. Financial and qualitative scores are combined into a model grade, mandatory adjustments are applied, the analyst may propose an override with governance, and the result feeds monitoring.*

**Step 1: segment.** One model does not fit all. Banks build separate models for large corporates, mid-sized companies, small businesses, banks, insurers, sovereigns, real estate, project finance, commodity traders, funds, and so on, because the drivers of default differ. Each model has a defined scope, and assigning a borrower to the right model is itself a controlled step.

**Step 2: financial factors.** The model takes the spread financial statements (see [[09 Credit Analysis - Reading a Borrower]]) and computes a set of ratios: typically leverage (net debt / EBITDA, gearing), coverage (interest cover, debt service cover), profitability (margins, return on capital), liquidity (current ratio, cash / short-term debt), size (revenue or total assets, because big companies default less), and sometimes growth and volatility. Each ratio is transformed into a score (a value of 2.0x leverage might score 70 out of 100; 6.0x might score 20) using a curve derived from historical default data where it exists and from expert judgement where it does not. The ratio scores are combined with weights (say leverage 30%, coverage 25%, profitability 20%, liquidity 15%, size 10%) into a **financial score**.

**Step 3: qualitative factors.** The analyst answers a structured questionnaire: industry risk (often pulled from a bank-wide industry rating), competitive position, management quality and track record, quality of financial reporting, ownership and group support, country risk, customer and supplier concentration, access to funding. Each answer is a choice from a fixed set ("strong, adequate, weak") with points attached. Qualitative factors typically carry 30% to 50% of the weight for large corporates and less for small businesses, where the data is thinner and more objective.

**Step 4: combine and map.** The financial and qualitative scores are combined into a total score, which is mapped to a grade on the master scale and so to a PD. The mapping is set at calibration (below).

**Step 5: mandatory adjustments.** Rules that the model applies automatically: a **sovereign ceiling** (a company cannot usually be rated better than its country, with exceptions); **parent support** (lift towards the parent's grade if there is a guarantee or strong support, or a cap at the parent's grade if the parent is weak and could drain the subsidiary); **warning signals** (a covenant breach, an overdue payment, a qualified audit opinion, a watchlist flag) that cap the grade; and **age of financials** (stale accounts force a downgrade or block the rating).

**Step 6: override.** The analyst can propose a different grade, as described in the next section.

**Step 7: approval.** The grade is approved by someone with authority, usually alongside the credit decision.

Where the data allows, the weights and transformations in steps 2 and 3 are fitted statistically (usually by logistic regression, like a scorecard) on the bank's own default history, sometimes pooled with other banks' data through a consortium, and the expert inputs are used to check and adjust. Where the data does not allow (banks, sovereigns, large corporates, project finance), the model is **expert-based**: the weights are set by a panel of experienced credit officers, and the model is calibrated to external default data or to agency ratings. Regulators accept this but expect the bank to prove the model discriminates (see Gini below) and to be conservative.

## The override process and its governance

No model knows everything. The analyst may know that the chief executive has just resigned, that the main customer is about to be lost, or that the accounts flatter the business because of a one-off gain. An **override** is a change from the model grade to a different final grade, with a written reason.

Overrides are both necessary and dangerous. Necessary because a model with no override path forces analysts to game the inputs instead. Dangerous because overrides are almost always upgrades (relationship managers want deals approved) and because a model whose output is routinely overridden is not really the model the regulator approved. So banks govern them:

| Control | Typical form |
|---|---|
| Reason codes | A fixed list of permitted reasons (new information not in the model, data quality, event risk, group support) plus free text |
| Direction and size limits | Upgrades limited to one or two notches without senior approval; downgrades allowed more freely |
| Approval authority | An override beyond a set size needs a more senior credit officer or a committee |
| Logging | Every override stored with model grade, final grade, reason, approver and date |
| Monitoring | Override rate by model, by analyst, by business unit, by direction; a model with more than about 10% to 20% overrides (banks set their own trigger) is reviewed for redevelopment |
| Performance tracking | Do overridden grades predict default better or worse than the model grades? If the analysts are consistently right, the model needs a new factor; if wrong, the override policy needs tightening |
| Regulatory reporting | Override statistics are a standard part of the annual model report and of supervisory inspections |

A related concept is the **rating trigger** or **mandatory downgrade**: not an override but a rule, for example "90 days past due means default grade" or "watchlist status caps the grade at 12." These are not discretionary and must be applied by the system.

## How a retail scorecard is built

Scorecards are the retail counterpart and are more purely statistical. Imagine you had records of 100,000 kids who borrowed bikes over the last three years, with everything you knew about each when they asked (age, whether they had returned a bike before, how many bikes they already had out, whether their friends vouched for them), and whether they brought the bike back. You could work out which facts predicted a lost bike and how strongly, and turn that into a points sheet. That is a scorecard.

![[10-scorecard-build.svg]]
*The scorecard build pipeline. The loop back from discrimination testing to variable selection is normal; most scorecards go round it several times before calibration and validation.*

**Step 1: define the target.** What counts as "bad"? Usually 90 days past due or worse within 12 months of the observation point (aligned to the regulatory definition of default; see [[02 What Credit Risk Is]]). "Good" is never worse than, say, 30 days past due. Accounts in between are "indeterminate" and often excluded from the build. The **observation window** is the period of history used to build the variables; the **performance window** (or outcome window) is the 12 months afterwards in which the outcome is observed.

**Step 2: assemble the sample.** Take all accounts opened (for an application scorecard) or all accounts active (for a behavioural scorecard) in a period, say 2019 to 2022, with their data at the observation point and their outcome. Typical sizes: 100,000 to several million accounts, with 1% to 5% bads. Exclusions: fraud, deceased, staff accounts, products no longer offered. **Reject inference** is the awkward step for application scorecards: the bank only knows the outcome for applicants it accepted, so it must estimate what the rejected ones would have done (using bureau data on how they performed with other lenders, or statistical inference), otherwise the model learns only from the pre-filtered population.

**Step 3: candidate variables.** Application scorecards use what the applicant tells you and what the credit bureau knows: age, income, employment status and tenure, residential status, time at address, number of existing credit accounts, total existing debt, utilisation of existing limits, number of recent credit searches, any missed payments or defaults on record, and the bureau's own score. Behavioural scorecards use the account's own history with the bank: months on book, current balance, utilisation, payment pattern (full, minimum, missed), days past due in the last 6 and 12 months, cash withdrawals on a credit card, overdraft excesses, salary credits. Anti-discrimination law bans some variables (race, religion, in many countries gender and sometimes age) and regulators scrutinise **proxies** that stand in for them (postcode, for instance).

**Step 4: binning and weight of evidence.** Each variable is divided into **bins** (bands): age 18 to 24, 25 to 34, and so on; utilisation 0% to 20%, 20% to 50%, and so on; missing values get their own bin. For each bin the modeller calculates the **weight of evidence** (WoE): the natural logarithm of (share of all goods in this bin / share of all bads in this bin). A bin with WoE of +0.8 contains proportionately more goods than the population; -0.8 more bads. Binning handles non-linear effects (very young and very old applicants both riskier than the middle), makes the model robust to outliers, and gives a monotonic, explainable relationship. The **information value** (IV) of a variable sums the WoE contribution across bins and measures how predictive the variable is as a whole; rules of thumb say IV below 0.02 is useless, above 0.3 is strong, and above 0.5 suspiciously strong (possibly leaking the outcome).

**Step 5: variable selection.** Keep variables with good IV, low correlation with each other, stability over time (the **population stability index**, PSI, measures whether the distribution of a variable has shifted between build sample and recent data), legal acceptability, and business sense. A final scorecard usually has 8 to 15 variables.

**Step 6: logistic regression.** The model predicts the probability that an account is bad. **Logistic regression** is the standard method: it fits a straight-line formula to the WoE values of the variables, and then squashes the result through a curve (the logistic function) so that the output is between 0 and 1. The formula is: log(odds of bad) = a + b1 x WoE1 + b2 x WoE2 + ... where the b's are the fitted coefficients. The modeller checks that every coefficient has the expected sign and is statistically meaningful. Machine learning methods (gradient boosting, random forests, neural networks) can predict better but are harder to explain, and regulators in most countries require explainability for decisions that affect consumers, so they are used mostly as challengers or for fraud and collections rather than for the regulatory PD.

**Step 7: scaling to points.** The log-odds are converted to a score people can read. A common convention: a score of 600 means odds of 50 good to 1 bad, and every 20 points doubles the odds (so 620 is 100:1 and 580 is 25:1). Each variable's bins then get integer points, and the scorecard becomes a lookup table: "age 25 to 34: 32 points; utilisation 20% to 50%: 18 points; no missed payments in 12 months: 45 points," and so on. Applicants' points are added up. This is what the branch system or the online journey runs.

**Step 8 to 10**: discrimination testing, calibration and validation, covered next.

The score drives a **decision strategy**: approve above a **cut-off** score, decline below a lower one, refer the middle to a human; set the limit and the price by score band. The cut-off is a business choice (accept more risk for more volume, or less), separate from the model. See [[05 Retail Lending]].

## Measuring discrimination: Gini and KS

A model **discriminates** well if it gives bad borrowers worse scores than good ones. Two statistics are universal.

**The Gini coefficient** (closely related to the **accuracy ratio** and to the **area under the ROC curve**, AUC). Line up every borrower from worst score to best. Walk along the line and count what share of all the defaulters you have passed. A perfect model puts all the defaulters first, so you reach 100% of defaulters after passing only the defaulters. A useless model scatters them randomly, so you reach 50% of defaulters after passing 50% of borrowers. Plot the curve (the cumulative accuracy profile), and the Gini is the area between the model's curve and the random diagonal, as a fraction of the area between the perfect curve and the diagonal. Gini of 1 is perfect; 0 is random. AUC = (Gini + 1) / 2.

Illustrative Ginis: a good retail application scorecard 0.50 to 0.70; a behavioural scorecard 0.70 to 0.85 (because the bank's own payment history is very informative); a corporate rating model 0.50 to 0.75; a low-default portfolio model, often lower and measured with huge uncertainty. Validation compares the Gini on the build sample, on a **hold-out** sample (data the model never saw), and **out-of-time** (a later period), and watches for decay.

**The Kolmogorov-Smirnov (KS) statistic.** Plot the cumulative share of goods and the cumulative share of bads against score. The KS is the largest vertical gap between the two curves: the score at which the model best separates the populations. KS of 0.40 means that at the best cut-off, 40 percentage points more of the bads than of the goods are below it. Ginis of 0.6 roughly correspond to KS around 0.45, though it depends on the shape.

Both measure ranking, not level. A model can have a superb Gini and predict PDs that are all twice too high. That is a calibration problem.

## Calibration to default rates

**Calibration** is making the PDs match reality. After the model ranks borrowers, each grade or score band is assigned a PD equal to the default rate the bank expects for that band.

Pocket money version: you have sorted your classmates into five groups by how likely they are to lose a borrowed bike. Calibration is going back through the last three years of lending and finding that group 1 lost 1 in 100 bikes, group 2 lost 3 in 100, and so on, and writing those numbers on the groups.

For regulatory capital the PD must be a **long-run average** of one-year default rates, covering at least five years of data (more is better, and the period should include a downturn), with a **margin of conservatism** added for data gaps and uncertainty. The steps:

1. Compute the observed default rate per grade or score band in each year of history.
2. Average over the years (ideally weighting so that the mix of good and bad years matches a full cycle; if the bank's data covers only a boom, it must adjust upwards).
3. Fit a smooth curve so that PDs increase steadily with grade and small grades do not have noisy estimates.
4. Add margins of conservatism for identified deficiencies.
5. Apply the regulatory floor (0.05% for most exposures; see [[basel-credit-risk-explained-simply]]).

Illustrative calibration table for a scorecard:

| Score band | Accounts | Observed bads (5-year average annual rate) | Calibrated PD |
|---|---|---|---|
| 720+ | 40,000 | 0.3% | 0.35% |
| 680 to 719 | 60,000 | 0.8% | 0.9% |
| 640 to 679 | 50,000 | 2.0% | 2.2% |
| 600 to 639 | 30,000 | 4.5% | 5.0% |
| below 600 | 20,000 | 9.0% | 10.0% |

The calibrated PD is slightly above the observed rate: that is the margin of conservatism.

For IFRS 9 the same bands get PIT PDs that move with the economic forecast, and lifetime PDs that extend the one-year number over the remaining life of the loan.

## Rating migration matrices

Ratings move. A **migration matrix** (transition matrix) shows, for borrowers starting the year in each grade, what share ended the year in each grade, defaulted, or left the bank. It is the standard way to see how stable a rating system is and to project how a portfolio will look in future.

Illustrative, with grades grouped for readability:

| From \ To | A-range | BBB-range | BB-range | B-range | CCC and below | Default |
|---|---|---|---|---|---|---|
| A-range | 90% | 8% | 1.5% | 0.4% | 0.05% | 0.05% |
| BBB-range | 4% | 87% | 7% | 1.5% | 0.3% | 0.2% |
| BB-range | 0.5% | 6% | 82% | 9% | 1.5% | 1.0% |
| B-range | 0.1% | 1% | 7% | 78% | 9.9% | 4.0% |
| CCC and below | 0% | 0.5% | 2% | 10% | 62.5% | 25% |

Read across a row: of borrowers that started in the BB range, 82% stayed, 6% improved to BBB, 9% fell to B, and 1% defaulted. The diagonal shows stability; a TTC system has a heavier diagonal than a PIT one. The last column is the one-year default rate by grade, which is the calibration check. Matrices are built per model and per year, and compared with agency matrices as a benchmark. They also drive IFRS 9 stage 2 identification (a significant increase in credit risk is often defined as a move of a certain number of notches) and the **lifetime PD** by multiplying the matrix by itself for each year ahead.

## Low-default portfolios

Some portfolios almost never default: lending to governments of rich countries, to large banks, to the biggest multinationals, and to some specialised lending types. A bank may have 500 such borrowers and 2 defaults in 15 years. You cannot calibrate a PD to that; the observed rate is 0.03% with an uncertainty range that spans from 0% to maybe 0.3%.

Regulators recognise **low-default portfolios** (LDPs) and expect banks to: use conservative statistical methods that estimate an upper bound for the PD rather than the point estimate; pool data across banks and years; use external data (agency default studies, consortium data); benchmark grades to agency ratings; rely more on expert judgement in the model design; and hold larger margins of conservatism. The Basel III final reforms went further and simply banned the advanced approach for banks, large corporates and financial institutions (see [[basel-credit-risk-explained-simply]]), partly because LGD and EAD estimates for these portfolios were unreliable.

For the platform, LDP models are a reminder that a rating system is not only a statistical artefact: the governance, the expert panels, the benchmarking and the documentation are what regulators inspect, because the data cannot speak for itself.

## From rating to PD, LGD and EAD

The rating gives the PD. Capital and expected loss need two more parameters, and both have their own models.

![[10-rating-to-capital.svg]]
*From an internal grade to capital and the other uses. PD comes from the grade; LGD and EAD from separate models; together they give expected loss, and through the Basel formula, risk-weighted assets and capital.*

### Loss given default (LGD)

The share of the exposure the bank does not get back after default. Two ways to measure it:

- **Workout LGD**: follow every defaulted loan through its recovery process (sale of collateral, restructuring, write-off), add up the cash recovered minus the costs, discount back to the default date at an appropriate rate, and compare with the exposure at default. This is what banks do for their own portfolios and it requires years of **recovery data** per defaulted facility: every cash flow, every cost, every collateral sale, for the whole workout (which can take 3 to 7 years for corporates). Incomplete workouts must be handled carefully.
- **Market LGD**: for bonds and traded loans, take the market price shortly after default as the recovery. Used mostly for large corporates and by agencies.

An LGD model then explains the observed LGDs with drivers: collateral type and coverage (see [[11 Collateral and Security]]), seniority and ranking, the type of borrower, the country and its legal system (how fast and how costly is enforcement), and sometimes the economic conditions. Typical ranges (illustrative): senior secured on good property 10% to 25%; senior unsecured corporate 35% to 50%; subordinated 60% to 80%; unsecured retail 60% to 90%. The regulatory supervisory LGD for senior unsecured corporate under the foundation approach is 40% (see [[basel-credit-risk-explained-simply]]).

**Downturn LGD**: recoveries are worse in recessions, because collateral prices fall when everyone is selling. The capital LGD must reflect a downturn, so banks either observe LGDs in a past downturn or add a conservative adjustment. For IFRS 9, LGD is instead the expected value under the forecast scenario.

### Exposure at default (EAD)

How much will be owed when default happens. For a term loan, it is the balance. For anything with an undrawn part (overdrafts, credit cards, revolving credit facilities, guarantees), the borrower may draw more before defaulting. EAD = drawn amount + **credit conversion factor** (CCF) x undrawn amount. Under the standardised and foundation approaches the CCFs are fixed by the rulebook (see [[basel-credit-risk-explained-simply]]); under the advanced approach the bank models them from its own data on how much borrowers drew in the year before defaulting. A typical modelled CCF for a corporate revolving facility is 40% to 70% of the undrawn; for credit cards it is often higher. **Utilisation** behaviour is the driver: companies in trouble draw down their lines, so a line that is 30% drawn today may be 80% drawn at default.

Expected loss is PD x LGD x EAD, and the IRB capital formula takes PD, LGD and maturity to give the capital per unit of exposure; see [[18 Regulatory Capital and Basel - the Short Version]] for the worked example.

## Model monitoring and backtesting

A model is built once and used for years. Monitoring checks that it still works. The standard quarterly or annual checks:

| Check | Question | Measure |
|---|---|---|
| Discrimination | Does it still rank well? | Gini, KS, on recent data; compared with build |
| Calibration | Are the PDs still right? | Observed default rate per grade versus predicted; binomial or similar statistical tests; traffic-light thresholds |
| Stability | Is the population still like the build population? | PSI on scores and on each variable |
| Migration | Are ratings stable or churning? | Migration matrix, average notches moved |
| Overrides | Is the model being used as designed? | Override rate, direction, approval, performance of overrides |
| Data quality | Are the inputs complete and timely? | Missing rates, age of financials, manual adjustments |
| Usage | Is the model being used where it should be? | Share of exposures rated by the right model; unrated exposures |
| Benchmarking | Does it agree with other views? | Comparison with agency ratings, bureau scores, challenger models |

**Backtesting** is the calibration check done formally: compare predicted PD with realised default rates over a year, per grade, and test whether the difference is within what chance would explain. A grade with predicted PD of 1% and 300 borrowers should see about 3 defaults; if it sees 9, the test fails and the model is under-predicting. Because defaults are rare, backtests have low power, and small portfolios can go years without a statistically significant result either way; regulators know this and expect judgement.

Monitoring results go to a model committee, and a failing model is recalibrated, redeveloped, or has a conservative overlay applied in the meantime. The full lifecycle (development, validation, approval, implementation, monitoring, change, retirement) is in [[21 Model Risk Management and Validation]].

## Regulatory requirements for IRB models in plain words

A bank that wants to use its own ratings for capital must get permission under the **internal ratings-based** (IRB) approach (see [[18 Regulatory Capital and Basel - the Short Version]]). The rulebook's requirements, stripped of jargon:

**The use test.** The bank must actually use the ratings to run the business: in approvals, pricing, limits, provisioning, monitoring and reporting. A model built only to produce a low capital number, while the real decisions are made some other way, will not be approved. Supervisors check this by looking at credit papers and committee minutes.

**Data history.** At least five years of default data for PD (more for retail LGD and EAD, seven years for corporate LGD and EAD under the rules as commonly implemented), covering a full economic cycle if possible, with the data stored, documented and reconcilable.

**Independence of validation.** The people who check the model must be independent of the people who built it and of the business that uses it, must have the authority to reject it, and must report to senior management and the board. See [[21 Model Risk Management and Validation]].

**Rating system design.** A meaningful number of grades (at least seven performing plus one default for corporates), no undue concentration in one grade, a clear definition of each grade, and documented criteria.

**Consistency with the definition of default.** The model's "bad" must be the regulatory default (90 days past due or unlikely to pay), applied the same way everywhere, with cure rules.

**Conservatism.** Margins of conservatism for data weaknesses; long-run PDs; downturn LGDs; floors.

**Documentation.** Everything written down: design, data, methodology, assumptions, limitations, testing, approvals, changes.

**Governance.** Board and senior management must understand and approve the rating systems; internal audit must review them; there must be a credit risk control unit independent of origination that owns the models' design and performance.

**Implementation integrity.** The model in the system must be the model that was approved. Changes go through a controlled process; material changes need regulatory approval before use.

**Ongoing permission.** The regulator can and does withdraw permission, impose capital add-ons, or require model fixes after inspections.

In the euro area, the European Central Bank's targeted review of internal models (the "TRIM" exercise of the late 2010s) and its later guide to internal models set out hundreds of pages of detailed expectations on exactly these points. The United Kingdom's and United States' regulators have their own equivalents. Many of the findings were about data and systems rather than statistics: inputs that could not be traced, models implemented differently from their documentation, overrides not logged, and ratings not refreshed.

## Common mistakes and misunderstandings

- **A grade is not a decision.** The rating says how risky; the credit decision weighs risk against return, security, limits and appetite.
- **High Gini does not mean correct PDs.** Discrimination and calibration are different, and both must be tested.
- **Point-in-time and through-the-cycle are not interchangeable.** Using a TTC PD in a provisioning model, or a PIT PD in capital, gives wrong answers and regulatory findings.
- **Agency ratings are not the truth.** They are an opinion with a known history of lagging, and the internal model must stand on its own.
- **Overrides are not free.** Every override is data: it either improves the model or erodes it, and both must be measured.
- **The model in production may not be the model in the document.** Implementation testing is a regulatory requirement, and it fails more often than the statistics.
- **Stale ratings are wrong ratings.** A corporate grade based on two-year-old accounts is not a rating of the company today.
- **"Unrated" is not a grade.** Exposures that fall through the cracks (no model in scope, data missing) end up with default treatments that are either too harsh or too kind, and regulators look for them.
- **LGD is not a constant.** It depends on security, ranking, jurisdiction and the cycle, and modelled LGD needs recovery data that most banks started collecting properly only after being required to.
- **Machine learning is not banned, but explainability is required.** A model that cannot say why it declined someone will not survive consumer regulation.

## What a platform lead needs to know about this

**Data.** The rating platform needs: the complete input set for each model (spreads for corporate models; application and bureau data at the time of application for scorecards; monthly behavioural data; collateral data for LGD; drawn and undrawn balances over time for EAD); every model output with its version, date and inputs frozen (so that a rating can be reproduced years later); the override record; the final approved grade and its effective dates; the default flag with its date and reason, and the cure date; and the full recovery cash flow history for defaulted facilities. The default history is the most valuable dataset the bank owns for these purposes, and the hardest to assemble, because defaults happen in the collections and workout systems and recoveries arrive over years.

**Systems.** Typically: a rating engine for wholesale (vendor or in-house) integrated with the spreading tool and the credit workflow; a decision engine for retail that executes scorecards and strategies in real time at the point of application; a batch scoring process for behavioural scores; a model inventory and a model-development environment (statistical software, data marts); the regulatory capital engine that consumes PD, LGD and EAD; the IFRS 9 engine that consumes PIT versions; and monitoring and reporting tools. The regulator will trace a number on the capital return back to the model that produced it, the inputs it used, and the approval of that model version. If any step in that chain is a spreadsheet or a manual re-key, it will be a finding. Model versioning, environment control (development, test, production), and reconciliation between the rating system and the capital engine are platform responsibilities. See [[22 Credit Risk Data, Systems and BCBS 239]].

**Controls.** Model inventory with owners and tiering; independent validation before use and annually; implementation testing (does the code match the document?); change control with regulatory notification thresholds; override logging and approval workflow; rating refresh rules (block or downgrade stale ratings); default identification automated from arrears and unlikeliness-to-pay flags; data quality checks on inputs; monitoring reports to a model committee; and a complete audit trail. See [[13 Credit Governance - Committees, Authorities and the Three Lines]] and [[21 Model Risk Management and Validation]].

**Who owns what.** Model development (usually in credit risk, sometimes a central modelling team) builds and maintains. Model validation (independent, in risk or a separate function) tests and challenges. The credit risk control unit owns rating system performance and overrides policy. Business units and credit analysts use the models and propose overrides. Credit officers approve grades. Regulatory reporting consumes the outputs. The platform team runs the engines, controls the environments, and keeps the lineage. The board approves the rating systems and sees the monitoring. The regulator approves, inspects and can withdraw.

## Related notes

- [[00 Start Here]]
- [[02 What Credit Risk Is]]
- [[03 The Credit Lifecycle]]
- [[04 Commercial and Corporate Lending]]
- [[05 Retail Lending]]
- [[06 Specialised Finance - Project, Object, Commodities, Real Estate]]
- [[07 Leveraged and Acquisition Finance]]
- [[09 Credit Analysis - Reading a Borrower]]
- [[11 Collateral and Security]]
- [[13 Credit Governance - Committees, Authorities and the Three Lines]]
- [[14 Risk Appetite, Limits and Concentration]]
- [[15 Monitoring, Early Warning and Watchlist]]
- [[16 Problem Loans, Restructuring and Recovery]]
- [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]]
- [[18 Regulatory Capital and Basel - the Short Version]]
- [[20 Stress Testing and ICAAP]]
- [[21 Model Risk Management and Validation]]
- [[22 Credit Risk Data, Systems and BCBS 239]]
- [[23 Reporting - Regulatory Returns, Pillar 3 and Management Information]]
- [[24 Pricing, RAROC and Return on Capital]]
- [[26 Sovereign, Bank and Country Risk]]
- [[28 Master Glossary]]
- [[basel-credit-risk-explained-simply]]
- [[basel-credit-risk-decision-tree]]
