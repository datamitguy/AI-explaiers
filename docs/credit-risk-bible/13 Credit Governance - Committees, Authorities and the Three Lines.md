# Credit Governance - Committees, Authorities and the Three Lines

**Why this matters to you.** A bank's credit risk is not controlled by a model or a system. It is controlled by people making decisions, and governance is the set of rules about who may decide what, who must check them, who is told, and who is held responsible when it goes wrong. As a platform lead you will build or inherit the systems that enforce those rules: approval workflows, authority tables, exception logs, committee packs. If you do not understand why the credit officer must be independent from the salesperson, why a 50 million loan needs a different committee from a 5 million loan, or why internal audit reports to the board and not to the chief risk officer, you will build the wrong workflow, and the regulator will find it.

## Table of contents

1. What governance means
2. The three lines of defence
3. The chief risk officer and the risk function
4. The board and the board risk committee
5. Credit committees at different levels
6. Delegated lending authorities and escalation
7. The four-eyes principle and independence from sales
8. The hierarchy of documents: framework, policy, standards, procedures
9. Policy exceptions and how they are tracked
10. The credit approval memo and the minutes
11. Conflicts of interest
12. Internal audit and the regulators
13. Model governance committees
14. What a governance failure looks like
15. Regulatory expectations in plain words
16. Common mistakes and misunderstandings
17. What a platform lead needs to know about this
18. Related notes

## 1. What governance means

Think of a school. Teachers run the classrooms. The head teacher sets rules and checks on the teachers. School governors, who are not employed by the school, meet a few times a year to check on the head. Inspectors turn up every few years to check on all of it. Nobody marks their own homework, and the bigger the decision (expelling a pupil, building a new wing), the more senior the person who has to agree.

Governance in a bank is the same structure applied to risk-taking. It answers five questions:

1. **Who decides?** Which person or committee can say yes to a loan, a limit, a policy, a model.
2. **Within what rules?** The policies and limits the board has set.
3. **Who checks?** An independent second opinion before the decision, and an independent review after.
4. **Who is told?** Reporting upward so that the board knows what risks the bank is carrying.
5. **Who is accountable?** Named individuals who answer for the outcome.

Credit governance is this applied to lending. It matters because lending decisions are made thousands of times a day by people with an incentive to say yes (they are paid to grow the business), and the losses arrive years later when those people may have moved on. Governance is how the bank makes today's decision-maker feel tomorrow's loss.

## 2. The three lines of defence

The standard model, used across banking and demanded by most regulators, is the **three lines of defence**. The football analogy: defenders, midfield, and the goalkeeper. Or in the school: teachers, head teacher, governors and inspectors.

**First line: the business.** The people who originate and own the risk. Relationship managers, branch staff, product teams, the front office. They are responsible for knowing their customer, proposing good loans, following policy, and running the day-to-day controls (checklists, data entry, limit checks). The first line owns the risk; if the loan goes bad, it is their loan. A common misconception is that the first line has no risk responsibility. In fact it has the most, because it is closest to the customer. Many banks also have "first line risk" teams, sometimes called business risk or "1.5 line," that sit inside the business and help it comply.

**Second line: the risk function.** Independent of the business, reporting to the chief risk officer. It sets the policies, approves (or declines) credit above the first line's authority, monitors the portfolio, measures the risk, owns the models and the limit framework, and challenges the business. Crucially, the second line does not report to the heads of the businesses it challenges, and its pay should not depend on business volumes. Compliance, operational risk and model risk are also second line. The credit risk function is the second line for credit.

**Third line: internal audit.** Independent of both. It reports to the board's audit committee, not to management. It does not approve anything or set any policy. Its job is to check, after the fact, that the first and second lines are doing what they say they are doing: that the controls exist, work, and are evidenced. It audits the credit function as hard as it audits the business.

Outside the three lines sit the **external auditor**, who signs the accounts, and the **regulator**, who inspects everything.

| Line | Who | Role | Reports to | Owns |
|---|---|---|---|---|
| First | Business units, relationship managers, operations | Take and manage risk, run day-to-day controls | Business heads, chief executive | The risk and the customer |
| Second | Credit risk, market risk, operational risk, compliance, model risk | Set policy, independent approval, monitor, measure, challenge | Chief risk officer, who reports to the chief executive and the board risk committee | The framework, policies, limits, models |
| Third | Internal audit | Independent assurance that the first two lines work | Board audit committee | Nothing except its own opinion |

