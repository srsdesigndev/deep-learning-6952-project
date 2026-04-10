## RQ1 — Can I predict whether a patient has diabetes based on lifestyle factors?

### What I Did
I treated this as a binary classification problem. The target was `Diabetes_binary` — either 0 (No Diabetes) or 1 (Diabetes). I trained three models in order of complexity: Logistic Regression as the baseline, a Simple Neural Network with one hidden layer, and a Deep Neural Network with three hidden layers and Dropout.

### The Core Challenge
The dataset had a significant class imbalance — roughly **86% No Diabetes, 14% Diabetes**. My first neural network completely failed to handle this, catching only 17% of actual Diabetes cases despite reporting 86% overall accuracy. Once I identified this, I introduced class weighting into the loss function, which penalized the model more heavily for missing Diabetes cases and pushed recall on the minority class up to approximately 79%.

### Results

| Model | Diabetes Precision | Diabetes Recall | Diabetes F1 |
|---|---|---|---|
| Logistic Regression | Baseline | Baseline | Baseline |
| Simple NN (no weighting) | 0.54 | 0.17 | 0.26 |
| Simple NN (with weighting) | Improved | 0.79 | Improved |
| Deep NN (with weighting) | Best | Best | Best |

### What the Confusion Matrix Told Me
The Deep Neural Network produced:
- **31,208** correct No Diabetes predictions
- **5,560** correct Diabetes predictions
- **1,509** missed Diabetes cases (False Negatives)
- **12,459** false alarms (False Positives)

The model became more aggressive in flagging Diabetes after class weighting, which reduced missed cases but increased false alarms. In a medical screening context, this is the right trade-off — a false alarm leads to a follow-up test, but a missed case goes untreated.

### Answer to RQ1
**Yes, but with important limitations.** Lifestyle features like BMI, blood pressure, cholesterol, and physical activity do carry a meaningful signal for diabetes prediction. However, the class imbalance makes raw accuracy a misleading metric, and the model still misses roughly 1 in 5 actual Diabetes cases even after correction. It is useful as a screening tool, not a diagnostic one.

---

## RQ2 — Can I predict a patient's BMI based on lifestyle factors?

### What I Did
I treated this as a regression problem. The target was the continuous `BMI` value. I dropped both `BMI` and `Diabetes_binary` from the features and trained three models: Linear Regression as the baseline, a Simple Neural Network, and a Deep Neural Network with Batch Normalization and Dropout.

### Results

| Model | MAE | RMSE | R² |
|---|---|---|---|
| Linear Regression | 4.3643 | 6.1749 | 0.1230 |
| Simple Neural Network | 4.2722 | 6.0696 | 0.1527 |
| Deep Neural Network | 4.2132 | 6.0281 | 0.1642 |

### What the Scatter Plot Told Me
The Predicted vs Actual BMI plot revealed a clear pattern — the model compresses predictions into a narrow band between roughly 24 and 37, regardless of actual BMI. It performs reasonably in the 20–35 range where most data lives, but significantly over-predicts for very lean individuals and heavily under-predicts for people with extreme obesity. The model is regressing toward the mean rather than capturing the true range of BMI variation.

### What the Loss Curves Told Me
Both regression models dropped sharply in the first epoch and then ran almost identically for the remaining training epochs. The improvements from Simple to Deep NN were real but marginal, suggesting the dataset itself is the limiting factor rather than the model architecture.

### Answer to RQ2
**Only weakly.** Even the best model — the Deep Neural Network — only explains **16.4% of the variance in BMI** (R² = 0.1642). Every model improved on the one before it, confirming that non-linear patterns exist and deeper architectures help capture them. But the consistently low R² across all models points to a data limitation rather than a modeling failure — the lifestyle features available in this dataset simply do not contain enough information to accurately predict individual BMI. Factors like genetics, diet specifics, and metabolic rate are absent and likely far more predictive.

---

## Overall Conclusions

**Neural networks outperformed classical baselines on both tasks**, but the margin of improvement was modest — particularly for regression. The most impactful decision in the entire project was not the choice of architecture but the correction for class imbalance in RQ1, which transformed a model that was practically useless for detecting Diabetes into one with meaningful predictive power.

The two tasks also tell different stories about the dataset. For RQ1, the features genuinely carry a useful signal for classification. For RQ2, the same features struggle to explain BMI variation, suggesting that predicting a continuous physiological measure from survey-based lifestyle data is fundamentally harder than predicting a binary health outcome from the same inputs.