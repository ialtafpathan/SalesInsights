
-- 1 Retrieve all customers.
SELECT * FROM CUSTOMERS; 

-- 2 List all products and their types
SELECT PRODUCT_CODE, PRODUCT_TYPE
FROM PRODUCTS;

-- 3 Get all unique customer types
SELECT DISTINCT CUSTOMER_TYPE
FROM CUSTOMERS;

-- 4 Retrieve customers whose names start with 'A'.
SELECT CUSTMER_NAME 
FROM CUSTOMERS
WHERE CUSTMER_NAME LIKE "A%";

-- 5 Find transactions with a sales amount greater than 1000.
SELECT * FROM 
TRANSACTIONS
WHERE SALES_AMOUNT > 1000;

-- 6 Get the total sales amount for each market.
SELECT M.MARKETS_NAME, SUM(SALES_AMOUNT) AS 'SALES AMOUNT'
FROM TRANSACTIONS T JOIN 
MARKETS M
ON T.MARKET_CODE = M.MARKETS_CODE
group by M.MARKETS_NAME
order by SUM(SALES_AMOUNT) DESC;

-- 7 Retrieve market names and associated transaction amounts.
SELECT M.MARKETS_NAME,
       T.SALES_AMOUNT
FROM TRANSACTIONS T
JOIN MARKETS M ON T.MARKET_CODE = M.MARKETS_CODE;

-- 8  Show transactions for Chennai market (market code for chennai is Mark001)
 SELECT * FROM TRANSACTIONS
 WHERE MARKET_CODE = 'Mark001';

-- 9 Show distinct product codes that were sold in chennai
SELECT distinct PRODUCT_CODE
FROM TRANSACTIONS
WHERE MARKET_CODE = 'Mark001';

-- 10 Show transactions where currency is US dollars
SELECT * FROM TRANSACTIONS
WHERE CURRENCY = "USD";

-- 11  Show transactions in 2020 join by date table And Sales amount more than 1000
SELECT *
FROM TRANSACTIONS T
JOIN DATE D
ON T.ORDER_DATE = D.DATE 
WHERE D.YEAR = '2019'
AND SALES_AMOUNT > 2000;

  
  

-- 12 Show transactions in 2020 join by date table
SELECT *
FROM TRANSACTIONS T
JOIN DATE D
ON T.ORDER_DATE = D.DATE 
WHERE D.YEAR = '2020';

-- 13  Show total revenue in year 2020, January Month,
 SELECT SUM(T.SALES_AMOUNT)
FROM TRANSACTIONS T
JOIN DATE D
ON T.ORDER_DATE = D.DATE 
WHERE D.YEAR = '2020' and D.MONTH_NAME = 'JANUARY'
AND T.currency="INR" or T.currency="USD";

-- 14 Show the total revenue in year 2020 in Chennai.

 SELECT SUM(T.SALES_AMOUNT)
FROM TRANSACTIONS T
JOIN DATE D
ON T.ORDER_DATE = D.DATE 
WHERE D.YEAR = '2020'
AND T.MARKET_CODE="Mark001";

-- 15 Get customers who purchased products in a specific market (e.g., 'North').
SELECT C.*,
       M.ZONE
FROM CUSTOMERS C
JOIN TRANSACTIONS T ON T.CUSTOMER_CODE = C.CUSTOMER_CODE
JOIN MARKETS M ON T.MARKET_CODE = M.MARKETS_CODE
WHERE M.ZONE = "north";


-- 16 Calculate the average profit margin for each product.
 SELECT PRODUCT_CODE,
       AVG(PROFIT_MARGIN_PERCENTAGE) AS AVG_PROFIT_MARGIN
FROM TRANSACTIONS
GROUP BY PRODUCT_CODE;

-- 17  Find the top 5 highest-grossing transactions.
SELECT *
FROM TRANSACTIONS
ORDER BY SALES_AMOUNT DESC
LIMIT 5;

-- 18 Identify the market with the highest total sales.
SELECT M.MARKETS_NAME,
       SUM(T.SALES_AMOUNT) AS TOTAL_SALES
FROM TRANSACTIONS T
JOIN MARKETS M ON T.MARKET_CODE = M.MARKETS_CODE
GROUP BY M.MARKETS_NAME
ORDER BY TOTAL_SALES DESC
LIMIT 1;

-- 19 Get the product type with the most transactions
SELECT P.PRODUCT_TYPE,
       COUNT(*)
FROM PRODUCTS P
JOIN TRANSACTIONS T ON P.PRODUCT_CODE = T.PRODUCT_CODE
GROUP BY P. PRODUCT_TYPE
ORDER BY COUNT(*) DESC;

-- 20 Find customers who have made purchases in all available markets.

SELECT C.CUSTMER_NAME
FROM CUSTOMERS C
WHERE NOT EXISTS
    (SELECT M.MARKETS_CODE
     FROM MARKETS M
     WHERE NOT EXISTS
         (SELECT 1
          FROM TRANSACTIONS T
          WHERE T.CUSTOMER_CODE = C.CUSTOMER_CODE
            AND T.MARKET_CODE = M.MARKETS_CODE));
            
-- 21 List transactions made in the last 30 days.
SELECT *
FROM TRANSACTIONS
WHERE ORDER_DATE >= CURDATE() - INTERVAL 30 DAY;
	