The model has critics (it can become a box-ticking exercise, and the lines can blur), but regulators expect it, and the credit workflow you build should reflect it: the system should know which role a user is in and only let them do that role's actions.

![[13-three-lines.svg]]
*The three lines of defence: the business owns the risk, the risk function challenges and approves, internal audit assures the board, and external parties inspect from outside.*

## 3. The chief risk officer and the risk function

The **chief risk officer** (CRO) is the executive responsible for the second line. In a well-governed bank the CRO:

- Is a member of the executive committee with the same standing as the chief financial officer.
- Reports to the chief executive for day-to-day purposes but has a direct, unfiltered line to the board risk committee, and cannot be dismissed without the board's agreement.
- Owns the risk appetite statement ([[14 Risk Appetite, Limits and Concentration]]), the risk policies, the risk reporting and the models.
- Has a veto, or at least a formal right of escalation, on any credit decision.

Under the CRO, a credit risk function typically contains:

- A **chief credit officer** (CCO) who runs credit approval and chairs the top credit committee.
- **Credit approval teams** (credit officers, sometimes called credit underwriters or sanctioners) organised by business line or sector: corporate, real estate, leveraged finance, financial institutions, retail.
- **Portfolio risk management**: the people who look at the whole book, concentrations, limits and stress tests ([[20 Stress Testing and ICAAP]]).
- **Credit risk modelling** and **model validation**, which must be separate from each other ([[21 Model Risk Management and Validation]]).
- **Credit risk reporting** and **credit risk data**, which is where your platform usually lives ([[22 Credit Risk Data, Systems and BCBS 239]], [[23 Reporting - Regulatory Returns, Pillar 3 and Management Information]]).
- **Special situations** or **workout** teams for problem loans ([[16 Problem Loans, Restructuring and Recovery]]), though in some banks these sit in the first line.
- **Credit policy** teams who write and maintain the documents in section 8.

Structures vary by bank and country. Some banks put retail credit decisioning (the automated scorecard engines) in the business with second-line oversight; some put it in risk. Some have regional CROs reporting to a group CRO.

## 4. The board and the board risk committee

The **board of directors** is ultimately responsible for everything, including the bank's risk. Boards include **non-executive directors** who are not employees and are there to challenge management. Regulators increasingly require that the board, not management, approves the risk appetite and the key risk frameworks.

Because a full board cannot go through every risk topic, it delegates to committees:

- The **board risk committee** (BRC), chaired by a non-executive, reviews the risk profile against appetite, approves the risk appetite statement for board sign-off, approves the main risk policies, receives the CRO's reports, hears about limit breaches and large problem loans, and in some banks approves the very largest exposures.
- The **board audit committee** oversees internal audit, external audit and financial reporting, including provisions ([[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]]).
- The **remuneration committee** matters more than you might think: if bonuses reward volume with no risk adjustment, governance elsewhere is fighting against the money.

Below the board, management committees do the daily work. A typical structure has an **executive risk committee** or **group risk committee** chaired by the chief executive or the CRO, with sub-committees for credit, market, operational and model risk.

## 5. Credit committees at different levels

A **credit committee** is a group of people who approve credit decisions together. Committees exist because no individual should approve a large loan alone, because several pairs of eyes catch more, and because minutes create a record.

A typical hierarchy, from the top:

| Committee | Chair | Typical scope (illustrative) | Meets |
|---|---|---|---|
| **Board** or **board risk committee** | Non-executive director | Exposures above the group committee's authority; connected parties (loans to directors and their interests); anything the CRO escalates | Quarterly, with written approvals in between |
| **Group credit committee** (or executive credit committee) | Chief credit officer or CRO | Largest exposures; all large exposures under the regulatory definition; new products; policy changes; the biggest watchlist and workout cases | Weekly |
| **Divisional or regional credit committee** | Divisional head of credit | Mid-sized exposures; weaker rated borrowers; exceptions to policy; watchlist cases in that division | Weekly or twice weekly |
| **Local or sector credit committee** | Senior credit officer | Smaller exposures within standard policy | Daily or as needed |
| **Individual delegated authority** | A named credit officer, usually paired with a business approver | Small, standard, well-rated exposures | Continuous |

