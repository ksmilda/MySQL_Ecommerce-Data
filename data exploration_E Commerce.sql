SELECT * FROM ecomm.dataset;

## Total orders
SELECT COUNT(DISTINCT order_id) AS number_of_orders FROM ecomm.dataset;
SELECT MIN(order_date) AS oldest_order_date FROM ecomm.dataset;
SELECT MAX(order_date) AS latest_order_date FROM ecomm.dataset;
## Total orders per country
SELECT country, COUNT(order_id) AS total_orders FROM ecomm.dataset
GROUP BY country ORDER BY total_orders DESC;


## Total revenue
SELECT round(sum(unit_price * quantity),2) AS revenue FROM ecomm.dataset;
## Revenue per country
SELECT country, SUM(unit_price * quantity) AS revenue FROM ecomm.dataset GROUP BY country ORDER BY revenue;
## Revenue growth per year (by order date)
SELECT YEAR(order_date) AS order_year, SUM(unit_price * quantity) AS total_revenue
FROM ecomm.dataset GROUP BY YEAR(order_date) ORDER BY order_year;
## Top 5 products based on revenue
SELECT product_name, SUM(unit_price * quantity) AS revenue
FROM ecomm.dataset GROUP BY product_name ORDER BY revenue DESC LIMIT 5;

## Average Order Value (AOV)
SELECT round(sum(unit_price * quantity) / COUNT(DISTINCT order_id),2) AS "AOV" FROM ecomm.dataset;

## Number of customers by subscription status
SELECT subscription_status, COUNT(order_id) AS total_Cust FROM ecomm.dataset 
WHERE subscription_status IN ('active','paused','cancelled') GROUP BY subscription_status;
## Customer with more than 1 cancellation
SELECT customer_id, cancellations_count FROM ecomm.dataset 
WHERE cancellations_count > 1 ORDER BY cancellations_count ASC;
SELECT COUNT(cancellations_count) FROM ecomm.dataset WHERE cancellations_count > 1;
## Average age of customers
SELECT ROUND(AVG(age),1) AS avg_customer_age FROM ecomm.dataset;

## Churn rate
SELECT ((COUNT(DISTINCT CASE WHEN subscription_status = "cancelled" THEN customer_id END) *1.0) /
(COUNT(DISTINCT customer_id))) AS "Churn Rate" FROM ecomm.dataset;
## Country with highest churn rate
SELECT country, 
COUNT(DISTINCT CASE WHEN subscription_status='cancelled' THEN customer_id END) * 1.0 /
COUNT(DISTINCT customer_id) AS churn_rate FROM ecomm.dataset
GROUP BY country ORDER BY churn_rate DESC;



## Product with highest purchase frequency
SELECT product_name, AVG(purchase_frequency) AS avg_frequency FROM ecomm.dataset
GROUP BY product_name ORDER BY avg_frequency DESC LIMIT 5;
## Gender distribution by purchase category
SELECT category, gender, COUNT(order_id) AS total_orders FROM ecomm.dataset 
GROUP BY category, gender ORDER BY category, total_orders DESC;
## Average purchase frequency by category
SELECT category, AVG(purchase_frequency) AS avg_purchase_freq
FROM ecomm.dataset GROUP BY category ORDER BY avg_purchase_freq DESC;
## Top 5 customers with highest spending and their country
SELECT customer_id, age, country, SUM(unit_price * quantity) AS total_Spent
FROM ecomm.dataset GROUP BY customer_id, country ORDER BY total_Spent DESC LIMIT 5;