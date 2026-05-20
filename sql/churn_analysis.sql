-- 1. Total Customers

SELECT COUNT(*) AS total_customers
FROM churn;

-- 2. Churn Distribution

SELECT
    Churn,
    COUNT(*) AS customer_count
FROM churn
GROUP BY Churn;

---3. Churn Percentage

SELECT
    Churn,
    ROUND(
        COUNT(*) * 100.0 / (SELECT COUNT(*) FROM churn),
        2
    ) AS churn_percentage
FROM churn
GROUP BY Churn;

-- 4. Customer Distribution by Contract Type

SELECT 
    Contract,
    COUNT(*) AS total_customers
FROM churn
GROUP BY Contract
ORDER BY total_customers DESC;    

-- 5. Churn Rate by Contract Type

SELECT
    Contract,
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
    2
    ) AS churn_rate
FROM churn
GROUP BY Contract
ORDER BY churn_rate DESC;   

-- 6. Churn Rate by Internet Service

SELECT
    InternetService,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate

FROM churn
GROUP BY InternetService
ORDER BY churn_rate DESC;

-- 7. Churn Rate by Payment Method

SELECT
     PaymentMethod,
     ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
     ) AS churn_rate
FROM churn
GROUP BY PaymentMethod
ORDER BY churn_rate DESC;     

-- 8. Average Monthly Charges by Churn

SELECT
    Churn,
    ROUND(AVG(MonthlyCharges),2
    ) AS average_monthly_charge
FROM churn
GROUP BY Churn;

-- 9. Average Tenure by Churn

SELECT
    Churn,
    ROUND(AVG(tenure),2) AS average_tenure
FROM churn  
GROUP BY Churn;

-- 10. High-Risk Customer Segments

SELECT
    Contract,
    InternetService,
    ROUND(AVG(MonthlyCharges),2)
    AS average_monthly_charge,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),2
    ) AS churn_rate 
FROM churn
GROUP BY Contract, InternetService
ORDER BY churn_rate DESC;