Committee membership normally includes credit risk (who hold the majority, or the chair holds a casting vote or veto), senior business representatives (who bring commercial knowledge but must not outvote risk), and sometimes finance or legal. Members may not vote on their own deals. A **quorum** is required. Decisions are approved, declined, deferred (more information needed) or approved with conditions.

Beyond the amount, the trigger for escalation is usually **risk**. Many banks use a grid: amount down one axis, internal rating grade across the other ([[10 Internal Ratings, Scorecards and PD Models]]). A 5 million loan to a borrower rated in the top grades might be approved locally; the same amount to a borrower in the weak grades goes two levels up. Specific categories escalate regardless of size: policy exceptions, connected parties, watchlist names, new sectors or countries, leveraged transactions above certain multiples, and anything the credit officer feels uncomfortable with.

## 6. Delegated lending authorities and escalation

A **delegated lending authority** (DLA, or "credit authority," "sanctioning authority," "mandate") is the written permission given to a named person or committee to approve credit up to defined limits. The board holds all authority and delegates it downward in a documented chain: board to group credit committee to divisional committee to individuals.

Authority is defined along several dimensions, and a decision must be within all of them:

- **Amount**: usually the total exposure to the group of connected counterparties after the new facility, not just the new facility. Approving 2 million to a customer who already has 20 million is a 22 million decision.
- **Rating grade**: lower authority for weaker ratings.
- **Product or sector**: specialised products (leveraged finance, project finance, derivatives) need specialist authority.
- **Tenor**: longer loans may need higher authority.
- **Country**: cross-border exposures may need country-level authority.
- **Exception status**: any deviation from policy raises the level.
- **Classification**: watchlist or defaulted borrowers typically go to a workout committee regardless of size.

Authorities are personal: granted to a named individual on the basis of training, experience and track record, reviewed annually, reduced or removed if the person's decisions go bad, and withdrawn when they change role. The authority register is itself a controlled document, and the workflow system should enforce it: a user cannot approve something outside their recorded authority, and the system should route the case to the right level automatically.

Worked example (all thresholds illustrative). A bank's authority grid:

| Total group exposure | Rating grades 1 to 4 (strong) | Grades 5 to 7 (average) | Grades 8 to 10 (weak) |
|---|---|---|---|
| Up to 2 million | Local credit officer | Local credit officer | Regional committee |
| 2 to 25 million | Regional committee | Regional committee | Group committee |
| 25 to 150 million | Group committee | Group committee | Board risk committee |
| Above 150 million | Board risk committee | Board risk committee | Board risk committee |

Any policy exception: one level higher than the grid says. Any connected party: board.

A relationship manager proposes a new 8 million facility for a grade 6 customer with existing exposure of 15 million. Total 23 million, grade 6: regional committee. The proposal also asks for an LTV of 75% against a policy maximum of 70%: a policy exception, so the case goes to the group committee. If the customer were a company owned by a director of the bank, the board would have to approve.

![[13-authority-ladder.svg]]
*The delegated authority ladder: a proposal is first checked for exception or connected-party status, then routed up the ladder by amount and rating until it reaches a level with authority to decide.*

## 7. The four-eyes principle and independence from sales

The **four-eyes principle** says that no credit decision should be made by one person. At minimum, two people must agree: the proposer and an approver. In practice, for anything above the smallest amounts, it means the business proposes and credit risk approves. For very small, standardised retail decisions, the "second pair of eyes" is an automated decision engine operating within rules set by the risk function, with human review of exceptions ([[05 Retail Lending]]).

**Independence of credit from sales** is the specific form of four-eyes that regulators care most about. The person who approves the loan must not:

- Report to the person who proposed it, or to anyone whose bonus depends on the loan being approved.
- Be paid on the basis of lending volume.
- Be in a position to be overruled by the business on a credit matter (the business can escalate, but only upward within risk, or to a committee where risk holds the veto).

