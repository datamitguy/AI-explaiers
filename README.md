# AI, Explained, plus Product, Platform & Big Ideas courses

Eight interactive, Brilliant-style courses. Each is a single self-contained HTML file with no build step:

| Page | Course |
|---|---|
| `index.html` | **AI, Explained**: 19 chapters, from AI basics to Claude, agents and the frontier |
| `product-management.html` | **Product Management, First Principles**: 8 chapters |
| `platform-management.html` | **Platform Management, First Principles**: 12 chapters |
| `theories.html` | **Big Ideas, Part 1: Big theories**: 128 theories across 14 domains (science, quantum physics, strategy, life, the brain, self, systems, economics, leverage, culture, thinking tools), with 43 simulations |
| `models.html` | **Big Ideas, Part 2: Mental models & toolkits**: 148 models and tools across 9 sections, with 39 simulations |
| `society.html` | **Big Ideas, Part 3: Society, politics & the human mind**: 140 theories across 8 domains (psychology, sociology, political theories, power, theories of history, economic schools, ethics, philosophy), with 27 simulations |
| `biases.html` | **Big Ideas, Part 4: The bias & fallacy codex**: 200 cognitive biases in 8 sections and 40 logical fallacies in 2 sections, each with how to counter it and an evidence note, plus 9 interactive experiments |
| `lab.html` | **Big Ideas, Part 5: Communication & the Pattern Lab**: 21 first principles of communication, 22 negotiation theories, 21 persuasion and influence theories, 22 leadership theories, 14 pattern-recognition models, 12 demos and the interactive **Meeting Pattern Lab** |

A switcher in the top bar links the courses. All five Big Ideas parts sit under "Theories" and link to each other; related-card chips jump between parts, and old links to a card that moved (for example `theories.html#t-maslow`) redirect to its new page.

---

## AI, Explained

An interactive, Brilliant-style course on artificial intelligence in a single `index.html` file. There's no build step and no dependencies apart from Google Fonts.

Open `index.html` in a browser, or serve the folder with a static server such as `python3 -m http.server`.

## Chapters

1. **What is AI?** A clickable AI ⊃ ML ⊃ DL ⊃ GenAI diagram and the ANI/AGI/ASI spectrum
2. **How machines learn** Live supervised (perceptron), unsupervised (k-means) and reinforcement (Q-learning) simulations, plus a gradient descent playground
3. **Neural networks** A single neuron you can tune, and an animated forward pass
4. **Data & feature engineering** A messy dataset to clean, the "circle problem" solved with engineered features, and a before/after toolkit of common transformations
5. **Training & evaluation** Train/validation/test splitting, an overfitting curve-fitter, and a confusion matrix with a threshold slider
6. **Deployment & model monitoring** The MLOps lifecycle loop, deployment patterns, and a live drift-monitoring dashboard
7. **Your first model** A guided 8-step project: frame, explore, clean, split, train (logistic regression, k-NN or a decision tree, all trained live in the browser), evaluate, predict, and ship with a model card and matching scikit-learn code
8. **The road to generative AI** A timeline from 1950 to 2026 and a deep dive on *Attention Is All You Need*
9. **Inside a transformer** A tokenizer, embedding arithmetic, an attention visualizer, the architecture explorer, and temperature sampling
10. **How LLMs are trained** Steppers for pretraining through RLHF, and for Constitutional AI
11. **Beyond text: diffusion** An interactive noise-to-image demo
12. **Deep dive: reinforcement learning** A multi-armed bandit game (greedy vs ε-greedy), value iteration on a grid world (discount, step reward, slippery floor), deep RL milestones, RL for LLMs (RLHF → DPO → RLVR), and a reward-hacking animation
13. **Deep dive: computer vision** Draw pixels, apply convolution kernels live, the CNN feature hierarchy, one scene with five vision tasks, Vision Transformer patchify, and failure modes
14. **Today's AI landscape** The AI stack and a filterable list of model families
15. **Meet Claude** The current lineup (Haiku 4.5, Sonnet 5, Opus 5.5, Fable 5.1, restricted Mythos 5.1), the Fable/Mythos story, a feature explorer, the tool-use loop, a context window visualizer, and extended thinking
16. **Building with LLMs** A prompt builder, a decision helper for prompting vs RAG vs fine-tuning vs agents, and an eval suite with a regression
17. **Agent engineering** The agent loop step by step, harness anatomy, lifecycle hooks (with a replayable session), context engineering simulator, progressive disclosure for skills, a workflow/multi-agent pattern gallery, permission modes, and long-running agents
18. **The frontier** A working in-browser mini-RAG, JEPA vs. generative prediction, Jev and System One models (a typed parallel-decision race against a generative LLM, plus a calibration reliability diagram), a Mixture-of-Experts router, and test-time compute
19. **Responsible AI** A fairness trade-off simulator, SHAP-style explanations, and the EU AI Act risk pyramid

