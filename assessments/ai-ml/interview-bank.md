# AI/ML interview assessments

Attempt questions before looking at references or assistant solutions. Record actual answers. Weekly assessments use five dimensions scored 0-3 each, maximum 15. Narrow checks use only relevant named dimensions and their actual denominator.

## Week 1 - Python and the ML workflow

1. How does learning a model differ from writing rules?
2. Why can changing a shared list alter another result?
3. Where does a trained model fit inside a delivery-time service?
4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.
5. Delayed transfer: Use a new concrete example; no earlier ML knowledge is assumed.

**Expected artifacts:** Read a small public CSV validate rows and compute descriptive statistics. **Behavioral checks:** Reject malformed rows and explain each transformation. **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.

## Week 2 - NumPy and numerical data

1. What does an array shape tell you that its length does not?
2. Why does a broadcasted subtraction silently produce the wrong shape?
3. When would you prefer a loop to a large vectorized intermediate?
4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.
5. Delayed transfer: Connect this topic to Week 1 (Python and the ML workflow).

**Expected artifacts:** Replace CSV-summary loops with NumPy and compare outputs. **Behavioral checks:** Test non-square arrays empty inputs and accidental mutation. **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.

## Week 3 - Vectors and linear prediction

1. Why does a dot product make a useful prediction function?
2. What happens to cosine similarity for a zero vector?
3. How would feature scale affect a nearest-neighbor service?
4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.
5. Delayed transfer: Connect this topic to Week 1 (Python and the ML workflow); Week 2 (NumPy and numerical data).

**Expected artifacts:** Implement scalar and batched linear predictions plus cosine similarity. **Behavioral checks:** Compare hand calculations and reject incompatible dimensions. **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.

## Week 4 - Matrices transformations and PCA

1. Why is matrix multiplication generally not commutative?
2. Why can fitting PCA before a train-test split leak information?
3. When is dimensionality reduction useful and when can it destroy signal?
4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.
5. Delayed transfer: Connect this topic to Week 2 (NumPy and numerical data); Week 3 (Vectors and linear prediction).

**Expected artifacts:** Implement a small matrix transformation and use a library PCA baseline. **Behavioral checks:** Check reconstruction shapes and fit transformations on training data only. **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.

## Week 5 - Derivatives and the chain rule

1. Why do we subtract the gradient when minimizing loss?
2. How can the wrong reduction factor make a correct-looking gradient wrong?
3. How would you investigate a model whose loss never decreases?
4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.
5. Delayed transfer: Connect this topic to Week 3 (Vectors and linear prediction); Week 4 (Matrices transformations and PCA).

**Expected artifacts:** Implement MSE derivatives and one gradient-descent update. **Behavioral checks:** Compare analytical and numerical gradients at several inputs. **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.

## Week 6 - Probability and Bayes

1. How do P(A given B) and P(B given A) differ?
2. Why can a high-accuracy detector produce many false positives?
3. How should rare-event prevalence influence a detection system?
4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.
5. Delayed transfer: Connect this topic to Week 3 (Vectors and linear prediction); Week 5 (Derivatives and the chain rule).

**Expected artifacts:** Simulate conditional events and compute a Bayes update. **Behavioral checks:** Compare simulated frequencies with analytical results. **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.

## Week 7 - Statistics and uncertainty

1. What does a confidence interval mean and not mean?
2. Why is a tiny p-value not evidence of a large useful effect?
3. How would you design an experiment with delayed outcomes?
4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.
5. Delayed transfer: Connect this topic to Week 1 (Python and the ML workflow); Week 6 (Probability and Bayes).

**Expected artifacts:** Estimate uncertainty for a metric and compare two sampled populations. **Behavioral checks:** Test small samples and explain why correlated observations matter. **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.

## Week 8 - Optimization information and numerical stability

1. Why can scaling features change optimization behavior?
2. Why does naive exponentiation overflow in softmax?
3. How do you distinguish bad optimization from insufficient model capacity?
4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.
5. Delayed transfer: Connect this topic to Week 4 (Matrices transformations and PCA); Week 5 (Derivatives and the chain rule); Week 6 (Probability and Bayes).

**Expected artifacts:** Compare optimizer trajectories and implement stable probability calculations. **Behavioral checks:** Probe large logits tiny probabilities and unsuitable learning rates. **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.

## Week 9 - Evaluation and the ML lifecycle

1. Why can 99 percent accuracy be useless?
2. How can preprocessing contaminate validation folds?
3. How would you turn a business goal into an ML evaluation plan?
4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.
5. Delayed transfer: Connect this topic to Week 6 (Probability and Bayes); Week 7 (Statistics and uncertainty); Week 8 (Optimization information and numerical stability).

**Expected artifacts:** Create split-aware preprocessing and an evaluated baseline. **Behavioral checks:** Include an intentional leak and a majority-class baseline. **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.

