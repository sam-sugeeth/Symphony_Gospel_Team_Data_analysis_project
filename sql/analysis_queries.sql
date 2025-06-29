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
GROUP BY Sales_Channel;-- SQL analysis queries used for insights
