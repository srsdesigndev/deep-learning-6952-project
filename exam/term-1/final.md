# Exam 1 — Master Question & Answer Sheet

---

## Section 1: Matching

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

## Section 2: Multiple Choice

*(Answer sheets only — refer to original exam for question text)*

| Version | Q1 | Q2 | Q3 | Q4 | Q5 | Q6 | Q7 | Q8 | Q9 | Q10 | Q11 |
|---------|----|----|----|----|----|----|----|----|-----|-----|-----|
| A | b | b | c | a | d | d | a | d | b | a | c |
| B | d | b | a | a | b | d | b | d | c | c | a |
| C | a | d | b | a | c | c | d | a | b | b | d |
| D | c | a | d | a | d | a | b | c | b | b | d |

---

## Section 3: Short Answer

**Q1. How do we use learning curves to assess model fit?**

We look for gaps between the training and validation set curves. A noticeable gap suggests overfitting. If they are close together, training is going well in terms of overfit/underfit.

---

**Q2. Give two reasons why ReLU can improve model training speed.**

1. It is very quick to compute — the output is simply 0 or the input value.
2. Its derivative is very quick to compute during gradient descent — it is either 0 or 1.

---

**Q3. Give a high-level overview of backpropagation.**

Backpropagation calculates gradients (derivatives of loss with respect to weights) using a loss function that compares predictions to ground truth. That information is sent backwards through the network layer by layer to compute further gradients, and at the very end the weights are updated accordingly.

---

**Q4. Describe the functionality of the DataLoader class in PyTorch.**

The DataLoader class provides batches of data during the training loop and handles batch size, shuffling, and iteration over the dataset.

---

**Q5. Compare and contrast Scikit-Learn and PyTorch for neural networks. Give one advantage and one disadvantage for each.**

Scikit-Learn is quick to prototype and evaluate, but limited in customization. PyTorch is highly customizable and can run faster, but is complex to use and doesn't integrate as cleanly with existing sklearn libraries.

---

**Q6. Why do ML practitioners seek out differentiable functions for use in their models?**

Differentiable functions allow for easy gradient (derivative) computation, which is essential for gradient descent during model training.

---

**Q7. For a feed-forward network with n hidden layers, each with 100 neurons, how many biases will the model have (in terms of n)?**

There will be 100n biases, since there are 100n total neurons and each requires a bias term. (Technically 100n + k for k output nodes, but either answer is accepted.)

---

**Q8. Summarize in one sentence how data flows through this forward() function.**

```python
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

The input data is passed through each fully-connected layer and concatenated (skip-connected) with the previous layer's input before being passed to the next layer, ultimately producing a single output.

---

**Q9. What is the purpose of α in the Ridge regression cost function?**

$$J(\theta) = \text{MSE}(\theta) + \alpha \sum_{i=1}^{n}(\theta_i)^2$$

α controls the amount of regularization applied — it scales the impact of the regularization term on the overall cost function.