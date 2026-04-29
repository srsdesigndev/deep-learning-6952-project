# Exam B — Answer Key

---

## Section 1: Matching (2pts each, 10 best = 20pts)

Match each term to its best-corresponding description or associated term(s).

| # | Term | Answer |
|---|------|--------|
| 1 | Regularization | (a) Simplifying a model to reduce the likelihood of overfitting |
| 2 | RMSE | (e) Numerically evaluating a regression model |
| 3 | Gradient Descent | (j) Iteratively finding a set of parameters that minimizes error |
| 4 | F1-Score | (c) Numerically evaluating a classification model |
| 5 | Scatterplot Matrix | (b) Gaining insights during data exploration |
| 6 | Pipeline | (h) Streamlines code by merging preprocessing and model fitting |
| 7 | Stratified Sampling | (g) Making sure the test set has a representative distribution |
| 8 | Normal Equation | (d) Precisely calculating a set of parameters that minimizes error |
| 9 | Randomized Search | (i) Finding highly-effective combinations of hyperparameters |
| 10 | Cross-Validation | (l) Evaluating a model and detecting overfitting |
| 11 | Confusion Matrix | (k) Identifying which classes a classifier is struggling with |
| 12 | Learning Rate | (f) Impacts the amount of parameter changes in each iteration |

---

## Section 2: Multiple Choice (4pts each, 10 best = 40pts)

| Q# | Answer |
|----|--------|
| 1 | **(d)** |
| 2 | **(c)** |
| 3 | **(c)** |
| 4 | **(a)** |
| 5 | **(c)** |
| 6 | **(d)** |
| 7 | **(c)** |
| 8 | **(d)** |
| 9 | **(a)** |
| 10 | **(d)** |
| 11 | **(b)** |

> **Note:** The original answer key does not include the full question text for Section 2. Refer to the original exam for the corresponding questions.

---

## Section 3: Short Answer (5pts each, 8 best = 40pts)

**Q1. Should you use ordinal encoding or one-hot encoding for a t-shirt size feature (S, M, L, XL)? Why?**

**Answer:** Ordinal encoding is the better choice because it preserves the relative ordering of sizes (e.g., small = 1, medium = 2, ...), which is likely valuable information for the model since larger sizes may cost more to produce. One-hot encoding would lose this ordering information. (Full credit may also be given if a student chooses one-hot encoding with a detailed, specific justification.)

**Rubric:** 5pts (fully correct) | 3pts (partially correct) | 2pts (incorrect but reasonable) | 1pt (minimal explanation) | 0pts (no answer)

---

**Q2. How do total epochs and learning rate each affect model training?**

**Answer:** Total epochs determines how long the model trains, affecting whether it underfits or overfits based on the total number of parameter updates. Learning rate controls how large each parameter update is — too small leads to slow training, while too large can cause the model to diverge and train poorly.

**Rubric:** 5pts (fully correct) | 3pts (partially correct) | 2pts (incorrect but reasonable) | 1pt (minimal explanation) | 0pts (no answer)

---

**Q3. Given a small dataset, how would you split the data and evaluate the model during training?**

**Answer:** With a smaller dataset, an 80/20 train/test split is reasonable (as low as 70/30 with justification). Stratified sampling could also be considered. Model evaluation during training can be done via a held-out validation set or k-fold cross-validation.

**Rubric:** 5pts (fully correct) | 3pts (partially correct) | 2pts (incorrect but reasonable) | 1pt (minimal explanation) | 0pts (no answer)

---

**Q4. Why can accuracy be a misleading metric for some classification problems?**

**Answer:** Poorly-fitting models with a worrying number of false positives/negatives can still achieve high accuracy when the dataset has a skewed class distribution.

**Rubric:** 5pts (fully correct) | 3pts (partially correct) | 2pts (incorrect but reasonable) | 1pt (minimal explanation) | 0pts (no answer)

---

**Q5. Compare and contrast One-versus-One and One-versus-All classifiers.**

**Answer:** A One-versus-One classifier trains a binary classifier for every combination of output classes, has them compete round-robin style, and selects the class with the most "victories." A One-versus-All classifier trains n classifiers for n classes, each in the form "class i or not class i," and selects the class whose classifier is most confident.

**Rubric:** 5pts (fully correct) | 3pts (partially correct) | 2pts (incorrect but reasonable) | 1pt (minimal explanation) | 0pts (no answer)

---

**Q6. Compute the model output given the weights and inputs.**

**Answer:** −2 + 4(0) + 1(3) = **1**

**Rubric:** 5pts (fully correct) | 3pts (partially correct) | 2pts (incorrect but reasonable) | 1pt (minimal explanation) | 0pts (no answer)

---

**Q7. (Security classifier — precision vs. recall) Which metric would you prioritize and why?**

**Answer:** Any of the three can be correct with proper justification. High precision is sensible due to the high cost of false positives (calling police unnecessarily). High recall is sensible since we don't want anyone unauthorized accessing a high-security area. F1-score is reasonable if both priorities are treated equally. The focus is on thoughtful consideration and justification.

**Rubric:** 5pts (fully correct) | 3pts (partially correct) | 2pts (incorrect but reasonable) | 1pt (minimal explanation) | 0pts (no answer)

---

**Q8. (Large dataset — Normal Equation vs. Gradient Descent) What are the tradeoffs?**

**Answer:** The closed-form (Normal Equation) solution is guaranteed to be optimal, but with many features/instances it becomes incredibly costly in terms of computation and memory. Gradient descent (e.g., stochastic gradient descent) avoids these issues, but offers no guarantee of optimality and requires careful tuning of hyperparameters.

**Rubric:** 5pts (fully correct) | 3pts (partially correct) | 2pts (incorrect but reasonable) | 1pt (minimal explanation) | 0pts (no answer)

---

**Q9. Give a high-level description of how gradient descent works.**

**Answer:** The model computes the direction in which changes to the parameters would lower error, then adjusts the parameters to move in that direction, iterating until convergence.

**Rubric:** 5pts (fully correct) | 3pts (partially correct) | 2pts (incorrect but reasonable) | 1pt (minimal explanation) | 0pts (no answer)