A searchable **glossary** of 150+ terms closes the course, and bold key terms throughout the course show inline definitions when you hover or tap them.

It supports light and dark themes, including a manual toggle, and respects `prefers-reduced-motion`.

---

## Product Management, First Principles (`product-management.html`)

1. **What product management is**: the four risks (value, usability, feasibility, viability), plus "name that risk" and "output, outcome or impact?" sorting games
2. **Start from the customer's problem**: Jobs to Be Done, a Mom Test question game, and an interactive opportunity solution tree
3. **Strategy**: Rumelt's kernel (take a strategy memo apart), Playing to Win, positioning and 7 Powers
4. **Prioritization**: a live RICE calculator with an evidence-based confidence ladder, and cost of delay
5. **Experiments**: an assumption map, and a simulation of 200 A/A tests showing the peeking problem
6. **Metrics**: a North Star metric tree with input metrics and guardrails, and a retention-curve shaper for product–market fit
7. **Teams & the product operating model**: feature teams vs. empowered teams, OKRs, story mapping and pricing
8. **Product management in the AI era**: an AI autonomy ladder, evals as the new spec, and AI unit economics

It ends with a filterable library of 26 books, papers and reports (2009–2026), including *Transformed* (2024), *Evidence-Guided* (2023), *Product Operations* (2023), *Me, My Customer, and AI* (2025), *AI Engineering* (2025) and the 2025 DORA report.

## Platform Management, First Principles (`platform-management.html`)

**Part A · Platform businesses**
1. **What is a platform?**: an animated pipeline-vs-platform comparison and the core interaction
2. **Network effects & cold start**: a two-sided marketplace simulator with cold-start strategies (atomic network, subsidies, single-player tool, seeding)
3. **Pricing**: subsidy and money sides, and a take-rate sweet-spot model with a leakage zone
4. **Governance & winner-take-all**: a governance-lever sorting game and a tipping-point checklist
5. **AI reshuffles platforms**: coordination, agents as a new side, protocols and envelopment

**Part B · Internal platforms**
6. **Cognitive load & Team Topologies**: an interactive diagram of the four team types and three interaction modes
7. **Platform as a product**: a golden-path simulator showing lead time, tickets and cognitive load
8. **Measuring a platform**: a DORA-metrics profiler, SPACE and DevEx
9. **Maturity & the AI era**: a CNCF maturity self-assessment with a radar chart, and the 2025 DORA platform findings

**Part C · Domain platforms (for example, credit & lending)**
10. **Who are my customers?**: an interactive customer map separating direct customers (journey teams, partners), operators, end customers (borrowers), guardrail owners and sponsors, plus a role-sorting game ("customers are per capability")
11. **Drawing the platform boundary**: a loan-lifecycle capability map (customers, interface, metric and guardrail owners for each capability), and a platform vs. self-service config vs. journey-team sorting game
12. **Running a lending platform as a product**: a job to be done for each customer, an outcome scorecard, leverage-based prioritization with regulatory deadlines, operating model and anti-patterns

