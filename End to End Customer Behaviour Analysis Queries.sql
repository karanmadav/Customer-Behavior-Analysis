CREATE DATABASE retail_analytics;
USE retail_analytics;
CREATE TABLE customer_transactions (
    customer_id INT,
    age INT,
    age_group VARCHAR(20),
    gender VARCHAR(10),
    item_purchased VARCHAR(100),
    category VARCHAR(50),
    purchase_amount_usd DECIMAL(10,2),
    location VARCHAR(50),
    size VARCHAR(10),
    color VARCHAR(20),
    season VARCHAR(20),
    review_rating DECIMAL(3,1),
    subscription_status BOOLEAN,
    shipping_type VARCHAR(20),
    discount_applied BOOLEAN,
    previous_purchases INT,
    payment_method VARCHAR(30),
    purchase_frequency VARCHAR(20)
);
USE retail_analytics;
DROP TABLE IF EXISTS customer_transactions;
SELECT COUNT(*) FROM customer_shopping_cleaned;
# Total Revenue
SELECT 
    SUM(`purchase_amount_(usd)`) AS total_revenue
FROM customer_shopping_cleaned;

#Average Order Value
SELECT 
    ROUND(AVG(`purchase_amount_(usd)`), 2) AS avg_order_value
FROM customer_shopping_cleaned;

#Revenue by Category
SELECT 
    category,
    SUM(`purchase_amount_(usd)`) AS revenue
FROM customer_shopping_cleaned
GROUP BY category
ORDER BY revenue DESC;

#Custmer Distribution by Age Group

SELECT 
    age_group,
    COUNT(DISTINCT customer_id) AS total_customers
FROM customer_shopping_cleaned
GROUP BY age_group;

#Gender wise spending behaviour
SELECT 
    gender,
    SUM(`purchase_amount_(usd)`) AS total_spent
FROM customer_shopping_cleaned
GROUP BY gender;

#Top 10 High value customers
SELECT 
    customer_id,
    SUM(`purchase_amount_(usd)`) AS lifetime_value
FROM customer_shopping_cleaned
GROUP BY customer_id
ORDER BY lifetime_value DESC
LIMIT 10;

#Discount Impact on sales
SELECT 
    discount_applied,
    COUNT(*) AS total_orders,
    ROUND(AVG(`purchase_amount_(usd)`), 2) AS avg_order_value
FROM customer_shopping_cleaned
GROUP BY discount_applied;

#Subscription or Non subscription revenue
SELECT 
    subscription_status,
    SUM(`purchase_amount_(usd)`) AS revenue
FROM customer_shopping_cleaned
GROUP BY subscription_status;

#Preffered payment methods
SELECT 
    payment_method,
    COUNT(*) AS usage_count
FROM customer_shopping_cleaned
GROUP BY payment_method
ORDER BY usage_count DESC;

#Sales trend
SELECT 
    season,
    SUM(`purchase_amount_(usd)`) AS seasonal_revenue
FROM customer_shopping_cleaned
GROUP BY season
ORDER BY seasonal_revenue DESC;

#Product category vs review rating
SELECT 
    category,
    ROUND(AVG(review_rating), 2) AS avg_rating
FROM customer_shopping_cleaned
GROUP BY category
ORDER BY avg_rating DESC;

#High rating by low revenue
SELECT 
    category,
    ROUND(AVG(review_rating), 2) AS avg_rating,
    SUM(`purchase_amount_(usd)`) AS revenue
FROM customer_shopping_cleaned
GROUP BY category
HAVING avg_rating >= 4
ORDER BY revenue ASC;

#Repeat vs new customers
SELECT
    CASE 
        WHEN previous_purchases = 0 THEN 'New Customer'
        ELSE 'Repeat Customer'
    END AS customer_type,
    COUNT(*) AS customer_count
FROM customer_shopping_cleaned
GROUP BY customer_type;

#Purchase frequency behaviour
SELECT 
    age_group,
    ROUND(AVG(purchase_frequency_days), 1) AS avg_days_between_purchases
FROM customer_shopping_cleaned
GROUP BY age_group;

#Customer Loyalty
SELECT 
    customer_id,
    previous_purchases,
    frequency_of_purchases
FROM customer_shopping_cleaned
WHERE previous_purchases >= 5
ORDER BY previous_purchases DESC;

