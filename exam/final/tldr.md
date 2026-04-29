# Master Answer Key — All Exams

---

# EXAM 1 (Neural Networks)

## Matching

| Term | Answer |
|------|--------|
| Variance | Tendency to Overfit |
| Binary Cross-Entropy | Log Loss |
| Backward Pass | Gradient Calculation |
| Tanh | Zero-Centered |
| Learning Curve | Line Chart |
| Dense Layer | Hidden or Fully-Connected |
| Regularization | LASSO Regression |
| Bias | Model Simplicity/Assumptions |
| Sigmoid | Logistic Function |
| sgn(z) | Perceptrons |
| Forward Pass | model(X_batch) |
| Softmax | 0.08 0.03 0.02 0.87 |

---

## Multiple Choice Answer Sheet

| Version | Q1 | Q2 | Q3 | Q4 | Q5 | Q6 | Q7 | Q8 | Q9 | Q10 | Q11 |
|---------|----|----|----|----|----|----|----|----|-----|-----|-----|
| A | b | b | c | a | d | d | a | d | b | a | c |
| B | d | b | a | a | b | d | b | d | c | c | a |
| C | a | d | b | a | c | c | d | a | b | b | d |
| D | c | a | d | a | d | a | b | c | b | b | d |

---

## Short Answer

**Q1. How do we use learning curves to assess model fit?**

We look for gaps between the training and validation set curves. A noticeable gap suggests overfitting. If they are close together, training is going well in terms of overfit/underfit.

---

**Q2. Give two reasons why ReLU can improve model training speed.**

1. It is very quick to compute — the output is simply 0 or the input value itself.
2. Its derivative is very quick to compute during gradient descent — it is either 0 or 1.

---

**Q3. Give a high-level overview of backpropagation.**

Backpropagation calculates gradients (derivatives of loss with respect to weights) using a loss function that compares predictions to ground truth. That information is sent backwards through the network layer by layer, and at the end the weights are updated accordingly.

---

**Q4. Describe the functionality of the DataLoader class in PyTorch.**

The DataLoader class provides batches of data during the training loop and handles batch size, shuffling, and iteration over the dataset.

---

**Q5. Compare and contrast Scikit-Learn and PyTorch. Give one advantage and one disadvantage for each.**

Scikit-Learn is quick to prototype and evaluate, but limited in customization. PyTorch is highly customizable and can run faster, but is complex to use and doesn't integrate as cleanly with existing sklearn libraries.

---

**Q6. Why do ML practitioners seek out differentiable functions for their models?**

Differentiable functions allow for easy gradient (derivative) computation, which is essential for gradient descent during model training.

---

**Q7. For a feed-forward network with n hidden layers each with 100 neurons, how many biases does the model have (in terms of n)?**

There will be 100n biases, since there are 100n total neurons and each requires its own bias term. (Technically 100n + k for k output nodes, but either is accepted.)

---

**Q8. Summarize in one sentence how data flows through this forward() function.**

```python
def forward(self, x):
    h1 = self.hidden1(x)
    c1 = torch.cat([h1, x], dim=1)
    h2 = self.hidden2(c1)
    c2 = torch.cat([h2, x], dim=1)
    h3 = self.hidden3(c2)
    c3 = torch.cat([h3, x], dim=1)
    out = self.output(c3)
    return out
```

The original input x is appended to the output of each fully-connected layer before being passed into the next, ultimately producing a single output value.

---

**Q9. What is the purpose of α in the Ridge regression cost function?**

$$J(\theta) = \text{MSE}(\theta) + \alpha \sum_{i=1}^{n}(\theta_i)^2$$

α controls the amount of regularization applied — it scales the impact of the regularization term on the overall cost function.

---

**Q10. What is the difference between `__init__(self)` and `forward()` in a custom nn.Module class?**

`__init__(self)` declares the layers and components the model will use. `forward()` defines how data actually flows through those components during a forward pass in the training loop.

---