It ends with a library of 23 sources (including Domain-Driven Design, the EU AI Act and the FCA Consumer Duty), including *Reshuffle* (2025), *Team Topologies* 2nd ed. (2025), *Platform Engineering* (2025), *Frictionless* (2025), *Platform Strategy* (2024), *The Cold Start Problem* (2021) and *Platform Revolution* (2016), plus foundational papers (Rochet & Tirole 2003; Eisenmann, Parker & Van Alstyne 2006).

## Big Ideas, Part 1: Big theories (`theories.html`)

An interactive field guide to the theories that give you an edge today, covering the outer world (science, economics, power) and the inner game (brain, belief, leverage, mental models). A **theory map** at the top lets you search, filter by domain, pick a theory at random, and track which ones you've marked as understood (saved in your browser). Each theory card covers the core idea, *why it gives you an edge now*, an example, a common misconception, and links to related theories. Cards in the self-help-adjacent sections carry an **evidence rating**, from "very strong evidence" to "belief system, not science". You can deep-link to any card, for example `theories.html#t-bayes`.

| Domain | Theories (🎮 = interactive simulation) |
|---|---|
| **Information & computation** | Information theory 🎮, Bayesian probability 🎮, computability, complexity (P vs NP), cybernetics, Gödel's incompleteness, Kolmogorov complexity |
| **Strategy & decisions** | Game theory (Axelrod tournament 🎮), expected utility, prospect theory 🎮, bounded rationality, mechanism design, Arrow's theorem (voting paradoxes 🎮), signaling |
| **Quantum physics: a deeper dive** | Planck's quanta, the photoelectric effect 🎮, the Bohr atom (hydrogen spectrum 🎮), de Broglie waves, the Schrödinger equation (particle in a box 🎮), the Born rule, superposition & qubits 🎮, the uncertainty principle 🎮, tunnelling 🎮, spin (Stern–Gerlach 🎮), Pauli exclusion, entanglement & Bell tests 🎮, interpretations, decoherence, quantum field theory, the Standard Model, quantum computing, no-cloning & quantum cryptography |
| **String theory & quantum gravity** | String theory & M-theory, the holographic principle, loop quantum gravity, Hawking radiation & the information paradox, the string landscape & multiverse debate |
| **Physics & the cosmos** | Big Bang (cosmic timeline 🎮), relativity (twin paradox 🎮), quantum theory (double slit 🎮), thermodynamics (entropy 🎮), chaos (logistic map 🎮), Noether's theorem, plate tectonics |
| **Life & evolution** | Natural selection (weasel program 🎮), the selfish gene, germ theory, endosymbiosis, the Red Queen, evolutionarily stable strategies, scaling laws (Kleiber 🎮) |
| **Mind & behaviour** | Dual-process theory (Cognitive Reflection Test 🎮), predictive processing, cognitive dissonance, attachment, theory of mind, global workspace, Hebbian learning |
| **Brain, attention & focus** | Neuroplasticity & deliberate practice 🎮, dopamine loops 🎮, default mode network, attention residue 🎮, flow 🎮, deep work, cognitive load, spaced repetition 🎮, sleep & memory, Zeigarnik/Ovsiankina, habit formation 🎮 |
| **Self-image, belief & wellbeing** | Psycho-Cybernetics, self-efficacy, growth mindset, Pygmalion effect, placebo, Neville Goddard's law of assumption (with what the evidence says), WOOP 🎮, hedonic treadmill 🎮, self-determination theory, locus of control, Stoic dichotomy of control, maximizers vs. satisficers, peak–end rule |
| **Systems & complexity** | Systems thinking (thermostat 🎮), small-world networks 🎮, emergence, power laws 🎮, tipping points (Granovetter 🎮), black swans |
| **Economics & society** | Comparative advantage (Ricardo 🎮), tragedy of the commons & Ostrom 🎮, principal–agent, creative destruction, diffusion of innovations, transaction costs |
| **Leverage, wealth & modern strategy** | Asymmetric bets 🎮, permissionless leverage 🎮, specific knowledge, compounding 🎮, escaping the default game, value maxing, owning your time 🎮, ideas to influence 🎮, Lindy effect, antifragility, Kelly criterion 🎮, ergodicity 🎮, Matthew effect, 1,000 true fans, luck surface area |
| **Language, culture & knowledge** | Sapir–Whorf, universal grammar, speech acts, semiotics, memetics, Hofstede's cultural dimensions 🎮, falsifiability (Wason 2-4-6 🎮), paradigm shifts |
| **Thinking tools & mental models** | First principles, inversion, second-order thinking, circle of competence, Occam's razor, Goodhart's law, Parkinson's law, Chesterton's fence, the map is not the territory, regret minimization, planning fallacy |