## Week 10 - Linear regression

1. Why is polynomial regression still linear in its parameters?
2. Why should you not blindly invert X transpose X?
3. When would a simple regression baseline beat a complex model?
4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.
5. Delayed transfer: Connect this topic to Week 3 (Vectors and linear prediction); Week 5 (Derivatives and the chain rule); Week 9 (Evaluation and the ML lifecycle).

**Expected artifacts:** Implement regression independently and compare with a library model. **Behavioral checks:** Test constant features outliers and held-out error. **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.

## Week 11 - Logistic regression and classification

1. Why is logistic regression a classifier despite its name?
2. Why can a ranking model have good AUC but poor deployed decisions?
3. How would you choose a threshold when false positives are costly?
4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.
5. Delayed transfer: Connect this topic to Week 6 (Probability and Bayes); Week 8 (Optimization information and numerical stability); Week 9 (Evaluation and the ML lifecycle); Week 10 (Linear regression).

**Expected artifacts:** Implement binary logistic regression and select a validation threshold. **Behavioral checks:** Test extreme logits imbalance and threshold sensitivity. **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.

## Week 12 - Trees forests and boosting

1. How do bagging and boosting address different problems?
2. Why can feature importance be misleading with correlated inputs?
3. How would you justify a tree ensemble instead of a neural network?
4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.
5. Delayed transfer: Connect this topic to Week 4 (Matrices transformations and PCA); Week 9 (Evaluation and the ML lifecycle); Week 11 (Logistic regression and classification).

**Expected artifacts:** Compare tree forest and boosting baselines on the same split. **Behavioral checks:** Preserve a baseline and measure important data slices. **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.

## Week 13 - KNN SVM and Naive Bayes

1. What does Naive Bayes assume that is naive?
2. Why can distance become less informative in high dimensions?
3. Which classifier would you select under a strict inference budget?
4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.
5. Delayed transfer: Connect this topic to Week 3 (Vectors and linear prediction); Week 6 (Probability and Bayes); Week 9 (Evaluation and the ML lifecycle); Week 12 (Trees forests and boosting).

**Expected artifacts:** Compare nearest-neighbor and probabilistic text baselines. **Behavioral checks:** Measure latency as the dataset grows and inspect error cases. **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.

## Week 14 - Clustering representation and feature selection

1. Why is a cluster not automatically a meaningful real-world class?
2. Why can a silhouette score reward an unhelpful clustering?
3. How would you evaluate clustering without reliable labels?
4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.
5. Delayed transfer: Connect this topic to Week 3 (Vectors and linear prediction); Week 4 (Matrices transformations and PCA); Week 9 (Evaluation and the ML lifecycle); Week 13 (KNN SVM and Naive Bayes).

**Expected artifacts:** Cluster a public dataset and compare representations. **Behavioral checks:** Test feature-scale changes and inspect unstable cluster assignments. **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.

## Week 15 - Time series anomaly detection and feature stores

1. Why does random splitting often fail for time-series evaluation?
2. How can a feature store return the right value at the wrong time?
3. How would you monitor a model whose labels arrive weeks later?
4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.
5. Delayed transfer: Connect this topic to Week 7 (Statistics and uncertainty); Week 9 (Evaluation and the ML lifecycle); Week 12 (Trees forests and boosting); Week 14 (Clustering representation and feature selection).

**Expected artifacts:** Build a temporal baseline with point-in-time feature validation. **Behavioral checks:** Test future leakage missing features and delayed labels. **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.

## Week 16 - Tensors and activations

1. Why cannot stacked linear layers express arbitrary nonlinear boundaries?
2. Why can sigmoid saturation slow learning?
3. How would you choose an activation given quality and execution constraints?
4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.
5. Delayed transfer: Connect this topic to Week 2 (NumPy and numerical data); Week 3 (Vectors and linear prediction); Week 5 (Derivatives and the chain rule); Week 8 (Optimization information and numerical stability).

**Expected artifacts:** Complete TinyTorch tensor and activation exercises plus an independent trace. **Behavioral checks:** Verify non-square inputs broadcasting and saturated activations. **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.

## Week 17 - Layers losses and data loading

1. How do parameter count and activation storage differ?
2. Why can an incorrect batch reduction change optimization?
3. What belongs in a data loader versus a model layer?
4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.
5. Delayed transfer: Connect this topic to Week 9 (Evaluation and the ML lifecycle); Week 11 (Logistic regression and classification); Week 16 (Tensors and activations).

**Expected artifacts:** Complete TinyTorch layers losses and dataloader exercises. **Behavioral checks:** Test batch size one incomplete batches and label-shape errors. **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.

## Week 18 - Autograd and backpropagation

