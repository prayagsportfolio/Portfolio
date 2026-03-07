# 🏦 Data Engineering & Risk Analytics: Accepted Loans Dataset

## 📌 Project Overview
This project demonstrates a complete ELT (Extract, Load, Transform) data pipeline and risk analysis using a massive **1.6 GB** real-world dataset of accepted personal and business loans. The core objective was to architect a local data warehouse environment, securely ingest millions of raw loan records, normalize inconsistent string data, and extract actionable business intelligence regarding loan default rates and borrower risk profiles.



## 🛠️ Technology Stack
* **Data Integration / Ingestion:** Airbyte (`abctl`), SFTP
* **Containerization:** Docker
* **Database / Data Warehouse:** PostgreSQL
* **Data Transformation & Analytics:** SQL (PostgreSQL Dialect)

## 🏗️ Pipeline Architecture (The ELT Process)

### 1. Extract & Load (EL)
* Provisioned a local PostgreSQL database and an SFTP server using **Docker** containers.
* Bypassed standard network upload limits by mounting the 1.6 GB CSV dataset directly into the local SFTP container.
* Configured **Airbyte** to extract the data via SFTP and load it directly into the PostgreSQL data warehouse, migrating hundreds of thousands of rows seamlessly.

### 2. Transform (T)
* The raw data contained inconsistent types (e.g., dates formatted as `Mon-YYYY` strings, integers mixed with text).
* Created a clean, virtual "Silver Layer" using a SQL `VIEW` (`vw_cleaned_loans`).
* Utilized advanced string manipulation and **Regular Expressions (`REGEXP_REPLACE`)** to strip text from numeric fields (e.g., converting `"10+ years"` to `10`) and cast string columns to proper `DATE` and `INTEGER` data types for accurate aggregation.

## 📊 Key Business Insights & Analytics

After cleaning the data, I executed a series of analytical queries to validate standard risk pricing models and uncover borrower behavior.

**1. Validating the Risk Pricing Model**
Analysis confirmed that the institutional pricing model correctly scales interest rates according to credit risk. Average interest rates scaled perfectly from **6.91%** for Grade A borrowers up to **27.94%** for Grade G borrowers.

**2. The Prediction Engine (Default Rates)**
Using conditional aggregation, I calculated the true default ("Charged Off") rate per credit grade. The internal grading model proved highly accurate at predicting failure:
* **Grade A:** 4.13% Default Rate
* **Grade G:** 41.77% Default Rate (A 10x increase in risk)

**3. Borrower Intent & The "Debt Cycle"**
Volume analysis revealed that borrowers primarily use these loans to manage existing liabilities. `debt_consolidation` (336k+ loans) and `credit_card` (137k+ loans) comprised the vast majority of the volume. These specific borrowers also carried the highest average Debt-to-Income (DTI) ratios at nearly 20%.

**4. The Small Business Anomaly**
Borrowers taking out loans for `small_business` possessed one of the lowest average DTIs (15.64%), indicating relatively stable personal financial health. However, this category experienced the **highest default rate (19.64%)** across all major loan purposes, highlighting the extreme inherent risk of small business ventures compared to personal debt consolidation.

## 📁 Repository Files
* `transformation_pipeline.sql`: Contains the complete SQL script for creating the cleaned data view and all risk analytics queries.

## 👤 Author
**[Your Name Here]**
* [LinkedIn Profile URL]
* [Your Portfolio Website URL]
