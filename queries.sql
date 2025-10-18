-- E-COMMERCE ORDER MANAGEMENT SYSTEM
-- Query 1: Total Sales by Category

SELECT 
    c.category_name,
    COUNT(DISTINCT o.order_id) as total_orders,
    ROUND(SUM(oi.subtotal), 2) as total_revenue,
    ROUND(AVG(oi.subtotal), 2) as avg_order_value,
    COUNT(oi.product_id) as total_items_sold
FROM categories c
LEFT JOIN products p ON c.category_id = p.category_id
LEFT JOIN order_items oi ON p.product_id = oi.product_id
LEFT JOIN orders o ON oi.order_id = o.order_id
GROUP BY c.category_id, c.category_name
ORDER BY total_revenue DESC;


-- Query 2: Top 5 Customers by Spending

SELECT c.customer_id,
    c.first_name || ' ' || c.last_name as customer_name,
    c.email,
    COUNT(o.order_id) as total_orders,
    ROUND(SUM(o.total_amount), 2) as total_spent,
    ROUND(AVG(o.total_amount), 2) as avg_order_value,
    MAX(o.order_date) as last_order_date
FROM customers c LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY total_spent DESC
LIMIT 5;


-- Query 3: Product Performance Analysis

SELECT 
    p.product_id,
    p.product_name,
    ROUND(p.price, 2) as price,
    p.stock_quantity,
    COUNT(DISTINCT oi.order_id) as times_ordered,
    SUM(oi.quantity) as total_quantity_sold,
    ROUND(AVG(r.rating), 2) as avg_rating,
    COUNT(r.review_id) as total_reviews,
    ROUND(SUM(oi.subtotal), 2) as total_revenue
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
LEFT JOIN reviews r ON p.product_id = r.product_id
GROUP BY p.product_id
ORDER BY total_revenue DESC;


-- Query 4: Order Status Distribution

SELECT 
    order_status,
    COUNT(*) as count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM orders), 2) as percentage,
    MIN(order_date) as earliest_order,
    MAX(order_date) as latest_order
FROM orders
GROUP BY order_status;


-- Query 5: Daily Sales Trend

SELECT 
    DATE(o.order_date) as order_date,
    COUNT(DISTINCT o.order_id) as orders_count,
    ROUND(SUM(o.total_amount), 2) as daily_revenue,
    ROUND(AVG(o.total_amount), 2) as avg_order_value
FROM orders o
WHERE o.payment_status = 'paid'
GROUP BY DATE(o.order_date)
ORDER BY order_date DESC;


-- Query 6: Customers with Pending or Unpaid Orders

SELECT 
    c.customer_id,
    c.first_name || ' ' || c.last_name as customer_name,
    c.email,
    o.order_id,
    o.order_date,
    ROUND(o.total_amount, 2) as amount,
    o.order_status,
    o.payment_status
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_status = 'pending' OR o.payment_status = 'unpaid'
ORDER BY o.order_date;


-- Query 7: Low Stock Alert

SELECT 
    p.product_id,
    p.product_name,
    p.stock_quantity,
    ROUND(p.price, 2) as price,
    c.category_name,
    COALESCE(SUM(oi.quantity), 0) as monthly_sales
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
LEFT JOIN categories c ON p.category_id = c.category_id
WHERE p.stock_quantity < 30
GROUP BY p.product_id
ORDER BY p.stock_quantity ASC;


-- Query 8: Customer Lifetime Value with Purchase History

SELECT 
    c.customer_id,
    c.first_name || ' ' || c.last_name as customer_name,
    c.country,
    o.order_id,
    o.order_date,
    ROUND(o.total_amount, 2) as order_amount,
    o.order_status,
    ROUND(SUM(o.total_amount) OVER (PARTITION BY c.customer_id), 2) as lifetime_value,
    ROW_NUMBER() OVER (PARTITION BY c.customer_id ORDER BY o.order_date DESC) as order_sequence
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
ORDER BY c.customer_id, o.order_date DESC;


-- Query 9: Payment Method Distribution

SELECT 
    payment_method,
    COUNT(*) as transaction_count,
    ROUND(SUM(amount), 2) as total_amount,
    ROUND(AVG(amount), 2) as avg_amount,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM payments), 2) as percentage
FROM payments
GROUP BY payment_method
ORDER BY total_amount DESC;


-- Query 10: Top Rated Products

SELECT 
    p.product_id,
    p.product_name,
    c.category_name,
    ROUND(p.price, 2) as price,
    ROUND(AVG(r.rating), 2) as avg_rating,
    COUNT(r.review_id) as review_count,
    GROUP_CONCAT(r.review_text, ' | ') as reviews
FROM products p
LEFT JOIN reviews r ON p.product_id = r.product_id
LEFT JOIN categories c ON p.category_id = c.category_id
GROUP BY p.product_id
HAVING COUNT(r.review_id) > 0
ORDER BY avg_rating DESC;
