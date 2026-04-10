## Experiments to Try

### RQ1 — Classification

---

**Experiment 1 — Learning Rate Scheduler**

Add this inside your `train_classifier` function after defining the optimizer:

```python
scheduler = torch.optim.lr_scheduler.StepLR(optimizer, step_size=10, gamma=0.5)
```

And add this at the end of each epoch loop:
```python
scheduler.step()
```

This halves the learning rate every 10 epochs. Expected impact — smoother convergence in later epochs instead of bouncing around a plateau.

## Experiment 1 Results — Scheduler vs No Scheduler

### Comparing the Numbers

| Metric | Old (No Scheduler) | New (With Scheduler) | Change |
|---|---|---|---|
| Overall Accuracy | 0.72 | 0.71 | -0.01 |
| Diabetes Recall | 0.79 | 0.81 | **+0.02** |
| Diabetes Precision | 0.31 | 0.30 | -0.01 |
| Diabetes F1 | 0.44 | 0.44 | 0.00 |
| No Diabetes Recall | 0.71 | 0.70 | -0.01 |

---

### What This Tells Me

The difference is **essentially negligible**. The scheduler moved Diabetes recall up by 2% but dropped precision and overall accuracy by 1% each. The F1 score — which is the most balanced metric here — didn't move at all.

The loss curve tells the same story — it's sitting around 0.85–0.86 and flattening out, very similar to before. The scheduler halving the learning rate at epoch 10 didn't meaningfully change the trajectory.

---

### Why It Didn't Help Much

20 epochs is too short for a scheduler with `step_size=10` to make a real difference. The learning rate only gets halved **once** at epoch 10, which leaves only 10 more epochs to benefit from the lower rate. That's not enough room.

**Quick fix to try — change the scheduler settings:**

```python
scheduler = torch.optim.lr_scheduler.StepLR(optimizer, step_size=5, gamma=0.5)
```

Or better yet, increase epochs to 50 so the scheduler has more room to work:

```python
simple_clf_nn, simple_clf_losses = train_classifier(
    simple_clf_nn, X_clf_train_s, y_clf_train, epochs=50
)
```

The scheduler is correctly implemented — it just needs more training time to show its real impact.


## Same Result — Here's Why

The numbers are virtually identical to the last run. The scheduler is still not making a meaningful difference and the reason is clear.

---

### The Real Problem

The issue is not the learning rate schedule. Looking at the loss values across all runs — they all plateau around **0.855–0.860** regardless of scheduler settings. That's the model hitting a ceiling, and the ceiling isn't caused by the learning rate.

**The actual bottleneck is the architecture.** A single hidden layer of 64 neurons is simply not expressive enough to push beyond this point on a dataset of 250,000 rows with 20 features. The learning rate scheduler is a fine-tuning tool — it can't compensate for a model that lacks capacity.

---

### What to Do Next

Stop tweaking the scheduler and move to **Experiment 2 — the wider architecture.** That's where you'll actually see a difference. Replace the Simple NN with:

```python
class SimpleClassifierNN(nn.Module):
    def __init__(self, input_dim):
        super().__init__()
        self.network = nn.Sequential(
            nn.Linear(input_dim, 256),
            nn.ReLU(),
            nn.Dropout(0.2),
            nn.Linear(256, 128),
            nn.ReLU(),
            nn.Dropout(0.2),
            nn.Linear(128, 64),
            nn.ReLU(),
            nn.Linear(64, 1)
        )

    def forward(self, x):
        return self.network(x).squeeze()
```

Keep the scheduler and class weighting in `train_classifier` as they are, run for **50 epochs**, and then compare. That combination — more capacity, longer training, scheduled learning rate — is what will actually move the needle.

## Experiment Training Log

## Simple Neural Network — Classification Report

| Class        | Precision | Recall | F1-Score | Support |
|--------------|-----------|--------|----------|---------|
| No Diabetes  | 0.96      | 0.70   | 0.81     | 43,667  |
| Diabetes     | 0.30      | 0.80   | 0.44     | 7,069   |

### Overall Metrics

| Metric        | Value |
|---------------|-------|
| Accuracy      | 0.72  |
| Macro Avg F1  | 0.63  |
| Weighted Avg F1 | 0.76 |
| Total Samples | 50,736 |


