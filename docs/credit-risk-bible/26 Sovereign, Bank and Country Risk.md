# Sovereign, Bank and Country Risk

**Why this matters to you.** Most of this vault is about lending to companies and people. This note is about the two kinds of borrower that are supposed to be the safest in the system and occasionally are not: governments and other banks. Governments default more often than most people think, and when they do, every company and bank in that country goes down with them. Banks lend to each other every day in enormous amounts, through channels most outsiders never see, and the failure of one bank can cascade through those channels to others. Measuring these exposures needs a different lens from corporate credit: country ratings, sovereign ceilings, transfer risk, bail-in rules, and a way of adding up exposure by *where the risk really sits* rather than where the borrower happens to be registered. That last piece, country exposure aggregation on an ultimate risk basis, is one of the hardest data problems in credit risk and one the regulator will ask about the moment a country gets into trouble.

---

## Table of contents

1. [What sovereign risk is](#1-what-sovereign-risk-is)
2. [Local currency versus foreign currency debt](#2-local-currency-versus-foreign-currency-debt)
3. [The 0% risk weight and the debate about it](#3-the-0-risk-weight-and-the-debate-about-it)
4. [Country risk, sovereign risk, and transfer and convertibility risk](#4-country-risk-sovereign-risk-and-transfer-and-convertibility-risk)
5. [Country limits and country ratings](#5-country-limits-and-country-ratings)
6. [Political risk insurance and export credit agencies](#6-political-risk-insurance-and-export-credit-agencies)
7. [Bank counterparty risk: why banks lend to each other](#7-bank-counterparty-risk-why-banks-lend-to-each-other)
8. [Bank ratings, the SCRA grades and the bail-in regime](#8-bank-ratings-the-scra-grades-and-the-bail-in-regime)
9. [Public sector entities and multilateral development banks](#9-public-sector-entities-and-multilateral-development-banks)
10. [Financial institution analysis: the CAMELS lens](#10-financial-institution-analysis-the-camels-lens)
11. [How a bank sets limits for other banks and countries](#11-how-a-bank-sets-limits-for-other-banks-and-countries)
12. [Data and systems for country exposure aggregation](#12-data-and-systems-for-country-exposure-aggregation)
13. [Common mistakes and misunderstandings](#13-common-mistakes-and-misunderstandings)
14. [What a platform lead needs to know about this](#14-what-a-platform-lead-needs-to-know-about-this)
15. [Related notes](#15-related-notes)

---

## 1. What sovereign risk is

In the lemonade stand world, imagine the headteacher borrows 100 coins from the pupils to build a new playground, promising to pay back from next year's school fees. The headteacher cannot be taken to court by a pupil. If the fees do not come in, or the headteacher decides the money is better spent on something else, the pupils simply do not get paid, and there is nobody above the headteacher to complain to.

A **sovereign** is a national government, and **sovereign risk** is the risk that it does not repay its debt. What makes it different from corporate credit risk is that a government cannot be put into bankruptcy. There is no court that can seize its assets and no receiver who can sell them. When a sovereign defaults, creditors negotiate a **restructuring** (less money, later, or both) with no legal power to force anything, only the government's wish to regain access to borrowing.

Governments do default. Over the last two centuries, dozens of countries have defaulted on external debt, some repeatedly. In living memory: a large Latin American economy in the early 2000s in one of the biggest defaults on record, with creditors eventually receiving around a third of face value; a euro-area country in 2012, where private creditors took a loss of more than half; several emerging and frontier markets after 2020, when the pandemic, commodity shocks and rising dollar interest rates combined. The pattern is usually the same: heavy borrowing in a currency the government does not control, a shock that cuts export earnings or raises borrowing costs, reserves running down, and then a choice between default and economic collapse.

Why a government defaults, the **ability and willingness** lens:

| Ability to pay | Willingness to pay |
|---|---|
| Size of debt relative to the economy (debt to gross domestic product) | Political cost of austerity versus political cost of default |
| Share of debt in foreign currency | History of past defaults |
| Foreign currency reserves versus upcoming payments | Strength of institutions and rule of law |
| Export earnings and current account | Relationship with international lenders of last resort |
| Growth, inflation, tax base | Who the creditors are (domestic voters versus foreign funds) |

---

## 2. Local currency versus foreign currency debt

This is the single most important distinction in sovereign risk.

If the headteacher borrowed in school tokens that the school itself prints, it can always pay: print more tokens. The pupils get paid in full, though each token buys less at the tuck shop. That is **local currency debt**: a government that controls its own currency can always, in the end, create the money to repay. The risk to lenders is not default but **inflation** and **devaluation**, which are market risks rather than credit risks. (Governments that have given up their own currency, as in a monetary union, lose this escape route, which is why a euro-area sovereign could default on euro debt in a way the United States cannot default on dollar debt.)

If the headteacher borrowed in real coins that only the bank in town can issue, it must earn or borrow those coins to repay. That is **foreign currency debt**, usually dollars or euros. The government must earn them through exports, attract them through investment, or borrow them again. If it cannot, it defaults. Nearly every sovereign default in history has been on foreign currency debt or on debt owed to foreigners.

Consequences for a bank:

- Rating agencies and internal rating systems give most sovereigns **two ratings**, local currency and foreign currency, with the foreign currency rating usually lower.
- Under the Basel standardised approach, a bank may apply a preferential risk weight to its home sovereign's local currency debt funded in that currency, which is where the famous 0% comes from, discussed next.
- A loan in dollars to a company in a country that may run out of dollars carries a risk that has nothing to do with the company. That is transfer risk, in section 4.

---

## 3. The 0% risk weight and the debate about it

Under the standardised approach in [[18 Regulatory Capital and Basel - the Short Version]], sovereigns are risk-weighted by their external rating: 0% for the highest grades, rising to 150% for the weakest, and 100% for unrated. In addition, national regulators may allow banks to apply a lower weight, in practice 0%, to exposures to their own government and central bank in local currency, funded in local currency, regardless of rating. Most do. Under the IRB approach, sovereigns are exempt from the PD floor that applies to other classes, so a bank's own model can also produce a near-zero capital requirement.

The result is that banks across the world hold very large amounts of their own government's bonds with little or no capital against them. The arguments for and against:

| For a 0% weight | Against |
|---|---|
| A government that prints its currency cannot be forced to default in that currency | Governments in currency unions have defaulted on their own-currency debt |
| Government bonds are the safest, most liquid asset banks can hold for liquidity rules | Zero risk weight encourages banks to load up on sovereign debt, especially of weak sovereigns, because it earns yield with no capital cost |
| Making banks hold capital against their own government would raise government borrowing costs and could destabilise the sovereign in a crisis | The **sovereign-bank doom loop**: a weak sovereign weakens the banks that hold its bonds, which then need rescue from the sovereign, which weakens it further. This nearly broke the euro area in 2010 to 2012 |
| Risk weights are meant for credit risk; sovereign local currency risk is mostly inflation risk, which is captured elsewhere | A rating-based or debt-level-based weight would be more honest and would reward prudent governments |

The Basel Committee reviewed the treatment and, at the time of writing, has not changed the core rules, mainly because members could not agree. Some national regulators have introduced concentration limits or Pillar 2 add-ons for large sovereign holdings. Expect this debate to continue, and expect any bank's internal view of sovereign risk to be more conservative than the regulatory risk weight suggests.

---

## 4. Country risk, sovereign risk, and transfer and convertibility risk

These three terms overlap and are often confused.

![[26-country-risk-types.svg]]
*How sovereign risk, country risk on private borrowers, and transfer and convertibility risk relate, and where the mitigants and the country limit sit.*

**Sovereign risk** is the narrow one: will the government repay its own debt.

**Country risk** is the wide one: the risk of loss on *any* exposure in a country caused by events in that country, whatever the borrower. It includes sovereign risk, plus political risk (expropriation, war, civil unrest, repudiation of contracts, currency controls), plus the macro-economic risk that a national crisis drags down every borrower, plus the legal risk that the courts will not enforce the bank's rights.

**Transfer and convertibility risk** is the specific and most important part of country risk for a lender to private borrowers. Imagine a well-run manufacturer in a country that is running out of dollars. The manufacturer has plenty of local currency and is happy to pay its dollar loan. But the central bank has imposed **capital controls**: nobody may buy dollars (a **convertibility** restriction) or send money abroad (a **transfer** restriction). The company is solvent, willing, and unable to pay. The bank's loan is in default through no fault of the borrower. This happened to lenders in several countries in the 2010s and 2020s.

Consequences:

- A private borrower's foreign currency rating is normally **capped** at the sovereign's foreign currency rating, the **sovereign ceiling**, because the company cannot be more able to get dollars than its own country. Exceptions exist for companies with large offshore earnings and offshore accounts.
- Banks hold **transfer risk provisions** or treat transfer risk as a separate risk type with its own limits, and some regulators require specific provisions on exposures to countries with payment difficulties.
- The mitigants in section 6 (political risk insurance, export credit agency cover, offshore collection accounts, structures where repayment is collected outside the country from export receipts) exist mainly to deal with this risk.

---

## 5. Country limits and country ratings

Just as a bank limits its exposure to any single borrower, it limits its exposure to any single country. A **country limit** is the maximum total exposure the bank will accept to all borrowers in a country, usually split by tenor (short-term trade exposure is less risky than ten-year loans) and by type (sovereign, bank, corporate).

The limit is set from a **country rating**, which the bank produces itself from a country risk model, informed by external agency ratings, international body assessments, and its own economists. The model scores things like: debt levels and structure, reserves cover of imports and short-term debt, current account balance, growth and inflation, banking system strength, political stability, institutional quality, and track record. The rating maps to a grade which maps to a maximum limit, scaled by the bank's capital and its strategic interest in the country.

| Country grade (illustrative) | Typical characteristics | Limit style |
|---|---|---|
| 1 to 2 | Highly rated, own currency, deep markets | Large limit, mostly a monitoring tool |
| 3 to 4 | Investment grade, some external vulnerability | Capped limit, tenor sub-limits |
| 5 to 6 | Sub-investment grade, meaningful transfer risk | Tight limit, short tenors, mitigants expected |
| 7 and below | Distressed or in default | No new exposure; run-off and recovery only |

A country risk committee reviews ratings and limits at least annually and immediately on events (a coup, a currency crisis, sanctions). Country limits feed the limits system described in [[14 Risk Appetite, Limits and Concentration]] and are checked at the moment of every new booking.

---

## 6. Political risk insurance and export credit agencies

Two institutions exist to make lending into risky countries possible.

**Political risk insurance** (PRI) is bought from specialist insurers (private insurers and a multilateral insurer attached to the World Bank group). It pays out if the loss is caused by defined political events: expropriation, war and civil disturbance, currency inconvertibility and transfer restriction, and breach of contract by a government. It does not cover ordinary commercial default. For capital purposes, an insured exposure may be treated as guaranteed by the insurer, substituting the insurer's risk weight for the covered portion, subject to the usual legal certainty conditions in [[basel-credit-risk-explained-simply]].

**Export credit agencies** (ECAs) are government bodies (or private agencies acting for governments) that support their country's exporters. When a company in country A exports machinery to a buyer in country B, A's export credit agency may guarantee or insure the loan the buyer takes to pay for it, covering both commercial and political risk, typically for 85% to 95% of the amount (varies by agency and deal). The guaranteed portion carries the sovereign risk weight of country A, which is often 0%. ECA-backed finance is a large part of long-term lending to emerging markets, especially for infrastructure, aircraft and ships, and connects to [[06 Specialised Finance - Project, Object, Commodities, Real Estate]] and [[08 Trade Finance and Guarantees]].

| Mitigant | Covers | Does not cover | Capital effect |
|---|---|---|---|
| Political risk insurance | Expropriation, war, inconvertibility, government breach | Commercial default | Insurer's risk weight on covered portion |
| Export credit agency guarantee | Commercial and political default on an export loan | Uncovered percentage; policy exclusions | Agency's sovereign risk weight on covered portion |
| Multilateral development bank umbrella (preferred creditor status, co-lending) | Transfer risk in practice, because governments prioritise multilateral lenders | Not a legal guarantee | Usually none directly; reduces internal transfer risk assessment |
| Offshore collection accounts | Transfer risk on export receipts | Commercial default | May support a rating above the sovereign ceiling |

---

## 7. Bank counterparty risk: why banks lend to each other

Banks are each other's biggest counterparties, through channels most people never see.

**Interbank lending.** Every day some banks have surplus cash and others are short. They lend to each other overnight or for a few weeks in the **money market**. Before 2008 this was huge and unsecured; since then it is smaller and mostly secured (repos, described in [[19 Counterparty Credit Risk and Derivatives]]), but unsecured interbank exposure still exists.

**Nostro accounts.** "Nostro" is Italian for "ours." A nostro account is an account a bank holds at another bank, usually in that bank's currency, to make and receive payments in that currency. A British bank's dollar nostro is at a United States bank. The balance in that account is an unsecured deposit with the other bank: if that bank fails, the money is at risk. Large banks hold nostro balances in dozens of currencies at dozens of banks.

**Correspondent banking.** The wider relationship in which one bank provides payment, clearing, trade and foreign exchange services to another, especially across borders. The correspondent takes on exposure to the respondent bank through intraday overdrafts, trade confirmations and settlement.

**Trade finance.** When a bank confirms a letter of credit issued by a bank in another country ([[08 Trade Finance and Guarantees]]), it takes on the issuing bank's credit risk.

**Derivatives and settlement.** Foreign exchange and interest rate derivatives between banks, and the settlement risk at the moment of exchange, both covered in [[19 Counterparty Credit Risk and Derivatives]].

**Securities.** Banks hold each other's bonds, including the loss-absorbing bonds described in section 8.

The reason this matters so much is **contagion**. In 2008, the failure of one investment bank froze the interbank market because nobody knew who was exposed to whom. Interconnection is why the Basel large exposures rule has a tighter limit (15% of Tier 1) between global systemically important banks, and why supervisors require banks to be able to report their exposure to any other bank within hours.

---

## 8. Bank ratings, the SCRA grades and the bail-in regime

**External ratings.** Rating agencies rate banks on their standalone strength and then on the likelihood of support from their government or parent. Before 2008 the support assumption lifted most large bank ratings by several notches, because everyone assumed governments would rescue banks. Under the Basel standardised approach, rated banks get a risk weight from their rating.

**The SCRA grades.** For unrated banks (most banks in the world), the standardised approach uses the **standardised credit risk assessment approach** (SCRA), explained in [[basel-credit-risk-explained-simply]] section 11: grade A if the bank comfortably meets its own regulatory minimums and buffers (40% risk weight, or 30% if very strong), grade B if it meets minimums but not buffers (75%), grade C if it does not meet minimums or has a qualified audit (150%). Assigning the grade requires the lending bank to obtain and assess the counterparty bank's published capital ratios, which is itself a data task.

**Bail-in.** After 2008, taxpayers had rescued banks at enormous cost and governments resolved that next time, the bank's own creditors would pay. **Resolution regimes** introduced in the European Union, the United Kingdom, the United States and elsewhere give authorities the power, when a bank fails, to **bail in** its creditors: write down their claims or convert them to shares, in a set order, to absorb losses and recapitalise the bank without public money. To make this work, large banks must issue a minimum amount of bail-in-able debt, known in Europe as **MREL** (minimum requirement for own funds and eligible liabilities) and globally for the largest banks as **TLAC** (total loss-absorbing capacity).

The plain-words consequence: **since roughly 2014, when these regimes came into force, lending to a bank or holding its bonds became riskier**, because the implicit government guarantee was removed. A senior bond that would once have been rescued can now be written down. Rating agencies reduced or removed the support uplift. Banks reassessed their limits on other banks accordingly. Depositors below the insured threshold are protected; large corporate deposits, nostro balances and bonds are not.

| Instrument (from safest to riskiest in a bail-in) | Position in the order | Typical investor |
|---|---|---|
| Insured deposits | Protected, outside the bail-in | Retail |
| Secured liabilities (covered bonds, repos) | Protected by collateral | Banks, funds |
| Uninsured deposits and ordinary senior debt (varies by regime; some rank deposits above senior bonds) | Bailed in after the layers below | Corporates, banks (nostros), funds |
| Senior non-preferred or holding company senior debt | Designed to be bailed in before ordinary senior | Institutional investors |
| Tier 2 subordinated debt | Bailed in before senior | Institutional investors |
| Additional Tier 1 (contingent convertible) | Converted or written down first | Specialist funds |
| Shares | Wiped out first | Shareholders |

A 2023 case in which a large bank's additional Tier 1 bonds were written to zero while shareholders received something (an outcome specific to that country's rules) reminded the market that the order is not identical everywhere and that the documents matter.

---

## 9. Public sector entities and multilateral development banks

**Public sector entities** (PSEs) are regional and local governments and government-owned bodies that are not the sovereign itself: a state or province, a city, a public hospital trust, a state-owned utility. Under the standardised approach they are treated either like their sovereign or like banks, depending on how much taxing power and government backing they have, and national regulators decide which. The credit question is always **how real is the sovereign support**: a province with its own tax base is one thing; a loss-making state company with an informal promise is another. Several high-profile defaults have been municipal or state-owned entities whose government declined to step in.

**Multilateral development banks** (MDBs) are international institutions owned by many governments that lend for development: the World Bank group, regional development banks, and others. The strongest get a 0% risk weight under the standardised approach because of their capital, their shareholders and their **preferred creditor status**: governments in difficulty repay multilateral lenders before anyone else, because losing access to them is catastrophic. For a commercial bank, lending alongside an MDB (co-financing, or participating in an MDB-arranged loan under its umbrella) borrows some of that protection in practice, and is a common way to lend into risky countries.

---

## 10. Financial institution analysis: the CAMELS lens

Analysing a bank is different from analysing a company, because a bank's "product" is risk and its balance sheet is mostly other people's money. The standard framework, used by supervisors and by credit analysts, is **CAMELS**, an acronym for the six things to look at.

![[26-bank-limit-setting.svg]]
*How a bank sets a limit on another bank: CAMELS analysis produces a rating, the sovereign ceiling is checked, the limit is sized and split by product and tenor, and the country and concentration headroom are confirmed.*

| Letter | Area | Questions | Key ratios (illustrative good values vary by market) |
|---|---|---|---|
| C | Capital | How big is the cushion, and what quality? Is it above minimums and buffers with room to spare? | CET1 ratio (see [[18 Regulatory Capital and Basel - the Short Version]]), total capital ratio, leverage ratio, headroom over requirements |
| A | Asset quality | How bad is the loan book and how well is it covered? Concentrations? | Non-performing loan ratio, provision coverage, loan growth (fast growth is a warning), sector and single-name concentrations, share of stage 2 loans |
| M | Management | Is strategy coherent, governance sound, risk management credible? Regulatory history? | Qualitative: fines, enforcement actions, management turnover, audit qualifications |
| E | Earnings | Does it make money sustainably, or from one-off and volatile sources? | Return on equity, return on assets, net interest margin, cost-to-income ratio, cost of risk |
| L | Liquidity | Can it meet outflows? How reliant is it on flighty wholesale funding? | Liquidity coverage ratio, net stable funding ratio, loan-to-deposit ratio, share of wholesale funding, central bank eligible collateral |
| S | Sensitivity to market risk | How exposed is it to rate and price moves, and to its own sovereign? | Interest rate risk measures, trading book size, sovereign bond holdings relative to capital |

Two bank-specific points. First, a bank's rating is almost always **capped by its sovereign**, because a sovereign crisis takes down the banking system (the doom loop again). Second, bank failures are usually **fast and liquidity-driven**: a bank can report strong capital and fail within days when depositors run, as happened in 2023 to several mid-sized banks. Liquidity and funding structure therefore get more weight in bank analysis than in corporate analysis, and limits on banks are reviewed on news, not just annually.

---

## 11. How a bank sets limits for other banks and countries

Putting the pieces together, a typical process:

1. **Analyse** the counterparty bank through the CAMELS lens using its published accounts, regulatory disclosures ([[23 Reporting - Regulatory Returns, Pillar 3 and Management Information]] from its side), external ratings and market signals (bond spreads, credit default swap prices, share price).
2. **Rate** it on the internal financial institution rating scale; derive the SCRA grade for capital purposes.
3. **Apply the sovereign ceiling** from the country rating.
4. **Size** the overall limit from a grid that maps the rating to a maximum, scaled by the lending bank's own capital (so that no single bank exposure approaches the large exposure limit) and by the counterparty's size (a limit should not be a large share of the counterparty's capital either).
5. **Split** the limit into product and tenor sub-limits: money market placements (short, unsecured, high risk per unit), foreign exchange settlement (large, intraday, mitigated by payment-versus-payment systems), derivatives (measured as potential future exposure under [[19 Counterparty Credit Risk and Derivatives]]), trade finance confirmations (short, self-liquidating), nostro balances (continuous, unsecured), and securities holdings.
6. **Check headroom** against the country limit and the large exposures rule.
7. **Approve** at the appropriate authority ([[13 Credit Governance - Committees, Authorities and the Three Lines]]), load into the limits system, and set the review date.
8. **Monitor** continuously: rating actions, results announcements, spread widening, regulatory news, and sovereign events, with the ability to cut a limit within hours.

A worked illustration. A bank with Tier 1 capital of 10 billion considers a limit on a foreign bank rated internally at grade 3 (roughly single-A equivalent), in a country rated grade 2. The rating grid caps grade 3 banks at 2.5% of Tier 1, so 250 million overall. The country limit for that country has 400 million of headroom, so no constraint. The limit is split: 80 million money market up to 3 months, 100 million foreign exchange settlement (all through a payment-versus-payment system), 40 million derivatives potential future exposure, 20 million trade confirmations up to 180 days, 10 million nostro. Total 250 million. The large exposures rule allows up to 25% of Tier 1, or 2.5 billion, so there is no regulatory constraint; the internal grid is far tighter, as it should be.

---

## 12. Data and systems for country exposure aggregation

This is where the note becomes a platform problem, and it is a hard one.

**The question.** "What is our total exposure to country X?" sounds simple. It is not, because of three choices.

**Immediate borrower basis versus ultimate risk basis.** On the **immediate borrower** basis, exposure is assigned to the country where the direct counterparty is located. On the **ultimate risk** basis, exposure is assigned to the country where the risk *finally* sits after taking account of guarantees, collateral and parent support. A loan to the French subsidiary of a Brazilian company is France on the immediate basis and (if the parent guarantees it, or the subsidiary depends on the parent) Brazil on the ultimate basis. A loan to a Brazilian company guaranteed by a United States bank is Brazil on the immediate basis and the United States on the ultimate basis. Regulators and the Bank for International Settlements statistics require both views, and the ultimate risk view is the one that matters in a crisis.

**Risk transfer.** The movement of exposure from the immediate country to the ultimate country is called **risk transfer**, and the aggregation must record both the **outward** transfers (exposure in country X that is really someone else's risk) and the **inward** transfers (exposure elsewhere that is really country X's risk). The net of the two is the adjustment between the two views. Every guarantee, every eligible collateral item, and every parent relationship generates a transfer record.

**What counts as exposure.** Loans and bonds, obviously. Also: undrawn commitments (at full or converted amount), derivatives (at potential future exposure or replacement cost), guarantees issued, trade finance, nostro balances, securities financing, and the sovereign bonds in the treasury portfolio. Different reports use different measures, and the aggregation must be able to produce each.

**Branches and subsidiaries.** Exposure booked in the bank's own foreign branch or subsidiary in country X is local exposure, often funded locally and in local currency, with a different risk profile from cross-border exposure. Country reporting typically distinguishes **cross-border** from **local** claims.

**The data needed.**

| Data element | Source | Common problem |
|---|---|---|
| Counterparty country of incorporation and of operations | Customer master | Only one country held; branch addresses used instead of legal entity |
| Ultimate parent and its country | Hierarchy in customer master | Missing group links (see [[22 Credit Risk Data, Systems and BCBS 239]]) |
| Guarantor identity and country | Collateral and guarantee system | Guarantees held as documents, not structured data |
| Collateral location and issuer country | Collateral system | Location not captured for financial collateral |
| Booking entity and branch | Core banking | Branch coding inconsistent across systems |
| Exposure by product at the right measure | All product systems, warehouse | Derivatives and trade exposure on different measures |
| Country rating, limit and sanctions status | Country risk system, compliance | Not linked to the same country code list |

**The crisis test.** When a country gets into trouble, the supervisor's first call asks for total exposure on both bases, split by sovereign, bank, corporate and retail, by cross-border and local, by tenor, with mitigants, by tomorrow. BCBS 239 Principle 5 (timeliness) was written with precisely this in mind. A bank whose answer requires three teams and two days of spreadsheets has a documented gap.

---

## 13. Common mistakes and misunderstandings

- **"Governments do not default."** They do, regularly, on foreign currency debt, and in currency unions on local currency debt too.
- **"0% risk weight means zero risk."** It means zero *regulatory capital*. The bank's internal view, limits and stress tests must treat sovereign risk honestly.
- **"A good company in a bad country is a good loan."** Only if it can get hard currency out. Transfer and convertibility risk is independent of the borrower's quality.
- **"Country risk is just the sovereign rating."** Country risk covers every borrower in the country and includes political, legal and macro channels.
- **"Lending to a bank is safe because banks are regulated."** Banks fail fast and, since bail-in, creditors pay. Limits on banks need faster review than limits on corporates.
- **"Our nostro balances are operational, not credit."** They are unsecured deposits with another bank. They are credit exposure and belong in the limit.
- **"Immediate borrower country is good enough."** It hides guarantees and parent support in both directions and gives the wrong answer in a crisis.
- **"The sovereign ceiling is absolute."** It is a strong presumption with defined exceptions for genuinely offshore cash flows.
- **"An export credit agency guarantee covers everything."** Typically 85% to 95%, with exclusions. The uncovered portion is ordinary country and borrower risk.
- **"Public sector entities are the government."** Only if the government says so in a legally binding way. Many are not.

---

## 14. What a platform lead needs to know about this

**Country exposure aggregation is the flagship BCBS 239 use case.** If you build one thing to prove the platform can aggregate risk fast and flexibly, build the country exposure view on both bases with risk transfer, across all products, all entities and all measures, re-runnable for any date. It exercises every data domain in [[22 Credit Risk Data, Systems and BCBS 239]].

**Country is not one field.** A counterparty needs country of incorporation, country of main operations, country of risk (the bank's judgement), and the countries of its ultimate parent and any guarantor. Collateral needs location and issuer country. Facilities need booking entity and branch country. All of them must use one governed country code list, the same one the country rating, limit and sanctions systems use.

**Risk transfer needs structured guarantee and support data.** A guarantee held as a scanned document cannot transfer risk in a report. Guarantor identifier, guarantee amount, coverage percentage, expiry and the facilities covered must be structured fields, which is also what the capital engine needs for credit risk mitigation.

**Bank counterparty exposure is spread across every system.** Money market in treasury, foreign exchange settlement in the payments and trading systems, derivatives in the trading systems, trade in the trade finance system, nostros in the payments and accounting systems, bonds in the securities system. The limits system must see all of them against one counterparty identifier, intraday where the exposure moves intraday, with the group hierarchy so that exposure to a bank's branches and subsidiaries rolls up.

**Feeds that must be near real-time.** Sanctions designations (country and entity), country rating changes, bank rating actions, and large market moves on a bank's bonds and shares should reach the limits and watchlist processes within hours. A monthly batch is not acceptable for these.

**SCRA data.** To assign SCRA grades the bank must hold, for each counterparty bank, its published capital and buffer requirements and actuals, with dates and sources. This is a small but awkward reference data set that needs an owner and a refresh process.

**Who owns what.**

| Thing | Owner | Platform role |
|---|---|---|
| Country ratings, limits and the country risk committee | Country risk team in credit risk | Hold ratings and limits as governed data; feed the limits engine |
| Financial institution ratings and bank limits | Financial institutions credit team | Same, plus SCRA reference data |
| Counterparty country attributes and hierarchy | Customer master owner | Data model, quality rules, single country code list |
| Guarantee and support structured data | Credit operations and collateral | Capture and lineage |
| Exposure by product on the required measures | Product system owners and warehouse | Integrate; produce both bases with risk transfer |
| Country exposure regulatory returns and central bank statistics | Regulatory reporting | Generate from the aggregation; reconcile |
| Sanctions status | Compliance | Real-time feed into limits and watchlist |
| Crisis reporting playbook | Chief risk officer with risk reporting | The re-runnable, fast aggregation that makes it possible |

---

## 15. Related notes

- [[08 Trade Finance and Guarantees]]: letters of credit and bank confirmations as a source of bank exposure.
- [[13 Credit Governance - Committees, Authorities and the Three Lines]]: the country risk and financial institutions approval authorities.
- [[14 Risk Appetite, Limits and Concentration]]: country and bank limits inside the wider limit framework.
- [[18 Regulatory Capital and Basel - the Short Version]]: sovereign and bank risk weights, large exposures.
- [[19 Counterparty Credit Risk and Derivatives]]: the derivatives and settlement part of bank exposure.
- [[22 Credit Risk Data, Systems and BCBS 239]]: the aggregation capability this note depends on.
- [[23 Reporting - Regulatory Returns, Pillar 3 and Management Information]]: country exposure returns.
- [[25 Climate, ESG and Emerging Credit Risks]]: geopolitical and sanctions risk.
- [[27 A Platform Lead's First 90 Days]] and [[28 Master Glossary]].
- [[basel-credit-risk-explained-simply]] and [[basel-credit-risk-decision-tree]]: the exposure classes and the SCRA grades.