It ends with an 18-question "which theory explains it?" challenge, a 57-book reading list, and a recap on how to think in models.


## Big Ideas, Part 2: Mental models & toolkits (`models.html`)

Practical models and untools-style frameworks for acting in the world. It uses the same card format, evidence ratings, search, progress tracking and deep links as Part 1, and related-card chips marked ↗ jump between the two parts.

| Section | Models (🎮 = interactive simulation) |
|---|---|
| **Stoicism: the art of living** | Virtue as the only good (control sorter 🎮), judgements not things, the three disciplines, premeditatio malorum, memento mori (life in weeks 🎮), amor fati, the obstacle is the way, the view from above (powers of ten 🎮), voluntary discomfort, the evening review, Hierocles' circles |
| **First principles of wealth** | Wealth vs. money vs. status, value creation, productivity, ownership, savings rate (years to financial independence 🎮), diversification 🎮, index funds & costs (fee drag 🎮), inflation, opportunity cost, human capital, debt (minimum-payment trap 🎮), enough |
| **More mental models** | Hanlon's razor, survivorship bias (Wald's bombers 🎮), margin of safety, incentives, regression to the mean 🎮, sunk cost, availability, anchoring (wheel of fortune 🎮), resulting, local vs. global optima (hill climbing 🎮), leverage points, steelmanning, thought experiments, activation energy, moats, diminishing returns, cargo cult science |
| **People & motivation** | Fundamental attribution error, the Ben Franklin effect, temporal motivation theory (procrastination equation 🎮), halo effect, IKEA effect, pratfall effect, mere exposure, spotlight effect, curse of knowledge, bystander effect 🎮, social loafing, reactance |
| **Laws of work, tech & life** | Pareto principle, Hofstadter's law, the Peter principle 🎮, Hick's law (live reaction test 🎮), Dunning–Kruger 🎮, Murphy, Sturgeon, Moore, Amdahl 🎮, Gall, Metcalfe, Postel, Hyrum, Fitts, Jakob, Tesler and Cunningham's laws (plus links to Parkinson, Goodhart, Occam, Chesterton, Hanlon and Brooks) |
| **Decision-making tools** | Eisenhower matrix 🎮, one-way vs. two-way doors, weighted decision matrix 🎮, impact–effort matrix, Cynefin 🎮, 10/10/10, pre-mortem, decision trees & expected value 🎮, OODA loop, six thinking hats, RAPID/DACI, WRAP |
| **Problem-solving & communication** | Five whys 🎮, issue trees & MECE, the pyramid principle, abstraction laddering, the iceberg model 🎮, ladder of inference 🎮, fishbone diagrams, rubber duck debugging, the double diamond, SBI feedback, circles of concern & influence, radical candor 🎮 |
| **Project management models** | Iron triangle 🎮, critical path 🎮, PERT 🎮, theory of constraints 🎮, Little's law & WIP limits 🎮, Brooks's law 🎮, WBS, Agile & Scrum, Kanban, cone of uncertainty, RACI, Tuckman's stages, Conway's law, the ninety-ninety rule, risk matrices, Gantt charts, earned value 🎮, burndown charts 🎮, planning poker, critical chain, Monte Carlo forecasting 🎮, stakeholder mapping, scope creep, retrospectives, PDCA, the seven wastes, Six Sigma DMAIC, rolling wave planning |
| **Product management models** | Kano model 🎮, crossing the chasm, the Hook model, AARRR pirate metrics 🎮, Lean Startup, product–market fit, HEART, MoSCoW, Business Model Canvas, Fogg behaviour model 🎮, Blue Ocean strategy, Shape Up, Wardley mapping, three horizons, product life cycle, the innovator's dilemma, the hype cycle, growth loops, product-led growth, aha moments, Van Westendorp pricing 🎮, the decoy effect 🎮, Porter's five forces, the Ansoff matrix, the BCG matrix, outcome-driven innovation, dual-track agile |

