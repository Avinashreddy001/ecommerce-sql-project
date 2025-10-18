# E-Commerce Order Management System - SQL Project

A comprehensive database design and SQL analysis project demonstrating real-time e-commerce operations using SQLite.

## 📋 Project Overview

This project implements a complete e-commerce database system with 8 normalized tables, 100+ sample records, and 10 advanced SQL queries that solve real business problems.

**Technology:** SQLite | **IDE:** VS Code | **Purpose:** Portfolio Project

---

## 🗂️ Database Schema

### Tables (8 Total)

1. **customers** - Store customer information and contact details
2. **categories** - Product classification system
3. **products** - Product inventory with stock management
4. **orders** - Order headers with status and payment tracking
5. **order_items** - Line items for each order with pricing and discounts
6. **payments** - Payment transaction records and methods
7. **reviews** - Product ratings and customer feedback
8. **inventory_log** - Track all stock changes and movements

### Key Features

- ✅ **Proper Normalization** - 3NF design to prevent data redundancy
- ✅ **Foreign Key Relationships** - Enforces data integrity
- ✅ **Check Constraints** - Validates enum values (order_status, payment_method)
- ✅ **Generated Columns** - Auto-calculated subtotal with discount logic
- ✅ **Indexes** - Performance optimization for frequently queried columns
- ✅ **Timestamps** - Track record creation and updates

---

## 📊 SQL Queries (10 Advanced Analyses)

### Query 1: Sales by Category
Analyzes revenue distribution across product categories with order count and average values.

### Query 2: Top 5 Customers by Spending
Customer segmentation to identify high-value customers and their purchase patterns.

### Query 3: Product Performance Analysis
Comprehensive product metrics including sales volume, ratings, and revenue contribution.

### Query 4: Order Status Distribution
Shows order lifecycle stages with percentages and timeline information.

### Query 5: Daily Sales Trend
Time-series analysis of daily revenue and order patterns.

### Query 6: Pending/Unpaid Orders
Identifies orders requiring follow-up or payment collection.

### Query 7: Low Stock Alert
Inventory management query flagging products below 30-unit threshold.

### Query 8: Customer Lifetime Value with Window Functions
Advanced query using PARTITION BY and ROW_NUMBER for customer analytics.

### Query 9: Payment Method Distribution
Analysis of customer payment preferences and transaction patterns.

### Query 10: Top Rated Products
Identifies best-performing products based on customer reviews.

---

## 🚀 How to Run This Project

### Prerequisites
- VS Code installed
- SQLite extension installed in VS Code

### Setup Steps

1. **Clone/Download** this project folder
2. **Open in VS Code** - File → Open Folder
3. **Open Terminal** in VS Code (Ctrl+`)

### Method 1: Using SQLite CLI (Recommended)

```bash
# Create database and run schema
sqlite3 ecommerce.db < schema.sql

# Insert sample data
sqlite3 ecommerce.db < sample_data.sql

# Run queries
sqlite3 ecommerce.db < queries.sql
```

### Method 2: Using VS Code SQLite Extension

1. Right-click on `schema.sql` → Select "Run Query"
2. Choose `ecommerce.db` (will auto-create)
3. Repeat for `sample_data.sql`
4. Open `queries.sql` → Highlight any query → Right-click → "Run Query"

### Method 3: Interactive SQLite Shell

```bash
sqlite3 ecommerce.db

# Inside the shell, run:
.read schema.sql
.read sample_data.sql

# To see results:
SELECT * FROM customers;
.tables
.schema products
```

---

## 📈 Key Insights from Sample Data

- **8 Customers** across India and USA
- **12 Products** across 5 categories
- **8 Orders** with mixed statuses (pending, processing, shipped, delivered)
- **11 Order Items** showing real purchase patterns
- **6 Payments** completed across multiple methods
- **6 Reviews** with ratings and feedback

---

## 🎯 SQL Concepts Demonstrated

### Aggregation Functions
- COUNT, SUM, AVG, MIN, MAX
- GROUP BY and HAVING clauses

### Joins
- INNER JOIN, LEFT JOIN
- Multiple table joins (5+ tables)

### Window Functions
- PARTITION BY
- ROW_NUMBER, SUM OVER
- Lifetime value calculations

### Advanced Techniques
- Generated columns (computed subtotal)
- String concatenation (|| operator)
- Date functions (DATE, DATETIME)
- CASE expressions
- Subqueries

### Data Integrity
- Foreign keys with CASCADE delete
- CHECK constraints for enums
- UNIQUE constraints
- NOT NULL constraints

---

## 📝 File Structure

```
ecommerce-sql-project/
├── schema.sql           # Database table definitions
├── sample_data.sql      # Test data (8 customers, 12 products, etc.)
├── queries.sql          # 10 advanced analysis queries
├── ecommerce.db         # SQLite database file (auto-created)
├── README.md           # This file
└── .gitignore          # Git configuration
```

---

## 🔄 Real-World Use Cases

This database structure handles:

1. **Order Processing** - Track orders from pending to delivered
2. **Inventory Management** - Monitor stock levels and track changes
3. **Customer Analytics** - Identify top customers and purchase patterns
4. **Payment Tracking** - Multiple payment methods with status tracking
5. **Quality Control** - Customer reviews and ratings system
6. **Business Intelligence** - Revenue analysis by category, time, customer
7. **Alert Systems** - Low stock alerts, pending orders notifications
8. **Financial Reporting** - Sales trends, payment distribution, revenue metrics

---

## 💡 Potential Enhancements

- Add triggers for automatic inventory updates
- Create views for common reports
- Add user authentication and roles
- Implement coupon/discount codes table
- Add shipping address variations
- Create returns/refunds management
- Add customer segmentation logic

---

## 📚 Learning Outcomes

This project demonstrates:
- Database normalization and design principles
- Complex SQL query writing
- Real-world business logic implementation
- Performance optimization with indexes
- Data integrity through constraints
- Advanced analytical queries

---

## 👨‍💻 Portfolio Value

This project showcases:
- ✅ Full-stack database design
- ✅ Complex queries solving business problems
- ✅ Data modeling expertise
- ✅ SQL best practices
- ✅ Real-world application understanding
- ✅ Clean, well-documented code

---

## 📞 Questions & Troubleshooting

**Q: How do I view the database structure in VS Code?**

A: Use `.schema` command in terminal or right-click `ecommerce.db` with SQLite extension

**Q: Can I modify the data?**

A: Yes! Use INSERT, UPDATE, DELETE statements. Always backup before major changes.

**Q: How do I reset the database?**

A: Delete `ecommerce.db` and re-run schema.sql and sample_data.sql

**Q: Can this be converted to MySQL/PostgreSQL?**
A: Yes, with minimal syntax changes (mostly date functions and GENERATED ALWAYS AS syntax)

---

