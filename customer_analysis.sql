---CUSTOMER ANALYSIS 
--NUMBER OF CUSTOMERS FOR CHECKING
--Q4 2021 -Q1 2022
SELECT count (distinct (Customer_ID))AS NO_OF_CUSTOMERS
FROM [ShopNow Transactions from Oct 2021 to March 2022_edit]

-- Q4
SELECT count (distinct (Customer_ID))AS NO_OF_CUSTOMERS_Q4
FROM [ShopNow Transactions from Oct 2021 to March 2022_edit]
WHERE Transaction_Time BETWEEN '2021-10-01' and  '2021-12-31 23:59:59.999';

-- Q1
SELECT count (distinct (Customer_ID))AS NO_OF_CUSTOMERS_Q4
FROM [ShopNow Transactions from Oct 2021 to March 2022_edit]
WHERE Transaction_Time BETWEEN '2022-01-01' and '2022-03-31 23:59:59.999';
	


--FIRST TRANSACTION DATE (INCLUDING CONSIDERATION) CREATE TABLE
 SELECT DISTINCT(Customer_ID), Transaction_Time, MIN(Transaction_Time) OVER (PARTITION BY Customer_ID) AS first_purchase_date,Transaction_ID, Status
 INTO #TEMPCUSTOMER
FROM [ShopNow Transactions from Oct 2021 to March 2022_edit];


-- FIRST TRANSACTION DATE WITHOUT CONSIDERATION, CREATE TABLE 
 SELECT DISTINCT(Customer_ID), Transaction_Time, MIN(Transaction_Time) OVER (PARTITION BY Customer_ID) AS first_purchase_date,Transaction_ID, Status
 INTO #TEMPCUSTOMER2
FROM [ShopNow Transactions from Oct 2021 to March 2022_edit]
WHERE Status <> 'abandoned';


-- CUSTOMER CATEGORISING 
-- SETTING THE TABLE FOR SUBQUERY
-- excluding abandonded 
SELECT *,'customer_status' =
CASE 
WHEN  first_purchase_date < Transaction_Time then 'returning customer'
WHEN  first_purchase_date = Transaction_Time then 'New customer'
END
FROM #TEMPCUSTOMER2

-- incld abandonded
SELECT *,'customer_status' =
CASE 
WHEN  first_purchase_date < Transaction_Time then 'returning customer'
WHEN  first_purchase_date = Transaction_Time then 'New customer'
END
FROM #TEMPCUSTOMER
--END OF SUBQUERY SETUP


