# Exam 2 — Master Question & Answer Sheet

---

## Section 1: Matching

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

## Section 2: Multiple Choice

*(Answer sheets only — refer to original exam for question text)*

| Version | Q1 | Q2 | Q3 | Q4 | Q5 | Q6 | Q7 | Q8 | Q9 | Q10 | Q11 |
|---------|----|----|----|----|----|----|----|----|-----|-----|-----|
| A | b | c | c | a | d | c | d | c | d | d | a |
| B | d | c | c | a | c | d | c | d | a | d | b |
| C | c | a | b | d | a | c | c | d | c | d | d |
| D | d | c | c | c | d | d | b | c | a | d | a |

---

## Section 3: Short Answer

**Q1. Why can accuracy be a misleading metric for some classification problems?**

Poorly-fitting models with a worrying number of false positives/negatives can still achieve high accuracy when the dataset has a skewed class distribution.

---

**Q2. What are the tradeoffs between the Normal Equation and Gradient Descent for a large dataset?**

The Normal Equation is guaranteed to be optimal, but becomes incredibly costly in computation and memory with many features/instances. Gradient descent (e.g., stochastic gradient descent) avoids these issues but offers no guarantee of optimality and requires careful hyperparameter tuning.

---

**Q3. Give a high-level description of how gradient descent works.**

The model computes the direction in which changes to the parameters would lower error, then adjusts the parameters to move in that direction, iterating until convergence.

---

**Q4. How do total epochs and learning rate each affect model training?**

Total epochs determines how long the model trains, affecting whether it underfits or overfits based on total parameter updates. Learning rate controls how large each update is — too small leads to slow training, too large causes the model to diverge and train poorly.

---

**Q5. Given a small dataset, how would you split the data and evaluate the model during training?**

An 80/20 train/test split is reasonable (as low as 70/30 with justification). Stratified sampling could also be used. Evaluation during training can be done via a held-out validation set or k-fold cross-validation.

---

**Q6. Compare and contrast One-versus-One and One-versus-All classifiers.**

One-versus-One trains a binary classifier for every combination of output classes, has them compete round-robin, and selects the class with the most "victories." One-versus-All trains n classifiers for n classes in the form "class i or not class i," and selects the class whose classifier is most confident.

---

**Q7. Compute the model output: weights = [−2, 4, 1], inputs = [0, 3]**

−2 + 4(0) + 1(3) = **1**

---

**Q8. Should you use ordinal or one-hot encoding for a t-shirt size feature (S, M, L, XL)? Why?**

Ordinal encoding is the better choice because it preserves the relative ordering of sizes (e.g., S=1, M=2, L=3, XL=4), which is likely valuable to the model. One-hot encoding would discard this ordering information. (One-hot can receive full credit with a detailed, specific justification.)

---

**Q9. For a security classifier, would you prioritize precision, recall, or F1-score? Why?**

Any of the three can be correct with proper justification. High precision limits costly false positives (unnecessary police calls). High recall ensures no unauthorized person gets through. F1-score is reasonable if both priorities are weighted equally. The focus is on thoughtful justification.

---

**Q10. Why do ML practitioners seek out differentiable functions for use in their models?**

Differentiable functions allow for easy gradient (derivative) computation, which is essential for gradient descent during model training.