The reason is simple incentive arithmetic. A relationship manager is rewarded for deals closed this year. A credit loss shows up in three years. Without an independent approver, the bank is structurally biased toward saying yes. Nearly every big credit failure in banking history involved this independence being weakened: credit officers reporting to business heads, credit committees stacked with business members, or a dominant chief executive who overrode credit.

The platform consequence: the workflow must distinguish the proposer role from the approver role at the user level, must prevent the same user from doing both, must prevent an approver from acting on cases where they were the proposer or the relationship manager, and must log who did what.

## 8. The hierarchy of documents: framework, policy, standards, procedures

Banks run on documents, and the documents have a hierarchy. Each level is approved by a different body, changes at a different speed, and binds the levels below.

| Level | Document | Approved by | Changes | Example content |
|---|---|---|---|---|
| 1 | **Risk appetite statement** | Board | Annually | "Expected loss on the corporate book will not exceed 0.5% of exposure." |
| 2 | **Credit risk management framework** (or risk management framework) | Board or board risk committee | Every one to three years | Roles of the three lines, committee structure, principles, the delegation chain. |
| 3 | **Credit policies** | Group credit committee or executive risk committee | Annually or as needed | Who the bank will and will not lend to, minimum standards, approval authorities, collateral haircuts, rating requirements, watchlist rules. |
| 4 | **Credit standards and lending guidelines** | Divisional credit committee or chief credit officer | As needed | Sector-specific rules: maximum leverage for leveraged loans, maximum LTV for commercial property, minimum debt service cover for project finance, country limits. |
| 5 | **Procedures and manuals** | Heads of function | Frequently | How to complete the credit memo, how to enter a facility, how to order a valuation, the covenant monitoring steps. |
| 6 | **System rules and controls** | System owners, under change control | Frequently | Limit checks, mandatory fields, workflow routing, authority tables, automated decision rules. |

A lower-level document may be stricter than a higher one but never looser. A procedure cannot permit something a policy forbids. The platform lead lives at level 6, and the central discipline is that every rule in the system should trace to a documented policy or standard. When the policy changes, the system must change; when the system has a rule nobody can trace to a policy, that is a finding waiting to happen.

![[13-policy-hierarchy.svg]]
*The policy document hierarchy: from external regulation and the board's risk appetite statement, down through framework, policies and standards to procedures and the rules encoded in systems, with policy exceptions tracked as deviations.*

## 9. Policy exceptions and how they are tracked

No policy fits every case, so banks allow **exceptions**: a decision to approve something outside policy, made by a higher authority than normal, with the reason recorded. An exception is not a breach; it is an authorised departure. A breach is an unauthorised one.

Common exceptions: LTV above the standard maximum, tenor longer than the standard, leverage above the guideline, lending to a sector on the restricted list, accepting a non-standard security package, waiving a covenant requirement, lending to a borrower below the minimum rating.

Why track them? Because an exception that happens once is judgement; an exception that happens 400 times is a policy that has silently changed without the committee that owns it agreeing. Regulators ask for exception reports, and so does the board. A good exception process:

1. The exception is identified at proposal stage, by the credit officer or by the system comparing the proposal to policy parameters.
2. It is explicitly flagged in the credit memo with the policy clause, the deviation, and the justification.
3. It is approved at the elevated authority level.
4. It is recorded in an **exception register** with the borrower, the policy clause, the approver, the date, and any conditions (for example, "exception expires at the next annual review").
5. Exceptions are reported monthly to the credit committee by type, business unit and approver, with trends.
6. Persistent exceptions trigger a policy review: either the policy is wrong or the business is drifting.

The platform should hold exceptions as structured data (policy clause identifier, type, approver, expiry), not as free text in a memo.

## 10. The credit approval memo and the minutes

The **credit approval memo** (credit application, credit paper, credit proposal) is the document on which the decision is made. It is written by the relationship manager (first line), reviewed and usually rewritten in part by the credit officer (second line), and presented to the approver or committee. [[09 Credit Analysis - Reading a Borrower]] covers the analysis inside it. The structure, typically:

