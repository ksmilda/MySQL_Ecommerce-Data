SELECT * FROM ecomm.dataset;


## Data
SELECT COUNT(*) FROM ecomm.dataset;
 #there are 2000 rows of data

## Check missing values
SELECT SUM(order_date IS NULL) AS missing_date, SUM(unit_price IS NULL) AS missing_price, 
SUM(customer_id IS NULL) AS missing_customer FROM ecomm.dataset;
 #there are no missing values

## Format data type 
### order_id, cust_id, product_id, country, product_name as varchar
ALTER TABLE ecomm.dataset MODIFY customer_id VARCHAR(20) NOT NULL, MODIFY order_id VARCHAR(20) NOT NULL,
MODIFY product_id VARCHAR(20) NOT NULL, MODIFY product_name VARCHAR(30) NOT NULL, MODIFY country VARCHAR(30) NOT NULL;

### signup_date, last_purchase_date, order_date as date
UPDATE ecomm.dataset SET signup_date = str_to_date(signup_date, '%m/%d/%Y'), 
last_purchase_date = str_to_date(last_purchase_date, '%m/%d/%Y'),
order_date = str_to_date(order_date, '%m/%d/%Y');
ALTER TABLE ecomm.dataset MODIFY signup_date DATE NOT NULL, MODIFY last_purchase_date DATE NOT NULL,
MODIFY order_date DATE NOT NULL;

### age, cancellations_coun, purchase_freq, quantity as int
ALTER TABLE ecomm.dataset MODIFY age INT NOT NULL, MODIFY cancellations_count INT NOT NULL, 
MODIFY purchase_frequency INT NOT NULL, MODIFY quantity INT NOT NULL;

### unit_price as dec
ALTER TABLE ecomm.dataset MODIFY unit_price DECIMAL(10,2) NOT NULL;

### suscription_status, preferred_category, category, gender as enum
SELECT DISTINCT subscription_status FROM ecomm.dataset;
SELECT DISTINCT preferred_category FROM ecomm.dataset;
SELECT DISTINCT category FROM ecomm.dataset;
SELECT DISTINCT gender FROM ecomm.dataset;
ALTER TABLE ecomm.dataset MODIFY subscription_status ENUM('active','paused','cancelled') NOT NULL, 
MODIFY preferred_category ENUM('Sports','Electronics','Clothing','Beauty','Home') NOT NULL,
MODIFY category ENUM('Sports','Electronics','Clothing','Beauty','Home') NOT NULL,
MODIFY gender ENUM('Female','Male','Other') NOT NULL;

### order id as pk
ALTER TABLE ecomm.dataset ADD PRIMARY KEY (order_id);

## Check for duplicate
SELECT order_id, COUNT(*) FROM ecomm.dataset 
GROUP BY order_id HAVING COUNT(*) > 1;