1. Why does a reused tensor accumulate several gradient contributions?
2. How can keeping computation graphs create growing memory usage?
3. What would you save versus recompute during backward propagation?
4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.
5. Delayed transfer: Connect this topic to Week 5 (Derivatives and the chain rule); Week 16 (Tensors and activations); Week 17 (Layers losses and data loading).

**Expected artifacts:** Complete TinyTorch autograd then build an independent tiny scalar graph. **Behavioral checks:** Gradient-check branching graphs reused inputs and matrix backward passes. **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.

## Week 19 - Optimizers and regularization

1. How is Adam different from a second-order Hessian method?
2. Why are L2 regularization and decoupled weight decay not identical for every optimizer?
3. How would you choose an optimizer under a tight memory budget?
4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.
5. Delayed transfer: Connect this topic to Week 8 (Optimization information and numerical stability); Week 10 (Linear regression); Week 17 (Layers losses and data loading); Week 18 (Autograd and backpropagation).

**Expected artifacts:** Complete TinyTorch optimizers and compare training trajectories. **Behavioral checks:** Test repeated updates state reset and decoupled weight decay. **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.

## Week 20 - Training loops and stability

1. Why is overfitting a tiny batch a useful debugging test?
2. Why can validation behavior change when evaluation mode is missing?
3. How would you prioritize debugging when training suddenly diverges?
4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.
5. Delayed transfer: Connect this topic to Week 9 (Evaluation and the ML lifecycle); Week 17 (Layers losses and data loading); Week 18 (Autograd and backpropagation); Week 19 (Optimizers and regularization).

**Expected artifacts:** Complete TinyTorch training and inject controlled training failures. **Behavioral checks:** Overfit a tiny batch check reproducibility and verify checkpoint resume. **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.

## Week 21 - PyTorch and framework boundaries

1. What does a framework do beyond computing gradients?
2. Why can forgetting zero_grad change an experiment?
3. When is a custom implementation justified versus a mature framework?
4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.
5. Delayed transfer: Connect this topic to Week 2 (NumPy and numerical data); Week 18 (Autograd and backpropagation); Week 19 (Optimizers and regularization); Week 20 (Training loops and stability).

**Expected artifacts:** Port the small network to PyTorch and compare outputs and gradients. **Behavioral checks:** Check parity controlled random seeds and device placement. **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.

## Week 22 - CNNs and transfer learning

1. Why does convolution use fewer parameters than a dense image layer?
2. How can augmentation leak or invalidate evaluation?
3. When would transfer learning be preferable to training from scratch?
4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.
5. Delayed transfer: Connect this topic to Week 4 (Matrices transformations and PCA); Week 16 (Tensors and activations); Week 17 (Layers losses and data loading); Week 20 (Training loops and stability).

**Expected artifacts:** Complete TinyTorch convolution and train a small image classifier. **Behavioral checks:** Verify output shapes compare a simple baseline and inspect failure slices. **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.

## Week 23 - Text processing TF-IDF and retrieval

1. Why can TF-IDF be a strong baseline even beside neural embeddings?
2. How can fitting a vocabulary on all documents contaminate evaluation?
3. How would you choose between lexical and semantic retrieval?
4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.
5. Delayed transfer: Connect this topic to Week 9 (Evaluation and the ML lifecycle); Week 11 (Logistic regression and classification); Week 13 (KNN SVM and Naive Bayes); Week 14 (Clustering representation and feature selection).

**Expected artifacts:** Build a text-classification and keyword-retrieval baseline. **Behavioral checks:** Test unseen words empty documents and training-only vocabulary fitting. **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.

## Week 24 - Embeddings and sequence models

1. What information can a bag-of-words representation not retain?
2. Why can nearest embeddings return a semantically related but wrong answer?
3. How would you evaluate a representation for a specific downstream task?
4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.
5. Delayed transfer: Connect this topic to Week 3 (Vectors and linear prediction); Week 16 (Tensors and activations); Week 18 (Autograd and backpropagation); Week 23 (Text processing TF-IDF and retrieval).

**Expected artifacts:** Compare embedding retrieval with a small recurrent sequence exercise. **Behavioral checks:** Test ordering changes padding and misleading nearest neighbors. **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.

## Week 25 - Subword tokenization and embeddings

1. Why is a token not necessarily a word or a character?
2. How can changing a tokenizer invalidate existing model weights?
3. How would tokenizer choice affect serving latency and cost?
4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.
5. Delayed transfer: Connect this topic to Week 2 (NumPy and numerical data); Week 17 (Layers losses and data loading); Week 23 (Text processing TF-IDF and retrieval); Week 24 (Embeddings and sequence models).

**Expected artifacts:** Complete TinyTorch tokenization and embeddings with round-trip probes. **Behavioral checks:** Test Unicode round trips special tokens and token-length variation. **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.

## Week 26 - Attention and causal masking