- Summary of the request and the recommendation.
- Borrower and group structure, ownership, management.
- Purpose, facility details, pricing, return on capital ([[24 Pricing, RAROC and Return on Capital]]).
- Financial analysis, forecasts, sensitivities.
- Internal rating and its drivers, with any override and its justification.
- Security and its valuation ([[11 Collateral and Security]]).
- Covenants and conditions ([[12 Loan Documentation, Covenants and Conditions]]).
- Risks and mitigants.
- Policy compliance and any exceptions.
- Limit impact and concentration ([[14 Risk Appetite, Limits and Concentration]]).
- The credit officer's independent opinion, which may disagree with the recommendation.

The **minutes** of a credit committee record who attended, what was decided, any conditions attached, who dissented and why, and any actions. Minutes are a legal record and a regulatory expectation. They are also evidence: in a later dispute or inspection, "what did the bank know and when" is answered from the memo and the minutes. Banks are moving from memos as documents to memos as structured data in a credit workflow system, which lets the decision, the conditions and the approved limits flow straight into the servicing and limit systems rather than being re-keyed. Conditions of approval ("subject to receipt of the parent guarantee") must be tracked to completion like conditions precedent.

## 11. Conflicts of interest

A conflict of interest is a situation where someone's personal interest, or the interest of someone close to them, might affect their judgement. In credit governance the main cases:

- **Connected lending**: loans to directors, senior managers, their families, or companies they own or control. Regulators require these to be approved at board level, on arm's-length terms, and disclosed. Many countries put hard limits on them. Connected lending scandals are among the commonest causes of bank failure in emerging markets.
- **Personal relationships**: a credit officer approving a loan to a friend or relative. Must be declared and the case reassigned.
- **Financial interests**: an approver who owns shares in the borrower.
- **Business pressure**: the business head sitting on a committee and voting on their own team's deals. Committee rules should prevent members voting on cases from their own area.
- **Gifts and hospitality**: a register and limits.

The control is a **declaration**: committee members and approvers declare conflicts at the start of each meeting or on each case, and the system should allow (and record) recusal. Related-party flags on customer records, linked to a register of directors and senior managers and their interests, let the system route connected cases to the board automatically.

## 12. Internal audit and the regulators

**Internal audit** reviews the credit process on a cycle, typically every one to three years for each area, more often for high-risk areas. A credit audit will test: that approvals were within authority; that files contain the required analysis; that security was perfected ([[11 Collateral and Security]]); that covenants were monitored; that ratings were assigned per the methodology; that exceptions were approved and tracked; that watchlist and provisioning processes worked; that system access matched roles; and that management information reaching committees was accurate. Findings are rated by severity, assigned to an owner with a due date, and reported to the audit committee. Overdue findings are a serious matter; a chief executive whose bank has a backlog of overdue high-rated audit findings will hear about it from the regulator.

**Regulators** (in the United Kingdom the Prudential Regulation Authority, in the euro area the European Central Bank together with national authorities, in the United States the Federal Reserve, the Office of the Comptroller of the Currency and others) supervise governance directly. They review the framework documents, attend or read the minutes of committees, interview the CRO and non-executive directors, inspect sample credit files, review internal audit's findings, and issue their own findings with required actions. Under the Basel Pillar 2 process ([[18 Regulatory Capital and Basel - the Short Version]], [[20 Stress Testing and ICAAP]]), weak governance translates directly into a higher capital requirement. Regulators also increasingly hold named senior individuals personally accountable for their areas of responsibility (the United Kingdom's senior managers regime is one example), which has concentrated minds on whether the governance actually works rather than whether it looks good on paper.

## 13. Model governance committees

Because so much of credit risk is now measured by models (internal ratings, scorecards, loss given default, expected credit loss, stress tests), models need their own governance. [[21 Model Risk Management and Validation]] goes deep; the governance summary is:

- A **model risk policy** sets what counts as a model, how models are tiered by materiality, and the lifecycle requirements.
- A **model inventory** lists every model with its owner, tier, validation status and known limitations.
- A **model risk committee** (or model governance committee, or model approval committee) approves new models and material changes, reviews validation findings, and approves continued use of models with known weaknesses. It includes the CRO or a delegate, the head of model validation, the model owners, and often finance.
- **Independent validation** sits in the second line, separate from the developers, and reports to the committee.
- For regulatory models (the internal ratings-based models), the regulator must approve material changes before use.

