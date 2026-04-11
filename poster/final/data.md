Got it. Here's all the content to fill the poster:

---

**Title:** Predicting Diabetes Risk and BMI Using Neural Networks

**Name:** Sundar Raj Sharma

---

**Background**
- Diabetes affects millions globally and is closely tied to lifestyle factors like physical activity, diet, and BMI.
- Early detection using machine learning can help flag at-risk individuals before clinical diagnosis.
- This project uses the CDC BRFSS 2015 survey dataset with 253,680 respondents and 21 health indicators.

---

**Research Questions**
- **Classification:** Can we predict whether a patient has diabetes based on lifestyle factors like BMI, blood pressure, cholesterol, and physical activity?
- **Regression:** Can we predict a patient's BMI based on lifestyle factors like age, income, physical activity, general health, and smoking habits?

---

**Dataset**
- Source: CDC Behavioral Risk Factor Surveillance System (BRFSS) 2015
- 253,680 survey responses with 21 features per respondent.
- Target variables: Diabetes\_binary (0/1) and BMI (continuous).

---

**Data Preparation**
- Class imbalance handled using pos\_weight in BCEWithLogitsLoss — 86% No Diabetes vs 14% Diabetes.
- Features normalized using StandardScaler fit on training data only.
- 80/20 train-test split with stratification for classification task.

---

**Classification Method**
- Baseline: Logistic Regression.
- Simple NN: one hidden layer, 64 neurons, ReLU, class weighting.
- Deep NN: three hidden layers (128→64→32), Dropout 0.3, BCEWithLogitsLoss with pos\_weight.
- Optimal threshold tuned to +0.5 for best F1 score.

---

**Classification Results**
- Deep NN outperformed all baselines after class weighting and threshold tuning.
- Diabetes recall improved from 17% (no weighting) to 64% (final model).
- Overall accuracy: 80%, Diabetes F1: 0.47.

| Model | Accuracy | Diabetes F1 |
|---|---|---|
| Logistic Regression | Baseline | Baseline |
| Simple NN | 0.79 | 0.47 |
| Deep NN | 0.80 | 0.47 |

---

**Regression Method**
- Baseline: Linear Regression.
- Simple NN: one hidden layer, 64 neurons, MSELoss.
- Deep NN: three hidden layers (128→64→32), Batch Normalization, Dropout 0.3.
- Additional experiments: log transform, feature engineering.

---

**Regression Results**
- Deep NN achieved best R² of 0.1642 — marginal improvement over baseline.
- Log transform and feature engineering did not improve results.
- Data limitation identified — survey features insufficient to predict BMI accurately.

| Model | MAE | RMSE | R² |
|---|---|---|---|
| Linear Regression | 4.36 | 6.17 | 0.123 |
| Simple NN | 4.27 | 6.07 | 0.153 |
| Deep NN | 4.21 | 6.03 | 0.164 |

---

**Future Work**
- Incorporate richer features such as dietary data and metabolic indicators to improve BMI prediction.
- Explore ensemble methods and SMOTE oversampling to further address class imbalance in classification.


Can we predict if a patient has diabetes or not based on lifestyle factors like BMI, blood pressure, cholesterol levels, and physical activity?
