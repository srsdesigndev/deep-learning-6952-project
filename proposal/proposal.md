# Health by the Numbers: Predicting Diabetes and BMI with Deep Learning

## Course Project Proposal

**Dataset:** CDC Diabetes Health Indicators  
**Source:** UC Irvine Machine Learning Repository  
**URL:** [https://archive.ics.uci.edu/dataset/891/cdc+diabetes+health+indicators](https://archive.ics.uci.edu/dataset/891/cdc+diabetes+health+indicators)

---

## Research Questions

### RQ1 (Classification)

> Can we predict if a patient has diabetes or not based on lifestyle factors like BMI, blood pressure, cholesterol levels, and physical activity?

### RQ2 (Regression)

> Can we predict a patient's BMI based on lifestyle factors like age, income, physical activity, general health rating, and smoking habits?

---

## Step 1: Framing the Problem and Looking at the Big Picture

### How would the answers to your RQs be useful or beneficial to other people?

The answers to the classification RQ would be useful to other people because if it is possible to predict if a patient has diabetes or not, it will really help doctors and nurses to identify patients who may be on the verge of having diabetes. The answers to the regression RQ would be useful to other people because if it is possible to predict a patient's BMI, it would really help to identify the lifestyle factors associated with a patient's BMI. Both RQs are quite relevant to real-life situations.

### For the classification RQ, are you more interested in precision, recall, or F1 score?

The most important of these is **recall**. If the model fails to detect someone who has diabetes, it is much worse than if it detects someone who doesn't. A false negative could mean the person doesn't receive treatment on time, which could have serious repercussions on the person's health. A false positive just means the person must go through a few extra tests, which isn't ideal but is much less damaging. So, we need to maximize the recall even if it means sacrificing some precision.

### For the classification RQ, propose two models and one baseline model.

- **Baseline model:** Logistic Regression – a simple and easy to interpret model that is commonly used in medical research for binary classification tasks.
- **First main model:** A basic feedforward Neural Network with one hidden layer using ReLU activations – a good starting point for tabular data like this.
- **Second model:** A deeper Neural Network with two or more hidden layers and dropout added to help prevent overfitting.

### For the regression RQ, propose two models and one baseline model.

- **Baseline model:** Linear Regression – the most basic model to use when trying to predict a continuous value.
- **First main model:** A Feedforward Neural Network with a single hidden layer and a linear output layer to deal with the regression problem.
- **Second model:** A deeper version of the previous model with batch normalization and dropout layers to improve how well it generalizes to unseen data.

### Name at least 3 major hyperparameters you plan to tune.

1. **Learning rate** – controls how fast the model learns; if set incorrectly, training can take an eternity.
2. **Number of hidden layers** – determines model complexity, essential for how well it learns to recognize patterns.
3. **Dropout rate** – helps prevent the model from memorizing data.
4. **Batch size** – determines how stable the training process is.

---

## Step 2: Get the Data

### Where did you obtain the dataset?

This dataset was retrieved from the UC Irvine Machine Learning Repository, an approved source for this assignment. The data is publicly accessible and can be downloaded from the site.

### Does this dataset appear to have missing data?

No, since it is already a clean version of the original data from the CDC's Behavioral Risk Factor Surveillance System Survey.

### What types of data are in this dataset?

The data is tabular data stored in a CSV file containing different types of data:
- **Numerical data** – BMI and days with poor physical and mental health
- **Categorical data** – smoking status and high blood pressure status
- **Ordinal data** – rating of general health, age groups, income levels, and education levels

### How many instances and features are in this dataset?

There are **253,680 instances** and **22 features** in total: 21 features and 1 target variable (diabetes status). This far exceeds the 750 instances and 10 features required by the assignment. If the data is too large to be used for model training, random sampling can be used to reduce it to a more manageable size.

### How does this dataset allow you to answer your two research questions?

- **For the classification problem:** The target is the `Diabetes` binary column (0 = no diabetes, 1 = prediabetes or diabetes). The other 21 features are used as inputs.
- **For the regression problem:** BMI will be used as the target, with the other 20 features as inputs.

These two questions use the same dataset and share the same theme: health, lifestyle, and how they relate to diabetes.