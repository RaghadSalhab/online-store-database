-- Addresses
INSERT INTO Addresses (street, city, state, zipcode, country) VALUES
('123 Main St', 'Ramallah', 'Ramallah', '00970', 'Palestine'),
('45 King St', 'Nablus', 'Nablus', '00972', 'Palestine'),
('78 Queen Ave', 'Jerusalem', 'Jerusalem', '00973', 'Palestine');

-- Customers
INSERT INTO Customers (first_name, last_name, email, phone, address_id) VALUES
('Ali', 'Hassan', 'ali.hassan@example.com', '0591234567', 1),
('Sara', 'Khalil', 'sara.khalil@example.com', '0597654321', 2),
('Omar', 'Abu-Saleh', 'omar.abusaleh@example.com', '0599876543', 3);

-- Categories
INSERT INTO Categories (name, description) VALUES
('Electronics', 'Devices and gadgets'),
('Books', 'All kinds of books'),
('Clothing', 'Men and women clothing');

-- Products
INSERT INTO Products (name, category_id, price) VALUES
('Laptop', 1, 1200.00),
('Smartphone', 1, 800.00),
('Novel: War and Peace', 2, 25.00),
('T-Shirt', 3, 15.00),
('Jeans', 3, 40.00);

-- Orders
INSERT INTO Orders (customer_id, order_date) VALUES
(1, '2025-09-10'),
(2, '2025-09-12'),
(3, '2025-09-14');

-- Order_Items
INSERT INTO Order_Items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 1200.00),
(1, 2, 1, 800.00),
(1, 4, 5, 15.00),
(2, 3, 2, 25.00),
(2, 4, 1, 15.00),
(3, 4, 2, 15.00),
(3, 5, 1, 40.00);