1. What do queries keys and values represent computationally?
2. How can a reversed mask let a language model cheat?
3. When does attention become limited by memory rather than arithmetic?
4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.
5. Delayed transfer: Connect this topic to Week 4 (Matrices transformations and PCA); Week 6 (Probability and Bayes); Week 18 (Autograd and backpropagation); Week 25 (Subword tokenization and embeddings).

**Expected artifacts:** Complete TinyTorch attention and hand-trace a tiny masked example. **Behavioral checks:** Test future-token isolation non-square projections and padding masks. **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.

## Week 27 - Transformer architecture

1. How do encoder-only and decoder-only models differ in training objective?
2. Why can a correct-shaped transformer still leak future information?
3. How would you choose architecture for classification versus generation?
4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.
5. Delayed transfer: Connect this topic to Week 16 (Tensors and activations); Week 20 (Training loops and stability); Week 24 (Embeddings and sequence models); Week 26 (Attention and causal masking).

**Expected artifacts:** Complete TinyTorch transformer and assemble a tiny causal model. **Behavioral checks:** Check tensor shapes causal invariance and residual compatibility. **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.

## Week 28 - Pretraining data and checkpoints

1. Why does low training loss not establish a useful language model?
2. What state besides weights is needed to resume training?
3. How would you plan training within a fixed memory and compute budget?
4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.
5. Delayed transfer: Connect this topic to Week 9 (Evaluation and the ML lifecycle); Week 15 (Time series anomaly detection and feature stores); Week 19 (Optimizers and regularization); Week 25 (Subword tokenization and embeddings); Week 27 (Transformer architecture).

**Expected artifacts:** Train a hardware-sized tiny language model with checkpoint resume. **Behavioral checks:** Test train-eval separation exact resume and decoding parameters. **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.

## Week 29 - SFT LoRA and adaptation

1. What does LoRA change and what does it leave unchanged?
2. How can an adapter improve training metrics while harming held-out tasks?
3. When would you choose prompting RAG or fine-tuning?
4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.
5. Delayed transfer: Connect this topic to Week 9 (Evaluation and the ML lifecycle); Week 19 (Optimizers and regularization); Week 27 (Transformer architecture); Week 28 (Pretraining data and checkpoints).

**Expected artifacts:** Run a small adapter or supervised tuning comparison against a baseline. **Behavioral checks:** Inspect trainable parameters evaluate unseen tasks and preserve base behavior. **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.

## Week 30 - Rewards policies and value estimation

1. How is a reward different from a supervised-learning label?
2. Why can a higher measured reward represent worse intended behavior?
3. How would you validate an RL policy before letting it act?
4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.
5. Delayed transfer: Connect this topic to Week 6 (Probability and Bayes); Week 7 (Statistics and uncertainty); Week 9 (Evaluation and the ML lifecycle); Week 19 (Optimizers and regularization).

**Expected artifacts:** Implement a small controlled-environment policy or Q-learning experiment. **Behavioral checks:** Compare independent evaluation episodes and detect reward exploitation. **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.

## Week 31 - Preference optimization and evaluation

1. How does DPO avoid explicitly training a separate reward model?
2. Why can a model optimize a judge rather than the desired behavior?
3. How would you measure useful behavior beyond preference win rate?
4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.
5. Delayed transfer: Connect this topic to Week 6 (Probability and Bayes); Week 8 (Optimization information and numerical stability); Week 28 (Pretraining data and checkpoints); Week 29 (SFT LoRA and adaptation); Week 30 (Rewards policies and value estimation).

**Expected artifacts:** Implement a small preference-loss calculation and audit paired examples. **Behavioral checks:** Test pair reversal reference handling and contaminated evaluation. **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.

## Week 32 - Audio and speech fundamentals

1. Why does a spectrogram differ from a raw waveform?
2. How can resampling or chunk boundaries corrupt a streaming pipeline?
3. What metrics would you use for a real-time voice service?
4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.
5. Delayed transfer: Connect this topic to Week 2 (NumPy and numerical data); Week 7 (Statistics and uncertainty); Week 22 (CNNs and transfer learning); Week 25 (Subword tokenization and embeddings).

**Expected artifacts:** Build a small audio-feature pipeline and score a transcript comparison. **Behavioral checks:** Test sample-rate mismatch silence and segmentation boundaries. **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.

## Week 33 - Generative models and diffusion

1. How does generation differ from classification?
2. Why can a generation metric improve while users prefer the old model?
3. How would you choose a small generative-model experiment without huge hardware?
4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.
5. Delayed transfer: Connect this topic to Week 6 (Probability and Bayes); Week 8 (Optimization information and numerical stability); Week 17 (Layers losses and data loading); Week 20 (Training loops and stability); Week 27 (Transformer architecture).

