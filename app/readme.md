# 🩺 Do I Have Diabetes?

A Gradio web app that predicts diabetes risk and BMI using deep neural networks, with plain-English explanations powered by an LLM.

---

## What It Does

- **Classifies** diabetes risk (High / Low) based on health indicators
- **Predicts** BMI using a regression model
- **Explains** the results in plain English with a lifestyle tip via Claude (claude-3-haiku via OpenRouter)

---

## Models

| Model | File | Task |
|---|---|---|
| `DeepClassifierNN` | `deep_clf_nn.pt` | Binary diabetes risk (21 inputs) |
| `DeepRegressorNN` | `deep_reg_nn.pt` | BMI prediction (20 inputs) |

Both are PyTorch models trained on CDC health survey data (BRFSS).

---

## Setup

### 1. Install dependencies

```bash
pip install gradio torch openai
```

### 2. Get an API key

Get a free key from [OpenRouter](https://openrouter.ai) and paste it into the notebook:

```python
api_key = "your-openrouter-key"
```

### 3. Upload model files

Upload `deep_clf_nn.pt` and `deep_reg_nn.pt` when prompted (Google Colab) or place them in the working directory.

### 4. Run

Execute all cells. A Gradio link will appear — open it in your browser.

---

## Inputs

The app collects three categories of information:

- **Basic Info** — age, sex, height, weight, education, income
- **Medical History** — blood pressure, cholesterol, stroke, heart disease, mobility
- **Lifestyle** — smoking, alcohol, physical activity, diet, healthcare access, mental/physical health days

---

## ⚠️ Disclaimer

This app is for **educational purposes only** and is not a medical diagnostic tool. Always consult a healthcare professional.