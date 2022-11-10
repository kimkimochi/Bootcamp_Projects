-- Los Pollos Hermanos

-- CREATE FACT TABLE
.mode markdown
.header on
  
CREATE TABLE fact_order (
    order_id    INT PRIMARY KEY,
    store_id    INT,
    sta_id      INT,
    date_id     VARCHAR(220),
    cus_id      INT,
    pro_id      INT,
    quantity    INT,
    total_sales REAL,
  FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
  FOREIGN KEY (sta_id)   REFERENCES dim_staff(sta_id),
  FOREIGN KEY (cus_id)   REFERENCES dim_customer(cus_id),
  FOREIGN KEY (pro_id)   REFERENCES dim_product(pro_id)
);

-- INSERT DATA INTO FACT TABLE
INSERT INTO fact_order VALUES
  (1,  101, 201, '2022-06-05', 304, 1, 2, 20000.00 ),
  (2,  101, 201, '2022-06-05', 305, 3, 6, 120594.60),
  (3,  103, 203, '2022-06-05', 301, 3, 2, 40198.20 ),
  (4,  103, 203, '2022-06-06', 301, 1, 4, 40000.00 ),
  (5,  102, 202, '2022-06-07', 303, 2, 3, 36000.00 ),
  (6,  102, 202, '2022-06-08', 303, 3, 2, 40198.20 ),
  (7,  103, 203, '2022-06-08', 301, 2, 1, 12000.00 ),
  (8,  101, 205, '2022-06-09', 304, 4, 2, 16000.00 ),
  (9,  102, 202, '2022-06-09', 302, 5, 2, 13000.00 ),
  (10, 101, 205, '2022-06-10', 305, 3, 2, 40198.20 ),
  (11, 102, 204, '2022-06-10', 303, 2, 2, 24000.00 ),
  (12, 101, 201, '2022-06-11', 304, 1, 2, 20000.00 ),
  (13, 102, 202, '2022-06-12', 302, 3, 3, 60297.30 ),
  (14, 101, 201, '2022-06-13', 305, 4, 3, 24000.00 ),
  (15, 103, 203, '2022-06-13', 301, 3, 5, 100495.50),
  (16, 101, 201, '2022-06-13', 304, 1, 5, 50000.00 ),
  (17, 101, 201, '2022-06-14', 305, 5, 3, 19500.00 ),
  (18, 102, 202, '2022-06-14', 303, 2, 3, 36000.00 ),
  (19, 101, 205, '2022-06-15', 304, 1, 3, 30000.00 ),
  (20, 101, 201, '2022-06-16', 304, 1, 4, 40000.00 );


-- CREATE DIM TABLE 1
CREATE TABLE dim_store(
    store_id      INT PRIMARY KEY,
    store_city    VARCHAR(220),
    store_country VARCHAR(220),
    store_region  VARCHAR(220)
);

-- INSERT DATA TO DIM TABLE 1
INSERT INTO dim_store VALUES
    (101, 'Albuquerque', 'United States', 'North America'),
    (102, 'Bangkok',     'Thailand',      'Asia'),
    (103, 'Hanover',     'Germany',       'Europe');

-- CREATE DIM TABLE 2
CREATE TABLE dim_staff(
    sta_id        INT PRIMARY KEY,
    sta_gender    VARCHAR(220),
    sta_firstname VARCHAR(220),
    sta_lastname  VARCHAR(220),
    age           INT
);

-- INSERT DATA INTO DIM TABLE 2
INSERT INTO dim_staff VALUES
  (201, 'Mr.',  'Gustavo', 'Fring',   44),
  (202, 'Mr.',  'Jesse',   'Pinkman', 20),
  (203, 'Mr.',  'Walter',  'White',   50),
  (204, 'Mrs.', 'Skyler',  'White',   38),
  (205, 'Mr.',  'Saul',    'Goodman', 41);


-- CREATE DIM TABLE 3
CREATE TABLE dim_customer (
    cus_id        VARCHAR(220) PRIMARY KEY,
    cus_gender    VARCHAR(220),
    cus_firstname INT,
    cus_lastname  INT,
    cus_email     INT
);

-- INSERT DATA INTO DIM TABLE 3
INSERT INTO dim_customer VALUES
  (301, 'Mr.',  'Hank',   'Schrader',    'hank.schr@bb.com'),
  (302, 'Mrs.', 'Marie',  'Schrader',    'marie.schr@bb.com'),
  (303, 'Mr.',  'Mike',   'Ehrmantraut', 'mike.ehrm@bb.com'),
  (304, 'Mr.',  'Hector', 'Salamanca',   'hector.bellding@bb.com'),
  (305, 'Ms.',  'Jane',   'Margolis',    'jane.margo@bb.com');


-- CREATE DIM TABLE 4
CREATE TABLE dim_product (
    pro_id    INT PRIMARY KEY,
    pro_name  VARCHAR(220),
    pro_price REAL
);
  
-- INSERT DATA INTO DIM TABLE 4
INSERT INTO dim_product VALUES
  (1, 'Fried Chicken', 10000.00),
  (2, 'Meth Burger',   12000.00),
  (3, 'Blue Sky',      20099.10),
  (4, 'Say My Name',   8000.00),
  (5, 'Coke',          6500.00 );



-- 6 QUERIES
-- QUERIES #1 STAFF TOTAL SALES PERFORMANCE
WITH sta_sales AS (
  SELECT
    sta_id,
    quantity,
    total_sales
  FROM fact_order
  ),
    sta_info AS (
  SELECT *
  FROM dim_staff
  )

