# Data

The dataset is not included in this repository due to its size.
Download it using one of the options below before running the notebook.

---

## Dataset

**Name:** CDC Diabetes Health Indicators Dataset
**Source:** UC Irvine Machine Learning Repository
**URL:** https://archive.ics.uci.edu/dataset/891/cdc+diabetes+health+indicators
**Size:** 253,680 instances, 22 features
**Format:** CSV

---

## How to Download

### Option A — kagglehub (recommended, works directly in Colab)

```python
import kagglehub

path = kagglehub.dataset_download("alexteboul/diabetes-health-indicators-dataset")
print("Path to dataset:", path)
```

The file you need is:
`diabetes_binary_health_indicators_BRFSS2015.csv`

### Option B — Manual Download

1. Go to: https://www.kaggle.com/datasets/alexteboul/diabetes-health-indicators-dataset
2. Download the zip file
3. Extract and upload `diabetes_binary_health_indicators_BRFSS2015.csv` to your environment

---

## Notes

- The dataset has no missing values and requires no cleaning
- Do not commit the CSV file to this repository
- `diabetes_binary_health_indicators_BRFSS2015.csv` is listed in `.gitignore`