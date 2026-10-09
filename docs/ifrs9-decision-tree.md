# IFRS 9 decision trees

IFRS 9 (International Financial Reporting Standard 9, "Financial Instruments") is the accounting standard that decides how a bank values its loans and other financial assets, and how much it must set aside for expected credit losses. It replaced IAS 39 (International Accounting Standard 39) from 1 January 2018. It has three parts:

1. **Classification and measurement**: which accounting bucket an asset goes into, and therefore how it is valued.
2. **Impairment**: how much expected credit loss (ECL) must be provided for, using three stages.
3. **Hedge accounting**: how to show hedging with derivatives without creating artificial profit swings.

The two diagrams below cover parts 1 and 2, which are the parts that matter most for credit risk. For the full walk-through in plain language, read [[ifrs9-explained-simply]]. For the shorter credit-risk-team view, read [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]]. Paragraph references in brackets are to the standard itself (for example 4.1.2 is the amortised cost test, 5.5 is impairment).

---

## Part 1: classification and measurement

![[ifrs9-classification-tree.svg]]
*Every financial asset ends in one of four buckets. Only amortised cost and FVOCI debt go on to the impairment tree.*

How to read it:

- **Derivatives** always go to fair value through profit or loss (FVTPL), unless they are designated in a hedge relationship under Part 3.
- **Equity** (shares) goes to FVTPL, unless it is not held for trading and the bank makes an irrevocable choice on day one to put value changes in other comprehensive income (OCI). Those OCI gains and losses never move to profit, even on sale, and there is no impairment.
- **Debt** (loans, bonds, receivables) faces two tests (4.1.2 and 4.1.2A):
  - The **SPPI test**: are the contractual cash flows solely payments of principal and interest? A plain loan passes. A loan whose return depends on the borrower's profits, an equity price or a commodity price fails.
  - The **business model test**: is the asset held to collect its cash flows, held both to collect and to sell, or something else such as trading?
- Passing SPPI and held to collect gives **amortised cost**. Passing SPPI and held to collect and sell gives **FVOCI debt**. Anything else gives **FVTPL**.
- The **fair value option** (4.1.5) lets a bank designate an asset at FVTPL anyway, but only if that removes an accounting mismatch.

| Bucket | Balance sheet value | Where value changes go | Impairment? |
|---|---|---|---|
| Amortised cost | Cost, less repayments, adjusted by the effective interest rate, less the loss allowance | Interest and impairment in profit | Yes |
| FVOCI (debt) | Fair value | Interest and impairment in profit; other fair value changes in OCI, moved to profit on sale | Yes |
| FVOCI (equity, by election) | Fair value | All in OCI, never moved to profit; dividends in profit | No |
| FVTPL | Fair value | Everything in profit | No, because fair value already reflects credit risk |

Most of a commercial bank's loan book is at amortised cost, which is why impairment matters so much to credit risk teams.

---

## Part 2: impairment and the three stages

![[ifrs9-impairment-tree.svg]]
*The general approach puts every in-scope exposure into stage 1, 2 or 3 at each reporting date. POCI assets and the simplified approach take their own paths.*

How to read it:

- **Scope** (5.5.1): debt at amortised cost or FVOCI, lease receivables, contract assets, and loan commitments and financial guarantees that are not at FVTPL.
- **Purchased or originated credit-impaired (POCI)** assets were already in trouble when acquired. Only changes in lifetime ECL since purchase are recognised, interest uses a credit-adjusted effective rate, and they never move to stage 1 (5.5.13).
- The **simplified approach** (5.5.15) is required for trade receivables and contract assets without a significant financing component. It is a policy choice for those with one and for lease receivables. It always uses lifetime ECL, often through a provision matrix by days past due.
- Everything else uses the **general approach**:
  - **Stage 3** if the exposure is credit-impaired: in default, which carries a rebuttable presumption at 90 days past due, or unlikely to pay. Lifetime ECL, and interest is recognised on the net carrying amount.
  - **Stage 2** if credit risk has increased significantly since initial recognition (SICR). This is judged mainly by comparing today's lifetime probability of default with what was expected at origination, plus qualitative flags such as watchlist or forbearance. Being more than 30 days past due is a rebuttable backstop (5.5.11). Lifetime ECL, interest on the gross carrying amount.
  - **Stage 1** otherwise, or where the optional **low credit risk exemption** applies, roughly investment grade (5.5.10). 12-month ECL, interest on the gross carrying amount.
- **Measurement** (5.5.17): unbiased and probability-weighted across several economic scenarios, includes the time value of money by discounting at the effective interest rate, and uses reasonable and supportable information about past, present and forecast conditions.
- **Overlays**: governed adjustments for risks the models do not capture.
- **Booking**: the change in the allowance goes through profit or loss. For FVOCI debt the allowance is recognised in OCI rather than reducing the asset's carrying amount.
- **Every reporting date** the staging is redone. Exposures can move back to a better stage once the trigger has gone, usually after a probation period set by bank policy and regulatory guidance. Modified loans are assessed for gain or loss and possible derecognition. Loans are written off when there is no reasonable expectation of recovery.

| Stage | Meaning | Loss allowance | Interest revenue on |
|---|---|---|---|
| 1 | Performing, no significant increase in risk | 12-month ECL | Gross carrying amount |
| 2 | Significant increase in credit risk since origination | Lifetime ECL | Gross carrying amount |
| 3 | Credit-impaired | Lifetime ECL | Net carrying amount (gross minus allowance) |

---

## Where these trees connect to the rest of the vault

- How provisions affect regulatory capital, including the expected-loss shortfall deduction: [[18 Regulatory Capital and Basel - the Short Version]] and [[basel-credit-risk-explained-simply]].
- Where the early warning and watchlist signals behind SICR come from: [[15 Monitoring, Early Warning and Watchlist]].
- Default, cure and forbearance in practice: [[16 Problem Loans, Restructuring and Recovery]].
- The PD, LGD and EAD models that feed the calculation: [[10 Internal Ratings, Scorecards and PD Models]].
- Economic scenarios shared with stress testing: [[20 Stress Testing and ICAAP]].

## Caveats

- This is a reading guide, not accounting advice. The standard, the application guidance and your auditor's interpretation govern.
- Banks supervised in Europe also follow regulatory guidance on default definitions and staging that tightens some IFRS 9 judgements. Check your own regulator's expectations.
- US banks use CECL (current expected credit loss) instead, which has no stages and books lifetime losses from day one. See [[17 Provisioning and Expected Credit Loss - IFRS 9 and CECL]].
