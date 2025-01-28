--Create table--
CREATE TABLE walmart_sales (
	InvoiceID VARCHAR(30) PRIMARY KEY,	
	Branch VARCHAR(10),
	City VARCHAR(50),
	Customertype VARCHAR(50),
	Gender VARCHAR(50),
	Productline VARCHAR(50),
	Unitprice DECIMAL(10,2),
	Quantity INT,
	VAT FLOAT,
	Total DECIMAL(12,4),
	Date DATE,
	Time TIME,
	Payment VARCHAR(50),
	cogs DECIMAL(10,2),
	grossmargin_percent NUMERIC(11,9),
    grossincome DECIMAL(12,4),
	Rating NUMERIC(3,1)
);

SELECT * FROM walmart_sales;

--DATA EXPLORATION--
SELECT * FROM walmart_sales
WHERE InvoiceID IS NULL OR 	
	Branch IS NULL OR
	City IS NULL OR
	Customertype IS NULL OR
	Gender IS NULL OR
	Productline IS NULL OR
	Unitprice IS NULL OR
	Quantity IS NULL OR
	VAT IS NULL OR
	Total IS NULL OR
	Date IS NULL OR
	Time IS NULL OR
	Payment IS NULL OR
	cogs IS NULL OR
	grossmargin_percent IS NULL OR
    grossincome IS NULL OR
	Rating IS NULL;

--FEATURE ENGINEERING [ADDING NEW COLUMNS]--

-- time_of_day
SELECT 
	time,
	 CASE 
			WHEN time BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
			WHEN time BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
			ELSE 'Evening'
			END  AS time_of_day
FROM walmart_sales;

ALTER TABLE walmart_sales ADD COLUMN time_of_day VARCHAR(50);

UPDATE walmart_sales 
SET time_of_day = ( CASE 
			WHEN time BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
			WHEN time BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
			ELSE 'Evening'
			END )

-- day_name 
SELECT * FROM walmart_sales;

SELECT date,
    TO_CHAR(date, 'Day') AS day_name
FROM walmart_sales;

ALTER TABLE walmart_sales ADD COLUMN day_name VARCHAR(50);

UPDATE walmart_sales
SET day_name = ( 
		TO_CHAR(date, 'Day')
	);

--month_name

SELECT date,
    TO_CHAR(date, 'Month') AS month_name
FROM walmart_sales;

ALTER TABLE walmart_sales ADD COLUMN month_name VARCHAR(50);

UPDATE walmart_sales
SET month_name = ( 
		TO_CHAR(date, 'Month')
	);

SELECT * FROM walmart_sales;

--DATA ANALYSIS AND FINDINGS--

--1. How many unique cities does the data have?
SELECT COUNT(DISTINCT city)
FROM walmart_sales;

--2. Name each Unique city and their branch?
SELECT DISTINCT city,
		branch
FROM walmart_sales;

--3. How many unique product lines does the data have?
SELECT DISTINCT productline
FROM walmart_sales;

--4. What is the total revenue by Month?
SELECT month_name AS Month,
	SUM(total) AS total_revenue
FROM walmart_sales
GROUP BY 1
ORDER BY 2 DESC;

--5. What Month had the largest COGS?
SELECT month_name AS Month,
	SUM(cogs) AS Total_COGS
FROM walmart_sales
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

--6. What is the most common payment method?
SELECT payment,
		COUNT(payment) AS Cnt
FROM walmart_sales
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1

--7. What is the most selling product line based on total sales value and based on total quantity sold?
SELECT productline,
		SUM(total) AS total_sales
FROM walmart_sales
GROUP BY 1
ORDER BY 2 DESC	
LIMIT 1;

SELECT productline, 
    SUM(quantity) AS total_quantity_sold
FROM walmart_sales
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

--8. What product line has the largest VAT?
SELECT productline, 
    MAX(vat) AS largest_vat
FROM walmart_sales
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

--9. Which city has the largest revenue?
SELECT city,
		SUM(total) AS largest_revenue
FROM walmart_sales
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

--10. What is the most common product line by gender?
SELECT productline,
	gender,
	COUNT(gender) AS cnt
FROM walmart_sales
GROUP BY 1, 2
ORDER BY 3 DESC;

--11. Which branch sold more products than average product sold?
SELECT branch,
		SUM(quantity) AS quantity
FROM walmart_sales
GROUP BY 1
HAVING SUM(quantity) > (SELECT AVG(quantity) FROM walmart_sales)
ORDER BY 2 DESC;


--12. Which of the customer types brings the most revenue?
SELECT customertype,
	SUM(total) AS total_revenue
FROM walmart_sales
GROUP BY 1
ORDER BY 2 DESC;

--13. Which city has the largest VAT [Tax percent]?
SELECT city,
	MAX(vat) AS max_vat
FROM walmart_sales
GROUP BY 1;

--14. What customer tupe pays the most in VAT?
SELECT customertype,
	MAX(vat) AS max_vat
FROM walmart_sales
GROUP BY 1

--15. How many unique customer types does the data have?
SELECT DISTINCT customertype
	FROM walmart_sales;

--16. How many unique payment method does the data have?
SELECT DISTINCT payment
FROM walmart_sales;

--17. What is the most common customer type?
SELECT DISTINCT customertype,
		COUNT(customertype) AS cnt
FROM walmart_sales
GROUP BY 1
ORDER BY 2 DESC;

--18. What customer type buys the most?
SELECT DISTINCT customertype,
	COUNT(*) AS cnt
FROM walmart_sales
GROUP BY 1
ORDER BY 2 DESC;

--19. What is the gender of most ofthe customer?
SELECT gender,
	 COUNT(gender) 
from walmart_sales
group by 1
ORDER BY 2 DESC

--20. What is the gender distribution per branch?
SELECT DISTINCT a.branch, a.gender, COUNT(a.gender) FROM
(SELECT *
FROM walmart_sales ) as a
GROUP BY 1,2 
ORDER BY 1,3 DESC;

--21. Which time of the day do customers give most rating?
SELECT time_of_day,
AVG(rating)
FROM walmart_sales
GROUP BY 1
ORDER BY 2 DESC;

---END OF THE PROJECT--














 
 




















































--13. 




























