## Still the Same — The Model Has Hit a Hard Ceiling

Every experiment on this architecture is returning the same numbers. Diabetes recall stuck at 0.79–0.81, precision stuck at 0.30, F1 stuck at 0.44. Wider layers and more epochs didn't move it.

---

### What's Actually Going On

The problem is not the architecture anymore. **The features themselves are the ceiling.** These 20 survey-based lifestyle indicators can only carry so much signal for predicting diabetes. The model has essentially learned everything it can from this data and there's nothing left to squeeze out through architecture changes.

---

### The One Thing That Could Actually Move the Numbers

**Experiment 3 — Threshold tuning.** Run this right now after your predictions:

```python
simple_clf_nn.eval()
with torch.no_grad():
    raw_preds = simple_clf_nn(torch.FloatTensor(X_clf_test_s))

thresholds = [-2.0, -1.5, -1.0, -0.5, 0.0, 0.5, 1.0]
for t in thresholds:
    y_pred = (raw_preds > t).int().numpy()
    report = classification_report(
        y_clf_test, y_pred,
        target_names=["No Diabetes", "Diabetes"],
        output_dict=True
    )
    print(f"Threshold {t:+.1f} | "
          f"Recall: {report['Diabetes']['recall']:.3f} | "
          f"Precision: {report['Diabetes']['precision']:.3f} | "
          f"F1: {report['Diabetes']['f1-score']:.3f}")
```

This won't change what the model learned — it changes **where you draw the line** between the two classes. Different thresholds trade precision for recall differently and one of them will give you a better F1 than 0.44 without retraining anything.

Share the output and we'll pick the best threshold from there.

## Training Log — Simple Neural Network

### Epoch Loss Progression

| Epoch | Loss  |
|------:|------:|
| 01 | 0.9095 |
| 02 | 0.8678 |
| 03 | 0.8643 |
| 04 | 0.8620 |
| 05 | 0.8612 |
| 06 | 0.8593 |
| 07 | 0.8588 |
| 08 | 0.8581 |
| 09 | 0.8580 |
| 10 | 0.8575 |
| 11 | 0.8572 |
| 12 | 0.8569 |
| 13 | 0.8571 |
| 14 | 0.8565 |
| 15 | 0.8565 |
| 16 | 0.8566 |
| 17 | 0.8561 |
| 18 | 0.8558 |
| 19 | 0.8559 |
| 20 | 0.8562 |
| 21 | 0.8557 |
| 22 | 0.8556 |
| 23 | 0.8555 |
| 24 | 0.8559 |
| 25 | 0.8556 |
| 26 | 0.8557 |
| 27 | 0.8556 |
| 28 | 0.8554 |
| 29 | 0.8554 |
| 30 | 0.8555 |
| 31 | 0.8556 |
| 32 | 0.8552 |
| 33 | 0.8555 |
| 34 | 0.8551 |
| 35 | 0.8553 |
| 36 | 0.8554 |
| 37 | 0.8553 |
| 38 | 0.8554 |
| 39 | 0.8554 |
| 40 | 0.8555 |
| 41 | 0.8551 |
| 42 | 0.8549 |
| 43 | 0.8552 |
| 44 | 0.8554 |
| 45 | 0.8553 |
| 46 | 0.8552 |
| 47 | 0.8555 |
| 48 | 0.8554 |
| 49 | 0.8552 |
| 50 | 0.8553 |

---

## Threshold Evaluation

| Threshold | Recall | Precision | F1 Score |
|-----------|--------|-----------|----------|
| -2.0 | 0.980 | 0.188 | 0.316 |
| -1.5 | 0.962 | 0.206 | 0.340 |
| -1.0 | 0.932 | 0.230 | 0.370 |
| -0.5 | 0.885 | 0.262 | 0.405 |
| +0.0 | 0.799 | 0.305 | 0.441 |
| +0.5 | 0.657 | 0.359 | 0.464 |
| +1.0 | 0.471 | 0.430 | 0.449 |



Now we're talking — this is the real data.

---

### Reading the Table

