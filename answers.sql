. Which product categories have the highest sales?


WITH sales_by_category AS (
  SELECT 
    p.category,
    SUM(o.total) AS total_sales
  FROM 
    orders o
  JOIN 
    order_items oi ON o.order_id = oi.order_id
  JOIN 
    products p ON oi.product_id = p.product_id
  GROUP BY 
    p.category
)
SELECT 
  category,
  total_sales
FROM 
  sales_by_category
ORDER BY 
  total_sales DESC;


2. What is the average delivery time for orders?


WITH delivery_times AS (
  SELECT 
    o.order_id,
    o.order_date,
    o.delivery_date,
    TIMESTAMPDIFF(DAY, o.order_date, o.delivery_date) AS delivery_time
  FROM 
    orders o
)
SELECT 
  AVG(delivery_time) AS average_delivery_time
FROM 
  delivery_times;


3. Which states have the highest number of orders?


WITH orders_by_state AS (
  SELECT 
    c.state,
    COUNT(o.order_id) AS num_orders
  FROM 
    orders o
  JOIN 
    customers c ON o.customer_id = c.customer_id
  GROUP BY 
    c.state
)
SELECT 
  state,
  num_orders
FROM 
  orders_by_state
ORDER BY 
  num_orders DESC;

