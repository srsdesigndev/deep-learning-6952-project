**Predicting Diabetes and BMI with Deep Learning**
**Sundar Raj Sharma** | CSCI 6952 | Spring 2026

---

## Background
The project builds machine learning models to predict diabetes status and BMI from lifestyle and health indicators using the CDC BRFSS 2015 dataset.

---

## Research Questions
- **Classification:** Can we predict if a patient has diabetes or not based on lifestyle factors like BMI, Blood Pressure, cholesterol levels… and physical activity?
- **Regression:** Can we predict a patient's BMI based on lifestyle factors like age, income, physical activity, general health rating, and smoking habits?

---

## Dataset
- **Single Dataset:** CDC Diabetes Health Indicators (UCI ML Repository)
- 253,680 instances
- 22 features
- No missing values
- Binary, categorical, and ordinal features

---

## Data Preparation
- **Classification:** Applied random undersampling to balance classes (35,346 diabetic vs 35,346 non-diabetic). StandardScaler applied. 80/20 stratified split.
- **Regression:** Used full dataset (253,680 rows). StandardScaler applied. 80/20 split.

---

## Classification Method
- Logistic Regression was established as the baseline model.
- Deep learning models were developed using a Simple Feedforward Neural Network (64→32→1) and a Deep FNN incorporating Batch Normalization and Dropout layers.
- Tuned Learning Rate, Dropout Rate, and Batch Size to explicitly maximize Recall, minimizing missed diabetes diagnoses.

---

## Regression Method
- Linear Regression was established as the baseline model.
- Deep learning models were developed using a Simple Feedforward NN (64→32→1) and a Deep FNN (256→128→64→1) incorporating Batch Normalization and Dropout layers.
- Tuned Learning Rate, Dropout Rate, and Batch Size to minimize MAE and improve BMI prediction accuracy.

---

## Classification Results
- Logistic Regression achieved the highest Recall of **76.6%**, correctly identifying 3 out of 4 diabetic patients in the test set.
- Precision of **73.5%** is an acceptable clinical trade-off, as maximizing diabetes detection was the primary goal.

### Classification Results Table

| Model | Recall | F1 Score |
|---|---|---|
| Logistic Regression | 0.766 | 0.750 |
| Simple NN | 0.638 | 0.702 |
| Deep NN | 0.687 | 0.724 |

---

## Regression Results
- Deep NN achieved the best MAE of **4.2255** while Simple NN achieved the best R² of **0.1599**, both outperforming the Linear Regression baseline.
- All models clustered predictions around the population mean BMI (~28–30), reflecting a data ceiling caused by the binary nature of input features.

### Regression Results Table

| Model | MAE | R² |
|---|---|---|
| LR (Linear Regression) | 4.4012 | 0.1193 |
| SNN (Simple NN) | 4.2618 | 0.1599 |
| DNN (Deep NN) | 4.2255 | 0.1577 |

---

## Future Work
- Future studies will include using **SMOTE oversampling** for better diabetes recall.
- Acquiring better continuous attributes such as **caloric consumption** and **physical exercise hours** to surpass the BMI prediction limitation of R² ~0.16.