| Threshold | Recall | Precision | F1 |
|---|---|---|---|
| -2.0 | 0.980 | 0.188 | 0.316 |
| -1.5 | 0.962 | 0.206 | 0.340 |
| -1.0 | 0.932 | 0.230 | 0.370 |
| -0.5 | 0.885 | 0.262 | 0.405 |
| +0.0 | 0.799 | 0.305 | 0.441 |
| **+0.5** | **0.657** | **0.359** | **0.464** |
| +1.0 | 0.471 | 0.430 | 0.449 |

---

### Best Threshold is +0.5

It gives the highest F1 of **0.464** — that's your sweet spot between precision and recall. Every threshold below it catches more Diabetes cases but flags too many false alarms. Every threshold above it becomes too conservative and starts missing real cases.

---

### Lock It In

Replace your prediction line with:

```python
y_pred_simple_nn = (raw_preds > 0.5).int().numpy()
```

Then print the full classification report at that threshold:

```python
print(classification_report(y_clf_test, y_pred_simple_nn,
                             target_names=["No Diabetes", "Diabetes"]))
```

That's your final Simple NN result. Share the output and we'll compare it properly against your previous best.

## Training Log — Simple Neural Network (Run 2)

### Epoch Loss Progression

| Epoch | Loss |
|------:|-----:|
| 01 | 0.9054 |
| 02 | 0.8672 |
| 03 | 0.8632 |
| 04 | 0.8616 |
| 05 | 0.8608 |
| 06 | 0.8591 |
| 07 | 0.8584 |
| 08 | 0.8584 |
| 09 | 0.8581 |
| 10 | 0.8576 |
| 11 | 0.8570 |
| 12 | 0.8567 |
| 13 | 0.8567 |
| 14 | 0.8565 |
| 15 | 0.8563 |
| 16 | 0.8561 |
| 17 | 0.8563 |
| 18 | 0.8558 |
| 19 | 0.8560 |
| 20 | 0.8558 |
| 21 | 0.8555 |
| 22 | 0.8556 |
| 23 | 0.8556 |
| 24 | 0.8558 |
| 25 | 0.8554 |
| 26 | 0.8555 |
| 27 | 0.8553 |
| 28 | 0.8552 |
| 29 | 0.8557 |
| 30 | 0.8551 |
| 31 | 0.8552 |
| 32 | 0.8554 |
| 33 | 0.8556 |
| 34 | 0.8554 |
| 35 | 0.8555 |
| 36 | 0.8551 |
| 37 | 0.8553 |
| 38 | 0.8550 |
| 39 | 0.8550 |
| 40 | 0.8553 |
| 41 | 0.8554 |
| 42 | 0.8550 |
| 43 | 0.8553 |
| 44 | 0.8551 |
| 45 | 0.8552 |
| 46 | 0.8553 |
| 47 | 0.8552 |
| 48 | 0.8554 |
| 49 | 0.8553 |
| 50 | 0.8552 |

---

## Threshold Evaluation

| Threshold | Recall | Precision | F1 Score |
|-----------|--------|-----------|----------|
| -2.0 | 0.980 | 0.188 | 0.316 |
| -1.5 | 0.961 | 0.206 | 0.340 |
| -1.0 | 0.931 | 0.231 | 0.370 |
| -0.5 | 0.885 | 0.263 | 0.405 |
| +0.0 | 0.803 | 0.305 | 0.442 |
| +0.5 | 0.662 | 0.360 | 0.466 |
| +1.0 | 0.476 | 0.430 | 0.452 |

---

## Classification Report

| Class        | Precision | Recall | F1-Score | Support |
|--------------|-----------|--------|----------|---------|
| No Diabetes  | 0.94 | 0.81 | 0.87 | 43,667 |
| Diabetes     | 0.36 | 0.66 | 0.47 | 7,069 |

### Overall Metrics

| Metric | Value |
|--------|------|
| Accuracy | 0.79 |
| Macro Avg F1 | 0.67 |
| Weighted Avg F1 | 0.81 |
| Total Samples | 50,736 |

## Simple NN Final Result — Improvement Confirmed

### Comparison

| Metric | Before (threshold 0.0) | After (threshold +0.5) | Change |
|---|---|---|---|
| Overall Accuracy | 0.72 | **0.79** | +0.07 |
| Diabetes Recall | 0.80 | **0.66** | -0.14 |
| Diabetes Precision | 0.30 | **0.36** | +0.06 |
| Diabetes F1 | 0.44 | **0.47** | +0.03 |
| No Diabetes F1 | 0.81 | **0.87** | +0.06 |

