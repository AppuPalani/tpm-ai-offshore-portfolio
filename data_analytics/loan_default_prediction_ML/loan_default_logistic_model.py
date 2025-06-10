# Loan default prediction model for a sample dataset from kaggle

import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import accuracy_score, confusion_matrix, classification_report

# Load dataset
df = pd.read_csv("Loan_default_Dataset.csv")

# Sample preprocessing (adjust based on actual columns in your file)
df = df.dropna()  # Remove nulls

# Convert categorical to numeric (update these as needed)
df = pd.get_dummies(df, drop_first=True)

# Split data into features and label
X = df.drop('Loan_Status', axis=1)  # Replace 'Loan_Status' with your actual label column
y = df['Loan_Status']

# Train/Test Split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Build and train model
model = LogisticRegression(max_iter=1000)
model.fit(X_train, y_train)

# Predict and evaluate
y_pred = model.predict(X_test)
print("Accuracy:", accuracy_score(y_test, y_pred))
print("Confusion Matrix:\n", confusion_matrix(y_test, y_pred))
print("Classification Report:\n", classification_report(y_test, y_pred))