An "11 laws of the universe" shortcut on the hub links to Parkinson, Hofstadter, Hanlon, Pareto, Peter, Hick, Goodhart, Dunning–Kruger, Occam, Chesterton and Brooks across both parts. It ends with a "which tool fits?" challenge, a filterable reading list and a Monday-morning toolkit recap.

## Big Ideas, Part 3: Society, politics & the human mind (`society.html`)

The social sciences and humanities, split out of Part 1 to keep pages fast. Same card format, evidence ratings, search, progress tracking and deep links. Every theory is presented at its strongest, then its critics and its record.

| Domain | Theories (🎮 = interactive simulation) |
|---|---|
| **Classic psychology** | Maslow's hierarchy (rate your needs 🎮), adult attachment styles, psychoanalysis, Jung, classical conditioning (Pavlov/Rescorla–Wagner 🎮), operant conditioning, Piaget, Vygotsky, Erikson, the Big Five (10-item TIPI test 🎮), social learning, Milgram (shock board 🎮), Asch (line-judgement test 🎮), the Stanford prison experiment, learned helplessness, positive psychology, CBT, humanistic psychology, IQ and g, multiple intelligences, emotional intelligence, the marshmallow test, Yerkes–Dodson 🎮, grief stages, Dunbar's number, terror management theory, each with an honest evidence rating |
| **Sociology: how societies work** | Conflict theory ("which lens?" sorter 🎮), functionalism, symbolic interactionism, Goffman's dramaturgy, anomie and strain, Weber, the social construction of reality, labelling theory, social capital, Bourdieu, the strength of weak ties 🎮, social mobility & the Great Gatsby curve 🎮, intersectionality, McDonaldization, risk society, the network society, the panopticon and surveillance, cultural hegemony, broken windows, the contact hypothesis, secularisation |
| **Political theories & ideologies** | The left–right spectrum (two-axis questionnaire 🎮), liberalism, libertarianism, conservatism, socialism, communism, social democracy, anarchism, fascism, totalitarianism, nationalism, feminism, green politics, communitarianism, republicanism, Machiavelli, populism, theories of democracy, pluralism, the iron law of oligarchy, separation of powers, the median voter theorem (race to the middle 🎮), the Overton window |
| **Power, politics & history** | Realism, power transition (Thucydides Trap 🎮), hegemonic stability, social contract, democratic peace, soft power, Great Man vs. forces |
| **Theories of history** | Cyclical history, Ibn Khaldun's asabiyyah (dynasty cycle 🎮), Spengler & Toynbee, cliodynamics (secular cycles 🎮), Kondratiev waves, Strauss–Howe generations, progress & Whig history, historical materialism, the Annales school, geographic determinism, the Malthusian trap 🎮, collapse, path dependence (lock-in 🎮), contingency & counterfactuals, the Great Divergence, the Axial Age, world-systems theory, the clash of civilisations, Glubb's Fate of Empires, each with an honest evidence rating |
| **Schools of economic thought** | Mercantilism, classical economics (Adam Smith), Marxian economics, the marginal revolution, Keynesian economics (spending multiplier 🎮), the Austrian school ("which school said it?" 🎮), monetarism (MV = PY 🎮), the Phillips curve 🎮, rational expectations, New Keynesian economics (Taylor rule 🎮), MMT, Minsky's financial instability hypothesis, supply-side economics (Laffer curve 🎮), public choice, institutional economics, the efficient market hypothesis, behavioural economics, Georgism, Sen's capability approach |
| **Ethics: how should we live?** | Utilitarianism, deontology (Kant), virtue ethics, trolley problems 🎮, Rawls's veil of ignorance 🎮, care ethics, Mill's harm principle, Hume's is–ought gap, moral relativism vs. realism, Nozick's experience machine 🎮 |
| **Existence, mind & knowledge** | Existentialism, absurdism (Camus), Nietzsche, Plato's cave, rationalism vs. empiricism, the problem of induction (the turkey 🎮), the mind–body problem, the hard problem of consciousness, the Chinese Room, free will, personal identity (Ship of Theseus 🎮), pragmatism, Wittgenstein, Buddhist philosophy, Taoism |

