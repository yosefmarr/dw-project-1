/* ============================= STEP: DIMENSION ============================= */

CREATE TABLE dim_date (
	date_key BIGINT NOT NULL PRIMARY KEY,
  	full_date DATE DEFAULT NULL,
  	day_of_week TINYINT DEFAULT NULL,
  	day_num_in_month TINYINT DEFAULT NULL,
  	day_num_overall BIGINT DEFAULT NULL,
  	day_name VARCHAR(9),
  	day_abbrev VARCHAR(3),
  	weekday_flag VARCHAR(7),
  	week_num_in_year INT DEFAULT NULL,
  	week_num_overall BIGINT DEFAULT NULL,
  	week_begin_date DATE DEFAULT NULL,
  	week_begin_date_key BIGINT DEFAULT NULL,
  	month TINYINT DEFAULT NULL,
  	month_num_overall INT DEFAULT NULL,
  	month_name VARCHAR(9),
  	month_abbrev VARCHAR(3),
  	quarter TINYINT DEFAULT NULL,
  	year INT DEFAULT NULL,
  	yearmo INT DEFAULT NULL,
  	fiscal_month TINYINT DEFAULT NULL,
  	fiscal_quarter TINYINT DEFAULT NULL,
	fiscal_year INT DEFAULT NULL,
  	last_day_in_month_flag VARCHAR(15),
  	same_day_year_ago_date DATE DEFAULT NULL
);


CREATE TABLE dim_customer (
    sk_customer INT AUTO_INCREMENT PRIMARY KEY,
    customer_id VARCHAR(8) NOT NULL,
    customer_name VARCHAR(255) NOT NULL,
    segment VARCHAR(50) NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE(customer_id)
);


CREATE TABLE dim_product (
    sk_product INT AUTO_INCREMENT PRIMARY KEY,
    product_id VARCHAR(15) NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    category VARCHAR(50) NOT NULL,
    sub_category VARCHAR(50) NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


CREATE TABLE dim_ship_mode (
    sk_ship_mode INT AUTO_INCREMENT PRIMARY KEY,
    ship_mode VARCHAR(50) NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE(ship_mode)
);


CREATE TABLE dim_geography (
    sk_geography INT AUTO_INCREMENT PRIMARY KEY,
    postal_code INT NOT NULL,
    country VARCHAR(50) NOT NULL,
    region VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    city VARCHAR(100) NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

/* ============================= STEP: DIMENSION ============================= */

CREATE TABLE stg_super_store (
    row_id INT NOT NULL,
    order_id VARCHAR(20) NOT NULL,
    order_date DATE NOT NULL,
    ship_date DATE NOT NULL,
    ship_mode VARCHAR(50),
    customer_id VARCHAR(8) NOT NULL,
    customer_name VARCHAR(255),
    segment VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(100),
    state VARCHAR(50),
    postal_code INT NOT NULL,
    region VARCHAR(50),
    product_id VARCHAR(15) NOT NULL,
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(255),
    sales DECIMAL(10, 2),
    quantity INT,
    discount DECIMAL(5, 2),
    profit DECIMAL(10, 2)
);


/* ============================= STEP: FACT ============================= */

CREATE TABLE fac_sales (
	sk_customer INT NOT NULL REFERENCES dim_customer(sk_customer),
	sk_product INT NOT NULL REFERENCES dim_product(sk_product),
	sk_ship_mode INT NOT NULL REFERENCES dim_ship_mode(sk_ship_mode),
	sk_geography INT NOT NULL REFERENCES dim_geography(sk_geography),
	sk_date_key_order_date BIGINT REFERENCES dim_date(date_key),
	sk_date_key_ship_date BIGINT REFERENCES dim_date(date_key),
	row_id INT NOT NULL,
	order_id VARCHAR(20) NOT NULL,
	sales DECIMAL(10, 2),
	quantity INT,
	discount DECIMAL(5, 2),
	profit DECIMAL(10, 2)
);


