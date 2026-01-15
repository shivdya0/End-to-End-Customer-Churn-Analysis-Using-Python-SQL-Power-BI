CREATE DATABASE churn_db;
USE churn_db;



CREATE TABLE CREATE TABLE churn_data (
    customer_id INT PRIMARY KEY,
    age INT,
    gender VARCHAR(10),
    city VARCHAR(50),
    join_date DATE,
    plan_type VARCHAR(20),
    monthly_fee INT,
    subscription_status VARCHAR(20),
    avg_weekly_usage_hours INT,
    last_login_days_ago INT,
    payment_delay_days INT,
    total_paid INT,
    tickets_raised INT,
    last_ticket_days_ago INT,
    low_usage_flag INT,
    inactive_flag INT,
    payment_risk_flag INT,
    support_risk_flag INT,
    churn_risk_score INT,
    churn_risk_level VARCHAR(10)
);
 (
    customer_id INT PRIMARY KEY,
    age INT,
    gender VARCHAR(10),
    city VARCHAR(50),
    join_date DATE,
    plan_type VARCHAR(20),
    monthly_fee INT,
    subscription_status VARCHAR(20),
    avg_weekly_usage_hours INT,
    last_login_days_ago INT,
    payment_delay_days INT,
    total_paid INT,
    tickets_raised INT,
    last_ticket_days_ago INT,
    low_usage_flag INT,
    inactive_flag INT,
    payment_risk_flag INT,
    support_risk_flag INT,
    churn_risk_score INT,
    churn_risk_level VARCHAR(10)
);

Select * from churn_data ;
SELECT * FROM churn_data LIMIT 10;

SELECT churn_risk_level, COUNT(*) 
FROM churn_data
GROUP BY churn_risk_level;

# BUSINESS QUERIES (VERY IMPORTANT)
# High Risk Customers
SELECT customer_id, city, plan_type
FROM churn_data
WHERE churn_risk_level = 'High';

# Churn Risk by Plan
SELECT plan_type, churn_risk_level, COUNT(*) AS total_customers
FROM churn_data
GROUP BY plan_type, churn_risk_level;

# City-wise Churn
SELECT city, churn_risk_level, COUNT(*) AS count
FROM churn_data
GROUP BY city, churn_risk_level;

# view creation

# View 1: Risk Summary
CREATE VIEW churn_summary AS
SELECT churn_risk_level, COUNT(*) AS total_customers
FROM churn_data
GROUP BY churn_risk_level;

# View 2: High Risk Customers
CREATE VIEW high_risk_customers AS
SELECT customer_id, city, plan_type, total_paid
FROM churn_data
WHERE churn_risk_level = 'High';


# Index (“I used indexing to optimize query performance for dashboards.”)
/*What You Achieved (Resume Points)

Designed MySQL schema for churn analytics

Loaded processed data from Python to MySQL

Wrote business-driven SQL queries

Created views for Power BI dashboards

Optimized queries using indexes*/