**Q11. What occurs when `loss.backward()` is called during model training in PyTorch?**

Gradients are computed (derivatives of the loss with respect to each weight in the network).

---

**Q12. If using early stopping during model training, when should training be halted?**

After loss has not decreased for n epochs — training is stopped once improvement stalls for a defined number of consecutive epochs.

---

**Q13. What term best describes a neural network with one hidden layer of 1000 neurons?**

Wide Network — it has many neurons in a single layer rather than many layers.

---

**Q14. Consider the modified Hebbian learning equation below. Which statement about it is true?**

$$w^{(\text{next})}_{i,j} = w_{i,j} + \eta(y_j - \hat{y}_j)x_i$$

A correct prediction leads to no weight change — when $y_j = \hat{y}_j$, the error term $(y_j - \hat{y}_j) = 0$, so the weight update is zero.

---

---

# EXAM 2 (ML Fundamentals — Gradient Descent, Classification, Regression)

## Matching

| Term | Answer |
|------|--------|
| Normal Equation | Precisely calculating a set of parameters that minimizes error |
| Gradient Descent | Iteratively finding a set of parameters that minimizes error |
| Randomized Search | Finding highly-effective combinations of hyperparameters |
| Scatterplot Matrix | Gaining insights during data exploration |
| Stratified Sampling | Making sure the test set has a representative distribution |
| F1-Score | Numerically evaluating a classification model |
| Confusion Matrix | Identifying which classes a classifier is struggling with |
| Regularization | Simplifying a model to reduce the likelihood of overfitting |
| RMSE | Numerically evaluating a regression model |
| Learning Rate | Impacts the amount of parameter changes in each iteration |
| Cross-Validation | Evaluating a model and detecting overfitting |
| Pipeline | Streamlines code by merging preprocessing and model fitting |

---

## Multiple Choice Answer Sheet

| Version | Q1 | Q2 | Q3 | Q4 | Q5 | Q6 | Q7 | Q8 | Q9 | Q10 | Q11 |
|---------|----|----|----|----|----|----|----|----|-----|-----|-----|
| A | b | c | c | a | d | c | d | c | d | d | a |
| B | d | c | c | a | c | d | c | d | a | d | b |
| C | c | a | b | d | a | c | c | d | c | d | d |
| D | d | c | c | c | d | d | b | c | a | d | a |

---

## Short Answer

**Q1. Why can accuracy be a misleading metric for some classification problems?**

Models with a worrying number of false positives/negatives can still achieve high accuracy when the dataset has a skewed class distribution — a model that always predicts the majority class would appear highly accurate while being useless.

---

**Q2. What are the tradeoffs between the Normal Equation and Gradient Descent for a large dataset?**

The Normal Equation is guaranteed to find the global optimum, but becomes incredibly costly in computation and memory with many features/instances. Gradient descent avoids these issues but offers no guarantee of optimality and requires careful hyperparameter tuning.

---

**Q3. Give a high-level description of how gradient descent works.**

The model computes the direction in which changes to the parameters would lower error, then adjusts the parameters to move in that direction, iterating until convergence.

---

**Q4. How do total epochs and learning rate each affect model training?**

Total epochs determines how long the model trains, affecting whether it underfits or overfits. Learning rate controls how large each parameter update is — too small leads to slow training, too large causes the model to diverge and train poorly.

---

**Q5. Given a small dataset, how would you split the data and evaluate the model during training?**

An 80/20 train/test split is reasonable (as low as 70/30 with justification). Stratified sampling could also be used. Evaluation during training can be done via a held-out validation set or k-fold cross-validation.

---

**Q6. Compare and contrast One-versus-One and One-versus-All classifiers.**

One-versus-One trains a binary classifier for every combination of output classes, has them compete round-robin, and selects the class with the most "victories." One-versus-All trains n classifiers in the form "class i or not class i," and selects the class whose classifier is most confident.

---

**Q7. Compute the model output: weights = [−2, 4, 1], inputs = [0, 3]**

