# Credit Power Platform: deck draft

## Slide 1: Credit Power Platform: from federated apps to a platform that scales

- Proposal to establish a central Credit Power Platform team
- [Presenter, role, date]

*Visual:* Title slide with a simple hub-and-spoke graphic.

*Speaker notes:* Set the frame: this is about building on success, not fixing failure.

## Slide 2: We're asking for approval to set up a central Credit Power Platform team

- The ask: a team of 6 people, about £710k a year plus £150k set-up
- What it fixes: duplication, inconsistent data, access sprawl and uneven controls across 150 apps
- What it returns: about £1.1m a year at full run rate; payback in 2.0 years
- Decision needed today: approve the team, funding and first 90 days

*Visual:* Executive summary: three boxes (problem, proposal, return) and the ask in bold.

*Speaker notes:* State the decision first. If you only had this slide, could they decide?

## Slide 3: Power Platform has become how credit gets work done

- 150 live apps and flows built by 12 teams
- Examples: [annual reviews, covenant tracking, watchlist, limit requests…]
- It delivered speed and business ownership: a success worth protecting

*Visual:* Estate map: apps by team or process, sized by users.

*Speaker notes:* Celebrate the makers. You need them on your side.

## Slide 4: Our success has created fragmentation that now costs us speed, money and control

- Duplication: the same capabilities rebuilt by different teams
- Inconsistent data: exposure and limits copied with different definitions
- Access sprawl: no single view of who can approve what
- Uneven controls on apps that touch credit decisions
- Key-person risk and licence waste

*Visual:* Six symptom icons, each with one real number from your estate.

*Speaker notes:* Use your own numbers. One real example per symptom.

## Slide 5: One example: we have built approval workflows [N] times

- [Name the apps and teams]
- [Effort spent, differences in rules, an incident or audit point it caused]
- With a platform: one approval block with delegated authority, reused everywhere

*Visual:* Side-by-side screenshots of the different versions.

*Speaker notes:* A concrete story makes the abstract case real.

## Slide 6: A platform makes it faster, cheaper and safer for many teams to build

- A shared set of building blocks, rules and services, run as a product
- The platform doesn't build every app; it makes every app easier to build
- Analogy: a city provides roads, utilities and building codes; residents build their own houses

*Visual:* City analogy graphic: infrastructure layer under many buildings.

*Speaker notes:* Bottcher's definition: self-service APIs, tools, services, knowledge and support, arranged as a compelling internal product.

## Slide 7: We propose hub-and-spoke: centralise the commons, federate the journeys

- Hub (platform team): environments, entitlements, guardrails, pipelines, shared blocks, data model, support, enablement
- Spokes (business teams): their apps, processes, requirements and day-to-day changes
- Shared: standards, roadmap, risk tiering, contributions to the block catalogue

*Visual:* Hub-and-spoke diagram with the three columns.

*Speaker notes:* Address the 'central bottleneck' fear here, before anyone raises it.

## Slide 8: The platform provides 14 capabilities across four outcomes

- 🚀 Speed: paved road, templates, self-service environments
- 🛡️ Safety: entitlements, guardrails, audit, resilience
- 📦 Scale & cost: reusable blocks, connectors, licence optimisation, fewer apps
- 🧠 Data & AI: one credit data model, certified reporting, safe AI

*Visual:* Capability map grid (14 tiles in four colour groups).

*Speaker notes:* Use the Chapter 14 catalogue as an appendix slide with detail.

## Slide 9: One entitlement model lets us answer 'who can approve what?' in minutes

- Personas mapped to Entra ID groups and standard roles across all apps
- Segregation of duties and delegated authority enforced by design
- Leavers lose all access at once; one access review for all apps

*Visual:* Before/after: many app-specific role tables vs one persona model.

*Speaker notes:* This slide often matters most to risk and audit.

## Slide 10: Shared building blocks and one credit data model turn months into weeks

- Example: Annual credit review takes 45 days on the platform vs 81 from scratch (49% assembled)
- Blocks: connectors to core credit systems, approval with delegated authority, audit trail, document generation, app shell
- One data model: counterparty, facility, exposure, collateral, rating

*Visual:* Lego-style diagram of an app assembled from blocks.

*Speaker notes:* Numbers are illustrative unless you've measured them; say so.

## Slide 11: Risk-tiered guardrails: light for low-risk apps, strict for critical ones

- Tier 4 personal and team productivity: registered, same-day start
- Tier 3 departmental: packaged, tested, standard components
- Tier 2 business-important: pipelines, SoD checks, audit logging, support
- Tier 1 critical or regulatory: EUC register, independent testing, BCP, model-risk review

*Visual:* Four-step pyramid with controls per tier.

*Speaker notes:* Governance proportional to risk is what makes it fast.

## Slide 12: The platform pays back in about 2.0 years, but the bigger prize is speed and control

- About £1.1m a year in benefits at full run rate vs £710k a year to run
- 3-year net value: £429k; payback in 2.0 years
- Platform work no longer duplicated in teams: £330k a year
- Reuse on new builds: £269k a year
- Lower maintenance: £179k a year
- Conservative assumptions; ranges in the appendix

*Visual:* Bar chart of benefit sources plus a cumulative break-even line.

*Speaker notes:* Lead with ranges and say which numbers are measured vs estimated.

## Slide 13: It also reduces our regulatory and operational risk

- Consistent controls on every app that touches credit decisions
- Audit evidence produced by the platform, not reconstructed per app
- Lower key-person risk: standard build, documentation and support
- Resilience for apps supporting important business services

*Visual:* Risk heatmap: today vs with platform.

*Speaker notes:* Link to known audit findings or EUC risks if you can.

