-- Create the schema
DROP SCHEMA IF EXISTS aggregating_the_fun;
CREATE SCHEMA aggregating_the_fun;
USE aggregating_the_fun;


-- Create customers table
CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

-- Insert sample data into customers table
INSERT INTO customers (customer_id, first_name, last_name) VALUES
(1, 'John', 'Doe'),
(2, 'Jane', 'Smith'),
(3, 'Mike', 'Johnson'),
(4, 'Emily', 'Brown');

-- Create products table
CREATE TABLE products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(255),
  category VARCHAR(255),
  price DECIMAL(10, 2)
);

-- Insert sample data into products table
INSERT INTO products (product_id, product_name, category, price) VALUES
(1, 'Product A', 'Electronics', 100.00),
(2, 'Product B', 'Electronics', 200.00),
(3, 'Product C', 'Home Appliances', 50.00),
(4, 'Product D', 'Home Appliances', 75.00);

-- Create orders table
CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  total_price DECIMAL(10, 2),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Insert sample data into orders table
INSERT INTO orders (order_id, customer_id, total_price) VALUES
(1, 1, 100.00),
(2, 2, 250.00),
(3, 1, 200.00),
(4, 3, 75.00),
(5, 4, 50.00),
(6, 2, 100.00);

select * from orders;
select * from products;
select * from customers;

select count(customer_id) from customers;
select sum(total_price) as total_rev from orders;
select products.category,
	avg(price) as avg_price_by_cat,
	min(price) as min_price_by_cat,
	max(price) as max_price_by_cat from products group by category;
select o.customer_id, count(customer_id) as total_orders_by_customer from orders o group by customer_id;
select first_name, sum(total_price) as total_rev from orders o join customers c on o.customer_id = c.customer_id where total_price > 50 group by c.customer_id order by total_rev desc;
select first_name, avg(total_price) as avg_spent_per_order from orders o join customers c on o.customer_id = c.customer_id group by c.customer_id order by avg_spent_per_order Desc;
 


