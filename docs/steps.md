## What We Are Trying to Do

We have a large health survey dataset from the CDC with information about
253,680 people. Using this data we want to answer two questions:

1. Can we predict if someone has diabetes based on their lifestyle?
2. Can we predict someone's BMI based on their lifestyle?

---

## Our Plan

### 1. Set Up the Environment
Get Google Colab running with a GPU so training does not take too long.

### 2. Get the Data
Download the CDC Diabetes Health Indicators dataset and load it in.

### 3. Understand the Data
Look at what the data contains, check if anything is missing, and see
how many diabetic vs non-diabetic cases we have.

### 4. Prepare the Data
Clean it up, split it into training and testing sets, and scale the
features so they are all on the same range.

### 5. Build Classification Models
Train three models to predict diabetes — starting simple and going deeper:
- A basic logistic regression as our starting point
- A simple neural network
- A deeper neural network

We will pay special attention to how well each model catches actual
diabetic patients, not just overall accuracy.

### 6. Build Regression Models
Train three models to predict BMI — same approach, simple to complex:
- A basic linear regression as our starting point
- A simple neural network
- A deeper neural network

### 7. Visualize the Results
Create charts and plots to show how well our models performed and
where they struggled.

### 8. Draw Conclusions
Compare all models, summarize what worked, what did not, and what
we would do differently with more time.

### 9. Build the Poster
Put everything together into the final project poster.