The practical link to credit governance: a credit committee relies on the rating the model produces. If the model is wrong, every decision made using it is wrong. Model governance is therefore upstream of credit governance, and the credit committee should be told when a model it relies on has material findings.

## 14. What a governance failure looks like

A composite case, drawn from the patterns that recur in published regulatory enforcement actions and post-mortems rather than any single institution.

A mid-sized bank decides to grow its commercial real estate lending. The business head is charismatic and brings in deals; the chief executive backs the strategy. Over three years:

- Credit officers for real estate are moved to report to the business head "for efficiency." Their bonuses become linked to divisional profit.
- The regional credit committee gains two business members and loses one risk member; the chair is now the business head.
- The LTV policy maximum is 70%. Exceptions up to 80% start to be approved by the regional committee rather than the group committee, on the grounds that "the committee includes senior risk people." The exception register is not updated because the committee does not think of them as exceptions.
- Valuations are ordered by relationship managers from a small set of friendly valuers. The valuer panel policy exists but is not enforced in the system.
- The CRO raises concentration concerns at the board risk committee; the minutes record the concern and a management response that the portfolio is "well diversified by sub-sector." No limit is set.
- Internal audit's review of real estate lending is deferred twice because the team is busy with a regulatory project.
- Covenant monitoring is done on a spreadsheet by one analyst who leaves; the spreadsheet is not maintained for five months.

The property market turns. Values fall 25%. The bank discovers that 40% of its real estate book is above 80% LTV on current values, that security on a dozen large loans was never registered because conditions subsequent were not chased, that three borrowers are connected to each other through a common owner nobody had linked in the system, and that the group's total exposure breaches the large exposures limit. Losses exceed two years of profit. The regulator's report finds: loss of credit independence, committee composition captured by the business, an exceptions process that failed, unmonitored covenants, a deferred audit, and a board that recorded concerns without acting.

Note that no single step looked catastrophic. Each was a small, plausible efficiency. That is what governance failure looks like from the inside. The system controls that would have made each step visible (reporting lines in the authority table, exception flags computed by the system, valuer panel enforcement, condition subsequent ageing, connected party linking) are exactly the things a platform lead builds.

## 15. Regulatory expectations in plain words

The Basel Committee's **Core Principles for Effective Banking Supervision** and its guidance on credit risk management (most notably the "Principles for the Management of Credit Risk") set out what supervisors expect. In plain words:

1. **The board owns the credit strategy and risk appetite.** It must approve them, review them regularly, and make sure management implements them.
2. **There is a sound credit-granting process.** Clear criteria for who the bank lends to, well-defined approval authorities, thorough analysis before approval, and independence between origination and approval.
3. **Credit is managed over its whole life.** Documentation, monitoring, ratings, limits, and problem loan management, not just origination ([[03 The Credit Lifecycle]]).
4. **The bank measures and controls its risk.** Internal ratings, limits by borrower and by concentration, portfolio-level monitoring, stress testing.
5. **There are adequate controls.** Independent review of the credit process (internal audit), reporting of exceptions and breaches, and remedial action.
6. **Supervisors check all of this.** They will look at the documents, the minutes, the files and the systems, and require more capital or restrict business where it falls short.

The Basel Committee's **Corporate Governance Principles for Banks** add expectations on board composition and skills, the independence and stature of the CRO, the independence of internal audit, and risk-adjusted remuneration. National regulators layer their own rules on top; the precise requirements depend on where the bank operates and you should check the local framework rather than rely on this summary.

## 16. Common mistakes and misunderstandings

- **"Risk owns the risk."** No: the first line owns the risk. The second line owns the framework and the independent challenge. If the business thinks risk is someone else's problem, governance has already failed.
- **Thinking internal audit is part of risk.** It is the third line, reports to the audit committee, and audits the risk function too.
- **Measuring authority by the new facility rather than total exposure.** Authority nearly always applies to the total group exposure after the new facility.
- **Treating committees as the control.** A committee stacked with business members, or one that approves 98% of cases in two minutes each, is a rubber stamp. The control is independent analysis and the right to decline, with evidence that declines happen.
- **Letting exceptions become the norm without noticing.** The exception register and its trend reporting are the tripwire.
- **Confusing "approved with conditions" with "approved."** Conditions must be tracked to completion.
- **Reporting lines on paper that differ from reality.** If credit officers sit with the business, share its bonus pool, and depend on the business head for promotion, they are not independent whatever the organisation chart says.
- **Building system roles from job titles rather than from governance roles.** The system needs to know proposer versus approver versus reviewer, and the authority level of each approver, not just "manager."
- **Assuming governance stops at the group.** Subsidiaries and branches in other countries have their own boards, committees and local regulatory requirements, and the group's framework must be adopted locally.

