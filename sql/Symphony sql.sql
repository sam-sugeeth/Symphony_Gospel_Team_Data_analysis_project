
USE symphony_gospel_financials;

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
);

select * from transactions;

 
CREATE TABLE full_transaction_details AS
select t.Transaction_ID, t.Date, t.Month, t.Sales_Channel, t.Units_Sold, t.Unit_Price, t.Revenue,
t.Donations, t.Total_Revenue, l.Location, p.Product_Category from transactions t
INNER JOIN locations l ON t.location_ID = l.location_ID
INNER JOIN products p ON t.product_ID = p.product_ID;


SELECT Month, SUM(Revenue) AS Sales_Revenue, SUM(Donations) AS Donation_Revenue
FROM full_transaction_details
GROUP BY Month;

SELECT Location, SUM(Total_Revenue) AS Total
FROM full_transaction_details
GROUP BY Location
ORDER BY Total DESC;

SELECT Product_Category, SUM(total_revenue) 
FROM full_transaction_details
GROUP BY Product_Category;

SELECT Sales_Channel, SUM(Donations) AS Total_Donations
FROM full_transaction_details
GROUP BY Sales_Channel;


select * from full_transaction_details;