**Expected artifacts:** Implement a tiny autoencoder or denoising experiment. **Behavioral checks:** Inspect reconstruction overfitting diversity and evaluation limitations. **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.

## Week 34 - Multimodal and edge constraints

1. Why does connecting modalities require more than concatenating inputs?
2. How can a vision-language model ignore the image and still look correct?
3. When would edge inference beat sending all inputs to a server?
4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.
5. Delayed transfer: Connect this topic to Week 22 (CNNs and transfer learning); Week 24 (Embeddings and sequence models); Week 26 (Attention and causal masking); Week 32 (Audio and speech fundamentals); Week 33 (Generative models and diffusion).

**Expected artifacts:** Compare text-only and multimodal document retrieval on a small public sample. **Behavioral checks:** Test missing modalities misleading images and resource estimates. **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.

## Week 35 - Data engineering selection and lineage

1. Why can better data beat a larger model?
2. How can silent schema changes preserve API health but ruin predictions?
3. How would you prioritize labeling or data-cleaning work?
4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.
5. Delayed transfer: Connect this topic to Week 9 (Evaluation and the ML lifecycle); Week 14 (Clustering representation and feature selection); Week 15 (Time series anomaly detection and feature stores); Week 28 (Pretraining data and checkpoints).

**Expected artifacts:** Version the earlier dataset and implement reproducible ingestion checks. **Behavioral checks:** Test schema changes duplicates missing values and source lineage. **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.

## Week 36 - Retrieval metrics and regression analysis

1. Why does ranking order matter beyond recall at k?
2. How can aggregate retrieval scores hide a critical regression?
3. How would you build trustworthy relevance judgments for your product?
4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.
5. Delayed transfer: Connect this topic to Week 7 (Statistics and uncertainty); Week 9 (Evaluation and the ML lifecycle); Week 23 (Text processing TF-IDF and retrieval); Week 24 (Embeddings and sequence models).

**Expected artifacts:** Complete the Retrieval Evaluation Lab with independent ranking cases. **Behavioral checks:** Expose a per-query regression hidden by an improving mean. **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.

## Week 37 - RAG ingestion retrieval and answers

1. Why does retrieved evidence not guarantee a correct answer?
2. How can a stale index generate a plausible but outdated answer?
3. How would you decide whether the problem actually needs RAG?
4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.
5. Delayed transfer: Connect this topic to Week 15 (Time series anomaly detection and feature stores); Week 23 (Text processing TF-IDF and retrieval); Week 29 (SFT LoRA and adaptation); Week 35 (Data engineering selection and lineage); Week 36 (Retrieval metrics and regression analysis).

**Expected artifacts:** Build a public-document QA system with lexical and embedding baselines. **Behavioral checks:** Separate retrieval quality from answer quality and test unanswerable queries. **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.

## Week 38 - Chunking hybrid retrieval and reranking

1. Why can larger chunks improve context but worsen retrieval?
2. How can a reranker improve relevance while making the service unusable?
3. Which retrieval stage would you optimize under a strict latency budget?
4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.
5. Delayed transfer: Connect this topic to Week 3 (Vectors and linear prediction); Week 24 (Embeddings and sequence models); Week 25 (Subword tokenization and embeddings); Week 36 (Retrieval metrics and regression analysis); Week 37 (RAG ingestion retrieval and answers).

**Expected artifacts:** Compare chunking and retrieval configurations on fixed evaluation queries. **Behavioral checks:** Measure per-query changes quality latency and indexing cost. **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.

## Week 39 - Structured outputs and application evaluation

1. Why is valid JSON not the same as a correct task result?
2. How can retries hide a persistent model failure?
3. How would you compare an LLM workflow with a deterministic alternative?
4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.
5. Delayed transfer: Connect this topic to Week 9 (Evaluation and the ML lifecycle); Week 23 (Text processing TF-IDF and retrieval); Week 31 (Preference optimization and evaluation); Week 36 (Retrieval metrics and regression analysis); Week 37 (RAG ingestion retrieval and answers).

**Expected artifacts:** Add typed output validation and an application-specific evaluation suite. **Behavioral checks:** Test malformed output unsupported claims and flaky evaluator behavior. **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.

## Week 40 - Profiling and hardware constraints

1. Why can a GPU be busy without doing useful model work?
2. How can timing only a kernel misrepresent user-facing latency?
3. Would you optimize compute memory transfer or preprocessing first?
4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.
5. Delayed transfer: Connect this topic to Week 2 (NumPy and numerical data); Week 17 (Layers losses and data loading); Week 18 (Autograd and backpropagation); Week 20 (Training loops and stability); Week 28 (Pretraining data and checkpoints).

**Expected artifacts:** Complete TinyTorch profiling and profile a real local model pipeline. **Behavioral checks:** Separate preprocessing queueing model work and output handling. **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.

## Week 41 - Quantization and compression

