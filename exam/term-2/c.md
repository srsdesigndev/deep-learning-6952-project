# Exam C — Answer Key

---

## Section 1: Matching (2pts each, 10 best = 20pts)

Match each term to its best-corresponding description or associated term(s).

| # | Term | Answer |
|---|------|--------|
| 1 | Regularization | (a) LASSO Regression |
| 2 | Softmax | (b) 0.08 0.03 0.02 0.87 |
| 3 | Binary Cross-Entropy | (c) Log Loss |
| 4 | Dense Layer | (f) Hidden or Fully-Connected |
| 5 | Tanh | (l) Zero-Centered |
| 6 | Forward Pass | (d) model(X_batch) |
| 7 | Backward Pass | (h) Gradient Calculation |
| 8 | Variance | (j) Tendency to Overfit |
| 9 | Learning Curve | (g) Line Chart |
| 10 | sgn(z) | (k) Perceptrons |
| 11 | Sigmoid | (e) Logistic Function |
| 12 | Bias | (i) Model Simplicity/Assumptions |

---

## Section 2: Multiple Choice (4pts each, 10 best = 40pts)

**Q1. Your sklearn neural network has the following `verbose=True` printout. Which of the following would be the best assessment of the model's training?**

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

**Q2. For a model using backpropagation, when are parameters updated during training?**

- (a) After the current layer's gradients have been computed
- (b) After the gradients for every k layers have been computed
- (c) After the gradients for a learned number of layers, λ, have been computed
- **(d) After all layers' gradients have been computed** ✓

---

**Q3. Which of the following visualizations depicts the XOR operator?**

*(Refer to original exam figures)*

- **Answer: (b)** ✓

---

**Q4. Suppose you have a dataset with two features. If you have a data point xᵢ = ⟨3, 5⟩, what would be the resulting set of polynomial features for degree=2, not including bias?**

- **(a) ⟨3, 5, 9, 15, 25⟩** ✓
- (b) ⟨3, 5, 9, 15, 125⟩
- (c) ⟨3, 5, 9, 25, 30⟩
- (d) ⟨3, 5, 9, 25, 75⟩

---

**Q5. Which of the following is known to help reduce overfitting?**

- (a) Increasing total epochs
- (b) Reducing regularization
- **(c) Adding more training data** ✓
- (d) Making the model more complex

---

**Q6. Suppose you have a neural network with two hidden layers, each with 15 neurons. How many total biases will the hidden layers have?**

- (a) 15
- (b) 17
- **(c) 30** ✓
- (d) 225

---

**Q7. Consider the following custom network in PyTorch. What value should replace the variable `h` on line 14?**

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

**Q8. What term would be most commonly used to describe a neural network with 50 hidden layers?**

- **(a) Deep Network** ✓
- (b) Wide Network
- (c) Vast Network
- (d) Oblong Network

---

**Q9. What occurs when `optimizer.step()` is called during model training in PyTorch?**

- (a) Outputs are generated
- **(b) Weights are updated** ✓
- (c) Error is calculated
- (d) Gradients are computed

---

**Q10. Which of the following statements about Ridge regression is true?**

- (a) Ridge regression lacks a closed-form solution and must use an iterative method.
- **(b) Ridge regression uses the L2-norm as the regularization term, scaled by α.** ✓
- (c) Ridge regression can "remove" features by making their weights converge to 0.
- (d) Ridge regression applies regularization during both training and evaluation.

---

**Q11. Suppose you have a neural network model with the following attributes:**
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

## Section 3: Short Answer (5pts each, 8 best = 40pts)

**Q1. Suppose that we have a feed-forward neural network model with n hidden layers, each with 100 neurons. How many biases will the model have, in terms of n?**

**Answer:** There will be 100n biases, since there are 100n total neurons and each one requires a bias term. (Technically 100n + k for a network with k output nodes, but either answer accepted as the question targets hidden layers only.)

**Rubric:** 5pts (fully correct) | 3pts (partially correct) | 2pts (incorrect but reasonable) | 1pt (minimal explanation) | 0pts (no answer)

---

**Q2. Data scientists often observe that using ReLU activation function, ReLU(x) = max(0, x), can improve model training speed. Give two different reasons why this might be the case.**

**Answer:**
1. ReLU is very quick to compute — the output is simply 0 or the input value itself.
2. Its derivative is also very quick to compute during gradient descent — it is either 0 or 1.