--  COUNTING the number of transactions by users that have attempted previously 
--INCLD ABANDONED
-- ALL
SELECT customer_status, COUNT(customer_status)
FROM (SELECT *,'customer_status' =
CASE 
WHEN  first_purchase_date < Transaction_Time then 'returning customer'
WHEN  first_purchase_date = Transaction_Time then 'New customer'
END
FROM #TEMPCUSTOMER) AS C_T
GROUP BY customer_status

--Q4

SELECT customer_status, COUNT(customer_status)
FROM (SELECT *,'customer_status' =
CASE 
WHEN  first_purchase_date < Transaction_Time then 'returning customer'
WHEN  first_purchase_date = Transaction_Time then 'New customer'
END
FROM #TEMPCUSTOMER) AS C_T
WHERE Transaction_Time BETWEEN '2021-10-01' and  '2021-12-31 23:59:59.999'
GROUP BY customer_status

-- Q1
SELECT customer_status, COUNT(customer_status)
FROM (SELECT *,'customer_status' =
CASE 
WHEN  first_purchase_date < Transaction_Time then 'returning customer'
WHEN  first_purchase_date = Transaction_Time then 'New customer'
END
FROM #TEMPCUSTOMER) AS C_T
WHERE Transaction_Time BETWEEN '2022-01-01' and '2022-03-31 23:59:59.999'
GROUP BY customer_status

-- excld abandonded

-- ALL
SELECT customer_status, COUNT(customer_status)
FROM (SELECT *,'customer_status' =
CASE 
WHEN  first_purchase_date < Transaction_Time then 'returning customer'
WHEN  first_purchase_date = Transaction_Time then 'New customer'
END
FROM #TEMPCUSTOMER2) AS C_T2
GROUP BY customer_status

--Q4

SELECT customer_status, COUNT(customer_status)
FROM (SELECT *,'customer_status' =
CASE 
WHEN  first_purchase_date < Transaction_Time then 'returning customer'
WHEN  first_purchase_date = Transaction_Time then 'New customer'
END
FROM #TEMPCUSTOMER2) AS C_T2
WHERE Transaction_Time BETWEEN '2021-10-01' and  '2021-12-31 23:59:59.999'
GROUP BY customer_status

-- Q1
SELECT customer_status, COUNT(customer_status)
FROM (SELECT *,'customer_status' =
CASE 
WHEN  first_purchase_date < Transaction_Time then 'returning customer'
WHEN  first_purchase_date = Transaction_Time then 'New customer'
END
FROM #TEMPCUSTOMER2) AS C_T2
WHERE Transaction_Time BETWEEN '2022-01-01' and '2022-03-31 23:59:59.999'
GROUP BY customer_status

-- STATUS OF FIRST TRANSACTION
SELECT 
COUNT(CASE WHEN first_purchase_date = Transaction_Time AND Status = 'abandoned' THEN 1 ELSE NULL END) AS first_time_abandonded,
COUNT(CASE WHEN first_purchase_date = Transaction_Time AND Status = 'success' THEN 1 ELSE NULL END) AS first_time_success,
COUNT(CASE WHEN first_purchase_date = Transaction_Time AND Status = 'failed' THEN 1 ELSE NULL END) AS first_time_failed,
COUNT(CASE WHEN first_purchase_date = Transaction_Time AND Status = 'reversed' THEN 1 ELSE NULL END) AS first_time_reversed

FROM #TEMPCUSTOMER

--Q4
SELECT 
COUNT(CASE WHEN first_purchase_date = Transaction_Time AND Status = 'abandoned' THEN 1 ELSE NULL END) AS first_time_abandonded,
COUNT(CASE WHEN first_purchase_date = Transaction_Time AND Status = 'success' THEN 1 ELSE NULL END) AS first_time_success,
COUNT(CASE WHEN first_purchase_date = Transaction_Time AND Status = 'failed' THEN 1 ELSE NULL END) AS first_time_failed,
COUNT(CASE WHEN first_purchase_date = Transaction_Time AND Status = 'reversed' THEN 1 ELSE NULL END) AS first_time_reversed

FROM #TEMPCUSTOMER
WHERE Transaction_Time BETWEEN '2021-10-01' and  '2021-12-31 23:59:59.999'

--Q1
SELECT 
COUNT(CASE WHEN first_purchase_date = Transaction_Time AND Status = 'abandoned' THEN 1 ELSE NULL END) AS first_time_abandonded,
COUNT(CASE WHEN first_purchase_date = Transaction_Time AND Status = 'success' THEN 1 ELSE NULL END) AS first_time_success,
COUNT(CASE WHEN first_purchase_date = Transaction_Time AND Status = 'failed' THEN 1 ELSE NULL END) AS first_time_failed,
COUNT(CASE WHEN first_purchase_date = Transaction_Time AND Status = 'reversed' THEN 1 ELSE NULL END) AS first_time_reversed

FROM #TEMPCUSTOMER
WHERE Transaction_Time BETWEEN '2022-01-01' and '2022-03-31 23:59:59.999'


--new and existing customers  
-- create table

--q4 table
SELECT *
INTO #q4table
FROM [ShopNow Transactions from Oct 2021 to March 2022_edit]
	WHERE Transaction_Time BETWEEN '2021-10-01' and  '2021-12-31 23:59:59.999'

--q1 table
SELECT *
INTO #q1table
FROM [ShopNow Transactions from Oct 2021 to March 2022_edit]
	WHERE Transaction_Time BETWEEN '2022-01-01' and '2022-03-31 23:59:59.999'


	-- count Q1

	-- new clients

	SELECT DISTINCT( #q1table.Customer_ID)
FROM #q1table LEFT JOIN #q4table ON #q1table.Customer_ID = #q4table.Customer_ID
WHERE #q4table.Customer_ID IS NULL

	-- returning clients

SELECT DISTINCT( #q1table.Customer_ID)
FROM #q1table LEFT JOIN #q4table ON #q1table.Customer_ID = #q4table.Customer_ID
WHERE #q4table.Customer_ID IS NOT NULL























-- RETURN CUSTOMERS AFTER FIRST ABANDONING (NEED TO DOUBLE CHECK)/not included 
-- CREATSE SECOND TRANSACTION DATE
 SELECT DISTINCT(Customer_ID), Transaction_Time, MIN(Transaction_Time) OVER (PARTITION BY Customer_ID) AS second_date,Transaction_ID,first_purchase_date, Status
 INTO #TEMPSECOND
 FROM #TEMPCUSTOMER
 WHERE Transaction_Time > first_purchase_date;

 --INCLUDING SECOND TRANSACTION DATE IN ORIGINAL TABLE
 SELECT #TEMPCUSTOMER.*, #TEMPSECOND.second_date
 INTO #TEMPMERGE
 FROM #TEMPCUSTOMER LEFT  JOIN #TEMPSECOND ON #TEMPCUSTOMER.Transaction_ID = #TEMPSECOND.Transaction_ID

 -- Transactions that were succseful on the second try
SELECT
CASE WHEN first_purchase_date = Transaction_Time AND STATUS ='abandoned' THEN 'first_abandoned' ELSE NULL END AS first_status,
CASE WHEN second_date = Transaction_Time AND  Status = 'success' THEN 'second_sucess_after_abandoned' ELSE NULL END AS second_status,
*
FROM #TEMPMERGE

-- COUNT SUCCESSFUL 
SELECT COUNT(second_status) as second_try_successful, COUNT(first_status) as first_try_abandoned
FROM (SELECT
CASE WHEN second_date IS NULL AND  Status = 'abandoned' THEN 'first_abandoned' ELSE NULL END AS first_status,
CASE WHEN second_date = Transaction_Time AND  Status = 'success' THEN 'second_sucess_after_abandoned' ELSE NULL END AS second_status,
*
FROM #TEMPMERGE) as second_try

SELECT COUNT (DISTINCT(Customer_ID))
FROM (SELECT
CASE WHEN first_purchase_date = Transaction_Time AND STATUS ='abandoned' THEN 'first_abandoned' ELSE NULL END AS first_status,
CASE WHEN second_date = Transaction_Time AND  Status = 'success' THEN 'second_sucess_after_abandoned' ELSE NULL END AS second_status,
*
FROM #TEMPMERGE) AS test
WHERE first_status = 'first_abandoned'








 
