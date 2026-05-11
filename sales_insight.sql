-- Q1: Show all customer records
SELECT * FROM customers;

-- Q2: Show total number of customers
SELECT COUNT(*) FROM customers;

-- Q3: Show transactions for Chennai market (market code = 'Mark001')
SELECT * FROM transactions 
WHERE market_code = 'Mark001';

-- Q4: Show distinct product codes sold in Chennai
SELECT DISTINCT product_code 
FROM transactions 
WHERE market_code = 'Mark001';

-- Q5: Show transactions where currency is US dollars
SELECT * 
FROM transactions 
WHERE currency = 'USD';

-- Q6: Show transactions in 2020 (join with date table)
SELECT transactions.*, date.* 
FROM transactions 
INNER JOIN date 
    ON transactions.order_date = date.date 
WHERE date.year = 2020;

-- Q7: Show total revenue in year 2020 (INR or USD)
SELECT SUM(transactions.sales_amount) 
FROM transactions 
INNER JOIN date 
    ON transactions.order_date = date.date 
WHERE date.year = 2020 
  AND (transactions.currency = 'INR' OR transactions.currency = 'USD');

-- Q8: Show total revenue in January 2020
SELECT SUM(transactions.sales_amount) 
FROM transactions 
INNER JOIN date 
    ON transactions.order_date = date.date 
WHERE date.year = 2020 
  AND date.month_name = 'January' 
  AND (transactions.currency = 'INR' OR transactions.currency = 'USD');

-- Q9: Show total revenue in year 2020 for Chennai market
SELECT SUM(transactions.sales_amount) 
FROM transactions 
INNER JOIN date 
    ON transactions.order_date = date.date 
WHERE date.year = 2020 
  AND transactions.market_code = 'Mark001';
