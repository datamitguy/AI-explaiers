# Climate, ESG and Emerging Credit Risks

**Why this matters to you.** Most of this vault describes risks that banks have measured for decades, with long data histories and settled methods. This note is about the risks that do not have those things yet. Climate change can flood a borrower's factory or make a coal plant worthless; a cyber attack can empty a customer's bank account; sanctions can make a perfectly good loan illegal to collect; a pandemic can shut an entire sector overnight. None of these show up in a PD model built on twenty years of default history, because the history does not contain them. Regulators now require banks to measure and manage them anyway, which means new data (emissions, geolocation of collateral, sector heat maps), new models and new reports layered on top of everything else. For a platform lead, emerging risk is mostly a data-acquisition and data-integration problem, and it is the area where the credit function is most likely to ask you for something that does not exist yet.

---

## Table of contents

1. [Climate risk from scratch](#1-climate-risk-from-scratch)
2. [How climate becomes credit risk](#2-how-climate-becomes-credit-risk)
3. [The regulatory push](#3-the-regulatory-push)
4. [Sector heat maps](#4-sector-heat-maps)
5. [Counterparty questionnaires and engagement](#5-counterparty-questionnaires-and-engagement)
6. [Data challenges](#6-data-challenges)
7. [Environmental, social and governance scoring and its limits](#7-environmental-social-and-governance-scoring-and-its-limits)
8. [Greenwashing risk](#8-greenwashing-risk)
9. [Other emerging risks, briefly](#9-other-emerging-risks-briefly)
10. [How a credit team builds capability](#10-how-a-credit-team-builds-capability)
11. [Common mistakes and misunderstandings](#11-common-mistakes-and-misunderstandings)
12. [What a platform lead needs to know about this](#12-what-a-platform-lead-needs-to-know-about-this)
13. [Related notes](#13-related-notes)

---

## 1. Climate risk from scratch

Back to the lemonade stand. Two things could ruin your summer. First, the weather itself: a flood could wash the stand away, or a drought could triple the price of lemons. Second, the rules could change: the council might ban single-use cups, and if your whole business depends on cheap plastic cups, you are in trouble while the stand next door that already uses paper cups is fine.

Those are the two kinds of climate risk.

**Physical risk** is the direct damage from a changing climate. It comes in two flavours:
- **Acute**: sudden events. Floods, storms, hurricanes, wildfires, heatwaves. A factory under two metres of water does not produce or pay.
- **Chronic**: slow shifts. Rising sea levels, long-term drought, changing rainfall, rising average temperatures. A farm that gradually becomes unproductive; a coastal town where insurance becomes unaffordable and property values fall.

**Transition risk** is the cost of the world moving to a low-carbon economy. It comes from:
- **Policy and regulation**: carbon taxes, emissions trading, bans on certain engines or boilers, building efficiency rules.
- **Technology**: cheaper renewables and batteries making fossil-fuel assets uncompetitive.
- **Market and consumer preference**: customers and investors moving away from high-carbon products.
- **Legal**: lawsuits against emitters.

The two interact in an uncomfortable way. A fast, orderly transition means lower physical risk later but higher transition risk now. A slow or no transition means lower transition risk now but severe physical risk later. A disorderly, late transition is the worst of both: nothing happens for years, then everything at once. The scenarios regulators use for stress testing (section 3) are built around exactly these three paths, often called **orderly**, **disorderly** and **hot house world**.

| | Physical risk | Transition risk |
|---|---|---|
| Source | The climate itself | The response to climate change |
| Time horizon | Growing over decades, with acute events any time | Could be sudden (a policy change) or gradual (technology) |
| Who is hit hardest | Borrowers and collateral in exposed locations: coasts, floodplains, drought areas, wildfire zones | Borrowers in high-carbon sectors: fossil fuels, power generation, heavy industry, transport, agriculture, inefficient buildings |
| Lemonade version | Flood washes the stand away | Council bans plastic cups |

---

## 2. How climate becomes credit risk

Climate is not a new kind of risk for the capital rules. It is a new **driver** of the old kinds. It arrives in the credit book through the same three parameters as everything else.

![[25-climate-transmission.svg]]
*How physical and transition risk drivers travel through borrowers and collateral into PD, LGD and EAD, and from there into provisions, capital and concentration.*

**Through PD.** A borrower's cash flow falls (flood damage, lost output, higher insurance and energy costs, a carbon tax on its product) or its assets become worthless (a coal mine, a fleet of diesel trucks, oil reserves that cannot be extracted under new rules, so-called **stranded assets**). Lower cash flow and lower asset value mean higher probability of default, exactly as in [[09 Credit Analysis - Reading a Borrower]].

**Through LGD.** The collateral is itself exposed. A house in a floodplain is worth less once flood risk is priced in and insurers withdraw. An office building with poor energy efficiency may become unlettable when minimum efficiency standards arrive. A ship that does not meet emissions standards cannot trade in certain ports. Lower collateral value means lower recovery and higher LGD ([[11 Collateral and Security]]).

**Through EAD.** Borrowers under stress draw their undrawn lines. A company hit by a flood draws its revolving facility to fund repairs.

**Through concentration.** Climate effects are correlated by geography and sector. A bank with a large book in one coastal region, or in one carbon-intensive industry, faces the risk that many borrowers deteriorate at once, which is the concentration problem in [[14 Risk Appetite, Limits and Concentration]].

A worked example. A bank has a 50 million portfolio of commercial mortgages on 40 offices in one city. Today: average PD 1.0%, LGD 25%, expected loss 1.0% x 25% x 50 million = 125,000. A new regulation will ban letting buildings below a minimum energy rating within five years; 15 of the 40 buildings are below it, representing 20 million of exposure. The borrowers on those buildings face refurbishment costs they may not afford and rental voids. The bank's climate overlay raises their PD to 3.0% and, because the buildings are harder to sell, their LGD to 40%. New expected loss on that slice: 3.0% x 40% x 20 million = 240,000. Portfolio expected loss rises from 125,000 to 75,000 (the unaffected 30 million) plus 240,000 = 315,000, two and a half times the original. Nothing has physically happened yet; a rule was announced.

---

## 3. The regulatory push

Supervisors moved on climate risk quickly, and the direction has been consistent even where the details vary by country.

**Supervisory expectations.** Central banks and regulators in Europe, the United Kingdom and elsewhere have published expectations that banks identify, measure, manage and disclose climate-related financial risks, embed them in governance (board-level responsibility, a named senior executive), risk appetite, credit assessment and stress testing. The usual framing is that climate is a driver of existing risk categories, so it belongs inside the existing frameworks rather than in a separate silo. The Basel Committee has published principles along the same lines.

**Climate stress tests.** Several supervisors have run system-wide climate stress exercises, asking banks to project losses under the orderly, disorderly and hot-house scenarios over horizons of up to thirty years, far longer than the three to five years of a normal stress test in [[20 Stress Testing and ICAAP]]. The scenarios are typically built on the work of a network of central banks and supervisors that publishes shared climate scenario pathways with carbon prices, temperature paths and sector-level effects. Early exercises were explicitly learning exercises, with no capital consequence; the direction of travel is towards results informing Pillar 2 judgements.

**Disclosure frameworks.** The private-sector framework known as **TCFD** (Task Force on Climate-related Financial Disclosures) set the template: disclose governance, strategy, risk management, and metrics and targets, including financed emissions. That template has since been absorbed into sustainability reporting standards in many jurisdictions, including standards from the international sustainability standards body and the European Union's corporate sustainability reporting rules, and into Pillar 3 climate disclosure templates for banks in Europe. The details change year by year; what is stable is that banks must publish their climate exposure by sector, their financed emissions, and their alignment with transition paths.

**Taxonomies.** Several jurisdictions have published a **green taxonomy**: a list of activities that count as environmentally sustainable. Banks report the share of their lending that qualifies. This matters for credit data because every facility needs a tag.

| Regulatory tool | What it asks of the credit function | Platform implication |
|---|---|---|
| Supervisory expectations | Embed climate in credit policy, appetite, assessment, monitoring | Sector and location tags on every exposure; climate fields in origination |
| Climate stress tests | Project losses under long-horizon scenarios by sector and geography | Scenario engine extended to 30 years; emissions and location data |
| Disclosure (TCFD-style, Pillar 3 climate templates) | Publish exposure to high-carbon sectors, financed emissions, physical risk exposure | Reporting layer with new dimensions; emissions data pipeline |
| Green taxonomies | Classify lending by sustainability criteria | Facility-level tags with evidence |

---

## 4. Sector heat maps

The first tool almost every bank builds is a **sector heat map**: a table of industry sectors scored for physical and transition risk exposure, usually high, medium or low, sometimes over several time horizons.

| Sector (illustrative) | Transition risk | Physical risk | Notes |
|---|---|---|---|
| Coal mining and coal power | High | Medium | Stranded asset risk; policy exit paths in many countries |
| Oil and gas | High | Medium | Demand decline scenarios; offshore assets exposed to storms |
| Steel, cement, chemicals | High | Low to medium | Hard-to-abate emissions; carbon price sensitivity |
| Automotive | Medium to high | Low | Technology transition; depends on the borrower's product mix |
| Aviation and shipping | High | Medium | Fuel costs, emissions rules, port restrictions |
| Agriculture | Medium | High | Drought, flood, heat; also methane and land-use policy |
| Real estate | Medium | Medium to high | Energy efficiency rules; flood and subsidence by location |
| Utilities (renewables) | Low | Medium | Transition beneficiary; physical exposure of infrastructure |
| Insurance | Low | High | Claims exposure |
| Technology, services | Low | Low | Indirect only |

The heat map is used to: tag every exposure with a climate risk score; set appetite (for example, "no new lending to thermal coal; high-transition-risk sectors capped at X% of the book"); prioritise which borrowers get a detailed climate assessment; and give a first-cut view of portfolio exposure for disclosure. Its limits are obvious: it is coarse, it treats every company in a sector alike, and it depends entirely on the sector codes being right, which [[22 Credit Risk Data, Systems and BCBS 239]] says they often are not.

---

## 5. Counterparty questionnaires and engagement

Beyond the sector view, banks assess individual corporate borrowers with a **climate questionnaire** or scorecard, usually completed at origination and annual review. Typical questions: does the company measure its emissions (and what are they, by scope); does it have a published transition plan with targets; how dependent is its revenue on high-carbon activities; where are its key sites and are they in hazard zones; what is its insurance cover; has it been subject to climate litigation or regulatory action. The answers feed a counterparty climate score, which can sit alongside the rating as a flag, adjust the rating via an overlay, or feed a model where data allows.

**Engagement** is the softer tool: a bank asks its larger borrowers to produce transition plans, and may make financing conditional on them, or price loans with **sustainability-linked** margins that fall if the borrower meets emissions targets and rise if it misses them. Those margin ratchets have to be captured in the loan system and tested, which is a data point many systems were not built to hold.

---

## 6. Data challenges

Climate is, at the platform level, a data problem before it is a modelling problem.

**Emissions data.** The standard framework divides a company's emissions into **Scope 1** (direct, from its own operations), **Scope 2** (from the electricity it buys) and **Scope 3** (everything else in its value chain, including the use of its products). For a bank, the emissions it finances through its loans are its own Scope 3. Problems: most small and mid-sized borrowers do not measure emissions at all; large borrowers report on different bases and with a lag of a year or more; Scope 3 is estimated and enormous; and for the unreported majority the bank must use **proxies** (sector averages scaled by revenue or assets) with a quality score attached. The industry standard for financed emissions accounting prescribes data quality tiers from reported and verified down to sector-average estimates, and disclosures must show the mix.

**Geolocation of collateral.** Physical risk is about *where*. A bank needs the latitude and longitude, or at least a precise address or postcode, of every property, factory, farm and site it lends against, so it can overlay flood maps, wildfire maps, sea-level projections and heat maps. Many collateral systems hold an address as free text, or hold the borrower's head-office address rather than the site, or hold nothing for movable assets. Geocoding the collateral book is usually a large data-cleansing project.

**Hazard data.** Flood, storm, drought and wildfire projections come from public bodies, insurers and specialist vendors, at different resolutions and under different scenario assumptions. They must be versioned and their scenario basis recorded.

**Sector and activity codes.** Transition risk analysis needs finer classification than most banks hold: "utilities" is useless when the question is coal versus wind. Many banks have had to add a climate-relevant activity code alongside the standard industry code.

**Scenario data.** Carbon price paths, energy mix paths and macro-economic variables per scenario, from the shared central bank scenarios, loaded into the stress engine.

| Data need | Typical source | Typical gap | Quality flag needed |
|---|---|---|---|
| Borrower emissions by scope | Borrower reports, vendor databases, proxies | Missing for most small borrowers | Reported, estimated, proxy |
| Transition plans and targets | Questionnaires, borrower reports | Unstructured, inconsistent | Verified or self-declared |
| Collateral location | Collateral system, geocoding | Free-text addresses, missing for sites | Geocoded precision level |
| Hazard maps and projections | Public bodies, vendors | Resolution and scenario differences | Vendor, version, scenario |
| Climate-relevant activity codes | Internal classification | Too coarse | Mapping confidence |
| Scenario pathways | Central bank scenario network | Updated annually | Version |

---

## 7. Environmental, social and governance scoring and its limits

**ESG** stands for environmental, social and governance. ESG scoring tries to summarise a company's performance on all three: environmental (emissions, pollution, resource use), social (labour practices, human rights in the supply chain, product safety, community impact) and governance (board quality, shareholder rights, transparency, corruption). Scores come from external rating providers or from the bank's own scorecard.

Banks use ESG scores for several things: as a screen (no lending to companies below a threshold or involved in excluded activities such as controversial weapons), as an input to the credit assessment (poor governance has long been a credit risk indicator), as a flag for reputational risk, and for disclosure.

The limits are well documented and a credit officer should know them:

- **External ESG ratings disagree with each other far more than credit ratings do.** Different providers weight different things, use different data, and the same company can score well with one and poorly with another.
- **They measure different things.** Some measure the company's impact on the world; others measure the world's impact on the company's value. These are not the same and are often confused.
- **Size bias.** Large companies with sustainability departments score better simply because they report more.
- **Weak link to default.** The evidence that an ESG score predicts credit default, after controlling for the financial ratios the bank already uses, is mixed. Governance has the strongest link; environmental and social less so, except where they coincide with the climate drivers above.
- **Backward-looking.** Scores reflect disclosures from one or two years ago.

The sensible position: use ESG information as part of the qualitative assessment, use governance findings directly in the rating, treat climate specifically through the channels in section 2 rather than through a blended ESG score, and never let an external ESG score substitute for the bank's own credit analysis.

---

## 8. Greenwashing risk

**Greenwashing** is claiming to be greener than you are. It creates credit risk and other risk for a bank in several ways:

- **A borrower greenwashes.** A company's transition plan is marketing, its emissions data is wrong, and the bank's climate assessment, built on that data, is wrong too. The sustainability-linked margin ratchet is met on paper and the bank has underpriced a high-carbon borrower.
- **The bank greenwashes.** The bank labels a loan or a bond "green" or "sustainable" without the criteria being met, or reports financed emissions that later turn out to be understated. Regulators in several countries have taken enforcement action against financial firms for misleading sustainability claims, and the reputational and legal cost is real.
- **The product greenwashes.** A "green mortgage" discount applied to homes that do not meet the efficiency standard claimed.

Defences: evidence behind every green label (the certificate, the energy rating, the verified emissions report) stored with the facility; independent verification for larger claims; clear internal criteria aligned to a published taxonomy; and treatment of a borrower's climate data with the same scepticism as its financial statements, including checking it against external sources where possible. From the platform's side, this means the green tag on a facility is a governed data element with lineage to its evidence, not a tick box.

---

## 9. Other emerging risks, briefly

Climate gets the most attention, but the same "no history, must assess anyway" logic applies to several other risks.

**Cyber risk affecting borrowers.** A ransomware attack can halt a company's operations for weeks, drain its cash, and trigger regulatory fines and customer loss. For a bank, this is a PD driver that no financial ratio captures. Some banks now include cyber resilience questions in corporate credit assessment, particularly for sectors dependent on digital operations, and treat a significant cyber incident at a borrower as an early-warning trigger in [[15 Monitoring, Early Warning and Watchlist]]. The bank's own cyber risk is operational risk, outside this note, but a breach of the credit platform's data is both.

**Geopolitical and sanctions risk.** War, trade disputes and sanctions can cut a borrower off from markets, suppliers or payment systems overnight. Sanctions are a particular problem for credit because they can make it illegal to receive repayment from, or enforce security against, a sanctioned borrower, which converts a performing loan into a frozen one. Sanctions screening of counterparties is a compliance control, but its outputs (a borrower, its owners or its country becoming sanctioned) must feed the credit watchlist and country limits in [[26 Sovereign, Bank and Country Risk]] immediately. Recent years have shown how fast a whole country's exposure can become unrecoverable.

**Non-bank lenders and private credit.** An increasing share of corporate and leveraged lending ([[07 Leveraged and Acquisition Finance]]) is done by funds rather than banks. Banks are exposed indirectly: they lend to the funds, they provide fund-level leverage, they share borrowers with the funds, and they do not see the funds' underwriting standards. Supervisors have flagged this as a source of hidden leverage and interconnection, and banks are being asked to aggregate their exposures to the non-bank sector and understand what sits behind them.

**Crypto exposures.** Direct lending against crypto-assets, exposure to crypto-asset businesses, and exposure to counterparties whose balance sheets contain crypto. The Basel Committee has set a prudential standard that treats unbacked crypto-assets punitively (effectively full capital deduction, with tight limits), so direct bank exposure is small, but indirect exposure through borrowers and clients is harder to see and is a counterparty due diligence question.

**Pandemic-style shocks.** The pandemic of 2020 demonstrated that an entire sector (hospitality, travel, physical retail) can lose all revenue in a week through no fault of any borrower, that government support can suppress defaults for years and then withdraw, and that behaviour under moratoria breaks payment-history models. The lessons: sector concentration matters more than individual credit quality in a systemic shock; expected credit loss models need scenario overlays for events outside their history; and the operational ability to re-assess an entire portfolio in weeks (not the annual review cycle) is a capability worth building.

| Emerging risk | Main channel into credit | First practical step |
|---|---|---|
| Cyber at borrowers | PD via operational disruption | Cyber questions in corporate assessment; incident as early-warning trigger |
| Geopolitical and sanctions | Frozen or unrecoverable exposure; country risk | Sanctions feed into watchlist and country limits in real time |
| Non-bank lenders | Indirect exposure, hidden leverage | Aggregate exposure to the non-bank financial sector and look through |
| Crypto | Counterparty and collateral value | Identify and limit; due diligence on client crypto activity |
| Pandemic-style | Sector-wide revenue stop; model breakage | Sector concentration limits; rapid portfolio re-assessment playbook; ECL overlays |

---

## 10. How a credit team builds capability

Nobody starts with a climate-adjusted PD model. A realistic path, which matches what most banks have actually done:

![[25-climate-capability.svg]]
*A staged path from zero to embedded climate risk. Stage 1 makes the exposure visible, stage 2 measures it, stage 3 manages it. Where data is too weak to quantify, the bank stays qualitative and works on the data.*

**Stage 1, see the exposure (first six months).** Fix the sector codes and add a climate-relevant activity code. Build the heat map. Tag every exposure. Geocode the collateral book, starting with real estate. Produce the first portfolio view: exposure by climate risk bucket, by sector, by hazard zone. This is almost entirely a data exercise, which is why the platform is central from day one.

**Stage 2, measure (six to eighteen months).** Roll out the counterparty questionnaire to the largest borrowers. Acquire emissions and hazard data, with quality flags. Run the first scenario analysis, probably top-down by sector using the shared central bank scenarios, in the stress engine from [[20 Stress Testing and ICAAP]]. Compute financed emissions for disclosure, showing the data quality mix honestly.

**Stage 3, manage (eighteen months onwards).** Write climate into the risk appetite statement with sector limits and exclusions. Introduce rating overlays for high-risk borrowers, and where data supports it, climate-adjusted PD and LGD for specific portfolios (real estate is usually first because location data is best). Feed the results into pricing ([[24 Pricing, RAROC and Return on Capital]]), provisioning overlays, disclosure and regulatory stress tests. Make the climate assessment a standard section of every credit paper.

**Governance throughout.** A named senior executive, a working group across credit, risk, finance, data and the front office, board reporting from stage 1, and all new models through [[21 Model Risk Management and Validation]] with explicit acknowledgement of their limitations.

---

## 11. Common mistakes and misunderstandings

- **"Climate risk is a new risk type with its own capital charge."** It is a driver of credit, market, operational and other risks. There is no separate Pillar 1 climate charge (at the time of writing); it enters through PD, LGD, EAD, scenarios and Pillar 2.
- **"Our models already capture it because they use real data."** Historical default data contains almost no climate-driven defaults, and transition policy has no history at all. The models are silent on it, not informed about it.
- **"The sector heat map is the assessment."** It is the first filter. Two companies in the same sector can have opposite climate profiles.
- **"ESG score equals climate risk."** ESG blends many things and the providers disagree. Climate credit risk needs its own channels.
- **"Physical risk is decades away."** Acute events are happening now, and insurers repricing or withdrawing cover changes collateral values immediately.
- **"Transition risk only hits fossil fuel companies."** It hits their customers, their suppliers, their lenders, the regions that depend on them, and any building or vehicle that falls below a new standard.
- **"Thirty-year scenarios are too uncertain to be useful."** They are not forecasts. They are tools for finding which parts of the book are sensitive, which is useful even if every scenario is wrong.
- **"Green lending is lower risk."** Sometimes. A renewable project is still project finance with construction and offtake risk ([[06 Specialised Finance - Project, Object, Commodities, Real Estate]]), and a green label does not change the loan-to-value.
- **"Emissions proxies are good enough for decisions."** They are good enough for a first portfolio view and for disclosure with quality flags. They are not good enough to adjust an individual borrower's rating.

---

## 12. What a platform lead needs to know about this

**This is a data acquisition and integration programme.** The credit team's climate work depends on data the bank does not hold today: emissions, geolocation, hazard overlays, activity codes, transition plans, scenario pathways, taxonomy tags. Your job is to source it, quality-flag it, version it, link it to the counterparty and collateral masters, and make it available to the rating process, the stress engine and the reporting layer.

**Extend the data model before building anything else.** New fields on counterparty (climate score, emissions by scope with quality flag, transition plan status, activity code), on collateral (coordinates, hazard scores by peril and scenario, energy rating), on facility (green or sustainability tag with evidence reference, sustainability-linked margin terms), and on the reference data (heat map, taxonomy, scenario versions). Each needs an owner and quality rules, as in [[22 Credit Risk Data, Systems and BCBS 239]].

**Geocode the collateral book.** It is the single highest-value climate data project and it also improves ordinary collateral management. Expect a large cleansing effort for free-text addresses.

**Quality flags are first-class data.** Because so much climate data is estimated or proxied, every value should carry a quality tier that flows through to models and disclosures. Regulators and auditors will ask what share of the reported financed emissions is based on reported versus proxied data.

**Version external data and scenarios.** Hazard maps, emissions databases and scenario pathways are updated regularly and the updates change results. Reproducibility of a disclosure or stress result requires knowing which vintage was used.

**Prepare the stress engine for long horizons and new variables.** Thirty-year projections with carbon price and sector-level paths are a different workload from a three-year macro stress; this may need a separate calculation path.

**Watch the sanctions and cyber feeds.** The compliance screening outputs and the bank's threat intelligence should reach the credit watchlist and country limit processes automatically, not through a monthly email.

**Who owns what.**

| Thing | Owner | Platform role |
|---|---|---|
| Climate risk framework and appetite | Chief risk officer with a named climate executive | Data and reporting to support it |
| Sector heat map and activity codes | Credit risk with sustainability team | Hold as governed reference data; apply tags |
| Counterparty questionnaire and scores | Credit analysts | Capture structured data in origination and review systems |
| Emissions and hazard data | Sustainability and risk data teams | Source, integrate, quality-flag, version |
| Collateral geolocation | Collateral operations | Geocode, maintain, overlay hazards |
| Climate scenarios and stress | Stress testing team | Engine capability and scenario data |
| Climate disclosure (TCFD-style, Pillar 3) | Finance and sustainability | Reporting layer with climate dimensions and evidence |
| Green and sustainability tags | Product and sustainability with credit | Governed facility-level data with evidence lineage |
| Sanctions and cyber intelligence feeds into credit | Compliance and information security | Integrate into watchlist and limits |

---

## 13. Related notes

- [[06 Specialised Finance - Project, Object, Commodities, Real Estate]]: renewable project finance and real estate, where climate shows up first.
- [[09 Credit Analysis - Reading a Borrower]] and [[10 Internal Ratings, Scorecards and PD Models]]: where climate overlays enter the rating.
- [[11 Collateral and Security]]: collateral location and value under physical risk.
- [[14 Risk Appetite, Limits and Concentration]]: sector limits and exclusions.
- [[15 Monitoring, Early Warning and Watchlist]]: cyber incidents and sanctions as triggers.
- [[20 Stress Testing and ICAAP]]: climate scenarios and long-horizon stress.
- [[21 Model Risk Management and Validation]]: governance of new, data-poor models.
- [[22 Credit Risk Data, Systems and BCBS 239]]: the data foundations this note depends on.
- [[23 Reporting - Regulatory Returns, Pillar 3 and Management Information]]: climate disclosure templates.
- [[26 Sovereign, Bank and Country Risk]]: geopolitical and sanctions risk at the country level.
- [[27 A Platform Lead's First 90 Days]] and [[28 Master Glossary]].
- [[basel-credit-risk-explained-simply]] and [[basel-credit-risk-decision-tree]]: the capital framework climate drivers feed into.
