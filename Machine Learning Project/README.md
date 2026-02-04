# MBTI Personality Type Predictor

## 📌 Project Overview
This project utilizes Machine Learning to predict an individual's **Myers-Briggs Type Indicator (MBTI)** personality based on demographic and psychometric data. The goal is to optimize personality assessment by replacing time-consuming surveys with efficient algorithmic predictions.

## 🚀 Key Features
* **Dataset:** 128,061 observations with 8 input parameters (Age, Gender, Education, Interest, and Psychometric Scores).
* **Methods Evaluated:** Logistic Regression, Lasso/Ridge Regression, Decision Trees, Random Forest, and SVM.
* **Best Model:** **Random Forest** achieved the highest performance with **90.4% Accuracy**.

## 📊 Results
We compared multiple models to handle the multi-class classification problem. The Random Forest model proved most effective, successfully capturing non-linear relationships between traits like 'Introversion Score' and personality types.

| Model | Accuracy | Precision | Recall |
| :--- | :--- | :--- | :--- |
| **Random Forest** | **90.4%** | **81.3%** | **79.5%** |
| Logistic Regression | 89.7% | 71.2% | 62.2% |
| Decision Tree | 87.6% | 80.9% | 79.4% |
| SVM (Radial) | 86.8% | 80.8% | 73.5% |

## 📂 Project Structure
* **Report:** Detailed methodology and analysis (see attached `.pdf` file).
