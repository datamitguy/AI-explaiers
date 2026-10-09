# Trade Finance and Guarantees

**Why this matters to you.** Trade finance is the oldest banking business there is, and the one most people in a bank least understand. It is built on pieces of paper (now mostly electronic messages) that promise payment when other pieces of paper arrive. It has historically lost banks very little money, which is why it gets gentle treatment in the capital rules, but when it does go wrong it is usually fraud, sanctions, or both, and the fines and reputational damage can dwarf the credit loss. For a platform lead, trade finance means a separate processing system, a flood of short-lived exposures that appear and disappear within weeks, off-balance sheet items that must be converted into exposure numbers, and the heaviest screening and compliance workload in the bank.

## Table of contents

1. [Why trade needs banks](#why-trade-needs-banks)
2. [The documentary letter of credit, step by step](#the-documentary-letter-of-credit-step-by-step)
3. [UCP 600 in plain words](#ucp-600-in-plain-words)
4. [Variations: confirmed, standby, transferable and more](#variations-confirmed-standby-transferable-and-more)
5. [Documentary collections](#documentary-collections)
6. [Bank guarantees and bonds](#bank-guarantees-and-bonds)
7. [Demand versus conditional guarantees](#demand-versus-conditional-guarantees)
8. [Supply chain finance and receivables finance](#supply-chain-finance-and-receivables-finance)
9. [Export credit agencies](#export-credit-agencies)
10. [How trade finance exposures are measured](#how-trade-finance-exposures-are-measured)
11. [Why trade finance has low loss rates](#why-trade-finance-has-low-loss-rates)
12. [Fraud risk](#fraud-risk)
13. [Sanctions, dual-use goods and financial crime](#sanctions-dual-use-goods-and-financial-crime)
14. [A worked example](#a-worked-example)
15. [Common mistakes and misunderstandings](#common-mistakes-and-misunderstandings)
16. [What a platform lead needs to know about this](#what-a-platform-lead-needs-to-know-about-this)
17. [Related notes](#related-notes)

## Why trade needs banks

Imagine you want to buy a rare football sticker from a kid at a school in another town. You have never met. You do not want to post the money first, because they might keep it and send nothing. They do not want to post the sticker first, because you might keep it and send nothing. Neither of you can take the other to court over a sticker. The deal is stuck.

Now imagine both of you have a teacher you trust. You give your money to your teacher, who promises the other kid's teacher that it will be paid over as soon as the sticker is shown to be in the post with a tracking number. The other kid posts the sticker, shows their teacher the receipt, and gets paid. You get the sticker. Neither of you had to trust the other; you each trusted a teacher, and the teachers trusted each other.

That is the whole of trade finance. A buyer in one country and a seller in another cannot easily enforce a contract against each other, do not know each other's financial strength, speak different languages, use different laws, and are separated by weeks of shipping. Banks step in as the trusted middle: the buyer's bank promises to pay the seller's bank if the seller proves it has shipped. The proof is **documents**: the bill of lading (the shipping line's receipt and title document for the goods), the commercial invoice, a packing list, an insurance certificate, a certificate of origin, an inspection certificate. Banks deal in documents, never in goods.

There is also a timing problem: the seller has to buy materials and manufacture before shipping, and the buyer wants to sell the goods before paying for them. Trade finance bridges that gap with short-term lending at each end.

The products fall into two families:

| Family | What the bank does | Examples |
|---|---|---|
| Documentary trade (traditional) | Issues or handles a promise that is triggered by documents | Letters of credit, documentary collections, guarantees |
| Open account finance | Lends against invoices or receivables where the buyer and seller already trust each other | Supply chain finance, receivables finance, factoring, invoice discounting |

Most world trade (something like 80%) is now done on **open account**, meaning the seller ships and sends an invoice and trusts the buyer to pay in 30 to 90 days. Documentary trade is used where trust is lower: new relationships, riskier countries, large or bespoke orders.

## The documentary letter of credit, step by step

A **letter of credit** (LC), formally a documentary credit, is a written promise by a bank (the **issuing bank**) to pay the seller (the **beneficiary**) a stated amount, provided the seller presents the documents named in the LC, in the right form, by a deadline. The promise is independent of the sales contract: the bank pays if the documents comply, even if the buyer has changed its mind, and does not pay if they do not, even if the goods are perfect.

The five parties:

- **Applicant**: the buyer, who asks its bank to issue the LC and is obliged to reimburse the bank.
- **Issuing bank**: the buyer's bank, which issues the LC and makes the irrevocable promise to pay.
- **Advising bank**: a bank in the seller's country, usually the seller's own bank, which checks that the LC is genuine and passes it on to the seller. Advising is a service; it creates no payment obligation.
- **Confirming bank**: an advising bank that goes further and adds its own promise to pay. The seller now has a promise from a bank it knows, in its own country, and need not worry about the issuing bank or the buyer's country. Confirmation is where much of the credit risk in trade finance sits for international banks.
- **Beneficiary**: the seller.

A **nominated bank** is any bank the LC names as authorised to pay or negotiate; often the confirming bank. A **reimbursing bank** is sometimes used to hold the issuing bank's funds in the currency of the LC.

![[08-letter-of-credit-flow.svg]]
*A confirmed letter of credit from contract to collection of goods. Steps 1 to 4 set up the promise; 5 to 8 are the seller shipping and getting paid; 9 to 12 are the banks settling and the buyer collecting the goods.*

The steps, in the order they happen:

1. **Sales contract.** Buyer and seller agree the goods, price, delivery terms (usually using **Incoterms**, the standard codes such as FOB and CIF that say who pays for shipping and insurance and where risk passes), and that payment will be by confirmed irrevocable LC.
2. **Application.** The buyer applies to its bank for an LC. The bank treats this as a credit decision: if the buyer cannot reimburse, the bank will be out of pocket. It may require cash cover, a facility limit, or security. The application lists the documents that will be required.
3. **Issuance.** The issuing bank sends the LC to the advising bank, almost always as a **SWIFT MT700** message (SWIFT is the secure messaging network between banks; MT700 is the message type for issuing a documentary credit). It asks the advising bank to add its confirmation if the seller has required that.
4. **Advice and confirmation.** The advising bank checks the message is authentic, decides whether to confirm (a credit decision on the issuing bank and its country), and passes the LC to the seller.
5. **Shipment.** The seller manufactures and ships the goods.
6. **Bill of lading.** The shipping line issues the bill of lading. It is three things at once: a receipt for the goods, evidence of the contract of carriage, and a document of title (whoever holds the original can collect the goods at the destination port). This is what makes the LC work: the bank controls the goods by controlling the paper.
7. **Presentation.** The seller presents the documents to the confirming bank within the time allowed (usually 21 days after shipment and before the LC's expiry).
8. **Examination and payment.** The bank's document checkers compare every document against the LC, line by line, within five banking days. If the documents comply, the confirming bank pays (at sight) or commits to pay on a future date (a usance or deferred payment LC, giving the buyer time). If there are **discrepancies** (the invoice amount does not match, a date is wrong, a document is missing), the bank refuses and tells the seller, who can fix the documents or ask the buyer to waive the discrepancy. A surprisingly large share of first presentations (some surveys say more than half) have discrepancies.
9. **Forwarding and claim.** The confirming bank sends the documents to the issuing bank and claims reimbursement.
10. **Reimbursement.** The issuing bank, having checked the documents itself, reimburses.
11. **Release to buyer.** The issuing bank hands the documents to the buyer against payment (sight LC) or against the buyer's acceptance of a future payment date (usance LC). This is when the issuing bank's credit exposure to the buyer crystallises.
12. **Collection of goods.** The buyer presents the bill of lading to the shipping line and collects the goods.

Where is the credit risk? The issuing bank is exposed to the buyer (applicant) from issuance until reimbursed. The confirming bank is exposed to the issuing bank (and its country) from confirmation until reimbursed. Neither bank is exposed to the seller for credit, though both are exposed to the seller for fraud.

## UCP 600 in plain words

Almost every LC in the world says it is "subject to UCP 600". The **Uniform Customs and Practice for Documentary Credits**, publication 600 of the International Chamber of Commerce (ICC), issued in 2007, is a set of 39 articles that every bank follows. It is not a law; it is a rulebook that parties agree to by reference, and courts respect it. The key ideas:

- **Irrevocable.** Once issued, an LC cannot be changed or cancelled without the agreement of the beneficiary (and the confirming bank). The seller can rely on it.
- **Autonomy.** The LC is separate from the sales contract and from the goods. Banks deal with documents only. If the goods are rotten but the documents say they are fine, the bank pays. If the goods are perfect but the documents are wrong, the bank refuses. This is what makes the promise reliable: the bank does not have to judge the goods.
- **Strict compliance.** The documents must comply with the terms of the LC and with each other, on their face. "On their face" means the bank checks the words, not the truth. The ICC's companion booklet, the International Standard Banking Practice (ISBP), gives hundreds of detailed rules on what counts as a discrepancy (for example, whether a typo in an address matters; usually not).
- **Five banking days.** The bank has a maximum of five banking days after presentation to examine the documents and decide. Silence means acceptance.
- **Refusal must be formal.** If the bank refuses, it must say so once, list all discrepancies, and say what it is doing with the documents. It cannot drip-feed objections.
- **Banks are not liable** for the genuineness of documents, for delays in transmission, for the acts of other banks, or for force majeure.
- **Confirmation** is a definite undertaking of the confirming bank, in addition to that of the issuing bank.

Related ICC rulebooks you will hear about: **URC 522** for documentary collections, **URDG 758** for demand guarantees, **ISP98** for standby letters of credit, **eUCP** for electronic presentation, and **URR 725** for bank-to-bank reimbursements.

## Variations: confirmed, standby, transferable and more

| Type | What it means | When used |
|---|---|---|
| Unconfirmed | Only the issuing bank's promise | Seller trusts the issuing bank and its country |
| Confirmed | A second bank in the seller's country adds its promise | Issuing bank or its country is risky; seller wants local certainty |
| Silent confirmation | The seller's bank confirms without the issuing bank knowing | Issuing bank would be offended by a request to confirm |
| Sight | Pays as soon as compliant documents are presented | Seller wants cash immediately |
| Usance or deferred payment | Pays at a future date, e.g. 90 days after shipment | Buyer wants time to sell the goods first |
| Transferable | Beneficiary can transfer part of the LC to its own supplier | Middlemen and traders |
| Back-to-back | Beneficiary uses the first LC as security to get its bank to issue a second LC to its supplier | Traders where the first LC is not transferable |
| Revolving | Reinstates automatically after each drawing | Regular shipments under one contract |
| Red clause | Allows an advance to the seller before shipment | Seller needs pre-shipment finance; rare today |
| Standby (SBLC) | A guarantee in LC form: paid only if the buyer fails to pay or perform | Used as a guarantee, especially from US banks, which historically could not issue guarantees |

**Standby letters of credit** deserve their own paragraph. A standby is not meant to be drawn. It sits in the background as a promise that the bank will pay if the applicant fails to do something, and the beneficiary draws by presenting a simple statement of default. It is economically a demand guarantee but takes the LC legal form, usually under ISP98 rules. Standbys back everything from a trading relationship (the seller ships on open account but holds a standby in case the buyer does not pay) to lease obligations, bond issues and derivatives margin. A **financial standby** backs a payment obligation and is treated as a direct credit substitute in the capital rules; a **performance standby** backs a non-financial obligation and is treated like a performance bond.

## Documentary collections

A **documentary collection** is a cheaper, weaker cousin of the LC. The seller ships, then sends the documents through its bank (the **remitting bank**) to the buyer's bank (the **collecting bank** or **presenting bank**) with instructions: release the documents to the buyer only against payment (**documents against payment**, D/P) or against the buyer's signed acceptance of a bill of exchange promising to pay on a future date (**documents against acceptance**, D/A). The banks follow **URC 522**.

The crucial difference from an LC: **no bank promises to pay**. The banks are only messengers and custodians of the documents. If the buyer refuses to pay or accept, the seller still owns the goods (because the bill of lading has not been released), but now has a container sitting in a foreign port and a buyer who has walked away. The seller's protection is control of title, not a bank's credit. Collections are used where buyer and seller have some trust, the goods are easy to resell, and the LC fee is not worth paying.

Banks earn fees and take little credit risk on collections, unless they **discount** or **avalise** the accepted bill (add their own guarantee to the buyer's promise), at which point they are lending.

## Bank guarantees and bonds

A **bank guarantee** is a promise by a bank to pay a named beneficiary a sum of money if the bank's customer (the **principal** or **applicant**) fails to do something. Unlike an LC, it is not a payment mechanism; it is a safety net, and the bank and the customer both hope it is never called.

Playground version: you promise your friend you will mow their lawn on Saturday. They are worried you will not turn up, so your older sibling says "if they do not show, I will pay you 10 coins." Your sibling has issued a performance guarantee. You owe your sibling the 10 coins if it is ever paid.

![[08-guarantee-taxonomy.svg]]
*A taxonomy of bank guarantees and bonds. The first split is what the customer must do (pay money or do a job); the second is how the beneficiary can claim (on demand or only after proving a default).*

The main types:

| Type | Backs | Typical size | Who asks for it | Called when |
|---|---|---|---|---|
| Bid or tender bond | A bidder's promise to sign the contract and provide a performance bond if it wins | 1% to 5% of contract value | The buyer running a tender | The winning bidder refuses to sign |
| Performance bond | The contractor's promise to complete the work to specification | 5% to 20% of contract value (in some markets up to 100% for surety-type bonds) | The buyer or project owner | The contractor fails or is late |
| Advance payment guarantee | Refund of a deposit the buyer paid up front | The amount of the advance, reducing as work progresses | The buyer who paid the deposit | The contractor fails to deliver |
| Retention or warranty bond | Defects repair after completion; replaces cash retention | 5% to 10% of contract value | The buyer | Defects appear and are not fixed |
| Payment guarantee | The buyer's promise to pay for goods or services | The amount of the purchase or credit limit | The seller | The buyer does not pay |
| Financial guarantee | A loan, lease, bond or other financial obligation | The full obligation | The lender, lessor or bondholders | The borrower defaults |
| Customs, tax and court bonds | Payment of duties, taxes or court-ordered amounts | The amount at stake | Government or court | The principal fails to pay |
| Rental or lease guarantee | Rent under a lease | Several months' rent | The landlord | The tenant does not pay |

Guarantees are the main way banks support construction, engineering and export companies. A contractor building a hospital might need a bid bond to tender, a performance bond on winning, an advance payment guarantee to receive the deposit, and a retention bond at the end. A large contractor can have hundreds of bonds outstanding, totalling more than its borrowings, under a **bonding facility** with an agreed limit.

For the bank, a guarantee is a contingent exposure to the customer. If the beneficiary calls it, the bank pays and then has a loan to the customer that it never intended to make, at exactly the moment the customer is in trouble (that is why the bond was called). The credit analysis is therefore the same as for a loan, plus an assessment of how likely the bond is to be called and whether calls are likely to come in a cluster (a contractor in trouble usually has many bonds called at once).

**Surety** companies (insurers) also issue performance bonds, especially in North America. Their bonds are usually conditional and backed by a detailed assessment of the contractor; bank bonds are usually on demand.

## Demand versus conditional guarantees

This distinction decides who carries the risk of a dispute.

A **demand guarantee** (or on-demand bond, or first-demand guarantee) is paid when the beneficiary presents a written demand, usually with a statement that the principal is in breach. The bank does not check whether the breach is real. "Pay first, argue later." The international rules are **URDG 758**. The beneficiary loves this: certainty of cash. The principal hates it: an unfair call can only be recovered by suing the beneficiary afterwards, possibly in a foreign court. Banks treat a demand guarantee as very nearly a loan, because they cannot refuse a compliant demand, and courts will only stop payment in clear cases of fraud.

A **conditional guarantee** (or surety bond, or default bond) is paid only when the beneficiary proves the default, for example with an adjudication or court award, or a certificate from an independent engineer. The principal is protected against unfair calls; the beneficiary may wait years. These are used where the beneficiary is confident of the legal system, or where the guarantor is an insurer.

Between the two are guarantees with documentary conditions: "pay on demand accompanied by a copy of the engineer's certificate of non-completion." The bank still checks only documents, as under an LC.

Other points that matter in practice:

- **Expiry.** Guarantees have an expiry date, but in some countries and under some wordings they do not really expire until the original is returned or the beneficiary releases it ("open-ended" or "evergreen" guarantees). Banks and regulators dislike these, and they are a frequent source of stale exposure data.
- **Counter-guarantees.** When the beneficiary wants a guarantee from a local bank, the customer's bank issues a counter-guarantee to the local bank, which then issues the local guarantee. The customer's bank now has credit exposure to the customer and operational exposure to the local bank's behaviour.
- **Extend or pay.** Beneficiaries sometimes demand "extend the expiry or pay now", which is a polite form of calling the bond.
- **Governing law.** Which country's courts hear a dispute is important; local-law guarantees in some jurisdictions are effectively uncallable or effectively unlimited.

## Supply chain finance and receivables finance

Since most trade is now on open account, the growth areas are products that lend against invoices.

**Receivables finance** (also factoring, invoice discounting, receivables purchase). The seller has invoices owed by its customers. The bank either lends against them (invoice discounting: the seller keeps collecting) or buys them (factoring: the bank collects). The bank's credit risk is on the seller (if the invoices are fake or disputed) and on the buyers (if real invoices are not paid), depending on whether the sale is **with recourse** (the seller must make good unpaid invoices) or **without recourse** (the bank takes the buyer risk). Non-recourse purchases of receivables from strong buyers let the seller remove the invoices from its balance sheet entirely, which is popular with companies managing their reported debt. See [[11 Collateral and Security]] for receivables as security.

**Supply chain finance** (SCF, also reverse factoring, payables finance, approved payables). This starts from the buyer. A large, well-rated buyer (a supermarket chain, say) has thousands of small suppliers who would like to be paid faster. The buyer sets up a programme with a bank: once the buyer approves a supplier's invoice, the supplier can choose to be paid immediately by the bank, at a discount based on the *buyer's* credit quality (which is far cheaper than the supplier's own borrowing cost). The bank then collects the full amount from the buyer on the original due date. The credit risk is on the buyer, not the thousands of suppliers, which makes it attractive for banks and lets them lend to small businesses they would never assess individually.

SCF has two well-known controversies. First, accounting: if the buyer extends its payment terms from 30 to 120 days at the same time as introducing the programme, the "trade payable" is arguably bank debt in disguise, and accounting bodies now require more disclosure. Second, concentration: a bank running a large SCF programme has a single large exposure to the buyer, and some high-profile collapses (a supply chain finance firm in 2021, a construction company in 2018) showed that programmes can also hide the buyer's distress and, in the worst case, be used to finance invoices for goods that do not exist (see fraud below).

**Pre-shipment and post-shipment finance** are the older names for lending to an exporter before it ships (to buy materials and manufacture, often against a confirmed LC as evidence of the order) and after it ships (against the documents or the accepted bill). **Forfaiting** is buying a series of future trade payments (bills or promissory notes, usually guaranteed by the buyer's bank) without recourse to the seller.

## Export credit agencies

An **export credit agency** (ECA) is a government body or government-backed insurer that supports its country's exporters by insuring or guaranteeing the payment risk on export contracts, or by lending directly. Examples: UK Export Finance, the Export-Import Bank of the United States, Euler Hermes acting for the German government, Japan's JBIC and NEXI, and many others. Multilateral bodies such as the International Finance Corporation (part of the World Bank group) and regional development banks play a similar role.

ECAs matter to a bank for two reasons:

1. **Buyer credit.** For large capital goods (turbines, aircraft, trains) sold to buyers in riskier countries, the bank lends to the buyer over 5 to 15 years and the exporter's ECA guarantees 85% to 100% of the loan against political and commercial risk. The bank's credit risk is then largely on the ECA, which is usually the sovereign (see [[26 Sovereign, Bank and Country Risk]]). Under the capital rules, the guaranteed portion can take the ECA's or sovereign's risk weight by substitution (see [[basel-credit-risk-explained-simply]]).
2. **Short-term insurance.** ECAs and private credit insurers cover an exporter's open account receivables against buyer default. A bank financing those receivables may be named as loss payee on the policy, which improves its security.

ECA-backed lending follows an international agreement (the OECD Arrangement) that sets minimum premiums and maximum tenors so that governments do not compete by subsidising exports. ECA loans are also a major source of funding for [[06 Specialised Finance - Project, Object, Commodities, Real Estate]] deals in developing countries.

## How trade finance exposures are measured

Most trade finance products are **off-balance sheet**: the bank has made a promise but has not yet lent money. The capital rules convert each promise into an exposure using a **credit conversion factor** (CCF), as explained in [[basel-credit-risk-explained-simply]]. The main treatments under the standardised approach of the current Basel text (national versions vary; check your own):

| Product | CCF | Reasoning |
|---|---|---|
| Financial guarantee, financial standby LC, acceptance, aval | 100% | A direct credit substitute: if the customer fails, the bank pays the full amount |
| Performance bond, bid bond, warranty, advance payment guarantee, performance standby | 50% | Only paid if a specific non-financial event happens; often not called even when the customer struggles |
| Short-term self-liquidating trade LC (issuing and confirming), typically under one year, with shipment of goods | 20% | Backed by goods and documents; very short; historically very low loss |
| Documentary collection, when the bank has no payment obligation | 0% or not an exposure | The bank is a messenger |
| Unconditionally cancellable trade facility limit (undrawn) | 10% | Can in theory be withdrawn |
| Drawn trade loan, discounted bill, post-shipment finance | 100% (on-balance sheet) | It is a loan |

So a 10 million confirmed LC counts as a 2 million exposure to the issuing bank for capital purposes, and a 10 million performance bond counts as 5 million exposure to the customer. The leverage ratio uses its own, generally higher, factors (trade LCs at 20% and performance guarantees at 50% there too under the current text, but check).

For banks on the internal ratings-based approach, the CCF for trade products is set by the rulebook (not modelled), and the probability of default is that of the obligor: the applicant for an issued LC or guarantee, the issuing bank for a confirmation. Country risk matters a great deal for confirmations, because the issuing bank may be able to pay but be blocked by its central bank from sending foreign currency out; this **transfer risk** is covered in [[26 Sovereign, Bank and Country Risk]].

A practical consequence: trade exposures are short (30 to 180 days), numerous (a large bank may have hundreds of thousands open at once), and constantly rolling. Limits are set per customer and per correspondent bank and country, and utilisation moves daily.

## Why trade finance has low loss rates

The ICC has collected default and loss data from dozens of banks for over a decade in its Trade Register. The consistent finding is that documentary trade products default rarely (well below 1% a year for LCs and guarantees in most years, with the same order of magnitude as high-quality corporate lending), and when they default the loss is small, because the exposure is short and often secured by goods or by a bank. This data is what persuaded the Basel Committee to keep the 20% CCF and to shorten the maturity floors for trade.

Why?

- **Short tenor.** A 90-day exposure gives a borrower little time to deteriorate, and the bank can simply not renew.
- **Self-liquidating.** The goods are sold and the proceeds repay the facility; the transaction itself produces the cash.
- **Documents and title.** The bank controls the goods through the bill of lading until it is paid.
- **Bank obligors.** Much of the risk is on other banks (confirmations), which default less often than companies.
- **Multiple parties with skin in the game.** Buyer, seller, two banks, a carrier and an insurer all check each other.
- **Priority in a workout.** Trade creditors are often paid first in a restructuring because the company needs to keep trading.

The caveat is that this low-loss record is for genuine trade. Where trade finance products are used for something else (financing a trader's speculative positions, providing disguised working capital to a company in distress, or financing goods that do not exist), the loss experience is very different.

## Fraud risk

Trade finance's weakness is that banks deal in documents and never see the goods. Every control is therefore a check that the documents are genuine and are being used once.

- **Fake or altered documents.** Forged bills of lading, invoices for goods never shipped, inflated quantities. Checks: verifying bills of lading with the carrier's own database, vessel tracking (was that ship really in that port on that date?), price checks against market data (an invoice for copper at twice the market price is a red flag), and comparing documents across presentations.
- **Double or multiple financing.** The same invoice or the same cargo financed by two or three banks, each thinking it has the only claim. This was the pattern in several large commodity trading collapses in 2020. Checks: registries of financed receivables where they exist, reconciling the borrower's total facilities across banks, and collateral management agreements with physical inspection.
- **Circular or fictitious trade.** Companies in the same group selling the same goods to each other to generate invoices to finance. Checks: knowing the counterparties, looking for related-party patterns, and asking why the goods are travelling in a circle.
- **Phantom warehouses and empty tanks.** Warehouse receipts for metal that is not there. Checks: independent inspection with rotation of inspectors, surprise visits, reconciling receipts to warehouse operators directly.
- **Misuse of supply chain finance.** Invoices for future or notional business presented as approved payables.

The common thread is that fraud losses are total (the whole facility, not a share) and sudden, and that the borrower usually turns out to have been in trouble for a long time. Fraud is the main reason trade finance credit analysis spends so much time on the customer's business model and the purpose of each transaction, not just the financials.

## Sanctions, dual-use goods and financial crime

Because trade finance moves goods and money across borders, it is the part of the bank most exposed to **sanctions** (government bans on dealing with certain countries, people, companies, vessels or goods), to **export controls** on **dual-use goods** (items with both civilian and military uses, such as certain chemicals, electronics, machine tools and software), to **anti-money-laundering** rules (trade-based money laundering uses over- or under-invoicing to move value disguised as trade), and to **anti-bribery** laws.

Every LC, collection, guarantee and trade loan is screened: the parties (applicant, beneficiary, banks, carriers, insurers, agents), the vessel (against sanctioned-vessel lists and against ship-tracking data for suspicious port calls), the ports and routes, the goods (described in the documents, against dual-use lists), and the prices. Screening generates large volumes of alerts, most of them false positives, that must be investigated and cleared by trained staff before the transaction proceeds. Banks have paid fines in the billions for sanctions failures in trade and correspondent banking, which is why compliance, not credit, is often the binding constraint on how much trade finance a bank is willing to do.

This is not strictly credit risk, but it lands on the same platform and the same data, and a sanctions or export-control failure can turn a good credit into a frozen, unrecoverable one overnight. See [[25 Climate, ESG and Emerging Credit Risks]] for how environmental and social screening is being added to the same process.

## A worked example

A machinery maker in Germany sells a 5 million packaging line to a food company in a mid-sized emerging market. Illustrative numbers.

**Structure.** Payment: 15% advance on signing, 75% by confirmed irrevocable LC at sight against shipping documents, 10% retention payable after installation. The seller wants an advance payment guarantee issued for the 15% and a performance bond of 10% for the installation.

**The buyer's bank (issuing bank)** approves a 3.75 million LC under the food company's 10 million trade facility. The facility is secured by a floating charge over the company's inventory and receivables and a parent guarantee. Capital: 3.75 million times a 20% CCF is 0.75 million of exposure, at the company's risk weight. It also issues no guarantees (those are the seller's side).

**The seller's bank (confirming bank)** receives the MT700, checks it, and considers confirmation. The issuing bank is rated BB, in a country rated BB with occasional currency restrictions. The confirming bank has a country limit and a limit on the issuing bank; the 3.75 million fits within both. It confirms, charging a confirmation fee of 1.2% a year pro-rated (illustrative), and records an exposure to the issuing bank of 3.75 million times 20%, 0.75 million, at the issuing bank's risk weight, plus country risk provisioning under its own policy.

**The seller's bank also issues**, on behalf of the machinery maker, an advance payment guarantee of 0.75 million (reducing on delivery) and a performance bond of 0.5 million, both on demand under URDG 758, under the maker's 20 million bonding facility. Exposure to the maker: 0.75 million at 50% CCF plus 0.5 million at 50% CCF, 0.625 million.

**Shipment and presentation.** The maker ships. First presentation has two discrepancies: the packing list shows 14 crates, the bill of lading 13, and the insurance certificate is dated after the bill of lading. The bank refuses within three banking days, listing both. The maker obtains a corrected packing list and a re-dated insurance certificate and re-presents. The second presentation complies. The confirming bank pays 3.75 million to the maker, claims reimbursement from the issuing bank, and is paid five days later. The issuing bank releases the documents to the food company against a 90-day trade loan, which is now an on-balance sheet exposure of 3.75 million at 100%.

**Compliance.** All parties, the vessel, the route and the goods description (packaging machinery, checked against dual-use lists because some food-processing equipment has controlled components) are screened at issuance, at confirmation and at presentation. One alert on a near-name match for the shipping agent is investigated and cleared.

**Outcome.** The food company repays the trade loan on day 85. The performance bond expires unclaimed after installation. Total credit loss: zero. Fees earned by the two banks: around 100,000 between them. This is a normal trade finance transaction.

## Common mistakes and misunderstandings

- **Thinking the bank checks the goods.** It checks documents. Autonomy is the point.
- **Confusing an LC with a guarantee.** An LC is a payment mechanism that is expected to be used; a guarantee is a safety net that is expected not to be. The exposure profile and the CCF differ.
- **Treating a confirmation as risk-free because the issuing bank is a bank.** It is credit exposure to that bank and transfer risk on its country.
- **Assuming a documentary collection is a bank promise.** It is not. The banks are messengers.
- **Forgetting that a demand guarantee is near-certain to be paid if called.** The bank cannot argue about the underlying contract.
- **Letting guarantees "expire" in the system when they have not expired in law.** Open-ended and foreign-law guarantees linger. Stale exposure data understates risk.
- **Counting the face value of every LC and guarantee as exposure in management reports while the capital engine uses CCFs**, or the other way round, and then being unable to reconcile the two.
- **Underestimating fraud.** The low loss rate is for honest trade. The controls that keep it low are the document checks and inspections, which are easy to cut when volumes are high.
- **Treating sanctions screening as somebody else's problem.** A sanctioned counterparty makes the credit unrecoverable.

## What a platform lead needs to know about this

**Data.** Trade finance exposures are different in shape from loans: a single transaction has an applicant, a beneficiary, an issuing bank, a confirming bank, a country of risk (which may differ from the country of the obligor), a vessel, goods, an expiry, a tenor, a CCF class, and a status that changes several times (issued, advised, confirmed, presented, discrepant, paid, reimbursed, expired). Guarantees need an issue date, expiry date, legal expiry treatment, governing law, beneficiary, type (for the CCF), and call history. The exposure for limits (usually face value) and the exposure for capital (face value times CCF) must both be available and reconcilable. Country risk needs the country of the issuing bank for confirmations and the country of the goods' destination for some sanctions purposes.

**Systems.** Expect a dedicated trade finance processing platform (there are a handful of market-standard vendors) that handles SWIFT messaging, document examination workflow, fees and accounting, often separate from the core loan system and with its own customer master. Expect a sanctions and dual-use screening engine wired into every step, with an alert management workflow owned by compliance. Expect supply chain finance on yet another platform, sometimes a third-party or fintech one. The hard integration problems are: feeding trade exposures with the correct CCF class into the regulatory capital engine and the limit system every day; keeping guarantee expiries accurate; aggregating a customer's trade, loan and derivative exposure into one limit view; and getting correspondent bank and country exposures into the [[14 Risk Appetite, Limits and Concentration]] framework. See [[22 Credit Risk Data, Systems and BCBS 239]].

**Controls.** Document examination by trained checkers with four-eyes review; verification of bills of lading and vessel tracking; price checking against market data; double-financing checks; collateral inspection regimes for commodities; sanctions, dual-use and anti-money-laundering screening at every stage with documented clearance; guarantee expiry management; limit checks before issuance and confirmation; country limit management; and periodic reconciliation of the trade platform to the general ledger and to the capital engine. For the governance framework see [[13 Credit Governance - Committees, Authorities and the Three Lines]].

**Who owns what.** The trade finance product and sales team (front office) sells and structures. Trade operations (a large, specialised processing unit, often in a shared service centre) examines documents and processes messages. Financial crime compliance owns screening and alert clearance. Credit risk approves facility limits for applicants and confirmation limits for banks. Country risk sets country limits. Regulatory reporting owns the CCF mapping. Legal owns guarantee wording and governing-law questions. Internal audit tests the whole chain regularly, because regulators expect it.

## Related notes

- [[00 Start Here]]
- [[01 What a Bank Is and How It Makes Money]]
- [[02 What Credit Risk Is]]
- [[04 Commercial and Corporate Lending]]
- [[06 Specialised Finance - Project, Object, Commodities, Real Estate]]
- [[09 Credit Analysis - Reading a Borrower]]
- [[11 Collateral and Security]]
- [[12 Loan Documentation, Covenants and Conditions]]
- [[13 Credit Governance - Committees, Authorities and the Three Lines]]
- [[14 Risk Appetite, Limits and Concentration]]
- [[18 Regulatory Capital and Basel - the Short Version]]
- [[22 Credit Risk Data, Systems and BCBS 239]]
- [[23 Reporting - Regulatory Returns, Pillar 3 and Management Information]]
- [[25 Climate, ESG and Emerging Credit Risks]]
- [[26 Sovereign, Bank and Country Risk]]
- [[28 Master Glossary]]
- [[basel-credit-risk-explained-simply]]
- [[basel-credit-risk-decision-tree]]
