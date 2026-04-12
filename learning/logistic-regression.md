Logistic Regression is a binary classification algorithm that predicts the probability of an outcome being 0 or 1.

It works in three steps. First, it computes a linear combination of input features — just a weighted sum of your inputs plus a bias. This gives a raw score with no bounds, any number from negative to positive infinity.
Second, that raw score is passed through the sigmoid function, which squashes it into a probability between 0 and 1. If the raw score is very positive, probability is close to 1. Very negative, close to 0. Near zero means the model is uncertain — right on the decision boundary.

Third, the model learns by minimizing cross entropy loss using gradient descent. It makes predictions, measures how wrong it was, computes gradients to find which weights caused the error, and nudges them in the right direction. It repeats this for every epoch until it reaches the optimal weights and bias — the global minimum of the loss.

The decision boundary is a straight line or hyperplane in the feature space — logistic regression is a linear classifier. The sigmoid is a curve, but what separates the two classes is always linear.
Once trained, the model is just one formula:
probability = sigmoid(optimal_weights × new_data + bias)
Above 0.5 → class 1. Below 0.5 → class 0.
The entire goal of training is to find the optimal weights and bias such that when you pass new unseen data, the model correctly estimates which class it belongs to — expressed as a probability, not just a hard label.