# Health by the Numbers: Predicting Diabetes and BMI with Deep Learning

> CDC Diabetes Health Indicators — UC Irvine ML Repository

## Files

- [project/readme.md](project/readme.md)
- [project-instructions/instructions.md](project-instructions/instructions.md)
- [project-poster/readme.md](project-poster/readme.md)
- [project-poster/template/poster-instruction.md](project-poster/template/poster-instruction.md)
- [project-poster/template/project-banner-template.png](project-poster/template/project-banner-template.png)
- [proposal/proposal.md](proposal/proposal.md)

## Dataset

**Source:** [CDC Diabetes Health Indicators](https://archive.ics.uci.edu/dataset/891/cdc+diabetes+health+indicators)  
**Instances:** 253,680 | **Features:** 22

## Research Questions

**RQ1 (Classification)** — Predict diabetes status from lifestyle factors (BMI, blood pressure, cholesterol, physical activity)

**RQ2 (Regression)** — Predict BMI from lifestyle factors (age, income, physical activity, health rating, smoking)

## Models

| Task | Baseline | Model 1 | Model 2 |
|------|----------|---------|---------|
| Classification | Logistic Regression | Feedforward NN (1 hidden layer) | Deep NN + Dropout |
| Regression | Linear Regression | Feedforward NN (1 hidden layer) | Deep NN + BatchNorm + Dropout |

## Hyperparameters to Tune

- Learning rate
- Number of hidden layers
- Dropout rate
- Batch size