## Big Ideas, Part 4: The bias & fallacy codex (`biases.html`)

200 cognitive biases, heuristics and fallacies, organised after Buster Benson's "cognitive bias codex" by the four problems they solve (too much information, not enough meaning, the need to act fast, what to remember). Each compact card explains the bias, why it happens, **how to counter it**, an example and an **evidence note** (some famous biases, such as the backfire effect or stereotype threat, are much weaker than first reported; some, like Berkson's or Simpson's paradox, are statistical fallacies rather than mental quirks). Cards with a full deep-dive elsewhere link to it.

| Section | Examples (🎮 = interactive experiment) |
|---|---|
| **What grabs our attention** | Availability, illusory truth, mere exposure, negativity bias, anchoring, framing (the "Asian disease" problem 🎮), base rate neglect (the cab problem 🎮), inattentional blindness, empathy gap |
| **Seeing what we already believe** | Confirmation bias, belief perseverance, backfire effect, motivated reasoning, the Barnum effect (personal reading 🎮), bias blind spot, naive realism, illusion of explanatory depth |
| **Patterns, probability & statistics** | Clustering illusion, the gambler's fallacy 🎮, hot hand, conjunction fallacy (the Linda problem 🎮), scope insensitivity, prosecutor's fallacy, Berkson's and Simpson's paradoxes, narrative fallacy |
| **Judging people & groups** | Fundamental attribution error, halo and horn effects, in-group bias, just-world hypothesis, curse of knowledge, spotlight effect, false consensus, identifiable victim effect |
| **Overconfidence & the self** | Overconfidence and overprecision, illusory superiority, optimism bias, planning fallacy, illusion of control, self-serving bias, end-of-history illusion, impostor phenomenon |
| **Decisions, risk & value** | Loss aversion, endowment effect, status quo and default bias, sunk cost, zero-risk bias, ambiguity aversion, hyperbolic discounting, mental accounting, choice overload, bikeshedding |
| **Social influence & groups** | Bandwagon effect, groupthink, authority and automation bias, pluralistic ignorance, the Abilene paradox, foot-in-the-door, information cascades, normalisation of deviance |
| **What we remember** | Hindsight bias, rosy retrospection, the misinformation effect, false memory, serial position effect (memory test 🎮), peak–end rule, the Google effect, testing and spacing effects |

| **Fallacies of relevance** | Ad hominem (spot the fallacy 🎮), tu quoque and whataboutism, straw man, red herring, misplaced appeal to authority, appeals to popularity, emotion, fear, nature, tradition and novelty, argument from ignorance, genetic fallacy, poisoning the well, loaded question, shifting the burden of proof, Gish gallop, motte-and-bailey, the fallacy fallacy |
| **Fallacies of structure, cause & evidence** | Affirming the consequent (valid or invalid? 🎮), denying the antecedent, undistributed middle, circular reasoning, false dilemma, slippery slope, post hoc, correlation vs. causation (spurious correlations 🎮), hasty generalisation, cherry-picking, composition and division, equivocation, no true Scotsman, special pleading, moving the goalposts, argument to moderation, false equivalence, the nirvana fallacy, the ecological fallacy |