1. Why does a smaller model not necessarily run faster?
2. How can calibration data make quantization fail on a rare slice?
3. How would you select precision for a quality-critical serving workload?
4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.
5. Delayed transfer: Connect this topic to Week 8 (Optimization information and numerical stability); Week 12 (Trees forests and boosting); Week 19 (Optimizers and regularization); Week 35 (Data engineering selection and lineage); Week 40 (Profiling and hardware constraints).

**Expected artifacts:** Complete TinyTorch quantization and compression with baseline comparisons. **Behavioral checks:** Measure quality memory and actual execution time separately. **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.

## Week 42 - Kernels caching and recomputation

1. What is the difference between caching model outputs and caching KV state?
2. Why can a cache improve latency but produce incorrect results?
3. When is recomputing cheaper than keeping intermediate state?
4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.
5. Delayed transfer: Connect this topic to Week 18 (Autograd and backpropagation); Week 25 (Subword tokenization and embeddings); Week 26 (Attention and causal masking); Week 28 (Pretraining data and checkpoints); Week 40 (Profiling and hardware constraints); Week 41 (Quantization and compression).

**Expected artifacts:** Complete TinyTorch acceleration and memoization with correctness checks. **Behavioral checks:** Compare cached uncached paths and invalidation after an input change. **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.

## Week 43 - Benchmarking and model serving

1. Why does average latency hide production failures?
2. How can the benchmark client become the bottleneck?
3. What evidence would justify a claim that a service handles a target load?
4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.
5. Delayed transfer: Connect this topic to Week 7 (Statistics and uncertainty); Week 9 (Evaluation and the ML lifecycle); Week 39 (Structured outputs and application evaluation); Week 40 (Profiling and hardware constraints); Week 42 (Kernels caching and recomputation).

**Expected artifacts:** Complete TinyTorch benchmarking and expose a real local model API. **Behavioral checks:** Run varied-input load tests with baseline and positive controls. **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.

## Week 44 - Capacity planning and LLM serving

1. Why do training and serving prefer different utilization targets?
2. Why can identical prompts inflate serving capacity claims?
3. How would you choose a serving engine and batching policy?
4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.
5. Delayed transfer: Connect this topic to Week 25 (Subword tokenization and embeddings); Week 26 (Attention and causal masking); Week 28 (Pretraining data and checkpoints); Week 40 (Profiling and hardware constraints); Week 42 (Kernels caching and recomputation); Week 43 (Benchmarking and model serving).

**Expected artifacts:** Compare serving configurations under steady ramp spike and bounded soak loads. **Behavioral checks:** Measure tail latency cache diversity and memory growth. **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.

## Week 45 - Monitoring drift and delayed feedback

1. How can every health check be green while a model is wrong?
2. Why does detecting drift not prove accuracy has fallen?
3. When should a monitoring signal trigger investigation versus retraining?
4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.
5. Delayed transfer: Connect this topic to Week 9 (Evaluation and the ML lifecycle); Week 15 (Time series anomaly detection and feature stores); Week 35 (Data engineering selection and lineage); Week 43 (Benchmarking and model serving); Week 44 (Capacity planning and LLM serving).

**Expected artifacts:** Add prediction-quality and input monitors to the existing service. **Behavioral checks:** Inject schema skew and distribution shift without crashing the API. **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.

## Week 46 - Releases registries and rollback

1. What must be versioned beyond model weights?
2. How can a rollback fail even when the old model file exists?
3. How would you stage a release when outcomes arrive slowly?
4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.
5. Delayed transfer: Connect this topic to Week 15 (Time series anomaly detection and feature stores); Week 28 (Pretraining data and checkpoints); Week 35 (Data engineering selection and lineage); Week 43 (Benchmarking and model serving); Week 45 (Monitoring drift and delayed feedback).

**Expected artifacts:** Implement local model-version switching and a reproducible rollback exercise. **Behavioral checks:** Reject a quality regression and restore a known-good model. **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.

## Week 47 - Security privacy fairness and auditability

1. Why are model instructions not an authorization boundary?
2. How can aggregate accuracy conceal a harmful subgroup failure?
3. How would you prioritize controls for a sensitive-data ML service?
4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.
5. Delayed transfer: Connect this topic to Week 6 (Probability and Bayes); Week 9 (Evaluation and the ML lifecycle); Week 31 (Preference optimization and evaluation); Week 35 (Data engineering selection and lineage); Week 37 (RAG ingestion retrieval and answers); Week 45 (Monitoring drift and delayed feedback).

**Expected artifacts:** Enforce source access checks and document model data and system limits. **Behavioral checks:** Test unauthorized retrieval redaction paths and subgroup evaluation. **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.

## Week 48 - Conventional ML service integration

