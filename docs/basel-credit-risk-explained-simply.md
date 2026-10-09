# Credit risk and the Basel rules, explained from zero

This is a companion to `basel-credit-risk-decision-tree.md`. That file has a big diagram full of short labels and acronyms. This file walks through every box in that diagram and explains it as if you have never heard any of the words before. Read it top to bottom the first time. After that, use the table of contents to jump around.

Every acronym is spelled out the first time it appears, and there is a glossary at the end you can use as a cheat sheet.

---

## Table of contents

1. [The one-sentence version](#1-the-one-sentence-version)
2. [What a bank actually is](#2-what-a-bank-actually-is)
3. [What credit risk is](#3-what-credit-risk-is)
4. [Why banks need a cushion called capital](#4-why-banks-need-a-cushion-called-capital)
5. [Who Basel is and why their rules matter](#5-who-basel-is-and-why-their-rules-matter)
6. [The big idea: risk-weighted assets](#6-the-big-idea-risk-weighted-assets)
7. [The three ingredients: how much, how likely, how bad](#7-the-three-ingredients-how-much-how-likely-how-bad)
8. [Banking book versus trading book](#8-banking-book-versus-trading-book)
9. [The six ways a bank can be exposed](#9-the-six-ways-a-bank-can-be-exposed)
   - [Way 1: On-balance sheet, or money already lent](#way-1-on-balance-sheet-or-money-already-lent)
   - [Way 2: Off-balance sheet, or promises that might become loans](#way-2-off-balance-sheet-or-promises-that-might-become-loans)
   - [Way 3: Counterparty credit risk, or deals that can flip](#way-3-counterparty-credit-risk-or-deals-that-can-flip)
   - [Way 4: Settlement risk, or the hand-over moment](#way-4-settlement-risk-or-the-hand-over-moment)
   - [Way 5: Securitisation, or loans chopped into slices](#way-5-securitisation-or-loans-chopped-into-slices)
   - [Way 6: Investment funds, or a basket of things](#way-6-investment-funds-or-a-basket-of-things)
10. [Sorting borrowers into exposure classes](#10-sorting-borrowers-into-exposure-classes)
11. [The three ways to measure the risk: SA, F-IRB, A-IRB](#11-the-three-ways-to-measure-the-risk-sa-f-irb-a-irb)
12. [Credit risk mitigation: things that make a loan safer](#12-credit-risk-mitigation-things-that-make-a-loan-safer)
13. [Turning risk into a number: the RWA box](#13-turning-risk-into-a-number-the-rwa-box)
14. [The capital stack: floors, minimums, buffers](#14-the-capital-stack-floors-minimums-buffers)
15. [The leverage ratio: a rule with no risk weights](#15-the-leverage-ratio-a-rule-with-no-risk-weights)
16. [Large exposures: do not put all eggs in one basket](#16-large-exposures-do-not-put-all-eggs-in-one-basket)
17. [The three pillars](#17-the-three-pillars)
18. [The last box: the bank's own decision](#18-the-last-box-the-banks-own-decision)
19. [A worked example from start to finish](#19-a-worked-example-from-start-to-finish)
20. [How this all fits inside a real bank](#20-how-this-all-fits-inside-a-real-bank)
21. [Things that are easy to get wrong](#21-things-that-are-easy-to-get-wrong)
22. [Glossary](#22-glossary)

---

## 1. The one-sentence version

A bank lends out money that belongs to other people. Some borrowers will not pay it back. Credit risk is the risk of that happening. The Basel rules force every bank to keep a cushion of its own money, sized to how risky its loans are, so that when borrowers fail the bank does not fail too.

Everything else in this document is detail on top of that sentence.

---

## 2. What a bank actually is

Imagine you run a lemonade stand and your friends give you their pocket money to look after. You promise to give it back whenever they ask, and maybe pay them a little extra for the favour.

While you have their money, you do not just leave it in a jar. You lend it to other kids who want to buy a bike or start their own stand, and you charge them a little extra for borrowing it. The difference between what you charge borrowers and what you pay your friends is your profit.

That is a bank:

- **Deposits** are the pocket money your friends gave you. The bank owes this money back.
- **Loans** are the money you lent to the bike-buyers. The bank is owed this money.
- **Interest** is the "little extra" charged or paid.

The catch is that the money the bank lends out is mostly not the bank's own. If too many bike-buyers never pay back, the bank cannot give your friends their deposits back. That is how banks collapse, and when big banks collapse, whole countries have a bad decade. That is why governments care so much about how banks lend.

---

## 3. What credit risk is

"Credit" just means lending. "Risk" means the chance of a bad outcome. So **credit risk** is the chance that someone you lent money to does not pay you back, in full and on time.

The bad outcome has a name: **default**. A borrower is in default when they have stopped paying. The Basel rules give a precise trigger: a borrower is treated as defaulted when they are **90 days late** on a payment, or when the bank thinks they are unlikely to pay even without being late yet.

Credit risk is different from some other risks a bank faces:

- **Market risk** is the chance that something the bank owns, like shares or bonds, drops in price. Nobody defaulted; the price just moved.
- **Operational risk** is the chance of things going wrong inside the bank: a computer glitch, a fraud, a fine.
- **Liquidity risk** is the chance that the bank runs short of cash on a given day even though it is not actually broke.

This document is only about credit risk, which is historically the biggest one for most banks.

---

## 4. Why banks need a cushion called capital

Go back to the lemonade stand. Suppose you have collected 100 coins from friends and lent out all 100 to bike-buyers. If just one bike-buyer with a 5-coin loan vanishes, you now only have 95 coins' worth of loans but you still owe your friends 100. You are 5 coins short and you cannot pay everyone back. Game over.

Now suppose you had put 10 coins of your own money into the stand at the start. You collected 100 from friends, added your 10, and lent out 110. When the 5-coin borrower vanishes, you have 105 coins' worth of loans and owe your friends 100. You lost 5 of your own 10 coins, which hurts, but every friend gets paid in full. You survive.

That 10 coins of your own money is **capital**. It is the bank's own skin in the game. It is the first money that gets burned when loans go bad, and it protects the depositors.

The whole point of the Basel credit risk rules is to answer one question: **how big does that cushion need to be?** The answer, in short, is "bigger when the loans are riskier." The rest of this document explains how "riskier" gets measured.

A note on the word "capital": in everyday English, people say "capital" to mean any money used in a business. In bank regulation it has a narrow meaning: the money that can absorb losses without the bank breaking a promise to anyone. Mostly that is money the owners (shareholders) put in, plus profits the bank kept instead of paying out. The best-quality part of it is called **Common Equity Tier 1**, usually shortened to **CET1**. You will see that term again.

---

## 5. Who Basel is and why their rules matter

Basel is a city in Switzerland. It hosts a club of central banks and bank regulators from about 28 countries, called the **Basel Committee on Banking Supervision**, or **BCBS**. They meet there, so their rules are called the Basel rules.

The BCBS does not make laws. It writes a rulebook, and each member country then copies the rulebook into its own national law, sometimes with tweaks. So "Basel" is really a shared recipe that nearly every big bank in the world follows, with local seasoning.

There have been several editions:

| Edition | Roughly when | What it did |
|---|---|---|
| Basel I | 1988 | The first simple rule: hold capital equal to 8% of your loans, with a few crude risk categories. |
| Basel II | 2004 | Let big banks use their own statistical models to measure risk, and added the "three pillars" idea. |
| Basel III | 2010 onwards, after the 2008 financial crisis | Raised the quality and quantity of capital, added buffers, a leverage ratio, liquidity rules. |
| Basel III final reforms (nicknamed "Basel 3.1", "Basel IV", or in the US "the Basel endgame") | Published 2017, coming into force 2023 to 2028 depending on country | Reined in the internal models, added an "output floor", rewrote the simple approach. |

The diagram and this document describe the **Basel III final reforms**, which is the current rulebook. The BCBS publishes it as a single "consolidated framework" split into chapters. Chapter codes you will see in the diagram:

- **CRE** stands for credit risk. CRE20 is the simple approach, CRE30 to CRE36 the model-based approach, CRE22 risk mitigation, CRE40 securitisation, CRE50 to CRE54 counterparty risk, CRE60 funds, CRE70 settlement.
- **MAR** stands for market risk.
- **LEX** stands for large exposures.
- **RBC** stands for risk-based capital, the chapter that sets the percentages.

You do not need to memorise these. They are just chapter numbers so you can find the original text.

---

## 6. The big idea: risk-weighted assets

Here is the trick at the centre of the whole system.

Suppose a bank has lent 100 coins to the government of a very safe country, and another bank has lent 100 coins to a brand-new restaurant. Both banks have "100 coins of loans," but obviously the second one is much more likely to lose money. It would be silly to make them hold the same cushion.

So Basel says: do not count loans at face value. Multiply each loan by a **risk weight**, a percentage that reflects how risky it is. A very safe loan might have a risk weight of 0%, meaning "count none of it." A normal business loan might be 100%, meaning "count all of it." A really dodgy loan might be 150%, meaning "count it one and a half times."

The result after multiplying is called the **risk-weighted assets**, or **RWA**. ("Assets" is accountant-speak for things the bank owns, and a loan is something the bank owns because it is owed the money.)

Then the capital rule becomes simple: **hold capital of at least 8% of your RWA**, plus some extra buffers we will get to.

Two examples:

- 100 coins lent to the safe government at 0% risk weight gives RWA of 0. Capital needed: 0.
- 100 coins lent to the restaurant at 100% risk weight gives RWA of 100. Capital needed: 8% of 100, which is 8 coins.

Almost everything in the diagram is about working out the right risk weight, or the right inputs to a formula that produces it. Keep this picture in your head: **exposure times risk weight equals RWA, and 8% of RWA is the cushion.**

---

## 7. The three ingredients: how much, how likely, how bad

Whether you use a simple table or a fancy model, the risk of a loan always comes down to three questions.

**How much could we lose?** That is the **exposure at default**, shortened to **EAD**. For a plain loan it is simply the amount still owed. For things like credit cards with an unused limit, or promises to lend in the future, it is trickier, because the borrower may draw more money right before they fail. We will come back to that.

**How likely is the borrower to fail?** That is the **probability of default**, shortened to **PD**. It is a percentage per year. A PD of 1% means that, out of 100 borrowers like this one, about 1 will default in the next year.

**If they fail, how much do we actually lose?** That is the **loss given default**, shortened to **LGD**. When a borrower defaults, the bank usually gets something back: it sells the house, or the business pays 30 cents on the dollar. LGD is the share you do not get back. An LGD of 45% means you lose 45 cents of every dollar owed and recover 55.

There is sometimes a fourth: **maturity**, shortened to **M**, meaning how long until the loan is paid off. A ten-year loan has more time for things to go wrong than a one-year loan, so longer maturity means slightly more risk.

The average loss you expect from a loan is just the three ingredients multiplied together:

> Expected loss = PD x LGD x EAD

For example, a 1,000-coin loan with a 2% chance of default and a 40% loss when it happens has an expected loss of 0.02 x 0.40 x 1,000 = 8 coins per year. The bank prices that into the interest rate. Capital is not for the expected loss; capital is for the **unexpected** loss, the bad year when far more borrowers fail than you thought.

---

## 8. Banking book versus trading book

The top of the diagram asks: "banking book or trading book?" This is the first fork and it decides which rulebook applies.

Banks sort everything they own into two piles. They literally call the piles "books," like ledgers.

**The banking book** is the pile of things the bank plans to keep. Loans to customers, mortgages, bonds it intends to hold until they are repaid. The risk here is mainly credit risk: will I get paid back? This is the pile the credit risk rules apply to, and it is what the whole diagram is about.

**The trading book** is the pile of things the bank bought in order to sell again soon, hoping to make money from price moves. Shares, bonds, currencies, and derivatives that the trading desk flips around daily. The risk here is mainly market risk: will the price drop before I sell? This pile is covered by a different rulebook, the market risk framework, currently a set of rules nicknamed **FRTB** (Fundamental Review of the Trading Book). The diagram shows this as a grey box and says "out of scope." For how market risk itself is measured and capitalised, see [[29 Market Risk]].

Why does the split matter? Because the same bond could sit in either pile, and the capital rules are different. Regulators keep a close eye on the boundary so banks cannot shuffle things between piles to pick whichever rule is cheaper.

One wrinkle, which the diagram flags: **counterparty credit risk**, which is Way 3 below, applies in **both** books. If a trading desk does a derivatives deal, the other side of that deal could still default. So even trading-book deals come back into the credit risk framework for that one piece.

---

## 9. The six ways a bank can be exposed

After the banking-book fork, the diagram asks "how does the exposure arise?" and splits six ways. "Exposure" just means "a situation where the bank could lose money if someone fails." Each of the six has its own way of measuring how much is at stake.

### Way 1: On-balance sheet, or money already lent

The **balance sheet** is the bank's official list of what it owns and what it owes. "On-balance sheet" means the loan has already happened and is sitting on that list.

Examples: a mortgage, a car loan, a business loan, a bond the bank bought, money the bank parked at another bank.

Measuring the exposure is easy: it is the amount still owed. There is one adjustment. If the bank has already decided that part of the loan is lost and has written it down (that write-down is called a **specific provision**), the exposure is the amount owed **minus** the provision, because that part of the loss has already been eaten.

In the diagram: "EAD = carrying amount net of specific provisions." "Carrying amount" is the value shown on the books.

### Way 2: Off-balance sheet, or promises that might become loans

Sometimes a bank has not lent any money yet, but has promised it might. These promises do not show up as loans on the balance sheet, hence "off-balance sheet," but they are still risky, because the promise can turn into a real loan at the worst possible moment.

Examples:

- A **credit line** or **committed facility**. "You can borrow up to 1 million whenever you like." Nothing is lent until the customer draws on it. Struggling companies tend to draw everything right before they collapse.
- A **letter of credit**, shortened to **LC**. A bank's promise to pay a seller on behalf of a buyer, common in international trade. A **standby letter of credit** is one that only gets used if the buyer fails.
- A **guarantee**. "If my customer does not pay you, I will." A **financial guarantee** backs a debt. A **performance bond** or **bid bond** backs a promise to do something, like finishing a building.
- An **acceptance** is an old-fashioned promise to pay a trade bill on a future date.
- **NIFs and RUFs** (note issuance facilities and revolving underwriting facilities) are promises to help a company borrow from the market. Rare these days, but still in the rulebook.

How do you measure the exposure on a promise? The rulebook uses a **credit conversion factor**, shortened to **CCF**. It is a percentage that says "treat this much of the promise as if it were already a loan." The number depends on how likely the promise is to turn into real money owed:

| Type of promise | CCF | Why |
|---|---|---|
| Direct credit substitutes: financial guarantees, standby letters of credit, acceptances | 100% | These are basically loans that have not been drawn yet. If the customer fails, the bank definitely pays. |
| Transaction-related: performance bonds, bid bonds, warranties, NIFs, RUFs | 50% | Only paid out if a specific thing goes wrong, which is less likely than a plain default. |
| Committed credit lines that the bank cannot cancel freely | 40% | Most customers never draw the whole line, but the ones who fail often do. |
| Short-term self-liquidating trade letters of credit | 20% | Backed by actual goods being shipped, short-lived, historically very safe. |
| Credit lines the bank can cancel at any time without notice | 10% | In theory the bank could pull the line before trouble. In practice banks are slow to do so, hence not 0%. |

The exposure is then **the promised amount times the CCF**. A 1 million committed credit line with a 40% CCF counts as a 400,000 exposure.

The diagram notes that banks on the most advanced model approach (A-IRB, explained later) may estimate their own CCFs, but only for revolving facilities like credit lines, not for guarantees.

### Way 3: Counterparty credit risk, or deals that can flip

This is the one people find hardest, so take it slowly.

The word **counterparty** just means "the other side of a deal." If you and a friend agree to swap lunches tomorrow, your friend is your counterparty.

A normal loan has a one-way risk: the bank gives money, and only the bank can lose if the other side vanishes. But some financial contracts are two-way. Depending on how things move, either side might end up owing the other. Because the amount owed can flip and change size over the life of the contract, the risk that the other side fails has its own name: **counterparty credit risk**, shortened to **CCR**. The diagram also calls it **pre-settlement risk**, because it is the risk during the life of the deal, before the final hand-over.

Two families of contracts carry this risk.

**Derivatives.** A derivative is a contract whose value depends on something else: a currency rate, an interest rate, an oil price, a share price. Examples: a **forward** (agree today to buy dollars in six months at a fixed price), a **swap** (agree to exchange a fixed interest payment for a floating one every quarter for five years), an **option** (the right but not the obligation to buy or sell something at a set price). On day one, these contracts are usually worth about zero to both sides. But as the market moves, one side gains and the other loses. If the losing side goes bust, the winning side does not get its gain. That gain is the exposure.

Derivatives are either **over-the-counter** (shortened to **OTC**, meaning a private deal between two parties) or **exchange-traded** (standardised and bought on an exchange like a stock exchange). A **long settlement transaction** is a deal where the hand-over is unusually far in the future, so it gets treated like a derivative.

**Securities financing transactions**, shortened to **SFTs**. These are short-term deals where one side hands over securities (bonds or shares) and the other hands over cash, with a promise to swap back later. The main kinds:

- A **repo**, short for repurchase agreement. "I sell you this bond today for 100 and promise to buy it back tomorrow for 100.01." Economically it is a one-day loan of cash secured on the bond.
- A **reverse repo** is the same deal seen from the other side.
- **Securities lending**: lend out shares for a fee, get them back later.
- **Margin lending**: lend cash to someone so they can buy securities, holding those securities as backing.

The risk in an SFT is that the other side fails and the collateral you hold is suddenly worth less than the cash you gave.

**How the exposure is measured.** Because the exposure on a derivative changes every day, you cannot just read it off a loan balance. The rulebook has specific recipes.

For derivatives, the standard recipe is called the **standardised approach for counterparty credit risk**, shortened to **SA-CCR**. Its formula is:

> Exposure = 1.4 x (Replacement Cost + Potential Future Exposure)

- **Replacement cost** (RC) is what it would cost today to replace the contract if the other side vanished. Roughly, it is how much the contract is currently worth to you, if positive, after subtracting any collateral they have posted.
- **Potential future exposure** (PFE) is an estimate of how much more the contract could be worth to you in the future if markets move in your favour before the other side fails. It is computed from rulebook tables based on what kind of contract it is and how long it lasts.
- The **1.4** is a safety multiplier, called alpha, added because the simple formula tends to understate the risk.

Big banks with regulator approval can instead use their own simulation models, called the **internal model method**, shortened to **IMM**.

For SFTs, the rulebook does not use SA-CCR. Instead it uses the **comprehensive approach**, which is the collateral method explained in the mitigation section later: take the cash you gave, subtract the value of the securities you hold, but first shave a safety margin called a **haircut** off that value, because prices can drop before you manage to sell. Banks can also use a statistical model (a value-at-risk model, shortened to **VaR**) or IMM for this.

**Netting.** Big banks do thousands of derivatives deals with the same counterparty. Some are in the bank's favour, some against. If both sides have signed a legally binding agreement saying "if either of us fails, add up everything and only the net amount is owed," then the bank's exposure is the net, not the sum of all the winners. This is called **netting**, and the agreement that makes it legal is usually an industry standard called an **ISDA master agreement** (ISDA is the International Swaps and Derivatives Association), with an attached **credit support annex** (CSA) that governs collateral. A group of deals covered by one such agreement is a **netting set**.

The diagram makes a point of this: in the SA-CCR formula, netting and collateral go **into** the replacement cost calculation. They are not a separate step applied afterwards. (The original Gemini diagram had them as a later step, which is why this is called out.) **NICA** in the diagram stands for "net independent collateral amount," which is just the collateral the counterparty has posted that is not tied to daily price moves.

**Central clearing.** After the 2008 crisis, regulators pushed most standard derivatives through a **central counterparty**, shortened to **CCP**. A CCP is a specialised institution that sits in the middle of every trade: instead of Bank A facing Bank B, Bank A faces the CCP and the CCP faces Bank B. The CCP demands collateral daily from everyone, so the chance of loss is much lower. A CCP that meets strict standards is a **qualifying CCP** (QCCP). Trades with a QCCP get a very low risk weight of just **2%**. Banks also have to contribute to the CCP's rainy-day fund, called the **default fund**, and there is a special formula for the capital on that contribution.

**CVA, the grey box.** There is one more cost of derivatives. Even if the counterparty never defaults, if their creditworthiness gets worse, the contract is worth less to you, because the chance of not being paid went up. Accountants make banks recognise this drop in value. It is called the **credit valuation adjustment**, shortened to **CVA**. The risk that CVA moves against you is treated as a market-type risk and gets its own capital charge under the market risk rules (chapter MAR50), with a basic version (**BA-CVA**) and a standardised version (**SA-CVA**). That is why the diagram shows it as a separate grey box that is **not** part of credit RWA. The dashed arrows mean "this also happens, but in a different rulebook."

### Way 4: Settlement risk, or the hand-over moment

Every deal eventually has a hand-over: I give you the money, you give me the shares. **Settlement** is that hand-over. If the two halves do not happen at exactly the same instant, there is a window where one side has paid and the other has not yet delivered. If the other side goes bust inside that window, you lose the whole amount, not just a gain.

This is sometimes called **Herstatt risk**, after a German bank that was shut down by regulators in 1974 in the middle of the day, after it had received the German-mark side of its currency deals but before it had paid out the dollar side. Its counterparties lost everything they had sent.

The fix is to make the two halves happen at the same instant, so that neither side can end up having paid without being paid:

- **Delivery versus payment**, shortened to **DvP**, for securities: the shares only move if the cash moves, and vice versa.
- **Payment versus payment**, shortened to **PvP**, for currencies. The main system for this is called **CLS** (originally "Continuous Linked Settlement"), a special bank that settles most big currency trades.

Under the rulebook (chapter CRE70), the capital treatment depends on whether the trade is DvP or PvP:

- **If yes**: there is no capital charge at all while the trade is on track. If the trade **fails** (the other side does not deliver), then starting 5 business days after the due date, the bank must hold capital against the amount it would lose. The percentage ramps up with time: 8% from day 5, then 50%, 75%, and 100% at 46 days or more.
- **If no** (called a **free delivery**, where one side pays first and trusts the other to deliver later): the moment the bank has sent its half, it must treat the amount as a loan to the counterparty, with that counterparty's normal risk weight. If the other half still has not arrived after 4 business days, the bank must deduct the whole amount from its capital, as if it were already lost.

The important correction to the original diagram: DvP and PvP are **not** a form of credit risk mitigation. They are reasons the settlement-risk charge is zero or deferred. They live in their own branch.

### Way 5: Securitisation, or loans chopped into slices

A bank can take a few thousand mortgages, put them in a box, and sell investors the right to the box's cash flows. That is **securitisation**. The clever and dangerous part is that the box is usually sliced into layers called **tranches**. The top slice gets paid first and only loses money if the whole box does terribly. The bottom slice gets paid last and loses money as soon as a handful of mortgages fail. Same box, very different risk.

Because the risk depends so much on which slice you hold, there is a separate rulebook for it (chapter CRE40). A bank that holds a tranche must pick from a hierarchy of methods:

1. **SEC-IRBA**, if the bank can model the underlying loans itself.
2. **SEC-ERBA**, which uses external credit ratings of the tranche, if the first is not available.
3. **SEC-SA**, a simple formula, as a last resort.

Some slices get a 1250% risk weight, which with the 8% rule means "hold capital equal to the full amount," which is the rulebook's way of saying "we assume you will lose all of this."

### Way 6: Investment funds, or a basket of things

If the bank owns units in a fund (a pooled investment that holds a mix of things), it cannot just assign one risk weight, because the fund could hold anything from government bonds to junk. Chapter CRE60 gives three options:

1. **Look-through**: if you can see exactly what the fund holds, risk-weight each thing inside as if you held it directly.
2. **Mandate-based**: if you cannot see inside but know the rules the fund must follow, assume it holds the riskiest things its rules allow.
3. **Fall-back**: if you know neither, use 1250%, which again means "assume you could lose it all."

---

## 10. Sorting borrowers into exposure classes

Once the bank knows how much is at stake (the exposure), the next question is **who** owes it. The rulebook groups borrowers into **exposure classes**, and each class has its own risk weights or its own model rules. The diagram lists six groups.

**Sovereigns, central banks, public sector entities, multilateral development banks.** A **sovereign** is a national government. A **central bank** is the government's bank, like the Federal Reserve or the Bank of England. **Public sector entities** (PSEs) are things like city governments or state-owned bodies. **Multilateral development banks** (MDBs) are international lenders like the World Bank. Rich, stable governments get a 0% risk weight. Weaker ones get more.

**Banks and securities firms.** Loans to other banks. These get risk weights based on ratings, or on a simple checklist (explained in the next section).

**Corporates.** Companies. The general class is "ordinary company." There are sub-flavours:
- **SME**, small and medium-sized enterprises, meaning small businesses, which get a slightly friendlier weight because their failures are small and spread out.
- **Specialised lending**, where the loan is paid back from one specific asset rather than from a company's general business. Three types: **project finance** (lending to build a power station, repaid from the electricity sales), **object finance** (lending to buy a ship or aeroplane, repaid from its charter income), and **commodities finance** (lending against a shipload of oil or grain).
- **IPRE**, income-producing real estate, meaning a building whose rent is the only thing that pays the loan.

**Regulatory retail.** Loans to ordinary people and very small businesses, in small amounts. The point of this class is that the risk is spread across millions of borrowers, so one failure barely matters. Sub-flavours: **QRRE** (qualifying revolving retail exposures, which is rulebook-speak for credit cards and overdrafts), split into **transactors** (people who pay off their card every month) and **revolvers** (people who carry a balance); **other retail** (personal loans, car loans); and **SME retail** (tiny businesses treated like individuals).

**Real estate.** Loans secured on property. This is its own class, not part of retail, because the risk depends so heavily on the property. Three types: **residential** (homes), **commercial** (offices, shops), and **ADC** (acquisition, development and construction, meaning lending to a builder before the building exists, which is the riskiest). The key measure is the **loan-to-value ratio** (LTV): a 600,000 loan on an 800,000 house has an LTV of 75%. Lower LTV means more cushion if the house price falls, so a lower risk weight. The rulebook also asks whether repayment depends on the property's cash flows (rent) or on the borrower's own income, because rent-dependent loans are riskier.

**Everything else.** **Equity** (owning shares in a company, which is riskier than lending to it, because shareholders are paid last). **Subordinated debt** (loans that are paid back after other loans, so riskier). **Covered bonds** (a safe kind of bank bond backed by a ring-fenced pool of mortgages). And **defaulted exposures**: once a borrower is 90 days late, the loan moves into this class and gets a high risk weight (150%, or 100% if the bank has already provisioned at least a fifth of the loan).

---

## 11. The three ways to measure the risk: SA, F-IRB, A-IRB

Now the bank knows how much is at stake and who owes it. The next fork is: which **approach** turns that into a risk weight? There are three, and this is probably the most important section in the document.

Think of it as three ways to work out how dangerous a hike is. You could read a sign at the trailhead (the standardised approach), you could check the weather yourself but trust the park's distances (foundation IRB), or you could survey the whole trail yourself (advanced IRB).

### The standardised approach (SA)

This is the rulebook's lookup table. The bank does not estimate anything about probabilities. It finds the borrower in a table and reads off the risk weight. The table is keyed on simple, observable facts:

- **External credit ratings**, where available. Rating agencies like Moody's, S&P and Fitch grade borrowers from AAA (safest) down to D (defaulted). A AAA company gets 20%, a BBB company gets 75%, a B company gets 150%, and so on. The rulebook calls this the **external credit risk assessment approach**, shortened to **ECRA**.
- For **banks without a rating**, there is a checklist called the **standardised credit risk assessment approach**, shortened to **SCRA**. It sorts the borrowing bank into **grade A** (comfortably meets its own capital rules: 40% risk weight, or 30% if it is very strong), **grade B** (meets minimums but not buffers: 75%), or **grade C** (does not meet minimums: 150%).
- For **real estate**, the loan-to-value buckets. For example a home loan with an LTV under 50% gets 20%; one over 100% gets much more.
- Fixed weights for the rest: **75%** for regulatory retail, **45%** for card transactors, **100%** for unrated companies, **85%** for unrated small businesses.

The advantage is that everyone can check it, nobody can game it, and small banks do not need a statistics team. The disadvantage is that it is crude: two companies with the same rating can be very different, and many borrowers have no rating at all.

The diagram's note "no PD or LGD" is a correction to the original: under SA, the bank never calculates a probability of default or loss given default. It just uses the table.

### The internal ratings-based approach (IRB)

"Internal ratings" means the bank grades borrowers itself, using its own data and statistics, instead of reading a table. This was the big innovation of Basel II. The bank feeds its own estimates of the three ingredients (PD, LGD, EAD, plus maturity M) into a formula fixed by the rulebook, and the formula spits out the risk weight.

Why would a regulator allow this? Because a big bank with 20 years of data on millions of mortgages genuinely knows more about those mortgages than a table written in Switzerland does. The flip side is that the bank has an incentive to be optimistic, because a lower PD means less capital. That tension is why there are two flavours, strict permissions, and floors.

**Foundation IRB (F-IRB).** The bank estimates only the **probability of default** itself. The other ingredients, LGD, EAD and maturity, are given by the rulebook as fixed "supervisory" values. For example, an unsecured loan to a company gets a supervisory LGD of 40%. The bank is trusted with the thing it knows best (how likely is this customer to fail) but not the things that are harder to estimate and easier to fudge. F-IRB is **not** available for retail at all: retail is either SA or the advanced version.

**Advanced IRB (A-IRB).** The bank estimates **all four**: PD, LGD, EAD and M. This gives the most accurate (and usually the lowest) capital, which is why big banks spent fortunes building these models in the 2000s.

The Basel III final reforms pulled A-IRB back sharply, after regulators found that different banks were producing wildly different numbers for the same kind of loan. The diagram records the restrictions:

- A-IRB is **not permitted** for loans to **banks**, other **financial institutions**, or **large companies** (groups with revenue above 500 million euros). For these, the best a bank can do is F-IRB. The reasoning is that defaults among big companies and banks are so rare that no bank has enough data to estimate LGD reliably.
- **Equity** is SA only. No models at all.
- **Input floors**: even where models are allowed, the estimates cannot go below set minimums. PD cannot be lower than 0.05% (written "5 basis points" or "5bp"; a basis point is one hundredth of a percent) for companies and most retail, or 0.10% for credit-card revolvers. LGD has floors too, for example 25% for unsecured company loans under A-IRB. EAD has a floor. These stop a model from claiming a borrower is essentially risk-free.

### How to tell which approach a bank uses

A bank does not simply pick. It must apply to its regulator for permission to use IRB, show that its models work, and once approved it generally has to use IRB across most of its book, not just where it is convenient. Smaller banks almost always use SA. The biggest banks use a mix: A-IRB for mortgages and retail where they have the data, F-IRB for large corporates and banks because that is all they are allowed, and SA for odd bits.

---

## 12. Credit risk mitigation: things that make a loan safer

Suppose a loan is risky on paper, but the borrower has pledged their house, or a very safe third party has promised to pay if the borrower does not. Common sense says the loan is safer. The rulebook agrees, but only if strict conditions are met. This is **credit risk mitigation**, shortened to **CRM** (chapter CRE22).

The first condition for any of these is **legal certainty**: the bank must have watertight documents, checked by lawyers, that would actually let it seize the collateral or call on the guarantee in every relevant country. A pledge that turns out to be unenforceable in a bankruptcy court is worth nothing, and regulators have seen that happen.

The diagram shows five branches out of the mitigation question.

**Eligible financial collateral.** Collateral is something the borrower hands over, or pledges, that the bank can sell if the borrower fails. "Financial" collateral means cash, gold, government bonds, good-quality company bonds, listed shares. There are two ways to recognise it:

- The **simple approach**: for the portion of the loan covered by collateral, swap the borrower's risk weight for the collateral's risk weight. A loan to a shaky company backed by government bonds gets the government's weight on that portion. There is a floor of 20%, so it can never go all the way to zero this way (with a few exceptions like cash).
- The **comprehensive approach**: subtract the collateral's value from the exposure, but first apply a **haircut**. A haircut is a safety margin that reflects how much the collateral's price could fall before the bank manages to sell it. Cash gets a 0% haircut. A government bond might get 2%. A volatile share might get 20% or more. There is also a haircut for currency mismatch if the loan and the collateral are in different currencies. The leftover after subtracting haircut-adjusted collateral is the exposure that gets risk-weighted.

**Guarantees and credit derivatives.** A guarantee is a third party's promise to pay if the borrower does not. A **credit derivative** (the common one is a **credit default swap**) is a contract that pays out if a named borrower defaults, which does the same job in a different legal form. If the guarantor is more creditworthy than the borrower, the rulebook uses **substitution**: for the guaranteed portion, use the guarantor's risk weight (under SA) or the guarantor's PD (under IRB) instead of the borrower's. If the guarantor is worse than the borrower, it does nothing.

**On-balance sheet netting.** If the bank has lent 100 to a customer who also has 30 on deposit with the bank, and there is a legal agreement that the bank can grab the deposit if the loan goes bad, the exposure is 70, not 100.

**Physical collateral and receivables.** A house, a factory, a ship, or invoices owed to the borrower by its customers. Under the **standardised approach these do not count at all**, with one exception: real estate loans are already risk-weighted by LTV, which is effectively giving credit for the property. Under IRB they do count: F-IRB banks get a lower supervisory LGD when a loan is backed by eligible physical collateral, and A-IRB banks estimate the LGD effect themselves. The diagram says "IRB only" for this reason.

**None eligible.** Then the loan is simply unsecured and the full exposure gets the borrower's risk weight.

After the first four branches there is one more box: **mismatch adjustments**. If the guarantee expires before the loan does (a **maturity mismatch**), only part of its value is recognised. If the collateral is in a different currency from the loan (a **currency mismatch**), an extra haircut is applied.

---

## 13. Turning risk into a number: the RWA box

All six exposure branches, after passing through class, approach and mitigation, land in the dark blue box: **credit risk-weighted assets**. This is the sum, across every single loan and promise and derivative in the bank, of exposure times risk weight. For a big bank it is a number in the hundreds of billions.

The box summarises the two formulas:

- **Under SA**: RWA = exposure x risk weight from the table. Done.
- **Under IRB**: RWA = exposure x K x 12.5. Here **K** is the output of the rulebook's capital formula, which takes PD, LGD and M and produces "the amount of capital this loan needs, as a fraction of its exposure." Multiplying by 12.5 (which is 1 divided by 8%) converts that back into an RWA-equivalent so it can be added to the SA numbers. The old rulebook also multiplied by a fudge factor of 1.06; the final reforms removed it, which the box mentions.

The last line of the box covers **expected loss versus provisions**. Remember expected loss is PD x LGD x EAD, the average loss the bank should be budgeting for. Under IRB, the bank compares its total expected loss to the total provisions it has already set aside. If provisions are **smaller** than expected loss (the bank has under-prepared), the shortfall is **deducted from CET1 capital**, so the bank cannot dodge the cost by just not provisioning. If provisions are larger, a limited amount of the excess can be counted as lower-quality capital.

---

## 14. The capital stack: floors, minimums, buffers

The bottom row of the diagram, "from RWA to the capital stack," is where the risk number becomes a capital requirement. Each box is a rule that sits on top of the previous one.

**The output floor.** This is the biggest change in the final reforms and the main reason big banks lobbied against them for years. Because IRB models tend to produce lower RWA than the standardised table, the rulebook now says: **whatever your models say, your total RWA cannot be lower than 72.5% of what it would be if you used the standardised approach for everything.** So a bank must run both calculations. If the models come out at, say, 60% of the SA number, the bank has to use 72.5% instead. This caps how much benefit the models can give. The BCBS schedule phases it in from 50% in 2023, rising by 5 percentage points a year, to 72.5% in 2028. Countries vary: the European Union started in 2025, the United Kingdom in 2027, and the United States had not finalised its version at the time of writing.

**Pillar 1 minimums.** With the final RWA in hand, the bank must hold:

- **CET1** (Common Equity Tier 1, the best-quality capital: shareholders' money plus retained profits) of at least **4.5% of RWA**.
- **Tier 1** (CET1 plus some slightly weaker instruments called additional Tier 1, which are bonds that convert into shares in a crisis) of at least **6% of RWA**.
- **Total capital** (Tier 1 plus Tier 2, which is longer-term bonds that absorb losses only if the bank actually fails) of at least **8% of RWA**.

That 8% is the number that has survived since Basel I in 1988. What changed is how much of it must be top-quality CET1 and what counts as RWA.

**Buffers.** On top of the minimums, the bank must hold extra CET1 as a buffer. If it dips into the buffer it is not shut down, but it is banned from paying dividends and bonuses until it rebuilds. The buffers are:

- **Capital conservation buffer**: a flat 2.5% of RWA for everyone.
- **Countercyclical buffer**: between 0% and 2.5%, set by each country's regulator, raised when credit is growing too fast in a boom and released in a downturn. The idea is to force banks to save in good times.
- **Systemic buffers**: an extra 1% to 3.5% for the largest, most interconnected banks, called **G-SIBs** (global systemically important banks, the roughly 30 banks whose failure would hurt the whole world) and **D-SIBs** (domestic systemically important banks, the ones that would hurt their home country).

Stack it all up and a large bank typically needs CET1 of around 10% to 13% of RWA in practice, not 4.5%.

---

## 15. The leverage ratio: a rule with no risk weights

Everything so far depends on risk weights. The problem with risk weights is that they can be wrong. Before 2008, banks held huge amounts of securitised mortgages that had tiny risk weights because the rating agencies called them AAA. The risk weights said "safe," so banks held almost no capital against them, and then they blew up.

The **leverage ratio** is the backstop for that. It ignores risk weights entirely:

> Tier 1 capital divided by total exposure must be at least 3%.

"Total exposure" is everything: all loans at face value, all promises with simple conversion factors, all derivatives, all SFTs, no risk weighting at all. It is a crude rule, deliberately. Whichever of the risk-based rules and the leverage rule bites harder is the one that binds. The biggest banks have a higher leverage requirement (3% plus half their G-SIB buffer).

---

## 16. Large exposures: do not put all eggs in one basket

A bank could be perfectly capitalised on average and still die if one giant borrower fails. The **large exposures** rules (chapter LEX) stop that:

- No single counterparty (or group of connected counterparties, like a parent company and its subsidiaries) may account for more than **25% of the bank's Tier 1 capital**.
- Between two G-SIBs the limit is tighter: **15%**, because the failure of one giant bank taking down another is exactly the domino effect regulators fear.

Note this is measured against capital, not against RWA. It is a concentration rule, not a capital rule, but it feeds into the same credit decision.

---

## 17. The three pillars

Basel II introduced a way of organising all this into three "pillars," and the diagram's final rule box refers to them.

**Pillar 1** is everything above: the mechanical rules for minimum capital. Credit risk, market risk, operational risk, each with a formula.

**Pillar 2** is the supervisor's judgement. Every bank must run an **internal capital adequacy assessment process** (ICAAP), a self-examination that asks "what risks do I have that Pillar 1 does not capture, and how much extra capital do I need for them?" The regulator then runs its own **supervisory review and evaluation process** (SREP) and can order the bank to hold more. Typical Pillar 2 risks: concentration (too many loans to one industry or region), interest rate risk in the banking book (**IRRBB**, the risk that rates move and squeeze the gap between what the bank pays depositors and what it earns on fixed-rate loans), and the results of stress tests, where the regulator makes the bank simulate a severe recession and show it survives.

**Pillar 3** is disclosure. Banks must publish their RWA, capital ratios, approaches used, and lots of detail, in a standard format, so that investors and analysts can compare them and apply pressure. The theory is that market discipline backs up regulatory discipline.

---

## 18. The last box: the bank's own decision

The final diamond in the diagram, "bank credit decision," is not a Basel rule at all. The diagram says so explicitly. It is there because this is where the regulatory calculation meets everyday life inside a bank.

When a company asks a bank for a loan, a credit officer works through roughly these questions:

1. Can they pay it back? This is the fundamental credit analysis: cash flows, debt levels, the business, the management. Ratios like **debt service coverage** (does the business generate enough cash to cover its loan payments?) and **interest coverage** (do profits cover the interest bill?) live here. This analysis feeds the bank's internal rating, which under IRB becomes the PD.
2. What would it cost us in capital? Run the exposure through the tree: how much RWA does this create, and therefore how much CET1 must we tie up?
3. Is the price right? Banks measure **return on risk-weighted assets** (RoRWA) or **return on regulatory capital**. A loan that earns a 1% margin but ties up a lot of capital may not be worth doing, while a loan with a thinner margin but low RWA might be.
4. Does it fit our **risk appetite**? The board sets limits: maximum exposure to any one borrower (the large exposure rule plus the bank's own tighter version), to any one industry, to any one country. Does this loan breach any of them?

If the answers are good, the loan is approved and a **limit** is set (the maximum the bank is willing to be exposed to this customer). If not, the bank can decline, ask for collateral or a guarantee to improve the mitigation branch, raise the price, or restructure the deal, for example by shortening the maturity or making it a DvP transaction. Those options are what the red box in the diagram lists.

---

## 19. A worked example from start to finish

Let us follow one loan through the whole tree, with made-up but realistic numbers.

**The deal.** A bank is asked to lend 10 million to a medium-sized manufacturing company, unrated, for five years, to buy new machines. The company's parent group has revenue of 200 million. The company offers the machines as security and the bank also holds 1 million of the company's cash on deposit, with a legal right of set-off.

**Step 1, banking book or trading book?** The bank intends to hold this loan to maturity. Banking book. Credit risk rules apply.

**Step 2, how does the exposure arise?** Once drawn, it is a plain loan. Way 1, on-balance sheet. Exposure at default is 10 million (no provisions yet, because nothing has gone wrong).

Suppose the bank also gives the company a 2 million working-capital line that it can cancel at any time. That is Way 2, off-balance sheet, unconditionally cancellable, CCF 10%, so it adds 200,000 of exposure.

**Step 3, exposure class.** Corporate. Revenue of 200 million makes it a mid-sized company, not an SME under the rulebook's definition (which caps SMEs at 50 million) and not a large corporate (over 500 million).

**Step 4, approach.** Say this bank has A-IRB approval for corporates. Since the group revenue is under 500 million, A-IRB is allowed. The bank's internal rating model gives the company a PD of 1.2% (above the 0.05% floor, so fine). The bank's LGD model, taking into account the machines as physical collateral, gives 35% (above the 25% unsecured floor, and the machinery justifies the lower figure). Maturity is 5 years, which under the formula gets capped at 5.

**Step 5, mitigation.** The 1 million deposit qualifies for on-balance sheet netting, so the loan exposure drops from 10 million to 9 million. The machines are physical collateral, which under A-IRB has already been reflected in the LGD estimate, so it is not double-counted. Total exposure: 9 million loan plus 200,000 from the line.

**Step 6, RWA.** Plugging PD 1.2%, LGD 35% and M 5 into the IRB formula gives a K of roughly 6% (the real formula is long; this is a plausible output). RWA is 9.2 million x 6% x 12.5, about 6.9 million. For comparison, under SA an unrated company gets a 100% risk weight, so SA RWA would be 9.2 million. The IRB number is 75% of SA, which is above the 72.5% output floor, so the floor does not bite on this loan.

**Step 7, capital.** With CET1 at 4.5% minimum plus a 2.5% conservation buffer plus, say, a 1% countercyclical buffer, the bank needs 8% of 6.9 million, about 550,000, of its own shareholders' money set aside for this one loan. The loan will earn perhaps 2% margin on 9 million, or 180,000 a year. Return on the capital tied up: about 33% before costs, which is attractive.

**Step 8, decision.** Within the bank's limits for this industry and this customer. Approved. The credit officer sets a limit of 12 million total.

**What if it had gone differently?** If the parent group had revenue of 2 billion, A-IRB would be banned and the bank would have to use F-IRB with the supervisory LGD of 40% (and no credit for the machines unless they met the rulebook's narrow eligibility rules), pushing RWA up. If the company were a brand-new start-up with no history, the PD model might say 8%, the RWA would double or more, and the bank would probably ask for a guarantee from the parent or decline.

---

## 20. How this all fits inside a real bank

It helps to know who actually does what, because "the bank" is thousands of people.

- **Relationship managers** find customers and bring in deals. They want the loan approved.
- **Credit risk analysts and credit officers** assess the borrower, assign the internal rating, and approve or decline. They are the second opinion, deliberately kept independent from the sales side.
- **Risk modelling teams** build and maintain the PD, LGD and EAD models, and defend them to the regulator.
- **Regulatory reporting and finance** run the RWA calculation every quarter across the whole bank and file it with the regulator. For a big bank this is a serious software system crunching millions of records.
- **Treasury** manages how much capital the bank has and raises more when needed.
- **The regulator** (in the UK the Prudential Regulation Authority, in the euro area the European Central Bank, in the US the Federal Reserve and others) reviews all of it, inspects the models, and can impose extra capital under Pillar 2.

The decision tree in the diagram is, in effect, a map of the conversation between these teams.

---

## 21. Things that are easy to get wrong

These are the specific places where the original Gemini diagram went wrong, restated in plain words, because they are the classic beginner mistakes.

- **Settlement mechanisms are not mitigation.** DvP and PvP do not reduce a credit exposure; they are a separate branch with their own rules about failed trades.
- **Netting is part of the exposure measurement**, inside the SA-CCR formula, not a later subtraction.
- **Repos are not derivatives.** They are measured with the collateral haircut method, not SA-CCR.
- **The standardised approach has no PD or LGD.** You cannot "assess PD" and then "choose SA." If you have a PD, you are on IRB.
- **IRB is a permission, not a choice.** And the advanced version is banned for banks, big companies and equity.
- **Mortgages are not retail.** Real estate is its own class.
- **CVA capital is a market risk charge**, not part of credit RWA, though it arises from the same derivatives.
- **The calculation does not stop at RWA.** The output floor, the leverage ratio, large exposure limits and Pillar 2 all sit on top.
- **The final approve-or-decline step is the bank's own policy**, not a Basel rule. Basel tells you the capital cost; the bank decides whether to pay it.

---

## 22. Glossary

Listed alphabetically. Terms in **bold** elsewhere in this document are here.

| Term | Meaning |
|---|---|
| A-IRB | Advanced internal ratings-based approach. The bank estimates PD, LGD, EAD and M itself. |
| Acceptance | A bank's written promise to pay a trade bill on a future date. |
| ADC | Acquisition, development and construction. Lending to build property that does not yet exist. |
| Alpha (1.4) | The safety multiplier in the SA-CCR formula. |
| BA-CVA | Basic approach to CVA risk capital. |
| Balance sheet | The bank's list of what it owns (assets) and what it owes (liabilities). |
| Banking book | The pile of things the bank intends to hold, mainly loans. Credit risk rules apply here. |
| Basel / BCBS | The Basel Committee on Banking Supervision, a club of regulators that writes the global bank rulebook. |
| Basis point (bp) | One hundredth of a percent. 5bp is 0.05%. |
| Buffer | Extra capital on top of the minimum. Dipping into it restricts dividends but does not close the bank. |
| Capital | The bank's own money, mainly from shareholders and retained profits, that absorbs losses first. |
| Capital conservation buffer | A flat 2.5% of RWA buffer for all banks. |
| CCF | Credit conversion factor. The share of a promise that is treated as if it were already a loan. |
| CCP / QCCP | Central counterparty. An institution that sits in the middle of trades. "Qualifying" means it meets strict standards. |
| CCR | Counterparty credit risk. The risk that the other side of a two-way contract fails while it is worth money to you. |
| CET1 | Common Equity Tier 1. The highest-quality capital: ordinary shares and retained earnings. |
| CLS | The specialist bank that settles most large currency trades on a payment-versus-payment basis. |
| Collateral | Something pledged by the borrower that the bank can sell if the borrower fails. |
| Commitment | A promise to lend in the future. |
| Comprehensive approach | The collateral method that subtracts haircut-adjusted collateral value from the exposure. |
| Counterparty | The other side of a deal. |
| Countercyclical buffer | A 0% to 2.5% buffer that regulators raise in booms and release in busts. |
| Covered bond | A bank bond backed by a ring-fenced pool of mortgages, treated as very safe. |
| CRE / MAR / LEX / RBC | Chapter codes of the Basel consolidated framework: credit risk, market risk, large exposures, risk-based capital. |
| Credit derivative | A contract that pays out if a named borrower defaults. The common kind is a credit default swap. |
| Credit line / facility | An agreement letting a customer borrow up to a limit when they choose. |
| Credit risk | The risk that a borrower does not pay back in full and on time. |
| CRM | Credit risk mitigation. Collateral, guarantees and netting that reduce the measured risk. |
| CSA | Credit support annex. The part of an ISDA agreement that governs collateral on derivatives. |
| CVA | Credit valuation adjustment. The drop in a derivative's value because the counterparty's creditworthiness worsened. |
| Default | The borrower has stopped paying. Triggered at 90 days late or when the bank judges payment unlikely. |
| Default fund | A CCP's rainy-day pool, funded by its members. |
| Derivative | A contract whose value depends on something else, like a rate or a price. |
| D-SIB | Domestic systemically important bank. |
| DvP | Delivery versus payment. Securities and cash move at the same instant. |
| EAD | Exposure at default. How much would be owed if the borrower failed. |
| ECRA | External credit risk assessment approach. Using rating-agency grades to pick a risk weight. |
| Equity | Owning shares in a company, as opposed to lending to it. |
| Expected loss | PD x LGD x EAD. The average loss to budget for. |
| Exposure | Any situation in which the bank could lose money if someone fails. |
| Exposure class | The category a borrower is sorted into: sovereign, bank, corporate, retail, real estate, other. |
| F-IRB | Foundation internal ratings-based approach. The bank estimates PD only; LGD, EAD and M are set by the rulebook. |
| Free delivery | A settlement where one side pays before the other delivers, with no DvP or PvP protection. |
| FRTB | Fundamental review of the trading book. The current market risk rules. |
| G-SIB | Global systemically important bank. Around 30 of the world's largest banks. |
| Guarantee | A third party's promise to pay if the borrower does not. |
| Haircut | A safety margin shaved off collateral value to allow for price falls. |
| Herstatt risk | Settlement risk, named after a 1974 bank failure. |
| ICAAP | Internal capital adequacy assessment process. The bank's own Pillar 2 self-assessment. |
| IMM | Internal model method. A bank's own simulation model for counterparty exposure, with regulator approval. |
| Input floor | A minimum value a bank's PD, LGD or EAD estimate may not go below. |
| IPRE | Income-producing real estate. A building whose rent repays the loan. |
| IRB | Internal ratings-based approach. The bank uses its own statistical estimates. Covers F-IRB and A-IRB. |
| IRRBB | Interest rate risk in the banking book. A Pillar 2 risk. |
| ISDA | International Swaps and Derivatives Association. Its master agreement is the standard contract for derivatives netting. |
| K | The output of the IRB capital formula: capital needed as a fraction of exposure. |
| LC | Letter of credit. A bank's promise to pay a seller on behalf of a buyer. |
| Leverage ratio | Tier 1 capital divided by total unweighted exposure, at least 3%. |
| LGD | Loss given default. The share of the exposure not recovered after a default. |
| Look-through | Risk-weighting a fund by looking at each thing inside it. |
| LTV | Loan-to-value ratio. Loan amount divided by property value. |
| M | Maturity. Time until the loan is repaid. |
| Market risk | The risk that prices move against you. Separate from credit risk. |
| MDB | Multilateral development bank, such as the World Bank. |
| Netting / netting set | Adding up all deals with one counterparty under a legal agreement so only the net is owed. |
| NICA | Net independent collateral amount. Collateral posted that is not tied to daily price moves. |
| NIF / RUF | Note issuance facility, revolving underwriting facility. Promises to help a company borrow from the market. |
| Off-balance sheet | A promise that has not yet become a loan, so it is not on the balance sheet. |
| On-balance sheet | A loan that has already been made. |
| OTC | Over the counter. A private contract between two parties, not on an exchange. |
| Output floor | Total RWA may not fall below 72.5% of what the standardised approach would give. |
| PD | Probability of default per year. |
| PFE | Potential future exposure. How much more a derivative could be worth before the counterparty fails. |
| Pillar 1 / 2 / 3 | Minimum capital rules / supervisory review / public disclosure. |
| Provision | Money set aside against a loss the bank expects or has already recognised. |
| PSE | Public sector entity, such as a city government. |
| PvP | Payment versus payment. Two currency legs move at the same instant. |
| QRRE | Qualifying revolving retail exposure. Credit cards and overdrafts. |
| RC | Replacement cost. What it would cost today to replace a derivative if the counterparty vanished. |
| Real estate class | Loans secured on property, its own exposure class split by LTV. |
| Regulatory retail | Small loans to individuals and tiny businesses. |
| Repo / reverse repo | A sale with a promise to buy back, economically a short-term secured loan. |
| Risk appetite | The limits a bank's board sets on how much risk it will take. |
| Risk weight | The percentage a loan is multiplied by to reflect its riskiness. |
| RoRWA | Return on risk-weighted assets. Profit relative to the capital a deal consumes. |
| RWA | Risk-weighted assets. Exposure times risk weight, summed across the bank. |
| SA | Standardised approach. Risk weights read from a rulebook table. |
| SA-CCR | Standardised approach for counterparty credit risk. The derivatives exposure formula. |
| SA-CVA | Standardised approach to CVA risk capital. |
| SCRA | Standardised credit risk assessment approach. A checklist for risk-weighting unrated banks into grades A, B, C. |
| SEC-IRBA / SEC-ERBA / SEC-SA | The three methods, in order of preference, for securitisation tranches. |
| Securitisation | Pooling loans and selling slices of the pool's cash flows. |
| Settlement | The hand-over of cash and securities at the end of a deal. |
| SFT | Securities financing transaction. Repos, securities lending, margin lending. |
| Simple approach | The collateral method that swaps in the collateral's risk weight for the covered portion. |
| SME | Small and medium-sized enterprise. |
| Sovereign | A national government. |
| Specialised lending | Loans repaid from one specific asset: project, object or commodities finance. |
| Specific provision | A write-down against a particular loan the bank expects to lose on. |
| SREP | Supervisory review and evaluation process. The regulator's Pillar 2 review. |
| Standby letter of credit | A letter of credit used only if the buyer fails to pay. |
| Subordinated debt | Debt repaid after other debts, so riskier. |
| Substitution | Using the guarantor's risk weight or PD instead of the borrower's. |
| Tier 1 / Tier 2 | Capital quality layers. Tier 1 is CET1 plus convertible instruments; Tier 2 is loss-absorbing long-term debt. |
| Trading book | The pile of things the bank intends to sell soon. Market risk rules apply. |
| Tranche | One slice of a securitisation, with its own place in the payment queue. |
| Transactor / revolver | A card customer who pays in full each month / one who carries a balance. |
| Unconditionally cancellable | A credit line the bank may withdraw at any time without notice. |
| VaR | Value at risk. A statistical model of how much could be lost over a period at a given confidence. |
