# MySQL_Ecommerce-Data
This is ksmilda's portfolio: Data cleaning and data exploration using MySQL.

## Project Background 
With this project, I'm analyzes an open dataset obtained from Kaggle [link](https://www.kaggle.com/datasets/nabihazahid/e-commerce-customer-insights-and-churn-dataset/data), which contains simulated e-commerce transactions. The dataset includes customer information, order details, product categories, sales values, and other related attributes. Although the dataset does not represent a specific company, it serves as a realistic sample to demonstrate data exploration, KPI tracking, and dashboard building.

The purpose of this analysis is to showcase data cleaning, SQL queries, and visualization skills for business intelligence use cases such as sales monitoring, customer segmentation, and churn analysis. This whole SQL project was executed on the MySQL Server, below is a snapshot of a few of the columns and entries in the [dataset](https://github.com/ksmilda/MySQL_Ecommerce-Data/blob/312f3babf0d8f275bde012918adf4d978993c4c3/E%20Commerce%20Customer%20Insights%20and%20Churn%20Dataset.xlsx).  




![snapshot of the dataset](image/ss_dataset.png)




## Data Cleaning
Before the exploration begins, the dataset is checked and cleaned to ensure there are no missing values nor duplicate rows, as documented in [this file](https://github.com/ksmilda/MySQL_Ecommerce-Data/blob/56a4d3774fa5f1b81d371230d57f4ffe25ab50cf/data%20cleaning_E%20Commerce.sql). The process include formatting the data type (normalizing) and setting the column `order_id` as the primary key. 

## Data Exploration
With a clean dataset in place, I began the exploratory data analysis (EDA) to better understand the underlying patterns and behaviors within the data. The goal of this stage is not only to summarize key metrics such as revenue, profit, and customer distribution, but also to uncover trends across different segments (e.g., gender, country, and subscription status).

This exploration provides the first set of insights into customer behavior and business performance. The data exploration query can be accessed in [this link](https://github.com/ksmilda/MySQL_Ecommerce-Data/blob/a7ddfdad6be8f39a38bb14e322e5036a58e287aa/data%20exploration_E%20Commerce.sql).


1. Numbers of orders
   - Using this query on MySQL, resulting there were 2000 order based on counting `order_id` ranging from 2020-09-18 untill 2025-09-20.


     ![screenshot on mysql for number of orders](image/ss_number_of_orders.png)


     And the order were increase every year, which may indicate growing customer engagement.
     
     ![screenshot on mysql for number of orders by year](image/ss_orders_peryear.png)



   - The number of orders based on each country. Picture below showed that country with the most number of orders were Germany with 360 orders.

     ![screenshot on mysql for number of orders each country](image/ss_orders_country.png)



3. Total revenue
   - The total revenue was $2.051.690,65.

     ![screenshot on mysql for total revenue](image/ss_total_revenue.png)



   - The total revenue based on country as attached below, show that the percentage revenue for each country is relatively balanced, with no single country accounting for more than one-fifth of total sales. This suggests the business has a diversified customer base across markets.

     ![screenshot on mysql for revenue by country](image/ss_revenue_country.png)


   - The revenue growth were increased every year, along with sales growth. This indicates that the growth is being driven by both higher transaction counts and consistent customer spending.

     ![screenshot on mysql for revenue growth](image/ss_growth_revenue.png)




4. Average order value (AOV)
   - The Average order value (AOV) for every country means on average each transaction contributes as number below in revenue. Countries like India and Pakistan show higher AOVs, while the UK has a lower AOV.


     <img width="1505" height="405" alt="image" src="https://github.com/user-attachments/assets/8eb77e23-8bf8-44cc-a58c-257d78bad04e" />


5. Customers demographic
   - The number of customers based on subscription status. 

     ![screenshot on mysql for total customers](image/ss_number_cust.png)


   - Customers with more than 1 cancellation orders,

     ![screenshot on mysql for cust with cancellation](image/ss_cust_cancel.png)


     and the total of it.
     ![screenshot on mysql for number of cust with cancellation](image/ss_total_cust_cancel.png)
 
   - Average age of customers.
     
     ![screenshot on mysql for avg age cust](image/ss_avg_age_cust.png)


   - Gender distribution.
     
     ![screenshot on mysql for avg age cust](image/ss_avg_age_cust.png)


6. Churn rate (and every country's)
   - The churn rate. 

     ![screenshot on mysql for churn rate](image/ss_churn_rate.png)


   - The churn rate for each country.

     ![screenshot on mysql for churn rate each country](image/ss_churn_rate_country.png)


7. Product and Category
   - Top 5 product based on revenue.

     ![screenshot on mysql for top 5 revenue product](image/ss_top_revenue_product.png)

   
   - Product with highest purchase frequency.

     ![screenshot on mysql for product](image/ss_product_freq.png)


   - Gender distribution by purchase category.

     ![screenshot on mysql gender distribution by category](image/ss_gender_dist_purchase.png)


   - Average purchase frequency by category.

     ![screenshot on mysql average purchase](image/ss_avg_purchase_freq.png)


   - Top 5 customers with highest spending and their country.

     ![screenshot on mysql customer highest spending](image/ss_top5_cust.png)


## Conclusion
