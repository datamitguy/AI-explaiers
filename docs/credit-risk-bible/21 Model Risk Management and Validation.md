# Model Risk Management and Validation

**Why this matters to you.** Almost every number a credit risk team produces comes out of a model: the probability that a borrower defaults, the loss if they do, the capital the bank must hold, the provision it must book, the price it should charge. If the model is wrong, every one of those numbers is wrong, and nobody notices until the losses arrive. Model risk management makes sure models are built properly, checked by someone independent, used only for what they were built for, and watched continuously. As a platform lead you will own the environments the models run in, the data they consume, the version control that proves which model produced which number, and the evidence that the model in production is the one the validators approved. Regulators inspect all of this, and findings land on the platform as often as on the modellers.

---

## Table of contents

1. [What a model is, and what is not a model](#1-what-a-model-is-and-what-is-not-a-model)
2. [Why models go wrong](#2-why-models-go-wrong)
3. [The model lifecycle](#3-the-model-lifecycle)
4. [The model inventory and tiering by materiality](#4-the-model-inventory-and-tiering-by-materiality)
5. [What regulators expect](#5-what-regulators-expect)
6. [What a validation report contains](#6-what-a-validation-report-contains)
7. [Key statistics explained simply](#7-key-statistics-explained-simply)
8. [Performance monitoring and triggers](#8-performance-monitoring-and-triggers)
9. [Model change control and versioning](#9-model-change-control-and-versioning)
10. [The model risk committee](#10-the-model-risk-committee)
11. [Documentation standards](#11-documentation-standards)
12. [Implementation risk: the spreadsheet versus production](#12-implementation-risk-the-spreadsheet-versus-production)
13. [Explainability for machine learning models in credit](#13-explainability-for-machine-learning-models-in-credit)
14. [Common mistakes and misunderstandings](#14-common-mistakes-and-misunderstandings)
15. [What a platform lead needs to know about this](#15-what-a-platform-lead-needs-to-know-about-this)
16. [Related notes](#16-related-notes)

---

## 1. What a model is, and what is not a model

Imagine you run a lemonade stand and you want to guess how many cups you will sell tomorrow. You notice that on hot days you sell more, so you write a rule: "cups sold equals 10 plus 2 for every degree above 20." That rule is a model. It takes an input (temperature), applies a method (the formula), and produces an estimate (cups) that you then use to decide how many lemons to buy. If the rule is wrong, you waste lemons or run out.

A bank's definition is the same idea in grown-up words. The most widely quoted one comes from the United States supervisory guidance known as **SR 11-7** (a letter from the Federal Reserve and the Office of the Comptroller of the Currency, issued in 2011): a model is a quantitative method, system or approach that applies statistical, economic, financial or mathematical theories, techniques and assumptions to process input data into quantitative estimates. The three parts matter:

1. **Inputs**: data about the borrower, the loan, the economy.
2. **A method**: a formula, a statistical fit, a simulation, a decision tree, a neural network.
3. **An output used for a decision**: approve or decline, a rating, a capital number, a provision, a price.

In credit risk the big models are the ones described in [[10 Internal Ratings, Scorecards and PD Models]] (probability of default, written **PD**), the loss given default (**LGD**) and exposure at default (**EAD**) models that feed [[18 Regulatory Capital and Basel - the Short Version]], the expected credit loss models in [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]], the scenario models in [[20 Stress Testing and ICAAP]], the pricing models in [[24 Pricing, RAROC and Return on Capital]], and the counterparty exposure models in [[19 Counterparty Credit Risk and Derivatives]].

### What is not a model

Not every spreadsheet is a model, and the difference matters because models get a heavy governance process and non-models get a lighter one. A **calculator** that just adds up balances is not a model: there is no estimate and no assumption, only arithmetic. A **report** that lists loans by sector is not a model. A **lookup table** copied from a regulation, such as the standardised risk weight table, is not a model, although the engine that applies it still needs testing.

The grey zone is the interesting part. A spreadsheet that applies "expert judgement" weights to five ratios to produce a rating is a model, even though it has no statistics in it. Banks call these **expert-judgement models** and they are often the worst governed, because the people who built them do not think of them as models. A rule in a decision engine ("decline if income below X") is a model if the threshold came from data analysis and a policy if a committee set it.

Things that are not models but still carry risk are governed as **end-user computing** (spreadsheets and small databases built by business users) with a lighter control framework: an inventory, access control, version control, and testing of formulas.

| Thing | Model? | Why | Governance route |
|---|---|---|---|
| Logistic regression PD scorecard | Yes | Statistical method, estimates, drives decisions | Full model risk framework |
| Expert-judgement rating template with weighted scores | Yes | Applies a method and assumptions to produce a rating | Full framework, usually a lower tier |
| Spreadsheet that sums exposures by country | No | Arithmetic only, no estimate | End-user computing controls |
| Standardised approach risk-weight engine | Engine, not model | Applies regulatory lookup, no estimation | Software change control and reconciliation |
| Macro-economic forecast feeding IFRS 9 | Yes | Economic theory and assumptions | Full framework, top tier |
| Machine learning fraud score | Yes | Statistical method, estimates | Full framework, with explainability requirements |

![[21-model-tiering.svg]]
*How a bank decides whether something is a model at all, and if so which tier of governance it gets. The questions are illustrative; every bank writes its own version.*

---

## 2. Why models go wrong

Back to the lemonade stand. Your "2 cups per degree" rule can fail in four different ways, and they map exactly onto how bank models fail.

**Data.** You measured temperature with a broken thermometer, or you only recorded sales during the summer holidays when the park was full. In a bank, the equivalent is a PD model built on five years of good economic times, so it has never seen a recession, or an LGD model where half the recovery records are missing because the collections system was replaced in 2017. The model learns from what it is shown. If the history is short, biased or dirty, the model inherits the problem. This is why [[22 Credit Risk Data, Systems and BCBS 239]] matters so much to modellers.

**Assumptions.** Your rule assumes sales rise in a straight line with temperature. Above 35 degrees people stay indoors and sales fall. The model's shape was wrong. Bank models are full of assumptions: that the future looks like the past, that borrowers in a segment behave alike, that house prices and unemployment move together the way they did last time, that defaults in one sector are independent of defaults in another. When an assumption breaks, the model is confidently wrong. The 2008 crisis is the famous case: securitisation models assumed house prices in different cities would not all fall together.

**Implementation.** You wrote the rule down correctly but your little brother typed it into the till as "10 plus 2 for every degree above 2" instead of 20. The method was fine; the code was wrong. In banks this is painfully common: the model was built in one language by the modelling team, re-coded in another by the technology team, and a rounding rule, a unit (percent versus decimal), a date convention, or a missing-value treatment got lost in translation. Section 12 is entirely about this.

**Use.** You built the rule for your stand in the park and your cousin uses it for her stand outside a cinema, where temperature does not matter at all. The model is being used for a purpose or population it was never built for. In a bank: a small business scorecard built on retail-style shops applied to tech start-ups, a PD model built on one country used in another, a model built to rank borrowers (which is good) used to set capital (which needs calibration to actual default rates). Also in this bucket: ignoring the model when it is inconvenient, or **overriding** it so often that the override, not the model, is really making the decision.

| Source of error | Bank version | Main defence |
|---|---|---|
| Data | Short or biased history, missing fields | Data quality checks, representativeness tests |
| Assumptions | Correlations that change in a crisis | Conceptual review, sensitivity analysis, stress testing |
| Implementation | Re-coding errors, unit mismatches | Implementation testing, parallel runs, reconciliation |
| Use | Wrong population, wrong purpose, excessive overrides | Documented scope, usage monitoring, override reporting |

One more source cuts across all four: a bank may have three hundred models, each individually fine, that share the same data feed and the same macro-economic forecast. When that shared input is wrong, all three hundred move together.

---

## 3. The model lifecycle

Models are born, checked, used, watched and eventually retired. Each stage has an owner and produces evidence. The diagram below shows the loop, and the paragraphs that follow walk through it.

![[21-model-lifecycle.svg]]
*The model lifecycle. Development sits in the first line, validation in the second, and the loop runs continuously because monitoring can send a model back to development at any time.*

### Development

A business owner (say the head of corporate credit) sponsors the model. A modelling team gathers data, chooses a method, estimates the model, tests it themselves, and writes it up, including a **data dictionary** (what every field means and where it comes from), a record of every exclusion, and the alternatives rejected. In the [[13 Credit Governance - Committees, Authorities and the Three Lines]] language, this is first-line work: the people who own the risk build the tool.

### Independent validation

A separate team that did not build the model, usually in risk management (second line), reviews it from scratch. "Independent" means organisationally separate, differently incentivised, and able to say no. The validators rebuild key results, test the data, challenge the assumptions, run their own statistics, and write a **validation report** (section 6) with findings graded by severity. Critical findings block go-live.

### Approval

A committee (section 10) receives the development document and the validation report and decides whether the model may be used, for what, and with what conditions. For models that drive regulatory capital under the internal ratings-based (**IRB**) approach, the regulator must also approve the model, and again for material changes. That external approval can take a year or more.

### Implementation

The approved model is put into the production system that will run it: a rating engine, a decision engine, a capital calculator, a provisioning engine. This involves coding or configuring the model, loading parameters, connecting data feeds, user acceptance testing, and usually a **parallel run** where old and new models both run for a period and differences are explained. Go-live is a change-management event with a rollback plan.

### Monitoring

Every quarter (sometimes monthly) the model owner reports whether the model still ranks borrowers correctly, whether predicted default rates match real ones, whether the population has changed, and how many overrides there were, all against pre-agreed **thresholds** (section 8). A breach triggers investigation and possibly a return to development.

### Periodic review

Even if nothing breaches, every model is fully re-validated on a schedule set by its tier: annually for the most important, every two or three years for lesser ones.

### Retirement

Models die: a new model replaces an old one, a product is discontinued, a regulation changes. Retirement is a formal step: switch off in production, archive code and documents (regulators can ask about a number produced five years ago), update the inventory, and check downstream consumers. Zombie models, switched off in theory but still feeding a report somewhere, are a classic audit finding.

---

## 4. The model inventory and tiering by materiality

You cannot govern what you cannot list. The **model inventory** is the single register of every model in the bank. Each entry records at minimum: a unique identifier, name and purpose, owner, developer, validator, tier, approval date and status, the production system it runs in, last and next validation dates, open findings, and the models it feeds and is fed by.

Large banks have hundreds to low thousands of models, and not all deserve the same attention. **Tiering** sorts them so that effort goes where the risk is. The usual drivers:

- **Financial materiality**: how much capital, provision, revenue or exposure the model influences.
- **Regulatory use**: anything feeding regulatory capital, financial statements or regulatory stress tests is top tier regardless of size.
- **Decision reach**: a million automated retail decisions a year versus ten large corporate deals.
- **Complexity and uncertainty**: a complex method on thin data carries more model risk than a simple one on rich data.

| Tier | Typical examples | Validation depth | Review frequency (illustrative) | Approval body |
|---|---|---|---|---|
| 1 | IRB PD, LGD, EAD models; IFRS 9 ECL models; regulatory stress models | Full independent validation, replication of results, regulator may inspect | Annual | Model risk committee, board-level reporting |
| 2 | Pricing models, behavioural scorecards for small portfolios, early-warning models | Independent validation, less replication | Every two to three years | Model risk committee |
| 3 | Small expert-judgement templates, internal management information estimates | Owner self-assessment, spot checks by validation | Every three to five years or on change | Delegated authority |

The tier also sets how much documentation is required, who signs off a change, and how fast a monitoring breach escalates. A tier 3 model that quietly starts driving a big decision must be re-tiered, which requires the inventory to be kept honest.

---

## 5. What regulators expect

Supervisors around the world have published expectations on model risk. The details differ, but the principles are consistent.

**SR 11-7 style principles (United States, copied widely).** Model risk is managed like any other risk, with an appetite, measurement and reporting. The three core elements are: sound development, implementation and use; effective validation that is independent, covers conceptual soundness, ongoing monitoring and outcomes analysis, and is repeated periodically; and governance, including a board-approved framework, an inventory, documentation and internal audit review. The phrase **"effective challenge"** comes from this guidance: validation must have the competence, influence and incentives to actually change outcomes.

**European Banking Authority (EBA) expectations on IRB models.** The EBA writes the detailed rules for the European Union's capital framework. Its IRB guidelines say, in plain words: use one consistent default definition everywhere; estimate PD as a long-run average over a cycle that includes bad years, with a **margin of conservatism** added for every data weakness; make LGD reflect an economic downturn; and re-estimate and re-validate regularly. The European Central Bank's multi-year programme of on-site model inspections (known as TRIM) showed how seriously this is taken: inspectors sat with the modellers and the data, and many banks had capital add-ons imposed.

**Prudential Regulation Authority (PRA, United Kingdom) expectations.** The PRA's model risk principles cover the whole model landscape, not just capital models: a complete inventory and tiering; a documented lifecycle; independent validation proportionate to tier; named senior individual accountability; and explicit handling of model limitations, including **post-model adjustments** (overlays). It has shown willingness to impose floors and add-ons where it is not satisfied.

Most other major regulators have something comparable, and a bank operating in several countries generally runs to the strictest standard it faces. The common thread a platform lead should hear: supervisors want **evidence**. Not "we validate models" but the report, the dated sign-off, the test results, the version number that was in production on 31 December, and the lineage that proves which records produced the number.

---

## 6. What a validation report contains

A validation report is the validator's written answer to the question "can this model be trusted, for this purpose, on this population, right now?" It follows a standard structure so that readers can compare across models.

![[21-validation-report.svg]]
*The seven questions a validation report answers, feeding an overall rating. Every finding is graded, and critical findings block approval.*

**Conceptual soundness.** Is the method appropriate for the problem? Are the variables chosen for sensible reasons rather than data-mining luck? For a PD model: is the default definition right, is the segmentation sensible, do the variable signs make economic sense (higher leverage should mean higher PD, not lower)? For an LGD model: are collateral, cure rates and discounting treated properly? The validator also lists the model's **limitations** and checks that the documentation admits them.

**Data.** Where did the development data come from? How long is the history, and does it include a downturn? What was excluded and why? How were missing values treated? Is the sample representative of the portfolio the model will be applied to? Validators often reconstruct the data from source to make sure the extracts are reproducible.

**Discriminatory power.** Does the model separate good borrowers from bad? If you sort borrowers by model score, do the defaults cluster at the bad end? Measured with the Gini coefficient, the Kolmogorov-Smirnov statistic, and the area under the receiver operating characteristic curve (all explained in section 7).

**Calibration.** Are the predicted probabilities the right size? A model can rank perfectly and still say "2%" when the truth is 4%. Calibration tests compare predicted and observed default rates, overall and by grade, using the binomial test, the Hosmer-Lemeshow test and simpler comparisons.

**Stability.** Has the population the model is applied to drifted away from the population it was built on? Measured with the population stability index on inputs and scores, and with migration analysis (how borrowers move between grades over time).

**Benchmarking.** How does the model compare to external agency ratings, a simpler challenger model built by the validator, the previous version, or industry data? Large gaps need an explanation.

**Implementation testing.** Does the production system produce the same output as the development code on the same inputs? Validators recompute a sample, sometimes the whole portfolio. Differences beyond rounding are findings, and they are surprisingly common.

The report ends with an **overall assessment** (fit for purpose, fit with conditions, not fit) and a **findings log** with each finding graded (critical, high, medium, low), an owner and a remediation date. Findings are tracked until closed.

---

## 7. Key statistics explained simply

These five statistics appear in every validation report and monitoring pack. Here they are with small worked examples. The numbers are made up but realistic.

### Gini coefficient (and the area under the curve)

Imagine 100 borrowers, 10 of whom will default. A perfect model would put all 10 defaulters at the very top of its "most risky" list. A useless model would scatter them randomly, so the top 10 of the list would contain just 1 defaulter on average.

The **Gini coefficient** measures how close the model is to perfect, on a scale where 0 is random and 1 is perfect. A closely related number is the **area under the receiver operating characteristic curve** (usually just **AUC**), which runs from 0.5 (random) to 1.0 (perfect); the two are linked by Gini = 2 x AUC minus 1.

Worked example: a corporate PD model sorts the 100 borrowers into five grades. The table shows how many defaulters fall into each grade.

| Grade (worst to best) | Borrowers | Defaulters | Cumulative share of borrowers | Cumulative share of defaulters |
|---|---|---|---|---|
| 5 | 20 | 6 | 20% | 60% |
| 4 | 20 | 2 | 40% | 80% |
| 3 | 20 | 1 | 60% | 90% |
| 2 | 20 | 1 | 80% | 100% |
| 1 | 20 | 0 | 100% | 100% |

Plot the last two columns against each other and you get a curve that bulges above the diagonal. The area between the curve and the diagonal, divided by the area a perfect model would achieve, is the Gini. For this table it works out at roughly 0.6. Typical ranges, which vary by portfolio: retail scorecards 0.5 to 0.8, corporate models 0.5 to 0.7, low-default portfolios often lower.

### Kolmogorov-Smirnov (KS) statistic

Take the same sorted list. At each cut-off, compute the share of defaulters captured so far minus the share of non-defaulters captured so far. The **KS statistic** is the largest gap. In the table above, after grade 5 the model has captured 60% of defaulters and 14 of the 90 non-defaulters (16%): a gap of 44 points. After grade 4 it is 80% versus 31%, a gap of 49. After grade 3, 90% versus 47%, a gap of 43. So KS is about 49. Values of 30 to 50 are typical for retail scorecards.

### Population stability index (PSI)

This measures drift. Compare the distribution of scores (or of any input) at development with the distribution today.

Worked example: at development, grade 5 held 20% of borrowers; today it holds 30%. Grade 1 held 20%; today 12%. For each bucket compute (today minus development) x natural log (today divided by development), and sum.

| Grade | Development share | Current share | Difference | ln(current / development) | Contribution |
|---|---|---|---|---|---|
| 5 | 20% | 30% | 0.10 | 0.405 | 0.041 |
| 4 | 20% | 22% | 0.02 | 0.095 | 0.002 |
| 3 | 20% | 20% | 0.00 | 0.000 | 0.000 |
| 2 | 20% | 16% | minus 0.04 | minus 0.223 | 0.009 |
| 1 | 20% | 12% | minus 0.08 | minus 0.511 | 0.041 |
| **Total PSI** | | | | | **0.093** |

Common rules of thumb: below 0.10 is stable, 0.10 to 0.25 is a warning worth investigating, above 0.25 is a significant shift. Our 0.093 is just under the warning line. PSI does not say the model is wrong; it says the world has moved and the model's performance should be checked more carefully.

### Binomial test

This is the simplest calibration test. For one grade, the model says PD is 2%. There are 500 borrowers in that grade, so the model expects 10 defaults. Suppose 18 actually default. Is that bad luck or a mis-calibrated model?

Under a binomial distribution with n = 500 and p = 2%, the standard deviation is the square root of 500 x 0.02 x 0.98, about 3.1. The observed 18 is (18 minus 10) divided by 3.1, about 2.6 standard deviations above expected. The chance of seeing 18 or more if the model were right is roughly 1%. Most banks would treat this as a red flag at a 95% or 99% confidence level: the grade is under-predicting. The test is run per grade and across the portfolio, often with an adjustment for the fact that defaults are correlated (one bad year hits everyone), which makes the honest confidence bands wider.

### Hosmer-Lemeshow test

Rather than testing one grade at a time, this test sorts borrowers into (usually ten) buckets by predicted PD and compares expected and observed defaults in every bucket at once, summing (observed minus expected) squared divided by expected, and comparing the result to a chi-squared distribution. A large value means the predicted PDs do not line up with reality across the range. Its known weakness is that with very large samples it rejects almost everything, so it is read alongside the per-grade picture.

| Statistic | Question it answers | Typical trigger (illustrative) |
|---|---|---|
| Gini / AUC | Does the model rank correctly? | Fall of more than 5 to 10 points from development |
| KS | What is the best single separation? | Fall of more than 5 to 10 points |
| PSI | Has the population drifted? | Above 0.10 amber, above 0.25 red |
| Binomial test | Is one grade's PD the right size? | Rejection at 95% or 99% |
| Hosmer-Lemeshow | Are PDs the right size across all grades? | Rejection at 95% |

---

## 8. Performance monitoring and triggers

Validation is a photograph; monitoring is a film. Every quarter the model owner produces a **monitoring pack** with the statistics above, plus:

- **Observed default rate versus predicted**, overall and by grade, with binomial confidence bands.
- **Override analysis**: how often credit officers overruled the model, in which direction, and whether the overrides turned out right. A high override rate (say above 10% to 15% in corporate books) suggests the model is not trusted or not fit. Overrides that are systematically upgrades and then default more often are a serious finding.
- **Usage**: is the model applied to the right population? Are there in-scope borrowers with no score?
- **Data quality**: missing inputs, defaulted-to-neutral values, stale financials.
- **Overlays**: any manual adjustment on top of the model output, its size, reason and expiry.

Each metric has pre-agreed **thresholds**, typically green, amber and red. Amber means investigate and report; red means escalate to the model risk committee and consider restricting use, recalibrating, or redeveloping. A **recalibration** adjusts the output level (shifting all PDs so that predicted equals observed) without changing the structure; a **redevelopment** rebuilds it. Most banks allow recalibration under a lighter process, which is where change control comes in.

---

## 9. Model change control and versioning

Every change to a model, however small, must be classified, approved and recorded. The question that drives everything is: **which exact version of which model produced this number, on this date, with these parameters?** If you cannot answer that for a regulatory return from two years ago, you have a control failure. Changes are classified by materiality, and the classification decides the approval route:

| Change type | Examples | Typical route |
|---|---|---|
| Material change | New variables, new method, new segmentation, new default definition, change in scope | Full validation, committee approval, regulator pre-approval for IRB models |
| Non-material change | Recalibration within existing structure, parameter refresh, minor data source change | Lighter validation review, delegated approval, regulator notification for IRB |
| Technical change | Code migration with identical logic, performance optimisation, bug fix that restores documented behaviour | Implementation testing proving identical output, change management |

European regulators have a formal materiality test for IRB model changes based on the size of the resulting RWA movement, with pre-approval required above a threshold; the thresholds change, so look them up rather than memorising them.

Good versioning practice, which the platform provides: every model has a version number stamped on every output record; the code for every version is tagged in source control; parameters are stored as data, not hard-coded; and a given version can be re-run on a given input snapshot and produce an identical result years later. This is **reproducibility**, the single most valuable thing a platform can give a model risk function.

---

## 10. The model risk committee

The **model risk committee** (names vary: model governance committee, model oversight committee) is the forum where models are approved, retired, re-tiered and escalated. It usually reports to the board risk committee described in [[13 Credit Governance - Committees, Authorities and the Three Lines]].

Who sits on it: the chief risk officer or a delegate as chair, the head of model validation, the heads of the main model-owning functions (credit risk, finance, treasury), a technology or data representative, and internal audit as an observer. Developers present but do not vote on their own models.

What it decides: approval of new models and material changes, with conditions of use; acceptance of validation findings and remediation deadlines; escalation of monitoring breaches and decisions to restrict, overlay or withdraw a model; approval of post-model adjustments above a size threshold, with expiry dates; and the annual model risk report to the board (inventory size, overdue validations, open findings by severity, model risk appetite status).

The committee only works if its papers are honest and complete. The platform produces the inventory metrics and monitoring data that feed those papers, from controlled sources rather than somebody's spreadsheet.

---

## 11. Documentation standards

The test of documentation is whether a competent person who has never met the developers could understand, rebuild and operate the model from the documents alone. Supervisors use exactly this test. The standard set of documents for a tier 1 model:

| Document | Owner | Purpose |
|---|---|---|
| Model development document | Developer | Purpose, scope, data, method, developer testing, limitations, alternatives considered |
| Data dictionary and lineage | Developer with data team | Every input field: definition, source system, transformation, quality checks |
| Validation report | Validator | Independent assessment, findings, overall rating |
| Approval record | Committee secretary | Decision, conditions, date, version approved |
| Implementation and testing evidence | Technology with developer | Test plans, results, parallel run reconciliation, sign-offs |
| User guide and scope statement | Owner | Who may use it, for what, override policy |
| Monitoring reports and change log | Owner | Quarterly performance; every version, what changed, who approved |

A rule that saves a lot of pain: **documents live with the version**. Documentation for version 3.2 is stored with version 3.2's code and parameters, so nobody has to guess which document describes the model that ran last March.

---

## 12. Implementation risk: the spreadsheet versus production

Return to the till with the typo. In a bank the pattern is this: a modeller builds a PD model in a notebook on their laptop. The validators test that version. The committee approves that version. Then a technology team re-implements it in the rating engine, in a different language, reading different tables, on a monthly batch. The approved model and the production model are now two different things, and they drift apart.

Classic ways they diverge:

- **Units**: development used PD as a decimal (0.02); the engine expects a percentage (2.0).
- **Missing values**: development replaced missing turnover with the segment median; production uses zero.
- **Rounding and capping**: development capped a ratio at the 99th percentile; production forgot.
- **Date logic**: "financials less than 18 months old" read as calendar months in one place and 548 days in another.
- **Data source**: development used a cleaned extract; production reads the raw operational table.
- **Sequence**: production applies the override before the floor; development applied it after.
- **Silent upgrades**: a library version changed and a function's default behaviour changed with it.

The defences are implementation testing (recompute the whole portfolio in both environments and reconcile), parallel runs, a **golden test set** of inputs with known expected outputs re-run after every deployment, and, best of all, running the development code itself in production inside a controlled execution environment, so there is only ever one implementation. That last option is where most banks are heading, and it is the subject of section 15.

---

## 13. Explainability for machine learning models in credit

Machine learning models (gradient-boosted trees, random forests, neural networks) often rank borrowers better than a logistic regression because they capture interactions and non-linear patterns. The catch is that they do not produce a simple "add 20 points if income is above X" rule that a credit officer, customer, validator or regulator can read.

Why this matters in credit specifically:

- **Customers have rights.** In many countries a declined applicant is entitled to the main reasons for the decision. "The neural network said no" does not satisfy this.
- **Discrimination.** A model may learn to use a proxy for a protected characteristic (postcode standing in for ethnicity). Without explainability you cannot find out.
- **Validators must assess conceptual soundness**, which they cannot do for a black box.
- **Regulators are cautious** about complex models for regulatory capital, where interpretability and stability are prized, while allowing them more freely for decisions and monitoring.

The toolkit, in plain words:

| Technique | What it tells you | Limits |
|---|---|---|
| Feature importance | Which inputs the model relies on most, overall | Nothing about direction or individual cases |
| Partial dependence plots | How the prediction changes as one input moves | Misleading when inputs are correlated |
| Shapley values (SHAP) | For one borrower, how much each input pushed the score up or down | Computationally heavy |
| Monotonicity constraints | Force the model so that, say, higher leverage never lowers PD | Reduces flexibility but makes the model defensible |
| Reason codes | A ranked list of the top factors behind a decline | Needed for customer communication |

The practical position many banks have reached: machine learning where interpretability requirements are lighter (fraud, collections, early warning as in [[15 Monitoring, Early Warning and Watchlist]]), constrained and explainable versions for lending decisions, and well-understood methods or hybrids for regulatory capital. Whatever the choice, the explainability outputs are part of the model and are validated and monitored like the score itself.

---

## 14. Common mistakes and misunderstandings

- **"It is only a spreadsheet, so it is not a model."** If it applies a method to inputs to produce an estimate that drives a decision, it is a model, whatever it is built in.
- **"Validation is a one-off before go-live."** It is continuous: monitoring, periodic review and change validation are all part of it.
- **"A high Gini means the model is good."** It means the model ranks well. It can rank perfectly and still be mis-calibrated by a factor of two, which for capital or provisions is a disaster.
- **"The regulator approved the model, so we are done."** Approval is conditional, version-specific and withdrawable. The bank remains responsible.
- **"Overrides fix the model's weaknesses."** A few do. Many, consistently in one direction, are evidence that the model is wrong or that users are gaming it.
- **"Independent validation means a different person on the same team."** It means a different reporting line and the authority to block.
- **"The model in production is the model we approved."** Only if implementation testing proved it, and only until the next deployment.
- **"Recalibration is a minor change."** It changes every output. It is a controlled change with its own version and evidence.
- **"More complex is more accurate."** Often true in development data, often false in production two years later.
- **"Post-model adjustments are temporary."** They are meant to be. In practice they accumulate. Every overlay needs an expiry and a plan to fold it into the model.

---

## 15. What a platform lead needs to know about this

Model risk management is where the platform is most visibly part of the control framework. These are the things you will be asked to provide, and the things that will land as findings if you do not.

**Model execution environments.** The goal is a controlled environment where the approved model code runs on approved data, with no manual steps between input and output. Separate environments for development (modellers may experiment), validation (validators replicate independently on the same data), user acceptance testing, and production (locked down, change-controlled, logged). Access to production parameters is restricted and every change audited.

**Reproducibility.** For any output record, you must be able to identify the model version, parameter set, code commit, input data snapshot and run that produced it, and re-run it to get the same answer. This means immutable input snapshots, versioned parameter stores, source control with tagged releases, pinned library versions, and run logs that stitch it all together. If your platform cannot reproduce last year's quarter-end PDs exactly, say so now and plan for it.

**Version control and deployment.** Model code belongs in source control with branch protection, code review, and a build pipeline that runs the golden test set before anything reaches production. Deployment records are the evidence for the change log in section 9. Promotion between environments is automated and logged, not done by copying files.

**Lineage from data to result.** Validators and supervisors will ask "where did this input come from?" and expect a field-by-field trace back through the warehouse to the source system. This is the same lineage requirement as in [[22 Credit Risk Data, Systems and BCBS 239]], and the inventory should link each model to the data elements it consumes so that a data quality issue can be traced forward to every affected model.

**Monitoring infrastructure.** Monitoring packs are generated from controlled code against controlled data, on a schedule, with the statistics in section 7 computed the same way every quarter. A process that depends on someone re-running a notebook by hand is a finding waiting to happen.

**The inventory as a system.** Ideally the inventory is an application with workflow (approval states, finding tracking, review alerts) integrated with the execution platform, so that "models in production" and "models in the inventory" are provably the same list.

**Who owns what.**

| Thing | Usual owner | Platform's role |
|---|---|---|
| Model design, data choices, documentation | Model owner and developers (first line) | Provide environments, data access, tooling |
| Independent validation | Model validation (second line) | Provide independent replication environment and the same data |
| Approval and policy | Model risk committee and model risk function | Provide inventory metrics, evidence |
| Implementation in production | Technology (often the platform team) | Own it fully: testing, deployment, reproducibility, logging |
| Monitoring production | Model owner | Automate the computation and distribution |
| Assurance | Internal audit (third line) | Provide access and evidence on request |

**Controls you will be asked to evidence.** Segregation of duties between development and deployment; approval before production change; reconciliation of production output to the approved model on a sample; access reviews; pinned dependencies; archive of retired versions for the regulatory retention period (often five to seven years, varies by country). If the bank uses machine learning, add explainability outputs stored with every score and a feature store so that training inputs and scoring inputs are provably the same.

---

## 16. Related notes

- [[30 Operational Risk]] for how model risk sits within the wider operational risk framework.
- [[10 Internal Ratings, Scorecards and PD Models]]: how the models being validated are built.
- [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]] and [[18 Regulatory Capital and Basel - the Short Version]]: the two biggest consumers of model output.
- [[20 Stress Testing and ICAAP]]: scenario models and their governance.
- [[13 Credit Governance - Committees, Authorities and the Three Lines]]: where the model risk committee sits.
- [[22 Credit Risk Data, Systems and BCBS 239]]: the lineage and quality requirements under every model.
- [[23 Reporting - Regulatory Returns, Pillar 3 and Management Information]]: where model outputs end up.
- [[24 Pricing, RAROC and Return on Capital]]: pricing models and their governance.
- [[27 A Platform Lead's First 90 Days]] and [[28 Master Glossary]].
- [[basel-credit-risk-explained-simply]] and [[basel-credit-risk-decision-tree]]: the regulatory background.
