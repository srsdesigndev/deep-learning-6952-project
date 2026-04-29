# Exam A — Answer Key

---

## Section 1: Matching (2pts each, 10 best = 20pts)

Match each term to its best-corresponding description or associated term(s).

| # | Term | Answer |
|---|------|--------|
| 1 | Variance | (g) Tendency to Overfit |
| 2 | Binary Cross-Entropy | (a) Log Loss |
| 3 | Backward Pass | (c) Gradient Calculation |
| 4 | Tanh | (e) Zero-Centered |
| 5 | Learning Curve | (b) Line Chart |
| 6 | Dense Layer | (d) Hidden or Fully-Connected |
| 7 | Regularization | (l) LASSO Regression |
| 8 | Bias | (f) Model Simplicity/Assumptions |
| 9 | Sigmoid | (j) Logistic Function |
| 10 | sgn(z) | (h) Perceptrons |
| 11 | Forward Pass | (k) model(X_batch) |
| 12 | Softmax | (i) 0.08 0.03 0.02 0.87 |

---

## Section 2: Multiple Choice (4pts each, 10 best = 40pts)

**Q1. What occurs when `optimizer.step()` is called during model training in PyTorch?**
- (a) Outputs are generated
- **(b) Weights are updated** ✓
- (c) Error is calculated
- (d) Gradients are computed

---

**Q2. Which of the following statements about Ridge regression is true?**
- (a) Ridge regression lacks a closed-form solution and must use an iterative method.
- **(b) Ridge regression uses the L2-norm as the regularization term, scaled by α.** ✓
- (c) Ridge regression can "remove" features by making their weights converge to 0.
- (d) Ridge regression applies regularization during both training and evaluation.

---

**Q3. Suppose you have a neural network with two hidden layers, each with 15 neurons. How many total biases will the hidden layers have?**
- (a) 15
- (b) 17
- **(c) 30** ✓
- (d) 225

---

**Q4. What term would be most commonly used to describe a neural network with 50 hidden layers?**
- **(a) Deep Network** ✓
- (b) Wide Network
- (c) Vast Network
- (d) Oblong Network

---

**Q5. Suppose you have a neural network model with the following attributes:**
- 2 inputs
- Hidden layer (5 neurons)
- Hidden layer (5 neurons)
- Hidden layer (5 neurons)
- 1 output

Not including biases, how many total parameters will this network have?

- (a) 50
- (b) 65
- (c) 70
- **(d) 75** ✓

---

**Q6. For a model using backpropagation, when are parameters updated during training?**
- (a) After the current layer's gradients have been computed
- (b) After the gradients for every k layers have been computed
- (c) After the gradients for a learned number of layers, λ, have been computed
- **(d) After all layers' gradients have been computed** ✓

---

**Q7. Suppose you have a dataset with two features. If you have a data point xᵢ = ⟨3, 5⟩, what would be the resulting set of polynomial features for degree=2, not including bias?**
- **(a) ⟨3, 5, 9, 15, 25⟩** ✓
- (b) ⟨3, 5, 9, 15, 125⟩
- (c) ⟨3, 5, 9, 25, 30⟩
- (d) ⟨3, 5, 9, 25, 75⟩

---

**Q8. Consider the following custom network in PyTorch. What value should replace the variable `h` on line 14?**

```python
class MyNetwork(nn.Module):
    def __init__(self):
        super().__init__()
        self.hidden1a = nn.Sequential(
            nn.Linear(3, 5),
            nn.Tanh()
        )
        self.hidden1b = nn.Sequential(
            nn.Linear(3, 4),
            nn.ReLU(),
            nn.Linear(4, 7),
            nn.ReLU()
        )
        self.output = nn.Linear(h, 6)  # FILL-IN VALUE HERE

    def forward(self, x):
        h1a = self.hidden1a(x)
        h1b = self.hidden1b(x)
        c = torch.cat([h1a, h1b], dim=1)
        out = self.output(c)
        return out
```

- (a) 5
- (b) 7
- (c) 11
- **(d) 12** ✓

---

**Q9. Which of the following visualizations depicts the XOR operator?**

*(Refer to original exam figures)*

- **Answer: (b)** ✓

---

**Q10. Your sklearn neural network has the following `verbose=True` printout. Which of the following would be the best assessment of the model's training?**

```
Iteration 1, loss = 1.612  |  Validation score: 0.861
Iteration 2, loss = 1.598  |  Validation score: 0.862
Iteration 3, loss = 1.586  |  Validation score: 0.863
Iteration 4, loss = 1.575  |  Validation score: 0.864
Iteration 5, loss = 1.566  |  Validation score: 0.865
Iteration 6, loss = 1.558  |  Validation score: 0.866
Iteration 7, loss = 1.551  |  Validation score: 0.867
```

- **(a) The model is fitting the data properly.**
- (b) The model is overfitting the data.
- (c) The model is training too slowly.
- (d) The model is underfitting the data.

> **Note:** All students received full credit — shown metrics were not fully defined and multiple options could be argued as correct.

---

**Q11. Which of the following is known to help reduce overfitting?**
- (a) Increasing total epochs
- (b) Reducing regularization
- **(c) Adding more training data** ✓
- (d) Making the model more complex

---

## Section 3: Short Answer (5pts each, 8 best = 40pts)

**Q1. Give a high-level description of how we can use learning curves to assess model fit.**

**Answer:** We look for gaps between the training set and validation set curves. If there is a noticeable gap between them, overfitting is possible. If they are very close together, model training is going well in terms of overfit/underfit.

**Rubric:** 5pts (fully correct) | 3pts (partially correct) | 2pts (incorrect but reasonable) | 1pt (minimal explanation) | 0pts (no answer)

---

**Q2. Data scientists often observe that using ReLU activation function, ReLU(x) = max(0, x), can improve model training speed. Give two different reasons why this might be the case.**

**Answer:**
1. ReLU is very quick to compute — the output is simply 0 or the input value itself.
2. Its derivative is also very quick to compute during gradient descent — it is either 0 or 1.

**Rubric:** 5pts (fully correct) | 3pts (partially correct) | 2pts (incorrect but reasonable) | 1pt (minimal explanation) | 0pts (no answer)

---

**Q3. Give a high-level overview of backpropagation for neural networks.**

**Answer:** Backpropagation calculates gradients (derivatives of loss with respect to weights) using a loss function that compares predictions to ground truth. That gradient information is then sent backwards through the network layer by layer to compute further gradients, and at the very end the weights are updated accordingly.

**Rubric:** 5pts (fully correct) | 3pts (partially correct) | 2pts (incorrect but reasonable) | 1pt (minimal explanation) | 0pts (no answer)

---

**Q4. Briefly describe the functionality of the `DataLoader` class in PyTorch.**

**Answer:** The `DataLoader` class provides batches of data during the training loop and handles things such as batch size, shuffling, and iteration over the dataset.

**Rubric:** 5pts (fully correct) | 3pts (partially correct) | 2pts (incorrect but reasonable) | 1pt (minimal explanation) | 0pts (no answer)