## Slide 14: A platform is the precondition for safe AI and Copilot at scale

- AI is only as good as the data and access controls beneath it
- Shared guardrails for Copilot Studio agents and AI Builder
- Reusable AI blocks (e.g. financial statement extraction) with human review

*Visual:* Layered diagram: data → entitlements → guardrails → AI use cases.

*Speaker notes:* Executives are being asked about AI; this connects your ask to theirs.

## Slide 15: A small team of 6 people, mixing product, engineering, data, design and risk

- 6 people: product owner, architect, platform engineers, pro developer, data, UX, enablement (some part-time)
- An embedded risk and control partner
- Business teams keep their makers; the platform team enables them

*Visual:* Org chart of the hub with links to business spokes.

*Speaker notes:* Show you are not building an empire.

## Slide 16: First 12 months: foundations, then building blocks, then scale

- Now (0–3 months): Appoint platform product owner; agree charter; Inventory the estate (CoE Starter Kit) and baseline metrics; Front door: intake, triage and platform portal; Environment strategy and Managed Environments; Redesign data loss prevention policies
- Next (3–6 months): Segregation-of-duties and delegated-authority service; Credit data model v1 (counterparty, facility, exposure); Custom connectors to loan system and core banking; Approval workflow block with delegated authority; Component library and design system v1
- Later (6–12 months): Automated access recertification; Starter template for credit apps; Retire and consolidate duplicate apps; Move tier 1 apps onto the paved road; Certified Power BI models on the credit data model

*Visual:* Now / Next / Later roadmap with quick wins highlighted.

*Speaker notes:* Name one visible quick win in the first 90 days.

## Slide 17: We'll measure success by speed, safety, reuse and adoption

- Lead time from idea to production: Halve within 12 months
- Share of new apps on the paved road: 80%+
- Apps with a named owner in the inventory: 100% for tiers 1–3
- Critical apps on ALM (no edits in production): 100%
- Open segregation-of-duties conflicts: Zero unapproved
- Audit findings on Power Platform apps: Down year on year; no repeats
- Reuse rate: 60%+
- Licence utilisation: 85%+

*Visual:* Scorecard table with baseline, target and owner.

*Speaker notes:* Commit to reporting quarterly.

## Slide 18: Funded centrally at first, then a hybrid model

- Months 0–18: central funding to drive adoption
- Then: core platform centrally funded; premium services charged
- Showback from day one so costs are visible

*Visual:* Timeline of funding stages.

*Speaker notes:* Pre-empt 'who pays' before it's asked.

## Slide 19: The main risks are bottleneck, low adoption and scope creep, and we've planned for them

- Bottleneck → self-service paved road, published service levels, product management
- Low adoption → enablement, champions, blocks better than building your own
- Scope creep → clear boundary: platform owns the commons, teams own their apps
- Disruption to existing apps → phased migration by risk tier

*Visual:* Risk/mitigation table.

*Speaker notes:* Naming your own risks builds credibility.

## Slide 20: Decision today: approve the team, the funding and the first 90 days

- Approve a 6-person Credit Power Platform team
- Approve funding of £860k for year 1
- Nominate an executive sponsor and a business customer council
- Agree a 90-day checkpoint with the first metrics

*Visual:* Three numbered asks.

*Speaker notes:* End on the ask, not on 'questions?'

## Slide 21: Appendix: questions you may have

- Won't a central team slow us down?
- Why can't each team just follow standards?
- What happens to the apps we already have?
- Who pays? Is this extra headcount?
- Will business teams lose control of their apps?
- Is Power Platform suitable for critical credit processes?

*Visual:* Q&A table.

*Speaker notes:* Keep the full objection list ready.

## Slide 22: Appendix: assumptions behind the business case

- Teams building on Power Platform: 12
- Live apps and flows: 150
- New apps per year: 40
- Licensed users: 800
- Blended day rate (fully loaded): £700
- Average build effort per new app (days): 40
- Share of each build that is common plumbing (%): 40
- Share of that plumbing the platform removes (%): 60
- Maintenance per app per year (days): 8
- Maintenance reduction from shared blocks (%): 25
- Apps that duplicate others and could be retired (%): 15
- Incidents or control issues per year: 6
- Average cost per incident: £25k
- Reduction with platform guardrails (%): 50
- Audit, EUC and access admin effort per year (days): 350
- Reduction from central controls and automation (%): 50
- Licence price per user per month: £20
- Share of licence spend recoverable (%): 15
- Platform team size (people): 6
- Platform-type work already done inside teams that moves to the platform (FTE): 3
- Cost per person per year: £110k
- Tooling and services per year: £50k
- One-off setup cost: £150k

*Visual:* Assumptions table with source for each number.

*Speaker notes:* Mark each as measured, estimated or industry benchmark.

## Slide 23: Appendix: our platform maturity today

- Platform vision, charter and roadmap (Platform product & strategy): today 0/3, importance Med
- Intake, triage and prioritisation of requests (Platform product & strategy): today 0/3, importance Med
- Value and adoption tracking (Platform product & strategy): today 0/3, importance Med
- Customer council with business teams (Platform product & strategy): today 0/3, importance Med
- Environment strategy (dev, test, prod per domain) (Environments & tenant): today 0/3, importance Med
- Self-service environment provisioning (Environments & tenant): today 0/3, importance Med
- Managed Environments and environment groups (Environments & tenant): today 0/3, importance Med
- Capacity management (storage, API requests) (Environments & tenant): today 0/3, importance Med

*Visual:* Heatmap of the 14 pillars.

*Speaker notes:* Shows you've done the homework and where the gaps are.
