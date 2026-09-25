# AI, Explained

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
