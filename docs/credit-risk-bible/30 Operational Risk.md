# Operational Risk

**Why this matters to you.** Credit risk asks "will they pay me back?" and market risk asks "what if the price moves?" Operational risk asks a humbler question: "what if *we* get it wrong?" A limit keyed with an extra zero, a spreadsheet nobody checked, a batch job that silently failed, a vendor engine down on reporting day: none of these are about a borrower or a market, all of them cost real money, and most happen inside technology. You own systems, changes, data feeds, vendor contracts and probably a few spreadsheets you did not know about, which makes you a **control owner** in the bank's operational risk framework. This note explains operational risk from zero: what it is, how banks catalogue, measure and capitalise it, and what it looks like on an ordinary Tuesday in a credit risk team.

## Table of contents

1. [The lemonade stand version](#the-lemonade-stand-version)
2. [What operational risk is](#what-operational-risk-is)
3. [The seven event types](#the-seven-event-types)
4. [Famous cases](#famous-cases)
5. [Boundary events: when operational failures become credit losses](#boundary-events-when-operational-failures-become-credit-losses)
6. [The operational risk management framework](#the-operational-risk-management-framework)
7. [Specialist sub-risks](#specialist-sub-risks)
8. [Capital for operational risk](#capital-for-operational-risk)
9. [Operational risk in a credit risk team's daily life](#operational-risk-in-a-credit-risk-teams-daily-life)
10. [Common mistakes and misunderstandings](#common-mistakes-and-misunderstandings)
11. [What a platform lead needs to know about this](#what-a-platform-lead-needs-to-know-about-this)
12. [Related notes](#related-notes)

## The lemonade stand version

You run a lemonade stand. Some things that can hurt you are about other people: your neighbour buys ten cups on credit and never pays (that is **credit risk**), or lemons suddenly get expensive (that is **market risk**). But plenty of bad days are entirely home-made:

- Your little brother helps himself to the cash tin (**internal fraud**).
- Someone pays with a fake banknote (**external fraud**).
- You trip over the cooler and twist your ankle (**workplace safety**).
- You tell a customer the lemonade is sugar-free when it is not, and their mum makes you refund everyone (**mis-selling and conduct**).
- A storm blows the stand over (**damage to physical assets**).
- Your till calculator runs out of battery at lunchtime rush (**system failure**).
- You write "£10" instead of "£1.00" on a receipt and the customer's dad complains (**process error**).

None of these were bets you chose to make; they come with running a stand at all. That is **operational risk**. The banking version is the same list with more zeros.

## What operational risk is

### The Basel definition in plain words

The Basel Committee on Banking Supervision, the international group of bank regulators described in [[18 Regulatory Capital and Basel - the Short Version]], defines operational risk as:

> the risk of loss resulting from inadequate or failed internal processes, people and systems or from external events.

Unpack it word by word:

| Part of the definition | Plain meaning | Banking example |
|---|---|---|
| Inadequate or failed **processes** | The recipe was wrong, or nobody followed it | A covenant test nobody was told to perform |
| Failed **people** | Mistakes, misconduct, fraud, or simply not enough skilled staff | An analyst types 50,000,000 instead of 5,000,000 |
| Failed **systems** | Technology breaks, is wrong, or is unavailable | The rating engine is down for two days |
| **External events** | Things from outside that hit you | A flood, a cyber attack, a pandemic, a supplier going bust |

Two clarifications matter. Operational risk **includes legal risk**: fines, penalties, lawsuits and settlements arising from how the bank behaves. It **excludes strategic risk** (choosing the wrong business plan, like opening branches nobody visits) and **reputational risk** (people trusting you less). Reputational damage often *follows* an operational event, but it is not counted in operational loss figures.

### How it differs from credit and market risk

| | Credit risk | Market risk | Operational risk |
|---|---|---|---|
| Do you choose to take it? | Yes, every loan is a deliberate bet | Yes, every position is a deliberate bet | No, it comes with doing business at all |
| Is there a reward for taking more? | Interest margin | Trading profit | None directly; it is a cost of operating |
| What causes the loss | A borrower defaults | A price moves | Your processes, people or systems fail, or an outside event |
| Shape of losses | Many small, some large | Daily ups and downs | Very many tiny losses, plus rare enormous ones |
| Can you diversify it away? | Partly, by lending to many | Partly, by hedging | Not really; you reduce it with controls and insurance |
| Where it is managed | Credit risk function (see [[02 What Credit Risk Is]]) | Market risk function (see [[29 Market Risk]]) | Operational risk function, plus every manager in the bank |

The key difference is the first row. A bank *wants* credit risk, because lending is how it earns money (see [[01 What a Bank Is and How It Makes Money]]). Nobody wants operational risk. You can only reduce it (controls), transfer some of it (insurance) or accept it within an agreed appetite.

The second difference is the **shape** of losses. A school's lost-property box fills every week with odd socks (small, frequent), and once a decade someone loses a laptop with the exam papers on it (rare, huge). Operational losses look like that, and this "fat tail" is why the industry eventually gave up modelling it in detail for capital.

## The seven event types

Basel sorts operational losses into seven **event types**, often called "Level 1" categories. Banks add finer Level 2 and Level 3 categories underneath, but every bank's loss data rolls up to these seven so that numbers can be compared across the industry.

![[30-event-types.svg]]
*The seven Basel event types. The first four are mainly about people and behaviour, the last three mainly about things, systems and processes, though real events often mix both.*

| # | Event type | What it means | Banking examples |
|---|---|---|---|
| 1 | Internal fraud | Someone inside the bank deliberately acts dishonestly or breaks rules for gain | A trader hiding losing positions; staff stealing from dormant accounts; an employee approving a loan to a friend's shell company |
| 2 | External fraud | Someone outside steals or deceives | Forged financial statements in a loan application; card fraud; hackers redirecting payments; fake invoices in trade finance |
| 3 | Employment practices and workplace safety | Breaking employment, health or safety laws | Discrimination or unfair dismissal claims; injuries in a branch; breaches of working-time rules |
| 4 | Clients, products and business practices | Failing customers through negligence or bad conduct, or a product that is flawed by design | Mis-selling insurance or investments; market manipulation; breaching client data privacy; anti-money laundering failures; unfair fees |
| 5 | Damage to physical assets | Physical things destroyed or damaged | Fire, flood, earthquake, terrorism, vandalism of branches or data centres |
| 6 | Business disruption and system failures | Things stop working | Data centre outage; a failed software upgrade; a telecoms cut; a power failure |
| 7 | Execution, delivery and process management | Mistakes in doing the daily work, and failed dealings with suppliers and counterparties | Keying errors; missed deadlines; wrong collateral recorded; incomplete legal documents; vendor disputes |

In most banks, by **number** of events, external fraud and execution errors dominate: thousands of small card frauds and processing slips. By **value**, the category "clients, products and business practices" has historically been the largest, because a single mis-selling scandal or conduct fine can cost more than a decade of keying errors.

## Famous cases

These are described generally, because the lessons matter more than the names.

| Type of case | What happened, in outline | Event type | Lesson |
|---|---|---|---|
| Rogue traders | A single trader built huge unauthorised positions and hid the losses with fake trades. One 1990s case brought down a centuries-old British bank; later cases cost several billion | Internal fraud | Separate trading from checking and settlement; investigate unexplained profit too |
| Mis-selling redress | Products such as loan-linked insurance that many customers could not use were sold at scale; in one country redress ran to tens of billions of pounds over many years | Clients, products and business practices | Sales incentives drive behaviour; conduct losses arrive years later |
| Large conduct fines | Rigging benchmark rates, sanctions breaches, money laundering failures, opening accounts nobody asked for | Clients, products and business practices | Fines come with large remediation costs |
| Major information technology (IT) outages | A failed batch upgrade at one bank and a botched migration at another left millions of customers without access for days or weeks | Business disruption and system failures | Change is a system's most dangerous moment |
| Cyber attacks | Attackers used a central bank's payment messaging credentials to send fraudulent transfers, tens of millions of dollars of which were paid away; ransomware has frozen banks and their suppliers | External fraud, business disruption | Vendors and payment systems need the same security as the core |
| Fat-finger payments | A bank meaning to pay interest sent nearly a billion dollars of principal, then fought a long legal battle to recover it; a broker once sold shares at one yen each instead of one share at a huge price | Execution, delivery and process management | Screens that make mistakes easy, and checkers who do not read, turn slips into giant losses |

## Boundary events: when operational failures become credit losses

Some losses are operational in **cause** but show up as credit or market losses in **effect**. Basel calls these **boundary events**.

**The analogy.** You lend your bike to a friend but forget to note who has it, and it never comes back. Was the loss because your friend was unreliable (credit risk) or because you kept no record (operational risk)? Honestly, both.

**Credit examples.**

| What went wrong | Why it is operational | How the loss appears |
|---|---|---|
| Security not perfected: a warehouse mortgage never registered (see [[11 Collateral and Security]]) | Process failure | On default the bank has no valid claim, so loss given default is much higher |
| A limit keyed as 50 million instead of 5 million (see [[14 Risk Appetite, Limits and Concentration]]) | Keying error | The bank lends 30 million, the borrower defaults, the loss far exceeds approval |
| A fraudulent loan application with fabricated accounts | External fraud | The "borrower" vanishes; it looks like a default |
| A covenant breach never spotted because monitoring was not set up (see [[12 Loan Documentation, Covenants and Conditions]]) | Process failure | The bank missed the chance to act early |

**The rule.** For **capital**, operational losses related to credit risk stay in credit risk, because they are already in the default and loss history behind credit risk-weighted assets, and counting them twice would double count. But they must still be **flagged** in the operational loss database, so the bank can see how much credit loss its own failures caused.

**Market examples** are treated differently: operational failures in market activities (a trade booked the wrong way, a hedge never executed) are generally counted as **operational risk** for capital. Details vary by jurisdiction, so check your regulator's text.

**Why this matters for a credit risk platform.** Your systems are where credit boundary events are born and spotted. A credit write-off needs a reliable link to its operational event: a boundary flag on the default record, a shared event identifier, or both. Without it, the bank understates what its own processes cost, and the models in [[10 Internal Ratings, Scorecards and PD Models]] may learn from losses caused by a broken process rather than borrower behaviour.

## The operational risk management framework

Every bank has an **operational risk management framework**: the policies, tools and committees for finding, measuring, watching and fixing operational risks. Think of a school's health and safety system: a list of hazards, checks that fire doors close, an accident book, fire drills, and someone making sure broken things get repaired.

![[30-orm-cycle.svg]]
*The operational risk management cycle: identify risks and controls, assess them through the risk and control self-assessment (RCSA), monitor them with key risk indicators (KRIs) and loss events, add external data and scenarios, report against appetite, act where needed, and feed everything back into the register.*

### Risk identification, the risk register and the control library

**The taxonomy** is the bank's official list of risk categories, usually starting from the seven event types and adding its own (technology, third party, data, model and so on). Everyone must use the same words, or reports cannot be added up.

**The risk register** is the catalogue of specific risks each business area faces, written in a cause, event, consequence style: "Because limit changes are entered manually (cause), an incorrect limit may be keyed (event), leading to lending beyond approved appetite and potential credit loss (consequence)."

**The control library** lists every **control** (anything that prevents a risk or detects it quickly) with an owner, frequency and the risks it mitigates. Controls are **preventive** (a system blocks a limit above the approver's authority) or **detective** (a daily reconciliation of limits against approvals), and **manual** or **automated**. Automated preventive controls are usually strongest, but they need their own controls (change management, testing, access) to stay reliable.

### Risk and control self-assessment

The **risk and control self-assessment**, shortened to **RCSA**, is a regular exercise (often yearly, refreshed when things change) in which each business area scores its own risks and controls. It is "self" because the people doing the work know best where it breaks, though the second line challenges the scores.

Each risk is scored twice:

- **Inherent risk**: how bad it would be with no controls at all.
- **Residual risk**: how bad it is with today's controls, as they actually work.

Scores typically use **likelihood** (how often) times **impact** (how bad), each on a 1 to 5 scale. Scales are bank-specific; the ones below are illustrative.

| Score | Likelihood | Impact (financial, illustrative) |
|---|---|---|
| 1 | Rare: less than once in 10 years | Under 50,000 pounds |
| 2 | Unlikely: once in 5 to 10 years | 50,000 to 250,000 |
| 3 | Possible: once in 1 to 5 years | 250,000 to 1 million |
| 4 | Likely: once or twice a year | 1 million to 10 million |
| 5 | Almost certain: several times a year | Over 10 million |

Impact scales usually also cover customers, regulatory consequences and reputation, and the highest of these drives the score.

### Worked example: scoring one risk

**Risk:** an incorrect credit limit is keyed into the limit system.

**Inherent assessment.** About 4,000 limit changes a year are typed by hand, and a few go wrong. Likelihood **4**. A wrong limit could let a large exposure go well beyond approval; impact **4**. Inherent score = 4 x 4 = **16 (Very high)**.

**Controls.**

| Control | Type | Tested? | Rating |
|---|---|---|---|
| Maker-checker: a second person approves every limit change in the system | Preventive, manual | Yes, sample of 25 changes, 1 approved without evidence of review | Partially effective |
| Daily automated reconciliation of limit system against the credit approval system, with breaks investigated within one day | Detective, automated | Yes, all breaks for one quarter traced | Effective |
| Hard block preventing utilisation above the approved amount in the lending system | Preventive, automated | Not yet built | None |

**Residual assessment.** With the controls, wrong limits still get keyed (the checker is not perfect), but the reconciliation catches them within a day, before much lending can happen. Likelihood **2**, impact **3**. Residual score = 2 x 3 = **6 (Medium)**.

| Score band (illustrative) | Rating | Response |
|---|---|---|
| 1 to 4 | Low | Accept |
| 5 to 9 | Medium | Accept if within appetite, monitor |
| 10 to 15 | High | Action plan required |
| 16 to 25 | Very high | Escalate to senior management; urgent action |

The residual is within appetite, but the weak maker-checker becomes an **issue** with an action, and the missing hard block goes on the platform roadmap. Most of the risk reduction comes from a system control, which is why technology owners are central to operational risk.

### Control testing

A control in a library is a promise, not proof. **Control testing** checks **design effectiveness** (if performed as described, would it stop or catch the risk? A checker who never sees the approval document cannot) and **operating effectiveness** (is it actually performed every time? Testers sample, say, 25 occurrences and look for evidence such as timestamps and signed reconciliations). The first line self-tests, the second line tests key controls, and internal audit tests both. A failed control becomes an issue.

### Key risk indicators

A **key risk indicator**, shortened to **KRI**, is a number tracked regularly that warns when a risk is growing, like the temperature gauge on a car dashboard. Each KRI has **thresholds** that turn it **green** (fine), **amber** (watch, explain) or **red** (act, escalate), a combination called **RAG** status.

Good KRIs are **leading** (they move before losses happen), measurable automatically, and owned by someone who can act on them.

### Worked example: a KRI dashboard for a credit risk platform

All figures illustrative, for one month.

| KRI | Green | Amber | Red | This month | Status |
|---|---|---|---|---|---|
| Limit reconciliation breaks older than 1 day | 0 | 1 to 2 | 3 or more | 1 | Amber |
| Critical end-user computing tools not in the inventory or without a recent review | 0 | 1 to 3 | 4 or more | 5 | Red |
| Overnight credit batch jobs failed or late | 0 to 1 | 2 to 4 | 5 or more | 1 | Green |
| Data quality rule failures on key regulatory fields (% of records) | Under 0.5% | 0.5% to 2% | Over 2% | 0.8% | Amber |
| Regulatory returns submitted late | 0 | none | 1 or more | 0 | Green |
| Leavers with system access still active after 5 days | 0 | 1 to 2 | 3 or more | 0 | Green |
| Production changes causing an incident (% of changes) | Under 2% | 2% to 5% | Over 5% | 3.1% | Amber |
| Overdue actions from audit or incidents | 0 | 1 to 2 | 3 or more | 2 | Amber |
| Vendor service level breaches on the rating engine | 0 | 1 | 2 or more | 0 | Green |

The red item (five reporting spreadsheets found on a shared drive with no owner) needs a plan at the next risk committee; the ambers get commentary. Late submissions have no amber: one is already red.

### Internal loss data collection

Every operational loss above a **threshold** is recorded in a **loss database**. This is the hardest evidence the bank has: what actually went wrong and what it cost.

**Thresholds.** Banks set a minimum amount for full recording. Under the Basel III standardised approach the standard threshold is 20,000 euros, and supervisors may allow larger banks to use up to 100,000 euros; many banks voluntarily record smaller events too, because small events reveal broken controls cheaply. Check your jurisdiction.

**Key fields.**

| Field | Meaning |
|---|---|
| Gross loss | The total loss before any recovery: direct write-offs, compensation, fines, legal fees and external costs to fix it. Internal staff time is normally excluded |
| Recoveries | Money got back: from the counterparty, from insurance, from a third party responsible |
| Net loss | Gross loss minus recoveries. Basel's capital calculation uses losses net of recoveries, with rules on which recoveries count |
| Date of occurrence | When the event actually happened |
| Date of discovery | When the bank found out |
| Date of accounting | When the loss hit the profit and loss account (P&L) |
| Event type, business line, cause, boundary flag | What, where, why, and any credit or market link |

The three dates can be years apart: a mis-selling event may **occur** from 2015 to 2019, be **discovered** in 2021 and hit the **accounts** in 2022. Capital uses accounting dates; trend analysis often uses occurrence dates.

### Worked example: a loss event record

On 3 March, a clerk releases a loan drawdown of **1,250,000** pounds instead of **125,000** (an extra zero), and the checker approves without reading the drawdown notice. A reconciliation break exposes it on 5 March; most of the excess comes back, but the borrower has spent some.

| Field | Value |
|---|---|
| Event ID | OR-2026-00417 |
| Title | Drawdown overpayment, extra zero keyed |
| Event type | 7. Execution, delivery and process management (Level 2: transaction capture, execution and maintenance) |
| Business line | Commercial banking |
| Date of occurrence | 3 March |
| Date of discovery | 5 March |
| Date of accounting | 31 March |
| Overpayment | 1,125,000 |
| External legal costs | 18,000 |
| **Gross loss** | **1,143,000** |
| Recovered from borrower | 1,060,000 |
| Insurance recovery | 0 (below policy excess) |
| **Net loss** | **83,000** |
| Boundary flag | Yes: the unrecovered 65,000 was added to the borrower's loan balance; if it is later written off, that write-off is counted as credit loss for capital, with this event linked |
| Root cause | Free-text amount field; maker-checker without source comparison |
| Actions | Drawdown amount pre-filled from facility system; checker screen shows source document; owner and due date recorded |

### External loss data

A bank's own history is thin for rare disasters, so banks also use **external loss data**: industry consortia sharing anonymised loss records, and public databases built from news and court reports. They answer "could that happen here?"

### Scenario analysis

**Scenario analysis** asks experts to estimate the cost of severe but plausible events: "What if our credit data centre were down for a week at quarter end?" "What if an employee colluded with a borrower on fraudulent loans for three years?" Workshops use internal and external loss data as a reality check, and the results feed the risk register, [[20 Stress Testing and ICAAP]] and resilience planning.

### Issues and actions management

When a control fails, an audit finds a gap, a KRI goes red or an incident happens, an **issue** is raised with a severity, an owner and an **action plan** with due dates. Closure needs evidence the fix works. Overdue high-severity actions go to senior management and the board, and repeatedly missed dates are a red flag to regulators.

### The three lines of defence for operational risk

The **three lines of defence** model described in [[13 Credit Governance - Committees, Authorities and the Three Lines]] applies here, with one twist: in operational risk, *every* business and support function is first line, including technology.

| Line | Who | Role in operational risk |
|---|---|---|
| First line | Business, operations, technology, including the platform team | Own risks and controls; run the RCSA; operate and self-test controls; report incidents and losses; fix issues. Many banks have small first-line control teams (sometimes called "1b") to help |
| Second line | Operational risk function, plus specialist teams for technology risk, information security, compliance and others | Set the framework, taxonomy and appetite; challenge RCSA scores; monitor KRIs and losses; run scenarios; calculate capital; report |
| Third line | Internal audit | Independently test whether both lines are working |

A common surprise for new platform leads: the operational risk team does not run your controls. They will ask you for evidence that *you* do.

## Specialist sub-risks

Operational risk is so broad that banks split it into specialist areas, each with its own second-line experts and policies.

| Sub-risk | Plain meaning | Credit platform example |
|---|---|---|
| Technology and cyber risk | Systems failing, being slow, insecure, or attacked | The rating engine is unavailable; an attacker gets into the collateral database |
| Third-party and outsourcing risk | A supplier fails to deliver, goes bust or is attacked | A vendor scorecard engine or cloud provider has an outage; a vendor leaks data |
| Model risk | Models being wrong or misused (see [[21 Model Risk Management and Validation]]) | A probability of default model uses the wrong data field after a release |
| Data risk | Data being wrong, incomplete, late, or lost (see [[22 Credit Risk Data, Systems and BCBS 239]]) | Exposure missing a collateral link, overstating capital |
| Conduct risk | Treating customers unfairly or harming markets | A pricing tool steering vulnerable customers to unsuitable loans |
| Legal and compliance risk | Breaking laws or regulations, or contracts not enforceable | Loan documents unenforceable in one country; data privacy breach |
| Financial crime | Money laundering, sanctions breaches, bribery, fraud | Lending to a sanctioned entity because a screening feed failed |
| Business continuity and operational resilience | Keeping critical services running through disruption | Credit approvals stop during a site outage |
| Change risk | Projects and releases breaking things | A migration loses a year of rating history |

**Technology and cyber risk** covers availability, integrity, confidentiality, capacity, patching and access (people with more rights than they need, leavers never removed). Cyber is now usually among a bank's top risks.

**Third-party risk.** A vendor takes the work, not the responsibility: the bank stays accountable. Controls are due diligence, contract clauses (service levels, audit rights, data location, exit), monitoring and a tested **exit plan**.

**Financial crime.** **Anti-money laundering** (AML) stops criminals making dirty money look clean; **know your customer** (KYC) checks confirm who customers are; **sanctions** screening blocks restricted people and countries. Every new borrower goes through these checks.

**Operational resilience.** Traditional **business continuity planning** asked "do we have a backup site?" Around 2021 and 2022, several regulators (the Basel Committee in its principles, supervisors in the United Kingdom and elsewhere, and later European Union legislation on digital resilience) shifted the question to "can we keep serving customers when, not if, something breaks?" The common ideas:

- Identify **important business services**: services whose disruption would cause intolerable harm to customers or markets, such as making payments or providing mortgages.
- Set an **impact tolerance** for each: the maximum disruption tolerable, often as a time ("no more than two days").
- **Map** the people, processes, technology, facilities, data and suppliers each service depends on.
- **Scenario test** severe but plausible disruptions against the tolerance, find vulnerabilities and fix them.

Business continuity is having a spare tyre; resilience is proving you can still get the children to school on time if the tyre, the car and the road all fail. Mapping usually shows that "lending to businesses" depends on your rating engine, limit system and data feeds, so your recovery times become regulatory commitments. Rules vary by country.

**Change risk.** Systems fail most often when someone changes them, so migrations and rushed releases deserve the most control.

## Capital for operational risk

### The history

The original Basel I rules of 1988 had no operational risk charge at all. Basel II (2004) added one, with three approaches of increasing sophistication, like a choice of a rough guess, a slightly better guess, or building your own forecasting machine.

| Approach | How it worked | Who used it |
|---|---|---|
| Basic indicator approach (BIA) | Capital = 15% of average annual gross income over three years | Smaller banks |
| Standardised approach (TSA) | Gross income split across eight business lines, each multiplied by a factor of 12%, 15% or 18% | Most mid-sized and many large banks |
| Advanced measurement approaches (AMA) | The bank built its own statistical model, usually combining internal loss data, external data, scenarios and business environment factors, to estimate a one-year loss at 99.9% confidence | Large banks with supervisory approval |

**Why the advanced approach was scrapped.** Banks with similar risks produced wildly different capital, because results depended on modelling choices more than real risk; estimating a one-in-a-thousand-year loss from a few decades of patchy data is guesswork dressed as statistics; and after 2008 huge conduct losses arrived that capital had not anticipated. The simpler approaches had a flaw too: a bank losing money saw its gross income, and so its capital, fall just as problems grew.

In 2017, the Basel Committee's final Basel III reforms (sometimes called Basel 3.1 or Basel IV) replaced *all three* with a single **standardised approach**, consulted on earlier as the "standardised measurement approach". Jurisdictions began implementing it from 2023 onwards, on different timetables.

### The Basel III standardised approach

The new approach has two ingredients: how **big** the bank is, and how much it has **lost** before.

![[30-sa-capital.svg]]
*How the standardised approach works: financial statements give the business indicator, marginal coefficients turn it into the business indicator component, ten years of losses may adjust it through the internal loss multiplier, and capital times 12.5 gives risk-weighted assets. Bucket thresholds are in euros as set by Basel.*

**Step 1: the business indicator.** The **business indicator** (BI) measures the bank's size from its income statement, averaged over three years, by adding an **interest, leases and dividends component** (roughly net interest income, capped, plus dividends), a **services component** (fees, commissions and other operating income and expenses, counted gross) and a **financial component** (trading and banking book profits or losses, counted as absolute values so losses also count). It measures how much business the bank does, not how profitable it is.

**Step 2: the business indicator component.** The **business indicator component** (BIC) applies **marginal coefficients** that rise with size, like income tax bands:

| BI bucket (euros) | Marginal coefficient |
|---|---|
| Up to 1 billion | 12% |
| 1 billion to 30 billion | 15% |
| Above 30 billion | 18% |

Each slice is charged at its own rate, as with tax bands, on the view that bigger banks carry proportionally more operational risk.

**Step 3: the loss component and the internal loss multiplier.** The **loss component** (LC) is 15 times the bank's average annual net operational losses over the past ten years. The **internal loss multiplier** (ILM) compares it with the BIC:

ILM = ln( e minus 1 + (LC / BIC) to the power 0.8 )

where ln is the natural logarithm and e is about 2.718. Only its behaviour matters: if LC equals BIC, ILM is exactly 1; higher losses push it above 1 and lower losses below, gently, because of the logarithm.

For the smallest banks (BI up to 1 billion euros) ILM is 1 by default. Crucially, Basel lets national supervisors **set ILM to 1 for all banks**, ignoring loss history, and many have done so (the European Union and United Kingdom among them), largely over data quality and comparability concerns. Supervisors can also require ILM of at least 1 where loss data is poor.

**Step 4: capital and risk-weighted assets.**

Operational risk capital = BIC x ILM

Operational risk risk-weighted assets (RWA) = 12.5 x operational risk capital

The 12.5 is 1 divided by the 8% minimum capital ratio, putting operational RWA alongside credit and market RWA in the capital ratio from [[18 Regulatory Capital and Basel - the Short Version]].

### Worked example: the capital calculation

A mid-sized bank, figures illustrative and in euros.

**Business indicator** (three-year averages): interest, leases and dividends component 2.3 billion, services component 1.4 billion, financial component 0.3 billion. **BI = 4.0 billion.**

**BIC:**

- First 1 billion x 12% = 120 million
- Next 3 billion (from 1 to 4 billion) x 15% = 450 million
- **BIC = 570 million**

**ILM**, under three loss histories:

| Average annual net loss (10 years) | LC = 15 x average | LC / BIC | ILM | Capital = BIC x ILM | RWA = 12.5 x capital |
|---|---|---|---|---|---|
| 15 million | 225 million | 0.39 | 0.79 | 448 million | 5.6 billion |
| 40 million | 600 million | 1.05 | 1.015 | 579 million | 7.2 billion |
| 80 million | 1,200 million | 2.11 | 1.26 | 719 million | 9.0 billion |
| ILM set to 1 by the supervisor | not used | not used | 1.00 | 570 million | 7.1 billion |

Look at the middle row step by step. 600 / 570 = 1.053. Raised to the power 0.8 that is about 1.042. Add e minus 1 (1.718) to get 2.760. The natural log of 2.760 is about 1.015. Capital = 570 x 1.015 = about 579 million.

Two lessons. Doubling losses from 40 to 80 million raises capital by about a quarter, not double: the formula is deliberately dampened. And where ILM is fixed at 1, capital depends only on income statement items, so the **finance data** feeding the BI becomes the key input. Loss data still matters for management, Pillar 2 and disclosure.

### Pillar 2 add-ons

The formula cannot see a bank's particular weaknesses. Under **Pillar 2**, the bank assesses its own operational risk in its **internal capital adequacy assessment process** (ICAAP, see [[20 Stress Testing and ICAAP]]), using scenarios and loss data, and supervisors can add capital for weak controls, pending conduct issues, vendor dependence or poor IT resilience. National implementation varies, so treat every figure here as illustrative.

## Operational risk in a credit risk team's daily life

| Where it hides | What goes wrong | Typical control |
|---|---|---|
| Manual spreadsheets: **end-user computing** (EUC) tools built by users rather than IT | A provisioning overlay spreadsheet has a broken formula | EUC inventory, version control, independent formula checks, plan to replace |
| Keying errors in limits and collateral | Collateral entered as 10 million instead of 1 million | Maker-checker against source, validation, reconciliation |
| Missed covenant monitoring | A borrower's covenant breach goes unnoticed for two quarters | Automated covenant diary, exception reports, KRI on overdue tests |
| Late regulatory submissions | A capital return is late because a feed failed (see [[23 Reporting - Regulatory Returns, Pillar 3 and Management Information]]) | Submission calendar, early warning milestones, contingency runbook |
| Access control | A leaver can still approve ratings | Leaver process, access reviews, segregation of duties |
| Change failures | A release breaks the default flag and doubles impairment | Change approval, testing, parallel runs, rollback |
| Vendor outages | The third-party rating engine is down on the last day of the quarter | Service levels, fallback procedures, exit plan, resilience testing |
| Data quality failures | Missing country codes put exposures in the wrong risk weight bucket | Data quality rules, thresholds, owners, lineage (see [[22 Credit Risk Data, Systems and BCBS 239]]) |

### Incidents and near misses

An **incident** is any unplanned event that disrupts or could disrupt normal operations. A **near miss** could have caused a loss but did not: the extra-zero limit the checker spotted, the failed batch rerun before anyone used the numbers. A shot that hits the post is not a goal, but the goalkeeper's coach still wants the replay. Banks that record near misses honestly find broken controls before they become losses.

![[30-incident-lifecycle.svg]]
*An incident's journey from detection to closure: contain it, log it, decide whether it is a loss or a near miss, flag any boundary with credit or market risk, find the root cause, and fix the control.*

### How to log an incident

Policies differ, but most banks expect something like this:

1. **Contain first.** Stop the damage: pause the job, correct the data, tell users not to rely on the report.
2. **Log quickly** in the operational risk system, often within a few working days, escalating at once if it is large, customer-affecting, regulatory, fraud or a data breach.
3. **Describe it factually**: what happened, the dates, which systems, customers and reports are affected.
4. **Estimate the impact**, even if uncertain; update later.
5. **Classify**: event type, cause, failed control, any boundary link.
6. **Find the root cause.** Ask "why" until you reach something fixable; "human error" is rarely the answer.
7. **Raise issues and actions** with owners and dates.
8. **Close with evidence**, and update the RCSA, KRIs and control library.

A technology **incident management** process (priority 1 and 2 incidents, major incident calls) runs in parallel; a mature bank links the two so every major IT incident is assessed for operational risk logging.

## Common mistakes and misunderstandings

- **"Operational risk is the operations department's problem."** Every function, including technology, is first line and owns its operational risks.
- **"No loss, no event."** Near misses must be recorded too; they are the cheapest source of learning.
- **"Human error is the root cause."** It is a symptom. Ask why the process, screen or check allowed it.
- **"The loss is what left the bank on day one."** Gross loss includes legal and remediation costs, net loss subtracts recoveries, and losses develop over years.
- **"If it ended as a write-off, it is purely credit risk."** Boundary events must be flagged in the operational loss data even though capital stays in credit risk.
- **"Capital reflects our controls."** Under the standardised approach, especially where ILM is set to 1, Pillar 1 capital reflects size, not control quality. Controls show up in Pillar 2, supervisory attitude, and actual losses.
- **"Outsourcing moves the risk."** It moves the work; the bank stays accountable.
- **"A green RCSA means we are fine."** Self-assessments drift optimistic; if scores are green while incidents keep happening, the scores are wrong.
- **"Spreadsheets are not systems."** If a spreadsheet produces numbers used in decisions, provisions or regulatory returns, it is an end-user computing tool and needs controls.
- **"Model errors are not operational risk."** Model risk is usually a sub-category with its own framework (see [[21 Model Risk Management and Validation]]); its losses go in the operational loss data.

## What a platform lead needs to know about this

**You are a control owner.** Expect your name in the control library against "production change approval", "batch monitoring", "platform access review" and "limit reconciliation". If the evidence lives only in someone's inbox, the control will be rated ineffective even if it works.

**Incident management.** Assess every platform incident for operational risk logging against clear criteria (financial, regulatory, customer, data breach). Record when it occurred, was detected and was contained; do real root cause analysis; track actions to closure.

**Change controls.** Approval, testing proportionate to risk, separation of who builds and who deploys, a rollback plan and post-release checks. For model and regulatory calculation changes, add parallel runs and sign-off by the model owner and finance.

**End-user computing inventory.** Find and risk-rate every spreadsheet, database and script used for decisions, provisioning, capital or reporting. Critical ones need an owner, version control, restricted access, documented logic, review and a replacement plan. The inventory will be larger than anyone thinks.

**Resilience testing.** Know which important business services depend on your platform and their impact tolerances, and test recovery against scenarios such as a vendor engine down at quarter end or a corrupted data load.

**Third-party management of vendor engines.** For each vendor (rating engines, scorecards, valuation feeds, data providers, cloud): assessment before contracting, contract terms on service levels, security, audit rights and exit, ongoing monitoring and a tested exit plan. A vendor's outage is your incident.

**Data and access.** Automate KRI feeds; let default and write-off records carry a boundary flag and operational event identifier; review access regularly, remove leavers promptly and segregate duties.

**Who owns what.**

| Area | Owner |
|---|---|
| Framework, taxonomy, appetite, capital calculation | Operational risk function (second line) |
| RCSA for the credit platform | You and the credit risk business, challenged by the second line |
| Platform controls, incidents, changes, EUC inventory, vendor oversight | You (first line) |
| Technology and cyber policy | Chief information security officer and technology risk (second line) |
| Business indicator inputs | Finance |
| Loss data quality | Operational risk, with every reporting area |
| Independent assurance | Internal audit (third line) |

Your first months should include a walk through the platform's RCSA, the open issues list and the EUC inventory, as suggested in [[27 A Platform Lead's First 90 Days]]. Operational risk is the one risk type where you are not supporting someone else's risk; you are carrying your own.

## Related notes

- [[02 What Credit Risk Is]] for the risk you are paid to take, compared with the one you are not.
- [[29 Market Risk]] for the third member of the big three and the market side of boundary events.
- [[basel-credit-risk-explained-simply]] for the Basel framework and the three pillars.
- [[basel-credit-risk-decision-tree]] for where credit capital approaches branch, alongside the operational approach here.
- [[11 Collateral and Security]] for perfection of security, a classic boundary event.
- [[12 Loan Documentation, Covenants and Conditions]] for covenant monitoring.
- [[13 Credit Governance - Committees, Authorities and the Three Lines]] for the three lines of defence.
- [[14 Risk Appetite, Limits and Concentration]] for limits and risk appetite.
- [[18 Regulatory Capital and Basel - the Short Version]] for how operational risk RWA joins the capital ratio.
- [[20 Stress Testing and ICAAP]] for Pillar 2, scenarios and ICAAP.
- [[21 Model Risk Management and Validation]] for model risk as a sub-type of operational risk.
- [[22 Credit Risk Data, Systems and BCBS 239]] for data risk, lineage and controls.
- [[23 Reporting - Regulatory Returns, Pillar 3 and Management Information]] for submission deadlines and disclosures.
- [[27 A Platform Lead's First 90 Days]] for where to start as a control owner.
- [[28 Master Glossary]].
