# AI, Explained, plus Product, Platform & Big Ideas courses

Five interactive, Brilliant-style courses. Each is a single self-contained HTML file with no build step:

| Page | Course |
|---|---|
| `index.html` | **AI, Explained**: 19 chapters, from AI basics to Claude, agents and the frontier |
| `product-management.html` | **Product Management, First Principles**: 8 chapters |
| `platform-management.html` | **Platform Management, First Principles**: 12 chapters |
| `theories.html` | **Big Ideas, Part 1**: 160 mind-expanding theories across 17 domains (including a quantum physics deep dive, string theory and philosophy), with 50 simulations |
| `models.html` | **Big Ideas, Part 2: Mental models & toolkits**: 148 models and tools across 9 sections, with 39 simulations |

A switcher in the top bar links the courses. Both Big Ideas parts sit under "Theories" and link to each other.

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

## Big Ideas: 62 theories that expand your mind (`theories.html`)

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
| **Power, politics & history** | Realism, power transition (Thucydides Trap 🎮), hegemonic stability, social contract, democratic peace, soft power, Great Man vs. forces |
| **Language, culture & knowledge** | Sapir–Whorf, universal grammar, speech acts, semiotics, memetics, Hofstede's cultural dimensions 🎮, falsifiability (Wason 2-4-6 🎮), paradigm shifts |
| **Ethics: how should we live?** | Utilitarianism, deontology (Kant), virtue ethics, trolley problems 🎮, Rawls's veil of ignorance 🎮, care ethics, Mill's harm principle, Hume's is–ought gap, moral relativism vs. realism, Nozick's experience machine 🎮 |
| **Existence, mind & knowledge** | Existentialism, absurdism (Camus), Nietzsche, Plato's cave, rationalism vs. empiricism, the problem of induction (the turkey 🎮), the mind–body problem, the hard problem of consciousness, the Chinese Room, free will, personal identity (Ship of Theseus 🎮), pragmatism, Wittgenstein, Buddhist philosophy, Taoism |
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