1. What evidence shows this is an ML system rather than just an API demo?
2. How would you isolate data corruption from a model or infrastructure bug?
3. What would you change first at ten times traffic?
4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.
5. Delayed transfer: Connect this topic to Week 9 (Evaluation and the ML lifecycle); Week 15 (Time series anomaly detection and feature stores); Week 20 (Training loops and stability); Week 35 (Data engineering selection and lineage); Week 43 (Benchmarking and model serving); Week 45 (Monitoring drift and delayed feedback); Week 46 (Releases registries and rollback); Week 47 (Security privacy fairness and auditability).

**Expected artifacts:** Integrate the tabular or vision service with tests telemetry release and recovery. **Behavioral checks:** Demonstrate malformed inputs quality regression load and rollback. **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.

## Week 49 - Tool contracts and MCP

1. Why is a tool schema necessary but insufficient for safety?
2. How can a successful transport response still represent a failed operation?
3. When does an MCP interface help more than a plain function call?
4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.
5. Delayed transfer: Connect this topic to Week 1 (Python and the ML workflow); Week 39 (Structured outputs and application evaluation); Week 43 (Benchmarking and model serving); Week 47 (Security privacy fairness and auditability).

**Expected artifacts:** Build a small read-only tool interface with contract tests. **Behavioral checks:** Reject invalid arguments unauthorized calls and misleading tool metadata. **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.

## Week 50 - Agent loops and state machines

1. When is an agent justified over a fixed workflow?
2. How can an agent report completion without completing the task?
3. What state must survive a process restart?
4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.
5. Delayed transfer: Connect this topic to Week 28 (Pretraining data and checkpoints); Week 37 (RAG ingestion retrieval and answers); Week 39 (Structured outputs and application evaluation); Week 46 (Releases registries and rollback); Week 49 (Tool contracts and MCP).

**Expected artifacts:** Build a bounded read-only research workflow before adding autonomy. **Behavioral checks:** Test tool failure stale state exhausted budgets and resume. **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.

## Week 51 - Trace debugging and agent evaluation

1. Why is a fluent final answer not an agent success metric?
2. How can overlapping spans make naive latency sums wrong?
3. How would you evaluate an agent when several valid trajectories exist?
4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.
5. Delayed transfer: Connect this topic to Week 7 (Statistics and uncertainty); Week 31 (Preference optimization and evaluation); Week 36 (Retrieval metrics and regression analysis); Week 39 (Structured outputs and application evaluation); Week 40 (Profiling and hardware constraints); Week 50 (Agent loops and state machines).

**Expected artifacts:** Implement a trace report and agent-specific offline evaluation cases. **Behavioral checks:** Detect double-counted tokens hidden failing spans and task regressions. **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.

## Week 52 - Durability budgets and coordination

1. Why can retrying an apparently failed action duplicate side effects?
2. How can adding agents reduce reliability instead of improving it?
3. What evidence would justify multi-agent coordination?
4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.
5. Delayed transfer: Connect this topic to Week 15 (Time series anomaly detection and feature stores); Week 46 (Releases registries and rollback); Week 47 (Security privacy fairness and auditability); Week 49 (Tool contracts and MCP); Week 50 (Agent loops and state machines); Week 51 (Trace debugging and agent evaluation).

**Expected artifacts:** Add bounded recovery to the agent and compare one coordination pattern. **Behavioral checks:** Test repeated callbacks partial failure and budget exhaustion. **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.

## Week 53 - Compute networks and storage

1. Why can a dataset be large without requiring distributed model computation?
2. How can faster accelerators expose a storage bottleneck?
3. What would justify distribution for memory versus calendar-time constraints?
4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.
5. Delayed transfer: Connect this topic to Week 15 (Time series anomaly detection and feature stores); Week 28 (Pretraining data and checkpoints); Week 35 (Data engineering selection and lineage); Week 40 (Profiling and hardware constraints); Week 44 (Capacity planning and LLM serving).

**Expected artifacts:** Model a training resource budget and measure a small data pipeline. **Behavioral checks:** Distinguish estimates from actual throughput and account for all retained state. **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.

## Week 54 - Collectives and data-parallel training

1. Why must workers agree on update semantics?
2. How can averaging gradients twice change the effective learning rate?
3. When would additional workers make training slower?
4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.
5. Delayed transfer: Connect this topic to Week 5 (Derivatives and the chain rule); Week 17 (Layers losses and data loading); Week 19 (Optimizers and regularization); Week 28 (Pretraining data and checkpoints); Week 53 (Compute networks and storage).

**Expected artifacts:** Run a small CPU multi-process data-parallel training experiment. **Behavioral checks:** Compare against a matched single-worker update and measure overhead. **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.

## Week 55 - Sharding and hybrid parallelism