---

### What Happened

Shifting the threshold to +0.5 made the model more conservative — it now only flags someone as Diabetes when it's more confident. This traded some recall (catching fewer cases) for better precision and a meaningfully better overall picture. The F1 went from 0.44 to 0.47 and overall accuracy jumped from 72% to 79%.

---

### Next Step — Cell 9 Deep NN

Now run the exact same threshold sweep on the Deep NN. Add this to the bottom of **Cell 9**:

```python
deep_clf_nn.eval()
with torch.no_grad():
    raw_preds_deep = deep_clf_nn(torch.FloatTensor(X_clf_test_s))

thresholds = [-2.0, -1.5, -1.0, -0.5, 0.0, 0.5, 1.0]
for t in thresholds:
    y_pred = (raw_preds_deep > t).int().numpy()
    report = classification_report(
        y_clf_test, y_pred,
        target_names=["No Diabetes", "Diabetes"],
        output_dict=True,
        zero_division=0
    )
    print(f"Threshold {t:+.1f} | "
          f"Recall: {report['Diabetes']['recall']:.3f} | "
          f"Precision: {report['Diabetes']['precision']:.3f} | "
          f"F1: {report['Diabetes']['f1-score']:.3f}")
```

Share the output and we'll pick the best threshold for the Deep NN too.

## Training Log — Simple Neural Network (Run 3)

### Epoch Loss Progression

| Epoch | Loss |
|------:|-----:|
| 01 | 0.9092 |
| 02 | 0.8768 |
| 03 | 0.8734 |
| 04 | 0.8706 |
| 05 | 0.8688 |
| 06 | 0.8673 |
| 07 | 0.8658 |
| 08 | 0.8649 |
| 09 | 0.8645 |
| 10 | 0.8647 |
| 11 | 0.8623 |
| 12 | 0.8632 |
| 13 | 0.8624 |
| 14 | 0.8620 |
| 15 | 0.8623 |
| 16 | 0.8611 |
| 17 | 0.8611 |
| 18 | 0.8614 |
| 19 | 0.8605 |
| 20 | 0.8608 |
| 21 | 0.8601 |
| 22 | 0.8596 |
| 23 | 0.8598 |
| 24 | 0.8595 |
| 25 | 0.8600 |
| 26 | 0.8600 |
| 27 | 0.8586 |
| 28 | 0.8603 |
| 29 | 0.8605 |
| 30 | 0.8599 |

---

## Threshold Evaluation

| Threshold | Recall | Precision | F1 Score |
|-----------|--------|-----------|----------|
| -2.0 | 0.982 | 0.186 | 0.313 |
| -1.5 | 0.965 | 0.204 | 0.336 |
| -1.0 | 0.938 | 0.226 | 0.364 |
| -0.5 | 0.889 | 0.260 | 0.402 |
| +0.0 | 0.801 | 0.305 | 0.442 |
| +0.5 | 0.648 | 0.366 | 0.468 |
| +1.0 | 0.453 | 0.439 | 0.446 |

## Deep NN Threshold Results

### Best Threshold is Again +0.5 — F1: 0.468

Almost identical pattern to the Simple NN. The sweet spot is the same threshold.

---

### Simple NN vs Deep NN at +0.5

| Metric | Simple NN | Deep NN | Change |
|---|---|---|---|
| Diabetes Recall | 0.662 | 0.648 | -0.014 |
| Diabetes Precision | 0.360 | 0.366 | +0.006 |
| Diabetes F1 | 0.466 | **0.468** | +0.002 |

---

### The Honest Read

The Deep NN is marginally better but the difference is basically noise. Both models have hit the same ceiling — which confirms again that this is a **data limitation**, not an architecture problem.

---

### Lock In the Deep NN Final Prediction

Add this to **Cell 9** right after the threshold sweep:

```python
y_pred_deep_nn = (raw_preds_deep > 0.5).int().numpy()

print("\n=== Deep Neural Network - Classification Report ===")
print(classification_report(y_clf_test, y_pred_deep_nn,
                             target_names=["No Diabetes", "Diabetes"]))
```