## 17. What a platform lead needs to know about this

**Data.** The governance data model needs: a user and role register (proposer, approver, committee member, reviewer, auditor, read-only), an authority table (per user or committee: amount, rating, product, country, exception dimensions, effective dates), a committee register (membership, quorum rules, meeting dates), the decision record for each case (who proposed, who approved, at what level, when, with what conditions, any dissent), an exception register (policy clause, type, approver, expiry), a conditions-of-approval tracker, a connected-party register linked to customer records, and a conflicts and recusal log. All of this must be versioned, because the question "who had authority for what on the date this was approved" is asked years later.

**Systems.** The credit workflow system (origination, memo, routing, approval, minutes) is the governance engine. It should compute the required approval level from the authority table and the case attributes, route accordingly, enforce segregation of proposer and approver, flag exceptions by comparing the proposal to policy parameters, and push approved limits and conditions to the limit and servicing systems without re-keying. Committee packs should be generated from the system, not assembled by hand. The policy documents themselves should live in a controlled document repository with version history, and every system rule should carry a reference to the policy clause it implements.

**Controls.** Access control aligned to roles, reviewed quarterly. Authority table changes under dual control with an approval reference. A monthly report of decisions made versus authority held (approvals outside authority should be zero; the report proves it). Exception trend reporting. Conditions-of-approval ageing. Connected party routing. Audit log of every decision and every change to the authority table. Reconciliation between committee minutes and the limits loaded in systems. Evidence retention for the period the regulator requires, often seven years or more.

**Who owns what.** The board owns the framework and appetite. The CRO owns policies and the risk function. The chief credit officer owns the authority grid and chairs the top committee. Credit policy owns the documents. Business heads own first-line compliance and their teams' authorities. The committee secretariat owns minutes and packs. Internal audit owns assurance. The platform lead owns the workflow system, the authority table implementation, the exception and conditions data, and the evidence that the system enforces what the documents say. Expect internal audit and the regulator to ask you to demonstrate, with system evidence, that no approval happened outside authority.

**Questions to ask in your first month.** Is the authority table in the system the same as the one in the policy document? Can the system show every approval outside authority in the last year? How are exceptions identified: by the system, or by someone remembering? Are committee minutes structured data or documents? Can you list every decision a given approver made, with outcomes, to support the annual review of their authority? Is there a related-party register linked to customers?

## 18. Related notes

- [[30 Operational Risk]] for the operational risk framework that shares the three lines model.
- [[01 What a Bank Is and How It Makes Money]] for the organisation of a bank.
- [[03 The Credit Lifecycle]] for where approval sits in the lifecycle.
- [[09 Credit Analysis - Reading a Borrower]] for the content of the credit memo.
- [[10 Internal Ratings, Scorecards and PD Models]] for ratings and overrides.
- [[11 Collateral and Security]] for valuation and security controls.
- [[12 Loan Documentation, Covenants and Conditions]] for conditions and waivers.
- [[14 Risk Appetite, Limits and Concentration]] for the appetite statement and limits.
- [[15 Monitoring, Early Warning and Watchlist]] for watchlist governance.
- [[16 Problem Loans, Restructuring and Recovery]] for workout committees.
- [[18 Regulatory Capital and Basel - the Short Version]] and [[20 Stress Testing and ICAAP]] for Pillar 2 and supervisory review.
- [[21 Model Risk Management and Validation]] for model governance.
- [[22 Credit Risk Data, Systems and BCBS 239]] for data governance.
- [[23 Reporting - Regulatory Returns, Pillar 3 and Management Information]] for committee reporting.
- [[27 A Platform Lead's First 90 Days]] for how to approach all this.
- [[basel-credit-risk-explained-simply]] section 20 for who does what in a bank.
- [[28 Master Glossary]] for terms.