1. How does sharding differ from adding replicated data-parallel workers?
2. Why can a model fit after sharding but train more slowly?
3. How would you map a parallelism strategy onto bandwidth tiers?
4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.
5. Delayed transfer: Connect this topic to Week 18 (Autograd and backpropagation); Week 19 (Optimizers and regularization); Week 27 (Transformer architecture); Week 28 (Pretraining data and checkpoints); Week 53 (Compute networks and storage); Week 54 (Collectives and data-parallel training).

**Expected artifacts:** Compare analytical memory budgets and one feasible sharding exercise. **Behavioral checks:** Check parameter-state accounting and explain communication dependencies. **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.

## Week 56 - Fault tolerance fleet serving and responsible scale

1. What recovery guarantees does a checkpoint actually provide?
2. How can a retry storm spread failure across a fleet?
3. How would you trade spare capacity recovery time cost and energy?
4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.
5. Delayed transfer: Connect this topic to Week 28 (Pretraining data and checkpoints); Week 43 (Benchmarking and model serving); Week 45 (Monitoring drift and delayed feedback); Week 46 (Releases registries and rollback); Week 47 (Security privacy fairness and auditability); Week 52 (Durability budgets and coordination); Week 54 (Collectives and data-parallel training); Week 55 (Sharding and hybrid parallelism).

**Expected artifacts:** Inject a worker failure and design a measured small-scale recovery plan. **Behavioral checks:** Verify restart state identify lost work and separate simulated fleet claims. **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.

## Week 57 - AI application integration

1. Why is the selected architecture better than a simpler baseline?
2. How would you trace an incorrect answer to a retrieval or generation failure?
3. What product-specific evidence would block a release?
4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.
5. Delayed transfer: Connect this topic to Week 29 (SFT LoRA and adaptation); Week 35 (Data engineering selection and lineage); Week 36 (Retrieval metrics and regression analysis); Week 37 (RAG ingestion retrieval and answers); Week 38 (Chunking hybrid retrieval and reranking); Week 39 (Structured outputs and application evaluation); Week 47 (Security privacy fairness and auditability); Week 50 (Agent loops and state machines); Week 51 (Trace debugging and agent evaluation).

**Expected artifacts:** Integrate the public-document QA capstone using prior components. **Behavioral checks:** Test stale missing unauthorized and conflicting evidence. **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.

## Week 58 - AI application load and recovery

1. Why is higher throughput not always better goodput?
2. How can a cached answer outlive its source authorization or freshness?
3. How would you respond to a latency spike without hiding quality regressions?
4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.
5. Delayed transfer: Connect this topic to Week 42 (Kernels caching and recomputation); Week 43 (Benchmarking and model serving); Week 44 (Capacity planning and LLM serving); Week 45 (Monitoring drift and delayed feedback); Week 46 (Releases registries and rollback); Week 52 (Durability budgets and coordination); Week 56 (Fault tolerance fleet serving and responsible scale); Week 57 (AI application integration).

**Expected artifacts:** Load-test the integrated AI service and exercise local rollback and recovery. **Behavioral checks:** Record quality floors tail latency unit cost and a reproducible incident. **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.

## Week 59 - Measured optimization and engineering defense

1. What evidence distinguishes a real optimization from a benchmark trick?
2. How can an optimization fail when the request distribution changes?
3. Which optimization would you reject despite a headline speedup?
4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.
5. Delayed transfer: Connect this topic to Week 9 (Evaluation and the ML lifecycle); Week 40 (Profiling and hardware constraints); Week 41 (Quantization and compression); Week 42 (Kernels caching and recomputation); Week 43 (Benchmarking and model serving); Week 44 (Capacity planning and LLM serving); Week 55 (Sharding and hybrid parallelism); Week 58 (AI application load and recovery).

**Expected artifacts:** Complete a hardware-feasible TinyTorch capstone and defend an optimization. **Behavioral checks:** Preserve quality checks show before-after measurements and report limitations. **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.

## Week 60 - Full mocks and delayed mastery review

1. How would you choose data model and serving architecture for an unfamiliar problem?
2. How would you debug a correct-looking service with declining business outcomes?
3. What remains unproven about your production readiness and how would you test it?
4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.
5. Delayed transfer: Connect this topic to Week 9 (Evaluation and the ML lifecycle); Week 18 (Autograd and backpropagation); Week 28 (Pretraining data and checkpoints); Week 36 (Retrieval metrics and regression analysis); Week 43 (Benchmarking and model serving); Week 45 (Monitoring drift and delayed feedback); Week 48 (Conventional ML service integration); Week 54 (Collectives and data-parallel training); Week 57 (AI application integration); Week 58 (AI application load and recovery); Week 59 (Measured optimization and engineering defense).

**Expected artifacts:** Complete a closed-book coding mock and two system-design defenses. **Behavioral checks:** Use unfamiliar variations recheck old weaknesses and preserve actual answers. **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.