−2 + 4(0) + 1(3) = **1**

---

**Q8. Should you use ordinal or one-hot encoding for a t-shirt size feature (S, M, L, XL)? Why?**

Ordinal encoding is the better choice because it preserves the relative ordering of sizes (S=1, M=2, L=3, XL=4), which is likely valuable to the model. One-hot encoding discards this ordering. (One-hot accepted with detailed justification.)

---

**Q9. For a security classifier, would you prioritize precision, recall, or F1-score? Why?**

Any of the three can be correct with proper justification. High precision limits costly false positives (unnecessary police calls). High recall ensures no unauthorized person gets through. F1-score is reasonable if both are weighted equally. The focus is on thoughtful justification.

---

---

# PRACTICE EXAM 1 (Neural Networks — Extended)

## Multiple Choice Answer Sheet

| Q# | Answer | Detail |
|----|--------|--------|
| 6 | (a) | Heaviside activation function visualization |
| 7 | (b) | Gradients are computed |
| 8 | (c) | After loss has not decreased for n epochs |
| 9 | (d) | Wide Network |
| 10 | (b) | 55 total parameters |
| 11 | (d) | A correct prediction leads to no weight change |

---

*(Short answers for Practice Exam 1 are covered above in Exam 1 — no new unique questions.)*

---

# PRACTICE EXAM 2 (ML Fundamentals — Extended)

## Multiple Choice Answer Sheet

| Q# | Answer | Detail |
|----|--------|--------|
| 6 | (d) | Average Distance Walked per Person — new derived feature |
| 7 | (d) | ‖t‖₂ = √14 |
| 8 | (c) | u · v = −9 |
| 9 | (b) | Minimizing total error across training data |
| 10 | (d) | MSE — squaring penalizes outliers heavily |
| 11 | (a) | Predicting model performance on unseen data |

---

## Short Answer

**Q1. Give one example where recall is prioritized over precision.**

A situation where false negatives are especially costly — for example, cancer detection, where missing a positive case is far more dangerous than a false alarm.

---

**Q2. Your binary classifier produces too many false positives. How should you adjust the threshold?**

Increase the threshold — this requires higher confidence before a positive prediction, which reduces false positives at the cost of potentially more false negatives.

---

**Q3. What does the following Python snippet do, and what is the result?**

```python
nums = [t*2 for t in range(4)]
```

This is a list comprehension that iterates over 0, 1, 2, 3 and multiplies each by 2. The result is `[0, 2, 4, 6]`.

---

**Q4. What is the difference between multiclass and multilabel classification?**

Multiclass means a single output can take one of more than two class values. Multilabel means the model predicts multiple independent binary outputs simultaneously (e.g., an image tagged as both "cat" and "indoors").

---

**Q5. You need to train on 10 million rows but your computer can't hold all data at once. Which gradient descent method should you use and why?**

Mini-batch or stochastic gradient descent — both process data in small chunks rather than loading the full dataset, making them feasible under memory constraints. Mini-batch is generally preferred as it balances memory efficiency with stable gradient estimates.

---

**Q6. State one benefit of using the closed-form solution over gradient descent for linear regression.**

The closed-form solution is guaranteed to find the global optimum directly — no risk of local minima, and no hyperparameters like learning rate to tune.

---

**Q7. Describe one strength and one weakness of k-fold cross-validation. When is each most important?**

**Strength:** Allows evaluation without needing a separate validation set — most valuable when the dataset is small. **Weakness:** Requires training k models, which is time-consuming for complex models or large datasets.

---

**Q8. You notice almost all features are highly correlated in your scatterplot matrix. What preprocessing step would you take?**

Apply dimensionality reduction such as PCA — high correlation indicates redundant features, and PCA compresses the information into fewer uncorrelated components.

---

**Q9. Why is accuracy a poor metric for evaluating model performance?**

Models with a worrying number of false positives/negatives can still achieve high accuracy when the dataset has a skewed class distribution.