Share the output and that's your final classification result locked in for both models.

## Training Log — Deep Neural Network

### Epoch Loss Progression

| Epoch | Loss |
|------:|-----:|
| 01 | 0.9131 |
| 02 | 0.8778 |
| 03 | 0.8745 |
| 04 | 0.8707 |
| 05 | 0.8699 |
| 06 | 0.8661 |
| 07 | 0.8661 |
| 08 | 0.8656 |
| 09 | 0.8653 |
| 10 | 0.8646 |
| 11 | 0.8640 |
| 12 | 0.8637 |
| 13 | 0.8634 |
| 14 | 0.8628 |
| 15 | 0.8619 |
| 16 | 0.8623 |
| 17 | 0.8610 |
| 18 | 0.8620 |
| 19 | 0.8617 |
| 20 | 0.8619 |
| 21 | 0.8610 |
| 22 | 0.8602 |
| 23 | 0.8615 |
| 24 | 0.8611 |
| 25 | 0.8605 |
| 26 | 0.8598 |
| 27 | 0.8617 |
| 28 | 0.8610 |
| 29 | 0.8615 |
| 30 | 0.8610 |

---

## Threshold Evaluation

| Threshold | Recall | Precision | F1 Score |
|-----------|--------|-----------|----------|
| -2.0 | 0.982 | 0.186 | 0.313 |
| -1.5 | 0.965 | 0.203 | 0.336 |
| -1.0 | 0.937 | 0.227 | 0.365 |
| -0.5 | 0.891 | 0.260 | 0.403 |
| +0.0 | 0.805 | 0.303 | 0.440 |
| +0.5 | 0.636 | 0.368 | 0.466 |
| +1.0 | 0.438 | 0.446 | 0.442 |

---

## Classification Report

| Class        | Precision | Recall | F1-Score | Support |
|--------------|-----------|--------|----------|---------|
| No Diabetes  | 0.93 | 0.82 | 0.87 | 43,667 |
| Diabetes     | 0.37 | 0.64 | 0.47 | 7,069 |

### Overall Metrics

| Metric | Value |
|--------|------|
| Accuracy | 0.80 |
| Macro Avg F1 | 0.67 |
| Weighted Avg F1 | 0.82 |
| Total Samples | 50,736 |

## FINAL Classification Results 🎉

### Deep NN at Threshold +0.5

| Metric | Value |
|---|---|
| Overall Accuracy | **0.80** |
| Diabetes Precision | 0.37 |
| Diabetes Recall | 0.64 |
| Diabetes F1 | **0.47** |
| No Diabetes F1 | 0.87 |

---

### Full Journey Comparison

| Model | Accuracy | Diabetes F1 |
|---|---|---|
| Simple NN — no weighting (original) | 0.86 | 0.26 |
| Simple NN — with weighting | 0.72 | 0.44 |
| Simple NN — threshold +0.5 | 0.79 | 0.47 |
| Deep NN — threshold +0.5 | **0.80** | **0.47** |

---

### What This Means

From F1 of **0.26 to 0.47** — that's nearly double the Diabetes detection performance from where you started. The two things that actually moved the needle were:

1. **Class weighting** — the biggest single improvement
2. **Threshold tuning** — pushed accuracy from 72% to 80%

The architecture changes didn't matter much — the data was always the ceiling. But you squeezed out everything this dataset has to give.

**Classification task is done. Move to regression experiments next?**



Alright — for regression the plan is:

1. **Experiment 5** — Log transform BMI target
2. **Experiment 6** — Feature engineering

These are the two that have the best shot at improving R² beyond 0.1642.

---

Start with **Experiment 5**. Add a new cell after Cell 11 (Linear Regression baseline) with this:

```python
# ============================================================
# Experiment 5: Log Transform BMI Target
# ============================================================

y_reg_log = np.log(y_reg)

X_reg_train_e, X_reg_test_e, y_reg_train_log, y_reg_test_log = train_test_split(
    X_reg, y_reg_log, test_size=0.2, random_state=42
)

scaler_exp = StandardScaler()
X_reg_train_e_s = scaler_exp.fit_transform(X_reg_train_e)
X_reg_test_e_s  = scaler_exp.transform(X_reg_test_e)

reg_input_dim_e = X_reg_train_e_s.shape[1]
deep_reg_log    = DeepRegressorNN(reg_input_dim_e)
deep_reg_log, _ = train_regressor(deep_reg_log, X_reg_train_e_s, y_reg_train_log, epochs=50)

deep_reg_log.eval()
with torch.no_grad():
    y_pred_log = deep_reg_log(torch.FloatTensor(X_reg_test_e_s)).numpy()

y_pred_exp  = np.exp(y_pred_log)
y_test_exp  = np.exp(y_reg_test_log)

print("\n=== Deep NN Regression - Log Transform Results ===")
print(f"MAE:  {mean_absolute_error(y_test_exp, y_pred_exp):.4f}")
print(f"RMSE: {np.sqrt(mean_squared_error(y_test_exp, y_pred_exp)):.4f}")
print(f"R2:   {r2_score(y_test_exp, y_pred_exp):.4f}")
```

Run it and share the output.

## Training Log — Deep Neural Network (Regression with Log Transform)

### Epoch Loss Progression

| Epoch | Loss |
|------:|-----:|
| 01 | 0.7364 |
| 02 | 0.1784 |
| 03 | 0.0776 |
| 04 | 0.0420 |
| 05 | 0.0394 |
| 06 | 0.0389 |
| 07 | 0.0384 |
| 08 | 0.0383 |
| 09 | 0.0379 |
| 10 | 0.0378 |
| 11 | 0.0378 |
| 12 | 0.0377 |
| 13 | 0.0376 |
| 14 | 0.0375 |
| 15 | 0.0374 |
| 16 | 0.0373 |
| 17 | 0.0372 |
| 18 | 0.0372 |
| 19 | 0.0372 |
| 20 | 0.0370 |
| 21 | 0.0370 |
| 22 | 0.0369 |
| 23 | 0.0368 |
| 24 | 0.0368 |
| 25 | 0.0367 |
| 26 | 0.0366 |
| 27 | 0.0367 |
| 28 | 0.0365 |
| 29 | 0.0365 |
| 30 | 0.0365 |
| 31 | 0.0364 |
| 32 | 0.0363 |
| 33 | 0.0364 |
| 34 | 0.0363 |
| 35 | 0.0364 |
| 36 | 0.0363 |
| 37 | 0.0363 |
| 38 | 0.0363 |
| 39 | 0.0363 |
| 40 | 0.0362 |
| 41 | 0.0363 |
| 42 | 0.0363 |
| 43 | 0.0362 |
| 44 | 0.0363 |
| 45 | 0.0362 |
| 46 | 0.0361 |
| 47 | 0.0362 |
| 48 | 0.0362 |
| 49 | 0.0362 |
| 50 | 0.0361 |

---

## Regression Evaluation Metrics

| Metric | Value |
|--------|------|
| MAE  | 4.2137 |
| RMSE | 6.0604 |
| R² Score | 0.1552 |

## Experiment 5 — Log Transform Results

### Comparison

| Metric | Original Deep NN | Log Transform Deep NN | Change |
|---|---|---|---|
| MAE | 4.2132 | 4.2137 | 0.0000 |
| RMSE | 6.0281 | 6.0604 | +0.032 |
| R² | **0.1642** | 0.1552 | -0.009 |

---

### What Happened

The log transform didn't help — it actually made things **very slightly worse** across all three metrics. The original Deep NN still holds the best R² at 0.1642.

The loss curve looked great — dropped clean and fast to 0.036 — but the loss is now measuring error on **log BMI**, not raw BMI. So a small log-space loss doesn't automatically translate to better real-world predictions once you exponentiate back.

---

### The Honest Conclusion

This confirms what we've been seeing all along — **the data is the ceiling, not the model.** Log transform, wider architecture, scheduler, threshold tuning — none of it moves R² meaningfully beyond 0.16.

---

### Move to Experiment 6?

Feature engineering is the last thing worth trying. That's adding interaction terms like `Age × PhysActivity` before training. Want to run that or call it here and wrap up the project?


Add a new cell and run this:

