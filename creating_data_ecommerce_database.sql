-- Database for the E-Commerce scenario

CREATE DATABASE IF NOT EXISTS ecommerce;
USE ecommerce;

CREATE TABLE customers(
	id SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR(45) NOT NULL,
	middle_name VARCHAR(45),
	last_name VARCHAR(45) NOT NULL,
	ssn CHAR(9) NOT NULL,
	birth_date DATE NOT NULL,
	phone CHAR(10) NOT NULL,
	email VARCHAR(45) NOT NULL,
	address VARCHAR(90) NOT NULL,
	CONSTRAINT un_ssn UNIQUE (ssn),
    CONSTRAINT un_phone UNIQUE (phone),
    CONSTRAINT un_email unique (email)
);

CREATE TABLE stocks(
	id TINYINT AUTO_INCREMENT PRIMARY KEY,
	location ENUM('AISLE 1', 'AISLE 2', 'AISLE 3', 'AISLE 4', 'AISLE 5', 'AISLE 6') NOT NULL,
	quantity SMALLINT UNSIGNED DEFAULT 0
);

CREATE TABLE products(
	id SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	product_name VARCHAR(45) NOT NULL,
    category ENUM('HARDWARE', 'PERIPHERALS', 'COMPUTERS', 'UPGRADE KIT', 'MONITORS', 'CHAIRS, GAMER TABLE AND OFFICE', 'ELECTRONICS', 'NOTEBOOKS AND LAPTOPS', 'VIDEO GAMES', 'NETWORKS AND WIRELESS', 'SMART HOME', 'OTHERS') DEFAULT 'OTHERS' NOT NULL,
    product_description VARCHAR(90) NOT NULL,
    quantity SMALLINT UNSIGNED NOT NULL,
	price DECIMAL(6,2) NOT NULL,
	evaluation ENUM('1', '2', '3', '4', '5'),
    registration_data DATE NOT NULL, 
	stock_id TINYINT NOT NULL,
    CONSTRAINT un_product_name UNIQUE (product_name),
	CONSTRAINT fk_products_stocks FOREIGN KEY (stock_id) REFERENCES stocks (id) ON UPDATE CASCADE
);

CREATE TABLE payments(
	id TINYINT AUTO_INCREMENT PRIMARY KEY,
    payment_type ENUM('CREDIT AND DEBIT CARDS', 'BANK TRANSFERS', 'ECHECKS', 'MOBILE PAYMENTS', 'CRYPTOCURRENCY') NOT NULL
);

CREATE TABLE orders(
	id SMALLINT UNSIGNED AUTO_INCREMENT,
	customer_id SMALLINT UNSIGNED,
    order_date DATE NOT NULL,
    order_status ENUM('PROCESSING PAYMENT', 'CANCELED', 'IN PROGRESS', 'SENT', 'DELIVERED') DEFAULT 'PROCESSING PAYMENT',
    order_description VARCHAR(270) NOT NULL,
	shipping DECIMAL(5,2) DEFAULT 0,
	payment_id TINYINT NOT NULL,
	PRIMARY KEY (id, customer_id),
	CONSTRAINT fk_orders_clients FOREIGN KEY (customer_id) REFERENCES customers (id) ON UPDATE CASCADE,
	CONSTRAINT fk_orders_payment FOREIGN KEY (payment_id) REFERENCES payments (id) ON UPDATE CASCADE
);

CREATE TABLE suppliers(
	id SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    company_name VARCHAR(90) NOT NULL,
    trading_name VARCHAR(45) NOT NULL,
    ein CHAR(9) NOT NULL,			-- EIN: Employer Identification Number
    phone CHAR(10) NOT NULL,
    email VARCHAR(45) NOT NULL,
    address VARCHAR(90) NOT NULL,
    CONSTRAINT un_company_name UNIQUE (company_name),
    CONSTRAINT un_ein UNIQUE (ein),
    CONSTRAINT un_phone UNIQUE (phone),
    CONSTRAINT un_email UNIQUE (email)
);

CREATE TABLE sellers(
	id SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    company_name VARCHAR(90) NOT NULL,
    trading_name VARCHAR(45) NOT NULL,
    ein CHAR(9) NOT NULL,
    phone CHAR(10) NOT NULL,
    email VARCHAR(45) NOT NULL,
    address VARCHAR(90) NOT NULL,
    CONSTRAINT un_company_name UNIQUE (company_name),
    CONSTRAINT un_ein UNIQUE (ein),
    CONSTRAINT un_phone UNIQUE (phone),
    CONSTRAINT un_email UNIQUE (email)
    );
    
CREATE TABLE products_sellers(
	product_id SMALLINT UNSIGNED,
    seller_id SMALLINT UNSIGNED,
    quantity SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY (product_id, seller_id),
    CONSTRAINT fk_products_sellers_products FOREIGN KEY (product_id) REFERENCES products (id) ON UPDATE CASCADE,
    CONSTRAINT fk_products_sellers_sellers FOREIGN KEY (seller_id) REFERENCES sellers (id) ON UPDATE CASCADE
);

CREATE TABLE products_suppliers(
	product_id SMALLINT UNSIGNED,
    supplier_id SMALLINT UNSIGNED,
    quantity SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY (product_id, supplier_id),
    CONSTRAINT fk_products_suppliers_products FOREIGN KEY (product_id) REFERENCES products (id) ON UPDATE CASCADE,
    CONSTRAINT fk_products_suppliers_suppliers FOREIGN KEY (supplier_id) REFERENCES suppliers (id) ON UPDATE CASCADE
);

CREATE TABLE orders_products(
	order_id SMALLINT UNSIGNED,
	product_id SMALLINT UNSIGNED,
    quantity SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY (product_id, order_id),
    CONSTRAINT fk_products_orders_products FOREIGN KEY (product_id) REFERENCES products (id) ON UPDATE CASCADE,
    CONSTRAINT fk_products_orders_orders FOREIGN KEY (order_id) REFERENCES orders (id) ON UPDATE CASCADE
);