-- ====================================================================
-- DATABASE SCHEMA SETUP & TABLE CONFIGURATION
-- Purpose: Builds relational tables with strict constraint integrity
-- ====================================================================

CREATE DATABASE IF NOT EXISTS ecommerce_staging;
USE ecommerce_staging;

DROP TABLE IF EXISTS Details;
DROP TABLE IF EXISTS Orders;

-- Create Parent Dimension Table
CREATE TABLE Orders (
    Order_ID VARCHAR(50) NOT NULL,
    Order_Date DATE NOT NULL,
    CustomerName VARCHAR(100) NOT NULL,
    State VARCHAR(100) NOT NULL,
    City VARCHAR(100) NOT NULL,
    PRIMARY KEY (Order_ID)
);

-- Create Child Fact Table with Relational Foreign Key
CREATE TABLE Details (
    Line_Item_ID INT AUTO_INCREMENT,
    Order_ID VARCHAR(50) NOT NULL,
    Amount INT NOT NULL,
    Profit INT NOT NULL,
    Quantity INT NOT NULL,
    Category VARCHAR(100) NOT NULL,
    Sub_Category VARCHAR(100) NOT NULL,
    PaymentMode VARCHAR(50) NOT NULL,
    PRIMARY KEY (Line_Item_ID),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID) ON DELETE CASCADE
);