SELECT
   sta_sales.sta_id AS 'StaffID',
   sta_info.sta_gender || ' ' || sta_info.sta_firstname AS 'Firstname',
   sta_info.sta_lastname AS 'Lastname',
   SUM(sta_sales.quantity) AS 'Quantity',
   SUM(sta_sales.total_sales) AS 'Total'
FROM sta_sales
JOIN sta_info ON sta_sales.sta_id = sta_info.sta_id
GROUP BY 1
ORDER BY 5 DESC;

--OTHER METHOD
/* WITH sta_sales AS (
  SELECT
    fact_order.sta_id AS 'StaffID',
    dim_staff.gender || ' ' || dim_staff.sta_firstname AS 'Firstname',
    dim_staff.sta_lastname AS 'Lastname',
    SUM(fact_order.total_sales) AS 'Total'
FROM fact_order, dim_staff
WHERE fact_order.sta_id = dim_staff.sta_id
GROUP BY fact_order.sta_id
)

SELECT *
FROM sta_sales
ORDER BY 4 DESC; */

----------------------------------------
--Break Line
SELECT '                                                    ' ;
----------------------------------------

-- QUERIES #2 STORE LOCATION SALES PERFORMANCE
WITH store_sales AS (
  SELECT
    store_id,
    total_sales
  FROM fact_order
  ),
    store_loc AS (
  SELECT
    store_id,
    store_city,
    store_country,
    store_region
  FROM dim_store
  )

SELECT
  store_sales.store_id AS 'StoreID',
  store_loc.store_city AS 'City',
  store_loc.store_country AS 'Country',
  store_loc.store_region AS 'Region',
  SUM(store_sales.total_sales) AS 'Total'
FROM store_sales
JOIN store_loc ON store_sales.store_id = store_loc.store_id
GROUP BY 1
ORDER BY 5 DESC;

----------------------------------------
--Break Line
SELECT '                                                              ' ;
----------------------------------------

-- QUERIES #3 TOP 3 Spenders
SELECT
  cus.cus_id AS 'CustomerID',
  cus.cus_gender || ' ' || cus.cus_firstname AS 'Firstname',
  cus.cus_lastname AS 'Lastname',
  cus.cus_email AS 'Email',
  SUM(fo.total_sales) AS 'Total'
FROM dim_customer AS 'cus'
JOIN fact_order AS 'fo' ON fo.cus_id = cus.cus_id
GROUP BY 1
ORDER BY 5 DESC
LIMIT 3;

----------------------------------------
--Break Line
SELECT '                                                                     ' ;
----------------------------------------

-- QUERIES #4 PRODUCT SALES IN ALBUQUERQUE
WITH fa AS (
  SELECT
    pro_id,
    quantity,
    total_sales
  FROM fact_order
  ),
    pro AS (
  SELECT
    pro_id,
    pro_name,
    pro_price
  FROM dim_product
  )

SELECT
  fa.pro_id AS 'ProductID',
  pro.pro_name AS 'Name',
  pro.pro_price AS 'Price',
  SUM(fa.quantity) AS 'Quantity',
  SUM(fa.total_sales) AS 'Total'
FROM fa
JOIN pro ON fa.pro_id = pro.pro_id
GROUP BY 1
ORDER BY 5 DESC;

----------------------------------------
-- Break Line
SELECT '                                                       ' ;
----------------------------------------

-- QUERIES #5 BLUE SKY'S SALES IN EACH COUNTRY
WITH fa AS (
  SELECT
    store_id,
    pro_id,
    quantity,
    total_sales
  FROM fact_order
  ),
    pro AS (
  SELECT
    pro_id,
    pro_name,
    pro_price
  FROM dim_product
  ),
    sto AS (
  SELECT *
  FROM dim_store
  )

SELECT
  sto.store_country AS 'Country',
  sto.store_city AS 'City',
  pro.pro_name AS 'Product',
  pro.pro_price AS 'Price',
  SUM(fa.quantity) AS 'Quantity',
  SUM(fa.total_sales) AS 'Total'
FROM fa
JOIN pro ON fa.pro_id = pro.pro_id
JOIN sto ON fa.store_id = sto.store_id
WHERE pro.pro_name = 'Blue Sky'
GROUP BY 1
ORDER BY 5 DESC;

----------------------------------------
--Break Line
SELECT '                                                                    ' ;
----------------------------------------

-- QUERIES #6 TOTAL SPENDING MORE THAN 150000 GET FREE GIFT (FRIED CHICKEN)
WITH fa AS (
  SELECT
    cus_id,
    total_sales
  FROM fact_order
  ),
  cus AS (
  SELECT
    cus_id,
    cus_gender,
    cus_firstname,
    cus_lastname,
    cus_email
  FROM dim_customer
  ),
  sta AS (
  SELECT *
  )

SELECT
  cus.cus_gender || ' ' || cus.cus_firstname AS 'Firstname',
  cus.cus_lastname AS 'Lastname',
  cus.cus_email AS 'Email',
  SUM(fa.total_sales) AS 'Total',
CASE
  WHEN SUM(fa.total_sales) > 150000 THEN 'YES'
  ELSE '-'
END AS 'GET FREE GIFT'
FROM fa
JOIN cus ON fa.cus_id = cus.cus_id
GROUP BY 1;
