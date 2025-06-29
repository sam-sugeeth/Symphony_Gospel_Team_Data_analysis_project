CREATE TABLE locations (
    Location_ID INT PRIMARY KEY,
    Location VARCHAR(100) NOT NULL
);

CREATE TABLE products (
    Product_ID INT PRIMARY KEY,
    Product_Category VARCHAR(100) NOT NULL
);

CREATE TABLE transactions (
    Transaction_ID VARCHAR(50) PRIMARY KEY,
    Date DATE,
    Month VARCHAR(20),
    Location_ID INT,
    Product_ID INT,
    Sales_Channel VARCHAR(50),
    Units_Sold INT,
    Unit_Price DECIMAL(10,2),
    Revenue DECIMAL(12,2),
    Donations DECIMAL(12,2),
    Total_Revenue DECIMAL(12,2),
    FOREIGN KEY (Location_ID) REFERENCES locations(Location_ID),
    FOREIGN KEY (Product_ID) REFERENCES products(Product_ID)
);-- SQL script to create database tables
