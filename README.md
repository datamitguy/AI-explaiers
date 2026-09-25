# AI, Explained, plus Product & Platform courses

Three interactive, Brilliant-style courses. Each is a single self-contained HTML file with no build step:

| Page | Course |
|---|---|
| `index.html` | **AI, Explained**: 19 chapters, from AI basics to Claude, agents and the frontier |
| `product-management.html` | **Product Management, First Principles**: 8 chapters |
| `platform-management.html` | **Platform Management, First Principles**: 9 chapters |

A switcher in the top bar links the three courses.

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

It ends with a library of 20 sources, including *Reshuffle* (2025), *Team Topologies* 2nd ed. (2025), *Platform Engineering* (2025), *Frictionless* (2025), *Platform Strategy* (2024), *The Cold Start Problem* (2021) and *Platform Revolution* (2016), plus foundational papers (Rochet & Tirole 2003; Eisenmann, Parker & Van Alstyne 2006).
