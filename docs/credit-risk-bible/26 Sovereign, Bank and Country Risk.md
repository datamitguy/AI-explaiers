# Sovereign, Bank and Country Risk

**Why this matters to you.** Most notes in this vault are about lending to people and companies. This one is about the counterparties underneath everyone else: governments, other banks, and whole countries. A government can print its own money but can still default; another bank is both your competitor and a counterparty you lend to every day; a perfectly healthy company can fail to repay you because its government has forbidden it from buying dollars. These exposures are large, short-dated and fast-moving, and they are added up in an unusual way (by *country of risk*, not by where the borrower happens to be registered). For a platform lead, this means separate rating models and capital rules, a country field that must be right on every exposure, guarantee and collateral data that can move an exposure from one country to another, and limits checked intraday.

---

## Table of contents

1. [Governments can and do default](#1-governments-can-and-do-default)
2. [Local currency versus foreign currency debt](#2-local-currency-versus-foreign-currency-debt)
3. [Sovereigns in the capital rules and the zero risk weight debate](#3-sovereigns-in-the-capital-rules-and-the-zero-risk-weight-debate)
4. [Country risk, sovereign risk and transfer risk](#4-country-risk-sovereign-risk-and-transfer-risk)
5. [Country ratings and country limits](#5-country-ratings-and-country-limits)
6. [Political risk insurance and export credit agencies](#6-political-risk-insurance-and-export-credit-agencies)
7. [Why banks lend to each other](#7-why-banks-lend-to-each-other)
8. [How Basel treats exposures to banks](#8-how-basel-treats-exposures-to-banks)
9. [Bank ratings, resolution and bail-in](#9-bank-ratings-resolution-and-bail-in)
10. [Public sector entities and multilateral development banks](#10-public-sector-entities-and-multilateral-development-banks)
11. [Analysing a bank: the CAMELS lens](#11-analysing-a-bank-the-camels-lens)
12. [Setting limits for banks and countries](#12-setting-limits-for-banks-and-countries)
13. [Country exposure aggregation: data and systems](#13-country-exposure-aggregation-data-and-systems)
14. [Common mistakes and misunderstandings](#14-common-mistakes-and-misunderstandings)
15. [What a platform lead needs to know about this](#15-what-a-platform-lead-needs-to-know-about-this)
16. [Related notes](#16-related-notes)

---

## 1. Governments can and do default

Imagine the school borrows money from its pupils to fix the roof, promising to repay next term. It feels like the safest borrower imaginable. But if the school runs out of money, there is no headteacher above it to force it to pay and no bailiff who can seize the gym. It can simply announce that it will repay half, later. That is a **sovereign**: a government borrowing in its own name. **Sovereign risk** is the risk that a government does not pay its debts in full and on time.

The common intuition that governments do not default is wrong. Defaults and restructurings have happened in every century and on every continent. Some episodes, described generally:

| Episode | What happened | Lesson for lenders |
|---|---|---|
| Latin American debt crisis (1980s) | Governments that had borrowed heavily in dollars from international banks could not pay when United States interest rates rose and commodity prices fell. Mexico's 1982 announcement started a decade of restructurings, ending with loans swapped into new bonds at a loss. | Foreign currency debt plus rising global rates is dangerous. Large banks were nearly wiped out by loans treated as safe. |
| Russia (1998) | The government defaulted on its own local currency treasury bills and imposed a moratorium on certain foreign payments by Russian banks and companies as the rouble collapsed. | Even local currency debt can be defaulted on, and a sovereign crisis instantly becomes a transfer risk event for private borrowers. |
| Argentina (2001 and later) | A very large bond default, frozen bank deposits, a broken dollar peg, restructurings in 2005 and 2010, years of litigation with holdout creditors, and another restructuring in 2020. | Recovery can take a decade, some sovereigns default repeatedly, and legal enforcement is very hard. |
| Greece (2012) | The largest sovereign debt restructuring on record at the time. Private bondholders swapped into new bonds worth well under half of the old ones in present-value terms. Capital controls followed in 2015. | A rich-country government that cannot print its own currency can default, and its banks suffer with it. |

Why it differs from lending to a company:

- **No bankruptcy court.** There is no international insolvency process for governments. Restructuring is a negotiation, sometimes alongside the International Monetary Fund (IMF), and creditors mostly accept what is offered.
- **Willingness as well as ability.** Paying may be politically unbearable, so sovereign analysis includes politics.
- **Negotiated recovery.** Loss given default (LGD), from [[02 What Credit Risk Is]], comes from negotiation, not collateral, and has ranged from small haircuts to most of the value.
- **Contagion.** A defaulting government's banks usually nearly fail (they hold its bonds) and its companies lose access to foreign currency: one event hits every exposure in the country, which is why country risk is its own discipline (section 4).

---

## 2. Local currency versus foreign currency debt

If you owe your sister ten tokens of a currency that *you* print in your bedroom, you can always pay: you print ten more. The tokens may become worthless if you print too many, but you never fail to hand them over. If you owe her ten real pounds, you must earn or borrow them, and if you cannot, you default.

**Local currency debt** is borrowed in the country's own currency. A government with its own central bank can, in the last resort, create the money to repay, so the risk changes shape into **inflation and devaluation risk**: the lender is paid in full, in money that buys less. Outright default is rarer but happens (Russia 1998), usually when a government chooses default over the political cost of printing.

**Foreign currency debt** is borrowed in a currency the government does not control, usually dollars or euros. To repay, the country must earn it through exports, attract it through investment, or borrow more. Most historical sovereign defaults have been on foreign currency debt.

A worked example. The fictional country Zandia owes the equivalent of 100 billion zand: half in zand, half in dollars (5 billion dollars at 10 zand to the dollar). A crisis halves the zand to 20 per dollar. The zand debt is still 50 billion zand, but the dollar debt now costs 100 billion zand to repay. Total debt in local terms jumps from 100 billion to 150 billion zand overnight with no new borrowing, while tax revenue still arrives in zand. This is why agencies often rate a country's local currency debt higher than its foreign currency debt.

Countries using a currency they do not issue (euro area members, dollarised countries) are a special case: their "local" debt behaves like foreign currency debt, as Greece showed.

| Feature | Local currency debt | Foreign currency debt |
|---|---|---|
| Can the government print it? | Yes, in the last resort | No |
| Main risk to lender | Inflation, devaluation | Default and restructuring |
| Effect of currency crash | Repaid in weaker money | Debt burden jumps |

---

## 3. Sovereigns in the capital rules and the zero risk weight debate

Under the Basel standardised approach (explained in [[basel-credit-risk-explained-simply]] and [[18 Regulatory Capital and Basel - the Short Version]]), exposures to sovereigns and their central banks are risk-weighted by external rating. The illustrative shape:

| Sovereign rating | AAA to AA- | A+ to A- | BBB+ to BBB- | BB+ to B- | Below B- | Unrated |
|---|---|---|---|---|---|---|
| Risk weight | 0% | 20% | 50% | 100% | 150% | 100% |

The Basel text also allows supervisors to use country risk scores published by export credit agencies instead of agency ratings. Check which your jurisdiction uses.

The key national discretion: supervisors may allow a **lower risk weight, typically 0%, for a bank's exposures to its own sovereign and central bank, denominated and funded in the domestic currency**. Many jurisdictions apply it.

A worked example. A bank holds 1 billion of its own government's local currency bonds and 200 million of dollar bonds issued by a foreign government rated BBB.

- Own government at 0%: risk-weighted assets (RWA) = 0, capital = 0.
- Foreign government at 50%: RWA = 100 million. At an illustrative 10% capital requirement, capital = 10 million.

The domestic holding, five times larger, attracts no credit risk capital at all.

**The debate.** Supporters argue government bonds are the safest local asset, banks need them for liquidity, and a government that can print its currency should not default on it. Critics point to the European sovereign debt crisis of 2010 to 2012: banks loaded up on "free" home government bonds, the government weakened, the banks weakened with it, and supporting the banks weakened the government further. This feedback is the **sovereign-bank doom loop**. The Basel Committee consulted on changes (concentration limits, positive risk weights) but, at the time of writing, did not reach consensus to change the standard. Sovereigns are also largely exempt from large exposure limits.

Under the internal ratings-based (IRB) approach in [[10 Internal Ratings, Scorecards and PD Models]], banks model sovereign probability of default (PD) themselves. With so few defaults, these are usually expert scorecards calibrated to agency studies, and often challenged in [[21 Model Risk Management and Validation]].

Whatever the capital rule says, a well-run bank still rates, limits and stresses every sovereign ([[20 Stress Testing and ICAAP]]).

---

## 4. Country risk, sovereign risk and transfer risk

**Sovereign risk** is the risk of lending to the government itself. **Country risk** is wider: the risk that something happening at the level of a country causes losses on *any* exposure there, including to perfectly sound companies and banks. Its components:

- **Transfer and convertibility risk.** The borrower has local currency and is willing to pay, but the government will not let it convert into dollars (convertibility) or send them abroad (transfer), usually through **capital controls** in a crisis.
- **Political risk.** Expropriation, nationalisation, war, civil unrest, sanctions, or the government cancelling contracts (contract repudiation).
- **Macroeconomic risk.** A recession, banking collapse or currency crash that raises PD for everyone at once.
- **Legal risk.** Weak creditor rights, raising LGD everywhere.

The analogy for transfer risk. You lend pocket money to an honest friend at another school who has the money to repay. But their headteacher has a rule: no money leaves the school during term. You lose nothing on your friend's character and everything on the school's rules.

A banking example. A bank lends 10 million dollars to a well-run Zandian exporter. Zandia hits a balance of payments crisis and rations access to dollars. The exporter has plenty of zand but cannot pay, so the loan defaults: not credit risk in the ordinary sense, but transfer risk. It must be provisioned under [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]] and perhaps restructured under [[16 Problem Loans, Restructuring and Recovery]], even if it is eventually repaid in full when controls lift.

![[26-country-risk-types.svg]]
*How a cross-border exposure breaks down: lending to the government is sovereign risk (local and foreign currency debt behaving differently), while lending to a private borrower carries its own credit risk plus transfer, convertibility and political risk. Mitigants reduce the country component, and everything rolls up into a country limit on an ultimate risk basis.*

### The sovereign ceiling

If a government can stop any company in the country paying foreign currency debt, a private borrower is unlikely to be a better foreign currency risk than its government. This is the **sovereign ceiling**: a company's or bank's foreign currency rating is capped at the sovereign rating. Agencies have softened it into a **country ceiling** that can sit above the sovereign, because defaulting governments do not always impose controls and some companies are protected (export revenue paid offshore, a strong foreign parent, assets abroad). Bank ratings stay tightly tied to their sovereign, because banks hold its bonds, depend on its central bank, and would need its support.

| Term | What can go wrong | Main mitigant |
|---|---|---|
| Sovereign risk | Government does not pay its own debt | Limits, diversification, rating |
| Transfer and convertibility risk | Borrower cannot buy or send foreign currency | Offshore accounts, political risk insurance, local lending funded locally |
| Political risk | Expropriation, war, contract repudiation, sanctions | Political risk insurance, export credit agency cover |
| Macroeconomic risk | PDs rise across the country | Country limits, stress testing |

---

## 5. Country ratings and country limits

### Internal country ratings

Every bank with cross-border business assigns an **internal country rating**, usually on the same master scale as counterparty ratings. Often there are two: a **sovereign rating** (will the government pay) and a **transfer and convertibility rating** or country ceiling (will private borrowers be allowed to pay in foreign currency). A small country risk team in the second line produces them, and a committee approves them as in [[13 Credit Governance - Committees, Authorities and the Three Lines]].

| Factor family | Examples |
|---|---|
| Economic strength | GDP (gross domestic product) per head, growth, diversification |
| Government finances | Debt to GDP, deficit, interest cost to revenue, share of debt in foreign currency |
| External position | Current account, foreign currency reserves, external debt, commodity dependence |
| Monetary and financial system | Inflation record, central bank independence, banking system health |
| Institutions and politics | Rule of law, stability, corruption, default history, sanctions |

Agency ratings are an input, not a substitute, and the rating must move with events, not wait for annual review.

### Country limits

A **country limit** caps total exposure to a country across all counterparties, products and booking entities, because a hundred loans to a hundred Zandian companies are not diversified against a Zandian crisis. It is part of the concentration framework in [[14 Risk Appetite, Limits and Concentration]]. Sizing typically starts from the country rating, is scaled by the bank's capital and business need, and is split into **sub-limits** by tenor (short trade runs off quickly in a crisis), product and counterparty type.

A worked example. Tier 1 capital is 5 billion. An illustrative policy:

| Country grade | Maximum limit as % of Tier 1 | Maximum tenor |
|---|---|---|
| 1 to 3 | Monitored, no fixed cap | Any |
| 4 to 5 | 20% | 10 years |
| 6 to 7 | 8% | 5 years |
| 8 to 9 | 3% | 2 years |
| 10 and below | Trade only, case by case | 1 year |

Zandia is grade 7: maximum 8% x 5 billion = 400 million. The committee approves 250 million: 150 million trade up to one year, 100 million term lending up to five years, of which no more than 50 million to the government. Six months later Zandia falls to grade 8, and the maximum becomes 3% x 5 billion = 150 million. The bank is in excess, stops new business, and lets trade run off until it fits.

Many banks add a traffic light: green, amber (no increases), red (run-off), black (frozen, for example by sanctions, see [[25 Climate, ESG and Emerging Credit Risks]]).

---

## 6. Political risk insurance and export credit agencies

You can sometimes pay someone else to carry country risk.

**Political risk insurance (PRI)** pays if a loan is not repaid because of a defined political event: transfer restrictions, expropriation, political violence, sometimes non-payment by a government. It does not cover ordinary commercial default, usually covers a percentage (say 90%), has waiting periods, and has conditions the bank must meet.

**Export credit agencies (ECAs)** are government-backed bodies that support their own exporters by guaranteeing loans to foreign buyers. If a German manufacturer sells turbines to a Zandian power company, the German ECA may guarantee 95% of the financing loan against both political and commercial risk. The guaranteed part becomes, for the lender, an exposure to the ECA and its government. See [[06 Specialised Finance - Project, Object, Commodities, Real Estate]] and [[08 Trade Finance and Guarantees]].

**Multilateral development bank (MDB) participation** is a softer mitigant: governments rarely block payments on loans where an MDB is lender of record.

A worked example. A bank lends 50 million to a Zandian company. Uncovered, it all counts against the Zandia limit at a 100% corporate risk weight (RWA 50 million). With a 95% guarantee from an ECA backed by a AAA government:

| Portion | Amount | Country of risk | Illustrative risk weight | RWA |
|---|---|---|---|---|
| ECA-guaranteed | 47.5 million | The ECA's country | 0% | 0 |
| Uncovered | 2.5 million | Zandia | 100% | 2.5 million |

Zandia usage and RWA both fall by 95%, provided the guarantee meets the eligibility rules in [[11 Collateral and Security]] and is linked to the facility in the data (section 13). Private PRI often gives only internal limit relief, not capital relief.

---

## 7. Why banks lend to each other

On a hot Saturday the lemonade stand by the park runs out of cups while the one by the library has too many. The library stand lends cups until Monday; next week it may be the other way round. Neither needs a huge stockpile. Banks do the same with cash: some take in more deposits than they lend, others the reverse, and the **interbank market** moves the surplus. A bank that cannot deal with other banks cannot function.

| Exposure | What it is | Typical tenor |
|---|---|---|
| Interbank deposits and money market placements | Lending surplus cash to another bank, unsecured | Overnight to 12 months, mostly under 3 months |
| Repurchase agreements (repo) | Lending cash against bonds as collateral | Overnight to months |
| Nostro accounts | "Ours with you": our account at a foreign bank in its currency, used for payments | Permanent, balance changes daily |
| Correspondent banking | Accounts and payments for a bank with no direct access to a currency | Ongoing |
| Trade finance confirmations | Adding our guarantee to a foreign bank's letter of credit | Usually under 1 year |
| Foreign exchange (FX) settlement | Paying one currency before receiving the other | Same day to a few days |
| Derivatives | Swaps and options with other banks, see [[19 Counterparty Credit Risk and Derivatives]] | Months to decades |

Three that are often missed:

- **Nostro balances are credit exposure.** If our yen correspondent fails, we are an unsecured creditor for the balance. Operations own these accounts, so they often escape the credit limit.
- **Confirmations carry bank and country risk.** Confirming a Zandian bank's letter of credit is exposure to that bank and to Zandia ([[08 Trade Finance and Guarantees]]).
- **FX settlement risk** is named after Herstatt, a German bank closed mid-day in 1974 after counterparties had paid it but before they were paid back. Simultaneous settlement systems reduce it; the rest is controlled by **settlement limits**.

Since 2008 the market has shifted towards secured repo and central bank deposits, but nostro, settlement and trade exposures are unavoidable.

---

## 8. How Basel treats exposures to banks

The revised Basel standardised approach uses one of two methods. Two terms first: **CET1** (Common Equity Tier 1) is the highest-quality capital, and the **leverage ratio** is capital divided by total unweighted exposure (both in [[18 Regulatory Capital and Basel - the Short Version]]).

### External credit risk assessment approach (ECRA)

Where external ratings may be used, a rated bank's risk weight comes from its rating, with lower weights for short-term exposures (original maturity of three months or less, and some short-term trade). Illustrative shape:

| Bank rating | AAA to AA- | A+ to A- | BBB+ to BBB- | BB+ to B- | Below B- |
|---|---|---|---|---|---|
| Base risk weight | 20% | 30% | 50% | 100% | 150% |
| Short-term | 20% | 20% | 20% | 50% | 150% |

The rating must not include **implicit government support**, except for public banks. This follows directly from bail-in (section 9).

### Standardised credit risk assessment approach (SCRA)

Where ratings may not be used (the United States restricts reliance on them in regulation) or the bank is unrated, the lending bank grades the counterparty itself:

| Grade | In plain words | Illustrative criteria | Base risk weight | Short-term |
|---|---|---|---|---|
| A | Strong in any reasonable conditions | Meets all published minimum requirements and buffers | 40% (30% if CET1 at least 14% and leverage ratio at least 5%) | 20% |
| B | Some vulnerability | Meets minimums but not all buffers, or has known weaknesses | 75% | 50% |
| C | Material default risk | Fails minimums, or auditor doubts it is a going concern | 150% | 150% |

A **sovereign floor** broadly stops a foreign bank's SCRA risk weight going below its home sovereign's for exposures not in the bank's local currency, with exceptions for short-term trade: the sovereign ceiling written into capital rules. Exact conditions are in your local text and in [[basel-credit-risk-decision-tree]].

A worked example. We place 100 million for six months with Bank North (Grade A, CET1 15%, leverage 5.5%) and 100 million for one month with Bank South (Grade B).

- North: not short-term, Grade A with high capital, 30%. RWA 30 million.
- South: short-term, Grade B, 50%. RWA 50 million. Rolled into six months, 75% and RWA 75 million.

Every grade needs evidence: counterparties' capital ratios from their Pillar 3 disclosures ([[23 Reporting - Regulatory Returns, Pillar 3 and Management Information]]), collected and stored.

**Under IRB**, the final Basel III reforms restrict exposures to banks and other financial institutions to the **foundation** approach (own PD, supervisory LGD), because there are too few bank defaults to model LGD. A PD floor applies, and large financial institutions get a higher correlation in the formula because banks tend to fail together.

---

## 9. Bank ratings, resolution and bail-in

**Before 2008.** A bank's rating was its standalone strength plus several notches of uplift for expected government rescue. In 2008 governments did rescue them, with taxpayers' money.

**After 2008.** Governments resolved that taxpayers should not pay again. Countries passed **resolution regimes**: a resolution authority can take control of a failing bank and impose losses on its creditors. The central tool is **bail-in**: writing down debt or converting it into shares to recapitalise the bank from inside. Bail-out is the government's money; bail-in is the creditors'.

The analogy. A lemonade stand runs out of money. The council used to pay everyone; now it says lenders' IOUs will be cut or swapped for a share of the stand, which keeps trading. Lending to the stand is suddenly less safe than lending to the council.

Simplified creditor hierarchy (the exact order varies by country):

| Loses first to last | Instrument |
|---|---|
| 1 | Equity (CET1) |
| 2 | Additional Tier 1 |
| 3 | Tier 2 subordinated debt |
| 4 | Senior non-preferred debt, or senior debt of the holding company |
| 5 | Senior preferred operating company debt, large corporate deposits |
| Protected or excluded | Insured deposits, secured liabilities, very short-term interbank liabilities in some regimes |

Large banks must hold minimum bail-in-able debt: TLAC (total loss-absorbing capacity) for the largest global banks and, in the European Union, MREL (minimum requirement for own funds and eligible liabilities).

A worked example. A bank has 100 of assets funded by 6 equity, 2 Additional Tier 1, 4 Tier 2, 8 senior bail-in-able bonds and 80 of protected liabilities. It loses 15. Before: the government injects capital and bondholders lose nothing. Now: equity, Additional Tier 1 and Tier 2 (12 in total) are wiped out, and senior bonds absorb the remaining 3, a 37.5% loss. The authority may then convert more senior debt into equity to recapitalise the bank.

So agencies removed most support uplift from bank ratings in major jurisdictions, and senior bank bonds became genuinely risky. **Which instrument** matters (an overnight deposit and a Tier 2 bond of the same bank have very different LGDs), **which entity** matters (holding company bonds absorb losses first), and support still matters for state-owned banks and in many emerging markets.

---

## 10. Public sector entities and multilateral development banks

**Public sector entities (PSEs)** are government-owned or controlled bodies that are not the central government: regions, cities, agencies, some non-commercial enterprises. Supervisors choose whether to treat a PSE like a bank or, where it has revenue-raising powers and arrangements making it as safe as the state, like the sovereign. State-owned commercial companies are corporates.

**Multilateral development banks** are owned by groups of governments to lend for development (the World Bank group and the large regional development banks). Basel lists qualifying MDBs that get a **0% risk weight** for very high credit quality and strong shareholder backing; others are weighted by rating on a favourable scale. MDBs also enjoy **preferred creditor status** in practice: countries tend to keep paying them even when defaulting on others.

| Counterparty type | Typical standardised treatment (illustrative) | Country of risk |
|---|---|---|
| Own sovereign, local currency | Often 0% | Home country |
| Other sovereign or central bank | By rating, 0% to 150% | That country |
| PSE with tax-raising powers | As sovereign or as bank, supervisor's choice | That country |
| Commercial state-owned company | Corporate | That country |
| Qualifying listed MDB | 0% | Supranational code |
| Bank | ECRA or SCRA | Incorporation, unless risk transferred |

Data trap: MDBs need a supranational bucket, or they are counted against their headquarters country.

---

## 11. Analysing a bank: the CAMELS lens

A bank is unlike a company ([[09 Credit Analysis - Reading a Borrower]]): it is leveraged by design (equity often well under 10% of assets), and its biggest danger is funding running faster than assets can be sold. The standard framework, borrowed from the United States supervisory rating system, is **CAMELS**.

| Letter | Stands for | Question | Indicators |
|---|---|---|---|
| C | Capital | How big is the cushion? | CET1 ratio, leverage ratio, headroom over requirements and buffers |
| A | Asset quality | How good are its loans? | Non-performing loan (NPL) ratio, provision coverage, concentrations |
| M | Management | Is it run sensibly and honestly? | Strategy, governance, regulatory sanctions |
| E | Earnings | Can it absorb losses and grow capital? | Return on equity (ROE), cost-to-income, stability |
| L | Liquidity | Can it survive a funding run? | Liquidity coverage ratio (LCR), net stable funding ratio (NSFR), wholesale reliance |
| S | Sensitivity | How hard would a market move hit it? | Interest rate and FX risk, holdings of its own sovereign's bonds |

The LCR asks whether liquid assets cover a 30-day stress; the NSFR asks whether long-term assets have stable funding. Both should be at least 100%. Analysts add **support** (parent or state, after bail-in) and **operating environment** (country rating and ceiling).

### Worked example: two banks

| Measure | Bank North | Bank South |
|---|---|---|
| Home country grade | 3 (strong) | 7 (weak) |
| CET1 ratio (requirement plus buffers 10.5%) | 15.0% | 11.5% |
| Leverage ratio | 5.5% | 4.0% |
| NPL ratio | 1.8% | 9.5% |
| Provision coverage of NPLs | 65% | 40% |
| Home sovereign bonds as % of CET1 | 120% | 380% |
| ROE | 10% | 14% |
| LCR / NSFR | 160% / 125% | 115% / 103% |
| Wholesale funding share | 15% | 35% |
| Management | Stable, clean record | New chief executive, regulatory fine |

Reading it:

- **Capital and asset quality.** South has one point of headroom against North's four and a half, and its NPLs are badly under-provisioned. Raising coverage to 65% costs roughly 25% x 9.5% = 2.4% of loans. On loans of 45 billion that is about 1.1 billion, against CET1 of about 3 billion (11.5% of around 26 billion RWA). CET1 would fall to about 7%, below requirement. Reported capital flatters it.
- **Earnings.** South's higher ROE comes from riskier lending and thin provisioning, a warning sign.
- **Liquidity and sensitivity.** South barely passes while leaning on wholesale money, and a home sovereign restructuring would wipe it out.

Outcome: North is internal grade 4 and SCRA Grade A, with a 12-month unsecured limit. South is grade 8 (capped by its sovereign and pulled down by asset quality) and SCRA Grade B on watch for C, with short trade confirmations and overnight or repo only.

---

## 12. Setting limits for banks and countries

![[26-bank-limit-setting.svg]]
*From limit request to approved bank limit: CAMELS analysis feeds an internal rating and SCRA grade, the sovereign ceiling is checked, size comes from a rating grid and is split into product and tenor sub-limits, then cut to fit the country limit and the large exposure rule.*

A bank limit (a financial institution, or FI, line) follows [[14 Risk Appetite, Limits and Concentration]] with a few special features.

**Size from a rating grid**, as a percentage of our capital, capped by a percentage of the counterparty's capital. Illustrative:

| Internal grade | Max % of our Tier 1 | Max % of counterparty equity | Max unsecured tenor |
|---|---|---|---|
| 1 to 3 | 8% | 15% | 5 years |
| 4 | 5% | 10% | 3 years |
| 5 to 6 | 2% | 5% | 1 year |
| 7 to 8 | 0.5% | 2% | 6 months |
| 9 and below | Secured or trade only | | 3 months |

**Sub-limits** for money market, nostro, FX settlement, derivatives (measured as potential future exposure, PFE), trade and bonds, each measured differently and often fed by different systems.

**Large exposures.** Under the Basel framework, exposure to one counterparty or connected group must not exceed 25% of Tier 1 (15% between the largest global systemically important banks); intraday interbank exposures are excluded.

**Country fit.** Every bank limit also uses its home country limit.

A worked example. Our Tier 1 is 5 billion. Bank North (grade 4, equity 6 billion): the lower of 5% x 5 billion = 250 million and 10% x 6 billion = 600 million, so 250 million. A request for 200 million across five sub-limits is approved. Bank South (grade 8, equity 4 billion): the lower of 25 million and 80 million, so 25 million. The business asks for 60 million of confirmations, but the Zandia country limit (150 million after downgrade) has only 20 million headroom. Approved: 20 million, trade only, six months maximum, with ECA or insurance cover suggested for the rest so it moves off Zandia.

**Monitoring.** Bank credit can deteriorate in days. Spreads, share prices, rating actions and deposit outflow news feed [[15 Monitoring, Early Warning and Watchlist]], and treasury may cut placements to overnight within hours, which needs a live view across products.

---

## 13. Country exposure aggregation: data and systems

"How much do we have in Zandia?" is one of the hardest numbers a credit platform produces.

### Which country?

| Attribute | Meaning |
|---|---|
| Country of incorporation | Where the counterparty is legally registered |
| Country of residence or operations | Where it is based and does business |
| Booking location | Where our facility is booked |
| Country of risk | Where the ultimate source of repayment, guarantor or collateral is |

For country risk, **country of risk** is what matters. Banks that confuse it with incorporation show large exposures to small offshore centres where holding companies keep a brass plate.

### Immediate borrower basis versus ultimate risk basis

**Immediate borrower basis** counts each exposure against the direct borrower's country. **Ultimate risk basis** reallocates it to whoever ultimately bears the risk, after **risk transfers**: guarantees (to the guarantor's country), collateral (to the country of the cash or securities issuer), branches (a branch is not a separate legal entity, so to the head office), and insurance or ECA cover (to the insurer's country). Supervisors often expect limits managed on an ultimate risk basis with both bases reported.

![[26-ultimate-risk-reallocation.svg]]
*How 120m booked to borrowers located in Zandia becomes only 40m of Zandia country risk once guarantees, collateral and branch structures are taken into account. Transfer risk on the branch placement is still watched, because local controls can trap money in the branch.*

| Facility | Risk transfer | Ultimate country | Amount |
|---|---|---|---|
| L1 Zandia Cement | None | Zandia | 40m |
| L2 Zandia Motors | Guarantee from Nordland parent | Nordland | 35m |
| L3 Zandia Foods | Cash deposit held in Westland | Westland | 25m |
| L4 Zandia branch of a Nordland bank | Head office liable | Nordland | 20m |

Immediate basis: Zandia 120 million against a 150 million limit. Ultimate basis: 40 million. Policy must say which drives the limit, and the ultimate number is only trustworthy if guarantees and collateral are eligible, linked and current: a lapsed Nordland guarantee left in the system understates Zandia by 35 million.

Two subtleties. **Partial transfers**: a 60% guarantee moves only 60%, and collateral only its post-haircut value. **Transfer risk can survive the move**: capital controls could trap L4's money in the branch, so some banks keep a separate transfer risk measure that still counts it against Zandia.

### What the data model needs

| Data element | Common problem |
|---|---|
| Incorporation, residence and risk country on every counterparty | Only incorporation captured; country of risk defaulted to it |
| Group hierarchy and ultimate parent | Missing or stale links |
| Guarantees and insurance linked to facilities, with guarantor country and coverage % | Held as a document, not a linked record |
| Collateral location (issuer or custodian country) | Missing for securities in custody |
| Branch versus subsidiary flag | Branches treated as separate counterparties |
| Sovereign, PSE, MDB, bank classification | Differs from the classification used in capital |
| Country ratings and limits | A spreadsheet maintained by one person |

The aggregation follows [[22 Credit Risk Data, Systems and BCBS 239]]: every exposure from every system, one counterparty and country hierarchy, reconciled to the ledger.

---

## 14. Common mistakes and misunderstandings

- **"Governments do not default."** They do, regularly, mostly on foreign currency debt, and occasionally rich ones too.
- **"A 0% risk weight means zero risk."** It means zero capital under a national discretion. Rate, limit and stress the exposure anyway.
- **"Country risk is sovereign risk."** Country risk includes transfer, political and macro risk on private borrowers who may be in excellent health.
- **"A strong company in a weak country is a strong credit."** For foreign currency lending, transfer risk may cap it.
- **"Senior bank bonds are as safe as deposits."** Since resolution regimes, they can be bailed in; ranking and issuing entity matter.
- **"Country of incorporation is the country of risk."** For offshore holding companies, vehicles and branches, often not.
- **"Ultimate risk basis is lower, so always use it."** Only if the guarantees and collateral are eligible, linked and current.

---

## 15. What a platform lead needs to know about this

**The country dimension is core data.** Every counterparty needs incorporation, residence and risk country held separately, with governed derivation rules for country of risk. Every facility needs linked guarantees, insurance and collateral, each with country and coverage, so ultimate risk is computed, not estimated.

**Two bases, one engine.** Produce immediate and ultimate views from the same data, with an audit trail of each transfer.

**Classification drives capital.** Sovereign, central bank, PSE, MDB, bank or corporate sets the risk weight and the large exposure treatment. Capital, limits and reporting must use the same classification; mismatches are a common audit finding.

**SCRA grades need evidence.** Capital ratios, buffer requirements and auditor opinions for each counterparty bank, captured as structured data from public disclosures and refreshed at least annually and on news.

**Treasury and operations exposures must reach credit.** Money market, repo, nostro, settlement and confirmations often live in systems never connected to limits.

**Limits must be near real time.** Pre-deal checks, intraday utilisation, and instant actions: suspend a bank, move a country to run-off, freeze a sanctioned country.

**Country ratings and limits belong in a governed system** with history and approvals, not a spreadsheet, and market data should feed the watchlist automatically.

| Thing | Owner | Platform role |
|---|---|---|
| Country ratings and country risk policy | Country risk team, approved by committee | Governed reference data with history |
| Country limits | Country risk committee | Limits engine with tenor and product sub-limits, both bases |
| Bank ratings and SCRA grades | FI credit analysts | Structured CAMELS inputs and grade evidence |
| Bank limits | FI credit with treasury, trade and markets | Pre-deal checks, intraday aggregation across products |
| Counterparty classification | Credit risk and regulatory reporting jointly | One classification for capital, limits and reporting |
| Guarantees, ECA cover, PRI | Credit operations and collateral management | Linked records with coverage and guarantor country |
| Nostro and settlement exposure | Operations and treasury | Daily or intraday feed into limits |
| Sanctions-driven country freezes | Compliance with country risk | Immediate limit action and alerting |

---

## 16. Related notes

- [[01 What a Bank Is and How It Makes Money]]: why banks lend to each other.
- [[02 What Credit Risk Is]]: PD, LGD and exposure applied to sovereigns and banks.
- [[08 Trade Finance and Guarantees]]: confirmations and ECA-backed trade.
- [[09 Credit Analysis - Reading a Borrower]]: the corporate analysis CAMELS adapts.
- [[10 Internal Ratings, Scorecards and PD Models]]: sovereign and bank rating models.
- [[11 Collateral and Security]]: guarantee eligibility and risk transfer.
- [[14 Risk Appetite, Limits and Concentration]]: country limits, bank limits and large exposures.
- [[15 Monitoring, Early Warning and Watchlist]]: market signals for banks and sovereigns.
- [[18 Regulatory Capital and Basel - the Short Version]]: risk weights for sovereigns, banks, PSEs and MDBs.
- [[19 Counterparty Credit Risk and Derivatives]]: derivative exposure to banks.
- [[20 Stress Testing and ICAAP]]: sovereign and country stress.
- [[22 Credit Risk Data, Systems and BCBS 239]]: aggregation by country and counterparty hierarchy.
- [[23 Reporting - Regulatory Returns, Pillar 3 and Management Information]]: country exposure reporting and Pillar 3.
- [[25 Climate, ESG and Emerging Credit Risks]]: geopolitical and sanctions risk.
- [[27 A Platform Lead's First 90 Days]] and [[28 Master Glossary]].
- [[basel-credit-risk-explained-simply]] and [[basel-credit-risk-decision-tree]]: the capital framework behind these exposure classes.
