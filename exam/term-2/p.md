# Practice Exam 2 — ML Fundamentals

---

## Section 2: Multiple Choice

| Q# | Answer | Detail |
|----|--------|--------|
| 6 | (d) | Average Distance Walked per Person (mi/person) |
| 7 | (d) | √14 |
| 8 | (c) | −9 |
| 9 | (b) | Minimizing total error across the training data |
| 10 | (d) | Mean Squared Error — squaring penalizes outliers more heavily |
| 11 | (a) | Predicting model performance on unseen data |

---

## Section 3: Short Answer

---

**Q1. Give one example of a situation where recall would be prioritized over precision.**

A situation where false negatives are especially costly — for example, cancer detection, where missing a positive case (false negative) is far more dangerous than a false alarm.

---

**Q2. Your binary classifier predicts "fish" when the decision function is > 0, but produces too many false positives. How should you adjust the threshold?**

Increase the threshold — this requires the model to have higher confidence before predicting "fish," which reduces false positives (at the cost of potentially more false negatives).

---

**Q3. Briefly explain what the following Python snippet does and its end result.**

```python
nums = [t*2 for t in range(4)]
```

This is a list comprehension that iterates over the values 0, 1, 2, 3 and multiplies each by 2. The result is `[0, 2, 4, 6]`.

---

**Q4. What is the difference between multiclass and multilabel classification?**

Multiclass classification means a single output can take one of more than two possible class values. Multilabel classification means the model predicts multiple independent binary outputs simultaneously (e.g., an image tagged as both "cat" and "indoors").

---

**Q5. You need to fit a linear regression model on 10 million rows, but your computer cannot hold all the data at once. Which gradient descent method should you use and why?**

Mini-batch or stochastic gradient descent — both process data in small chunks rather than loading the full dataset at once, making them feasible under memory constraints. Mini-batch is generally preferred as it balances memory efficiency with stable gradient estimates, while stochastic (batch size = 1) is the most memory-efficient but noisier.

---

**Q6. State one benefit of using the closed-form solution over gradient descent for linear regression.**

The closed-form solution is guaranteed to find the global optimum directly — there is no risk of getting stuck in a local minimum, and no hyperparameters (like learning rate) to tune.

---

**Q7. Describe one strength and one weakness of k-fold cross-validation. When is each most important?**

**Strength:** It allows mid-training evaluation without needing a separate validation set, which is especially valuable when the dataset is small. **Weakness:** It requires training k separate models, which can be very time-consuming for complex models or large datasets.

---

**Q8. After generating a scatterplot matrix, you notice that almost all features are highly correlated with each other. What preprocessing step would you take?**

Apply dimensionality reduction such as PCA (Principal Component Analysis) — high correlation between features indicates redundancy, and PCA can compress the information into fewer uncorrelated components.

---

**Q9. Why is accuracy a poor metric for evaluating model performance?**

Models with a worrying number of false positives/negatives can still achieve high accuracy when the dataset has a skewed class distribution — a model that always predicts the majority class would appear highly accurate while being useless.