Each fallacy card says when the same move is actually reasonable (for example, deferring to genuine experts, or a slippery slope with a real mechanism). The page ends with a "spot the bias" challenge, a reading list and a debiasing toolkit.

## Big Ideas, Part 5: Communication & the Pattern Lab (`lab.html`)

| Section | Contents (🎮 = interactive) |
|---|---|
| **First principles of communication** | Communication as a noisy channel 🎮, start from the audience, bottom line up front, commander's intent, Grice's maxims 🎮, "one cannot not communicate", the four-sides model, the 7-38-55 myth, active listening, the Johari window, psychological safety, Nonviolent Communication, crucial conversations, storytelling, signal vs. noise, narrative memos vs. slides, the medium is the message, read-back and teach-back, the rule of three, asking good questions, feedback that lands |
| **Negotiation** | BATNA (find the ZOPA 🎮), ZOPA and reservation points, principled negotiation (*Getting to Yes*), interests vs. positions, distributive vs. integrative bargaining (grow the pie 🎮), the fixed-pie bias, first offers and anchoring, the Nash bargaining solution, the ultimatum game 🎮, Rubinstein's patience model, Schelling's commitment and focal points, tactical empathy (Chris Voss), concessions and reciprocity, MESOs, precise numbers, emotions, Putnam's two-level games, the shadow of the future, deadlines, salary negotiation, mediation, 3-D negotiation |
| **Persuasion & influence** | Ethos, pathos, logos and kairos, the elaboration likelihood model (central or peripheral route? 🎮), social judgment theory (how big an ask? 🎮), source credibility, the sleeper effect, inoculation and prebunking (prebunk the tactic 🎮), two-sided messages, two-step flow and opinion leaders, moral reframing, deep canvassing, fear appeals and efficacy, nudges, influence without authority, French and Raven's bases of power, minority influence, self-persuasion and motivational interviewing, the power of "because", why persuasion is harder than it looks, self-affirmation, the firehose of falsehood, and persuasion vs. manipulation |
| **Leadership** | Trait theories, Lewin's autocratic/democratic/laissez-faire styles, task vs. people behaviours (Ohio State, the Managerial Grid), Fiedler's contingency model, situational leadership (which style fits? 🎮), path–goal theory, leader–member exchange, transformational vs. transactional, servant and authentic leadership, charisma and its dark side, Level 5 leadership (and its survivorship critique), Theory X and Y, Herzberg's two factors, Hackman's team conditions (audit your team 🎮), adaptive leadership, Goleman's six styles, Grove's managerial leverage, leader–leader and mission command, shared leadership, followership, and the romance of leadership (how much does the CEO matter? 🎮) |
| **Pattern recognition & reading people** | The Sherlock Holmes method, abductive reasoning, recognition-primed decisions, when to trust intuition, chunking, thin slicing, informal networks, pre-wiring and nemawashi, meeting dynamics (HiPPOs, anchors, hidden information), base rates for people, forecasting and calibration 🎮, field notes, emotional contagion, and the dark side: false patterns |

**The Meeting Pattern Lab** turns Holmes-style observation into a habit: record the people in your meetings (what persuades them, what they push back on), log each meeting (who objected, who supported, who stayed quiet, what won the room), and the Lab builds each person's patterns: an influence score, an objection heat map by topic and which tactics work. Before your next meeting, describe the proposal and the Lab predicts who is likely to object, the order to pre-wire people in and the chance of approval. Save the prediction, record what happened, and a scorecard (Brier score, objector hit rate) shows whether your read of the room is actually improving. It comes with a fictional sample team, three Sherlock-style practice cases, and JSON export/import. All data stays in your browser (localStorage); nothing is sent anywhere.