**Rubric:** 5pts (fully correct) | 3pts (partially correct) | 2pts (incorrect but reasonable) | 1pt (minimal explanation) | 0pts (no answer)

---

**Q3. Give a high-level description of how we can use learning curves to assess model fit.**

**Answer:** We look for gaps between the training set and validation set curves. If there is a noticeable gap between them, overfitting is possible. If they are very close together, model training is going well in terms of overfit/underfit.

**Rubric:** 5pts (fully correct) | 3pts (partially correct) | 2pts (incorrect but reasonable) | 1pt (minimal explanation) | 0pts (no answer)

---

**Q4. Why do ML folks often seek out differentiable mathematical functions for use in their models?**

**Answer:** Differentiable functions allow for easy gradient (derivative) computation, which is essential for gradient descent during model training.

**Rubric:** 5pts (fully correct) | 3pts (partially correct) | 2pts (incorrect but reasonable) | 1pt (minimal explanation) | 0pts (no answer)

---

**Q5. Briefly describe the functionality of the `DataLoader` class in PyTorch.**

**Answer:** The `DataLoader` class provides batches of data during the training loop and handles things such as batch size, shuffling, and iteration over the dataset.

**Rubric:** 5pts (fully correct) | 3pts (partially correct) | 2pts (incorrect but reasonable) | 1pt (minimal explanation) | 0pts (no answer)

---

**Q6. Consider the following custom network in PyTorch. In one sentence, briefly summarize how data flows through the `forward()` function.**

```python
class MyNetwork(nn.Module):
    def __init__(self):
        super().__init__()
        self.hidden1 = nn.Sequential(
            nn.Linear(8, 24),
            nn.ReLU()
        )
        self.hidden2 = nn.Sequential(
            nn.Linear(32, 32),
            nn.ReLU(),
            nn.Linear(32, 32),
            nn.ReLU()
        )
        self.hidden3 = nn.Sequential(
            nn.Linear(64, 64),
            nn.ReLU(),
            nn.Linear(64, 64),
            nn.ReLU(),
            nn.Linear(64, 64),
            nn.ReLU()
        )
        self.output = nn.Linear(128, 3)

    def forward(self, x):
        h1 = self.hidden1(x)
        c1 = torch.cat([h1, x], dim=1)
        h2 = self.hidden2(c1)
        c2 = torch.cat([h2, c1], dim=1)
        h3 = self.hidden3(c2)
        c3 = torch.cat([h3, c2], dim=1)
        out = self.output(c3)
        return out
```

**Answer:** The input data is passed through each fully-connected layer and then concatenated (skip-connected) with the previous layer's input before being passed to the next layer, ultimately resulting in a single output.

**Rubric:** 5pts (fully correct) | 3pts (partially correct) | 2pts (incorrect but reasonable) | 1pt (minimal explanation) | 0pts (no answer)

---

**Q7. Consider the cost function for Ridge regression below. What is the purpose of the parameter α?**

$$J(\theta) = \text{MSE}(\theta) + \alpha \sum_{i=1}^{n} (\theta_i)^2$$

**Answer:** α controls the amount of regularization applied to the model — it scales the impact of the regularization term on the overall cost function.

**Rubric:** 5pts (fully correct) | 3pts (partially correct) | 2pts (incorrect but reasonable) | 1pt (minimal explanation) | 0pts (no answer)

---

**Q8. Give a high-level overview of backpropagation for neural networks.**

**Answer:** Backpropagation calculates gradients (derivatives of loss with respect to weights) using a loss function that compares predictions to ground truth. That gradient information is then sent backwards through the network layer by layer to compute further gradients, and at the very end the weights are updated accordingly.

**Rubric:** 5pts (fully correct) | 3pts (partially correct) | 2pts (incorrect but reasonable) | 1pt (minimal explanation) | 0pts (no answer)

---

**Q9. Compare and contrast using Scikit-Learn and PyTorch for working with neural network models. Give one advantage and one disadvantage for each option.**

**Answer:** Scikit-Learn is very quick to get a prototype going and evaluate, but is limited in the amount of customization possible. PyTorch is highly customizable and can run faster, but it is very complex to use and can be unnecessarily so for simple models — it also doesn't integrate as cleanly with many existing sklearn functions and libraries.

**Rubric:** 5pts (fully correct) | 3pts (partially correct) | 2pts (incorrect but reasonable) | 1pt (minimal explanation) | 0pts (no answer)