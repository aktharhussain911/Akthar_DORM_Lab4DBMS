/*
1)	You are required to create tables for 
supplier,
customer,
category,
product,
supplier_pricing,
order,
rating to store the data for the E-commerce with the schema definition given below. */

create database Akthar_DORM_Lab4_ECommerce;
use Akthar_DORM_Lab4_ECommerce;

--  1) Table structure for table `category`

CREATE TABLE IF NOT EXISTS `category` (
  `cat_id` int(5) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(15) NOT NULL,
  PRIMARY KEY (`cat_id`)
);

-- Display details of table 'category'
SELECT CAT_ID, CAT_NAME FROM category;


-- 2) Table structure for table `customer`

CREATE TABLE IF NOT EXISTS `customer` (
  `cus_id` int(5) NOT NULL AUTO_INCREMENT,
  `cus_name` varchar(15) NOT NULL,
  `cus_phone` varchar(10) NOT NULL,
  `cus_city` varchar(10) NOT NULL,
  `cus_gender` char(1) NOT NULL,
  PRIMARY KEY (`cus_id`)
);

-- -- Display details of table 'customer'

SELECT CUS_ID, CUS_NAME, CUS_PHONE, CUS_CITY, CUS_GENDER
		FROM customer;
        
        
-- 3) Table structure for table `orders`
-- ORD_AMOUNT is excluded from 'orders' table
-- Reason: To avoid chances of data inconsistency and redundancy happening

CREATE TABLE IF NOT EXISTS `orders` (
  `ord_id` int(5) NOT NULL AUTO_INCREMENT,
  `ord_date` date DEFAULT NULL,
  `cus_id` int(5) DEFAULT NULL,
  `pricing_id` int(5) DEFAULT NULL,
  PRIMARY KEY (`ord_id`),
  KEY `cus_id` (`cus_id`),
  KEY `pricing_id` (`pricing_id`)
);

-- Display details of table 'orders'

SELECT ORD_ID,  ORD_DATE, CUS_ID, PRICING_ID
		FROM orders;
        
        
--  4) Table structure for table `product`

CREATE TABLE IF NOT EXISTS `product` (
  `pro_id` int(5) NOT NULL AUTO_INCREMENT,
  `pro_name` varchar(20) NOT NULL,
  `pro_desc` varchar(50) DEFAULT NULL,
  `cat_id` int(5) DEFAULT NULL,
  PRIMARY KEY (`pro_id`),
  KEY `cat_id` (`cat_id`)
);

-- Display details of table `product`

SELECT PRO_ID, PRO_NAME, PRO_DESC, CAT_ID
		FROM product;


-- 5) Table structure for table `rating`

CREATE TABLE IF NOT EXISTS `rating` (
  `rat_id` int(5) NOT NULL AUTO_INCREMENT,
  `ord_id` int(5) DEFAULT NULL,
  `rat_ratstars` int(1) NOT NULL DEFAULT '5',
  PRIMARY KEY (`rat_id`),
  KEY `ord_id` (`ord_id`)
);

-- Display details of table `rating`

SELECT RAT_ID, ORD_ID, RAT_RATSTARS FROM rating;


-- 6) Table structure for table `supplier`

 CREATE TABLE IF NOT EXISTS `supplier` (
  `supp_id` int(5) NOT NULL,
  `supp_name` varchar(15) NOT NULL,
  `supp_city` varchar(15) NOT NULL,
  `supp_phone` varchar(10) NOT NULL,
  PRIMARY KEY (`supp_id`)
);

-- Display details of table `supplier`

SELECT SUPP_ID, SUPP_NAME, SUPP_CITY, SUPP_PHONE
		FROM supplier;


-- 7) Table structure for table `supplier_pricing`

CREATE TABLE IF NOT EXISTS `supplier_pricing` (
  `pricing_id` int(5) NOT NULL AUTO_INCREMENT,
  `pro_id` int(5) NOT NULL,
  `supp_id` int(5) NOT NULL,
  `supp_price` int(5) DEFAULT '0',
  PRIMARY KEY (`pricing_id`),
  KEY `pro_id` (`pro_id`),
  KEY `supp_id` (`supp_id`)
);

-- Display details of table `supplier_pricing`

SELECT PRICING_ID, PRO_ID, SUPP_ID, SUPP_PRICE
		FROM supplier_pricing;