# Course Project Proposal Instructions

## Overview

The goal of this proposal is to get you thinking about your course project and receive feedback early on in the process. Think of this project as a "create your own homework" assignment, in that you will be applying deep learning methods to a dataset of your choice to answer research questions of your choosing. This will result in both a written and oral presentation, which will be further described in a later assignment. For now, the focus will be on proposing a project idea.

This project will loosely follow a subset of the steps from Aurélien Geron's Machine Learning Checklist, and the proposal will focus on the first two steps.

---

## Step 1: Framing the Problem & Looking at the Big Picture

You must decide on **two research questions (RQs)** , which are the things you are interested in learning about! A good research question should be a question, i.e., something that can be answered. It should be specific, measurable, and (at least in theory) able to be answered with the right set of data. Try to avoid too broad of a question such as *"How does ____ affect people?"* or *"What trends are there in _____?"*

You will need to come up with **one research question of each of the following categories**:

- **Classification**: Predicting a target class (categorical/ordinal variable) or set of classes.  
  *Example: “Can we predict whether an employee will leave a company based on their salary and years of experience?"*

- **Regression**: Predicting a target value (continuous value) or set of target values.  
  *Example: “Can I predict a student's final exam score based on attendance rate and hours studying per week?"*

### Questions to Answer for Step 1

1. How would the answers to your RQs be useful/beneficial to other people?

2. For the classification RQ, are you more interested in **precision**, **recall**, or **F₁-score**?

3. For the classification RQ, propose **two different models** (can be two different neural network architectures) and **one "baseline" model** (a simpler model such as linear regression, SVM, decision tree) that you plan to use and compare. The baseline should be a simple model/heuristic that, without deep learning, would be considered for use.

4. For the regression RQ, propose **two different models** and **one "baseline" model** that you plan to use and compare.

5. For **both RQs**, name at least **3 major hyperparameters** that you plan to use while evaluating different versions of your proposed models (e.g., regularization methods could be one option).

> **Note**: These questions don't necessarily have to be fully answered before Step 2, as the actual dataset you find may have an impact on them. You are welcome to draft RQs first and then adjust them after finding your dataset.

### Model Guidance

- **Non-baseline models** can include: neural networks, convolutional neural networks, recurrent neural networks, attention-based models, GANs, autoencoders, and diffusion models.
- **Baseline models** can include: linear/logistic regression, support vector machines, decision trees, random forests, and perceptrons.

> If you are not already familiar with the non-baseline models listed after neural networks, I recommend avoiding those, as we won't be getting to them until later in the semester.

---

## Step 2: Get the Data

Your dataset can be scraped from a website or queried via an API, but probably the easiest way to find one is by searching on places such as those listed below. **Do not pay for a dataset**; there are plenty of free options.

### Recommended Data Sources

- Google Datasets Search
- Hugging Face Datasets
- OpenML.org
- Kaggle.com
- UC Irvine Machine Learning Repository
- Stanford Large Network Dataset Collection
- Amazon’s AWS datasets
- U.S. Government’s Open Data
- DataPortals.org
- Wikipedia’s list of machine learning datasets

> **Note on multiple datasets**: You are welcome to pick two datasets (i.e., one per RQ), however they need to have some sort of **thematic link** so that your final poster/report has a sense of cohesion (i.e., I don't want to see a project about classifying tigers and also predicting the number of hockey fights per season).

### Dataset Requirements

The dataset(s) you pick should have the following attributes:

- **Reasonable number of data points (750+)** for meaningful analysis and modeling. In theory, it's fine if your dataset has millions of data points, but just note that you may end up needing to use sampling to keep things computationally manageable.
- **Reasonable number of features (10+)** for greater variety for feature selection and/or interpretation.
- **Reasonable data format** (CSV, JSON, images, and/or text; unfortunately, due to limited coverage in the class, I will veto proposals for complex tasks/data such as reinforcement learning, chatbots, video, and 3D shapes)
- Can have numerical data (continuous/integer), ordinal data, or categorical data, or any subset/combination of those.

> **Note on image/text datasets**: Image/text datasets will be restricted to only classification RQs and will almost certainly be more challenging projects due to covering those topics later in the semester.

### Questions to Answer for Step 2

1. Where did you obtain the dataset? (Name of source and a URL)

2. Does this dataset appear to have missing data?

3. What types of data (e.g., numerical/categorical/etc. and tabular/image/text) are in this dataset?

4. How many instances (e.g., rows) and features (e.g., columns) are in this dataset?  
   - If you pick an **image dataset**, instead report the image dimensions as the number of features.  
   - If you pick a **text dataset**, describe how you will be encoding the data as the "number of features".

5. How does this dataset allow you to (attempt to) answer your two research questions?

---

## Submission & Grading

Your submission will be graded on the following components, with written portions submitted in the built-in text editor:

| Component | Points |
|-----------|--------|
| Two research questions submitted | 3 pts |
| Answers to the five Step 1 questions submitted | 5 pts |
| Answers to the five Step 2 questions submitted | 5 pts |
| Proposed project has a coherent topic/theme | 1 pt |
| Written responses are clear, reasonably easy to read | 0.5 pts |
| Written responses are submitted in the built-in text editor | 0.5 pts |

**Total: 15 points**