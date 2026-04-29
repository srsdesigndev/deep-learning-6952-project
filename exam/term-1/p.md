# Practice Exam — Neural Networks & ML Fundamentals

---

## Section 1: Matching

Match each term to its best-corresponding description.

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

> Refer to original exam for question text. Answers only provided below.

| Q# | Answer |
|----|--------|
| 6 | (a) |
| 7 | (b) Gradients are computed |
| 8 | (c) After loss has not decreased for n epochs |
| 9 | (d) Wide Network |
| 10 | (b) 55 |
| 11 | (d) A correct prediction leads to no weight change |

---

## Section 3: Short Answer

---

**Q1. How do we use learning curves to assess model fit?**

We look for gaps between the training and validation set curves. A noticeable gap suggests overfitting. If they are close together, training is going well in terms of overfit/underfit.

---

**Q2. Give a high-level overview of backpropagation.**

Backpropagation calculates gradients (derivatives of loss with respect to weights) using a loss function that compares predictions to ground truth. That information is sent backwards through the network layer by layer, and at the end the weights are updated accordingly.

---

**Q3. Summarize in one sentence how data flows through this forward() function.**

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

**Q4. What is the difference between `__init__(self)` and `forward()` in a custom nn.Module class?**

`__init__(self)` declares the layers and components the model will use. `forward()` defines how data actually flows through those components during a forward pass in the training loop.

---

**Q5. For a feed-forward network with n hidden layers, each with 100 neurons, how many biases does the model have (in terms of n)?**

There will be **100n** biases, since there are 100n total neurons and each requires its own bias term.

---

**Q6. Compare and contrast Scikit-Learn and PyTorch for neural networks. Give one advantage and one disadvantage for each.**

Scikit-Learn is quick to prototype and evaluate, but limited in customization. PyTorch is highly customizable and can run faster, but is complex to use and doesn't integrate as cleanly with existing sklearn libraries.

---

**Q7. Give two reasons why ReLU can improve model training speed.**

1. It is very quick to compute — the output is simply 0 or the input value itself.
2. Its derivative is very quick to compute during gradient descent — it is either 0 or 1.

---

**Q8. Why do ML practitioners seek out differentiable functions for use in their models?**

Differentiable functions allow for easy gradient (derivative) computation, which is essential for gradient descent during model training.

---

**Q9. What is the purpose of α in the Ridge regression cost function?**

$$J(\theta) = \text{MSE}(\theta) + \alpha \sum_{i=1}^{n}(\theta_i)^2$$

α controls the amount of regularization applied to the model — it scales the impact of the regularization term on the overall cost function.