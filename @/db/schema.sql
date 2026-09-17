-- =========================================
-- ECOMMERCE DATABASE SCHEMA
-- =========================================

DROP DATABASE IF EXISTS dive_ecommerce_db;
CREATE DATABASE dive_ecommerce_db;
USE dive_ecommerce_db;

-- ---------------------------------------------
-- USERS
-- ---------------------------------------------
CREATE TABLE users (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    username        VARCHAR(50)  NOT NULL UNIQUE,
    password_hash   VARCHAR(255) NOT NULL,
    user_type       ENUM('admin', 'customer') NOT NULL DEFAULT 'customer'
);

-- ---------------------------------------------
-- USER PROFILES
-- ---------------------------------------------
CREATE TABLE user_profiles (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    user_id         INT NOT NULL,
    full_name       VARCHAR(100),
    mobile_number   VARCHAR(15),
    email           VARCHAR(100) UNIQUE,
    address         TEXT,
    CONSTRAINT fk_profile_user
        FOREIGN KEY (user_id) REFERENCES users(id)
);

-- ---------------------------------------------
-- CATEGORIES
-- ---------------------------------------------
CREATE TABLE categories (
    id      INT AUTO_INCREMENT PRIMARY KEY,
    name    VARCHAR(100) NOT NULL
);

-- ---------------------------------------------
-- PRODUCTS
-- ---------------------------------------------
CREATE TABLE products (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    category_id     INT NOT NULL,
    name            VARCHAR(150) NOT NULL,
    price           DECIMAL(10,2) NOT NULL,
    description     TEXT,
    CONSTRAINT fk_product_category
        FOREIGN KEY (category_id) REFERENCES categories(id)
);

-- ---------------------------------------------
-- ORDERS
-- ---------------------------------------------
CREATE TABLE orders (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    user_id         INT NOT NULL,
    placed_at       DATETIME,
    status          ENUM('in_cart', 'placed', 'out_for_delivery', 'delivered')
                        NOT NULL DEFAULT 'in_cart',
    total_amount    DECIMAL(10,2) NOT NULL DEFAULT 0,
    full_name       VARCHAR(100),
    mobile_number   VARCHAR(15),
    email           VARCHAR(100),
    address         TEXT,
    CONSTRAINT fk_order_user
        FOREIGN KEY (user_id) REFERENCES users(id)
);

-- ---------------------------------------------
-- ORDERED PRODUCTS
-- ---------------------------------------------
CREATE TABLE ordered_products (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    order_id        INT NOT NULL,
    product_id      INT NOT NULL,
    quantity        INT NOT NULL,
    product_name    VARCHAR(150) NOT NULL,
    single_price    DECIMAL(10,2) NOT NULL,
    total_price     DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_ordered_product_order
        FOREIGN KEY (order_id) REFERENCES orders(id),
    CONSTRAINT fk_ordered_product_product
        FOREIGN KEY (product_id) REFERENCES products(id)
);