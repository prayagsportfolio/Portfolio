/*
===============================================================================
Project: Accepted Loans Data Pipeline & Risk Analytics
Author: Prayag Bhatt
===============================================================================
*/

-- ============================================================================
-- PHASE 1: DATA TRANSFORMATION & CLEANING (SILVER LAYER)
-- ============================================================================
-- Creating a view to clean text fields, parse dates, and cast integers without destroying the raw data imported by Airbyte.

CREATE OR REPLACE VIEW vw_cleaned_loans AS 
SELECT 
    id, 
    loan_amnt, 
    int_rate, 
    installment, 
    grade, 
    sub_grade, 
    emp_title, 
    home_ownership, 
    annual_inc, 
    verification_status, 
    loan_status, 
    purpose, 
    dti, 
    addr_state, 

    CAST(REPLACE(term, ' months', '') AS INTEGER) AS term_months, 
    
    TO_DATE(issue_d, 'Mon-YYYY') AS issue_date, 
    
    CAST(NULLIF(REGEXP_REPLACE(emp_length, '\D', '', 'g'), '') AS INTEGER) AS emp_length_years, 
    
    TO_DATE(earliest_cr_line, 'Mon-YYYY') AS earliest_cr_line_date 

FROM accepted_loans;


-- ============================================================================
-- PHASE 2: QUERIES FOR RISK ANALYTICS
-- ============================================================================
-- Query 1: Top 10 States by Average Loan Amount
-- Filtered for statistical significance (>100 loans)

SELECT 
    addr_state, 
    COUNT(id) AS total_loans, 
    ROUND(AVG(loan_amnt), 2) AS avg_loan_amount 
FROM vw_cleaned_loans 
GROUP BY addr_state 
HAVING COUNT(id) > 100 
ORDER BY avg_loan_amount DESC 
LIMIT 10;

-- Query 2: Validating that riskier loan grades are assigned higher interest rates

SELECT 
    grade, 
    COUNT(id) AS total_loans, 
    ROUND(AVG(int_rate), 2) AS avg_interest_rate 
FROM vw_cleaned_loans 
WHERE grade IS NOT NULL
GROUP BY grade 
ORDER BY grade ASC;

-- Query 3: Calculating true default rates by credit grade

SELECT 
    grade, 
    COUNT(id) AS total_loans, 
    SUM(CASE WHEN loan_status IN ('Charged Off', 'Default') THEN 1 ELSE 0 END) AS failed_loans, 
    ROUND(SUM(CASE WHEN loan_status IN ('Charged Off', 'Default') THEN 1 ELSE 0 END) * 100.0 / COUNT(id), 2) AS default_rate_pct 
FROM vw_cleaned_loans 
WHERE grade IS NOT NULL 
GROUP BY grade 
ORDER BY grade ASC;

-- Query 4: Analyzing loan purpose against Debt-to-Income (DTI) and failure rates

SELECT 
    purpose, 
    COUNT(id) AS total_loans, 
    ROUND(AVG(loan_amnt), 2) AS avg_loan_amount, 
    ROUND(AVG(dti), 2) AS avg_dti, 
    ROUND(SUM(CASE WHEN loan_status IN ('Charged Off', 'Default') THEN 1 ELSE 0 END) * 100.0 / COUNT(id), 2) AS default_rate_pct 
FROM vw_cleaned_loans 
WHERE purpose IS NOT NULL 
GROUP BY purpose 
ORDER BY total_loans DESC 
LIMIT 10;