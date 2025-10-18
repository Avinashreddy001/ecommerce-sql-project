-- E-COMMERCE ORDER MANAGEMENT SYSTEM - SQLite
-- Sample Data

-- Insert Customers
INSERT INTO customers (first_name, last_name, email, phone, country, city) VALUES
('Rajesh', 'Kumar', 'rajesh.kumar@email.com', '9876543210', 'India', 'Telangana'),
('Priya', 'Singh', 'priya.singh@email.com', '9876543211', 'India', 'Mumbai'),
('Amit', 'Patel', 'amit.patel@email.com', '9876543212', 'India', 'Delhi'),
('Neha', 'Sharma', 'neha.sharma@email.com', '9876543213', 'India', 'Bangalore'),
('John', 'Smith', 'john.smith@email.com', '9876543214', 'USA', 'New York'),
('Sarah', 'Johnson', 'sarah.johnson@email.com', '9876543215', 'USA', 'Los Angeles'),
('Ravi', 'Verma', 'ravi.verma@email.com', '9876543216', 'India', 'Pune');

-- Insert Categories
INSERT INTO categories (category_name, description) VALUES
('Electronics', 'Electronic devices and gadgets'),
('Clothing', 'Apparel and fashion items'),
('Books', 'Physical and digital books'),
('Home & Garden', 'Home improvement and garden supplies'),
('Sports', 'Sports equipment and fitness gear');

-- Insert Products
INSERT INTO products (product_name, category_id, price, stock_quantity, description) VALUES
('Laptop', 1, 45000.00, 15, 'High performance laptop for professionals'),
('Smartphone', 1, 25000.00, 30, 'Latest smartphone with 5G support'),
('Wireless Headphones', 1, 3500.00, 50, 'Premium wireless headphones with noise cancellation'),
('T-Shirt', 2, 499.00, 100, 'Cotton t-shirt available in multiple colors'),
('Jeans', 2, 1299.00, 50, 'Premium denim jeans'),
('Jacket', 2, 2999.00, 25, 'Winter jacket with thermal lining'),
('SQL Database Design', 3, 299.00, 45, 'Comprehensive guide to database design'),
('Python Programming', 3, 399.00, 30, 'Learn Python from basics to advanced'),
('Yoga Mat', 4, 799.00, 25, 'Non-slip yoga mat for exercise'),
('Running Shoes', 5, 3999.00, 40, 'Professional running shoes with cushioning'),
('Dumbbell Set', 5, 1999.00, 20, 'Home gym dumbbell set 5kg to 25kg'),
('Coffee Maker', 4, 2499.00, 15, 'Automatic coffee maker with timer');

-- Insert Orders
INSERT INTO orders (customer_id, order_date, total_amount, order_status, payment_status, shipping_address) VALUES
(1, '2025-10-01 10:30:00', 46299.00, 'delivered', 'paid', '123 Main St, Hyderabad'),
(2, '2025-10-05 14:20:00', 50000.00, 'shipped', 'paid', '456 Park Ave, Mumbai'),
(3, '2025-10-10 09:15:00', 1798.00, 'processing', 'paid', '789 Oak Rd, Delhi'),
(4, '2025-10-12 16:45:00', 4798.00, 'pending', 'unpaid', '321 Elm St, Bangalore'),
(1, '2025-10-15 11:00:00', 299.00, 'delivered', 'paid', '123 Main St, Hyderabad'),
(5, '2025-10-16 13:30:00', 3500.00, 'processing', 'paid', '999 5th Ave, New York'),
(6, '2025-10-17 15:45:00', 2499.00, 'pending', 'unpaid', '888 Hollywood Blvd, Los Angeles'),
(7, '2025-10-18 09:00:00', 6298.00, 'processing', 'paid', '555 Market St, Pune');

-- Insert Order Items
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount_percent) VALUES
(1, 1, 1, 45000.00, 0),
(1, 4, 2, 499.00, 10),
(2, 2, 2, 25000.00, 0),
(3, 5, 1, 1299.00, 0),
(3, 4, 1, 499.00, 0),
(4, 10, 1, 3999.00, 0),
(5, 7, 1, 299.00, 0),
(6, 3, 1, 3500.00, 0),
(7, 12, 1, 2499.00, 0),
(8, 8, 1, 399.00, 5),
(8, 11, 1, 1999.00, 0);

-- Insert Payments
INSERT INTO payments (order_id, payment_method, amount, payment_date, transaction_id) VALUES
(1, 'credit_card', 46299.00, '2025-10-01 10:35:00', 'TXN001'),
(2, 'debit_card', 50000.00, '2025-10-05 14:25:00', 'TXN002'),
(3, 'paypal', 1798.00, '2025-10-10 09:20:00', 'TXN003'),
(5, 'credit_card', 299.00, '2025-10-15 11:05:00', 'TXN005'),
(6, 'paypal', 3500.00, '2025-10-16 13:35:00', 'TXN006'),
(8, 'credit_card', 2398.00, '2025-10-18 09:05:00', 'TXN008');

-- Insert Reviews
INSERT INTO reviews (product_id, customer_id, order_id, rating, review_text) VALUES
(1, 1, 1, 5, 'Excellent laptop, great performance and build quality'),
(4, 1, 1, 4, 'Good quality t-shirt, fits perfectly'),
(2, 2, 2, 5, 'Amazing phone, fast delivery'),
(5, 3, 3, 4, 'Comfortable jeans, good material'),
(3, 5, 6, 5, 'Perfect sound quality, very comfortable to wear'),
(8, 7, 8, 4, 'Great book, very informative');

-- Insert Inventory Log
INSERT INTO inventory_log (product_id, quantity_changed, log_type, reference_id) VALUES
(1, -1, 'purchase', 1),
(4, -2, 'purchase', 1),
(2, -2, 'purchase', 2),
(5, -1, 'purchase', 3),
(4, -1, 'purchase', 3),
(10, -1, 'purchase', 4),
(7, -1, 'purchase', 5),
(3, -1, 'purchase', 6),
(12, -1, 'purchase', 7),
(1, 5, 'restock', NULL),
(2, 10, 'restock', NULL);