SELECT * FROM ecomm.dataset;

## Total orders
SELECT COUNT(DISTINCT order_id) AS number_of_orders FROM ecomm.dataset;
SELECT MIN(order_date) AS oldest_order_date FROM ecomm.dataset;
SELECT MAX(order_date) AS latest_order_date FROM ecomm.dataset;
## total order every year
SELECT COUNT(DISTINCT order_id),YEAR(order_date) AS number_of_orders FROM ecomm.dataset GROUP BY YEAR(order_date);

## Total orders per country
SELECT country, COUNT(order_id) AS total_orders FROM ecomm.dataset
GROUP BY country ORDER BY total_orders DESC;


## Total revenue
SELECT round(sum(unit_price * quantity),2) AS revenue FROM ecomm.dataset;
## Revenue per country
SELECT country, SUM(unit_price * quantity) AS total_revenue,
    ROUND(SUM(unit_price * quantity) * 100.0 /
        (SELECT SUM(unit_price * quantity) FROM ecomm.dataset), 2) AS revenue_percentage
FROM ecomm.dataset
GROUP BY country
ORDER BY total_revenue DESC;

## Revenue growth per year (by order date)
SELECT YEAR(order_date) AS order_year, SUM(unit_price * quantity) AS total_revenue
FROM ecomm.dataset GROUP BY YEAR(order_date) ORDER BY order_year;


## Average Order Value (AOV)
SELECT round(sum(unit_price * quantity) / COUNT(DISTINCT order_id),2) AS "AOV", country FROM ecomm.dataset GROUP BY country;

## Number of customers by subscription status
SELECT subscription_status, COUNT(order_id) AS total_Cust FROM ecomm.dataset 
WHERE subscription_status IN ('active','paused','cancelled') GROUP BY subscription_status;
## Customer with more than 1 cancellation
SELECT COUNT(cancellations_count) FROM ecomm.dataset WHERE cancellations_count > 1;
SELECT customer_id, MAX(COALESCE(cancellations_count,0)) AS total_cancellations,
  SUM(unit_price * quantity) AS total_revenue FROM ecomm.dataset
GROUP BY customer_id HAVING total_cancellations > 1 ORDER BY total_revenue DESC;
## Average age of customers
SELECT ROUND(AVG(age),1) AS avg_customer_age FROM ecomm.dataset;
SELECT DISTINCT age, COUNT(age) AS count_ FROM ecomm.dataset GROUP BY age ORDER BY count_ DESC;
## Gender distribution of customer
SELECT gender, COUNT(DISTINCT customer_id) AS total_customers,
ROUND(COUNT(DISTINCT customer_id) * 100.0 / (SELECT COUNT(DISTINCT customer_id) FROM ecomm.dataset), 2)
AS percentage FROM ecomm.dataset GROUP BY gender;

## Churn rate
SELECT ((COUNT(DISTINCT CASE WHEN subscription_status = "cancelled" THEN customer_id END) *1.0) /
(COUNT(DISTINCT customer_id))) AS "Churn Rate" FROM ecomm.dataset;

SELECT YEAR(order_date) AS year, 
COUNT(DISTINCT CASE WHEN subscription_status = 'cancelled' THEN customer_id END) * 1.0 /
COUNT(DISTINCT customer_id) AS churn_rate FROM ecomm.dataset GROUP BY YEAR(order_date) ORDER BY year;

## Country with highest churn rate
SELECT country, 
COUNT(DISTINCT CASE WHEN subscription_status='cancelled' THEN customer_id END) * 1.0 /
COUNT(DISTINCT customer_id) AS churn_rate FROM ecomm.dataset
GROUP BY country ORDER BY churn_rate DESC;


## Top 5 products based on revenue
SELECT product_name, SUM(unit_price * quantity) AS revenue
FROM ecomm.dataset GROUP BY product_name ORDER BY revenue DESC LIMIT 5;
## top 5 most purchased product
SELECT product_name, SUM(quantity) AS total_quantity_sold FROM ecomm.dataset 
GROUP BY product_name ORDER BY total_quantity_sold DESC LIMIT 5;
## Gender distribution by purchase category
SELECT category, gender, COUNT(order_id) AS total_orders FROM ecomm.dataset 
GROUP BY category, gender ORDER BY total_orders DESC;
## Average purchase frequency by category
SELECT category, AVG(purchase_frequency) AS avg_purchase_freq
FROM ecomm.dataset GROUP BY category ORDER BY avg_purchase_freq DESC;
## Top 5 customers with highest spending and their country
SELECT customer_id, age, country, SUM(unit_price * quantity) AS total_Spent
FROM ecomm.dataset GROUP BY customer_id, country ORDER BY total_Spent DESC LIMIT 5;