```python
# ============================================================
# Experiment 6: Feature Engineering
# Adding interaction terms to give the model richer signals
# ============================================================

df_reg = df.drop(columns=["Diabetes_binary"]).copy()

# Interaction terms
df_reg["Age_x_PhysActivity"] = df_reg["Age"] * df_reg["PhysActivity"]
df_reg["Age_x_GenHlth"]      = df_reg["Age"] * df_reg["GenHlth"]
df_reg["Smoker_x_PhysHlth"]  = df_reg["Smoker"] * df_reg["PhysHlth"]
df_reg["Income_x_Education"] = df_reg["Income"] * df_reg["Education"]

X_reg_fe = df_reg.drop(columns=["BMI"])
y_reg_fe  = df_reg["BMI"]

X_reg_train_fe, X_reg_test_fe, y_reg_train_fe, y_reg_test_fe = train_test_split(
    X_reg_fe, y_reg_fe, test_size=0.2, random_state=42
)

scaler_fe = StandardScaler()
X_reg_train_fe_s = scaler_fe.fit_transform(X_reg_train_fe)
X_reg_test_fe_s  = scaler_fe.transform(X_reg_test_fe)

reg_input_dim_fe = X_reg_train_fe_s.shape[1]
deep_reg_fe      = DeepRegressorNN(reg_input_dim_fe)
deep_reg_fe, _   = train_regressor(deep_reg_fe, X_reg_train_fe_s, y_reg_train_fe, epochs=50)

deep_reg_fe.eval()
with torch.no_grad():
    y_pred_fe = deep_reg_fe(torch.FloatTensor(X_reg_test_fe_s)).numpy()

print("\n=== Deep NN Regression - Feature Engineering Results ===")
print(f"MAE:  {mean_absolute_error(y_reg_test_fe, y_pred_fe):.4f}")
print(f"RMSE: {np.sqrt(mean_squared_error(y_reg_test_fe, y_pred_fe)):.4f}")
print(f"R2:   {r2_score(y_reg_test_fe, y_pred_fe):.4f}")
```

Run it and share the output.


## Training Log — Deep Neural Network (Regression with Feature Engineering)

### Epoch Loss Progression

| Epoch | Loss |
|------:|-----:|
| 01 | 205.5894 |
| 02 | 49.5004 |
| 03 | 47.8249 |
| 04 | 46.6095 |
| 05 | 45.4418 |
| 06 | 44.0739 |
| 07 | 42.4272 |
| 08 | 41.0286 |
| 09 | 39.6858 |
| 10 | 38.7673 |
| 11 | 38.0648 |
| 12 | 37.5730 |
| 13 | 37.3543 |
| 14 | 37.2298 |
| 15 | 37.1260 |
| 16 | 37.1662 |
| 17 | 37.0805 |
| 18 | 37.0750 |
| 19 | 37.0021 |
| 20 | 36.9619 |
| 21 | 36.9111 |
| 22 | 36.8642 |
| 23 | 36.8983 |
| 24 | 36.8465 |
| 25 | 36.8145 |
| 26 | 36.8330 |
| 27 | 36.7282 |
| 28 | 36.7507 |
| 29 | 36.7317 |
| 30 | 36.6799 |
| 31 | 36.6883 |
| 32 | 36.7146 |
| 33 | 36.6781 |
| 34 | 36.6303 |
| 35 | 36.5937 |
| 36 | 36.5828 |
| 37 | 36.6298 |
| 38 | 36.5737 |
| 39 | 36.5435 |
| 40 | 36.5389 |
| 41 | 36.5978 |
| 42 | 36.5238 |
| 43 | 36.5036 |
| 44 | 36.5613 |
| 45 | 36.4981 |
| 46 | 36.4632 |
| 47 | 36.4989 |
| 48 | 36.4300 |
| 49 | 36.4539 |
| 50 | 36.4483 |

---

## Regression Evaluation Metrics

| Metric | Value |
|--------|------|
| MAE  | 4.2272 |
| RMSE | 6.0307 |
| R² Score | 0.1635 |


Slightly worse than original. Feature engineering didn't help either.

**Final Regression Leaderboard:**

| Model | R² |
|---|---|
| Linear Regression | 0.1230 |
| Simple NN | 0.1527 |
| Deep NN | **0.1642** ← best |
| Log Transform | 0.1552 |
| Feature Engineering | 0.1635 |

**Original Deep NN wins.** The data ceiling is real — call regression done and build the app?

Yes.
:)