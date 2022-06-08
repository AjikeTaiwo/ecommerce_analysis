-- transaction status value
-- All(october 2021 to March  2022)
SELECT Status, SUM(Transaction_Amount) AS value_of_transactions
FROM [ShopNow Transactions from Oct 2021 to March 2022_edit]
GROUP BY Status;

--Q4 2021
SELECT Status, SUM(Transaction_Amount) AS value_of_transactions_Q4
FROM [ShopNow Transactions from Oct 2021 to March 2022_edit]
WHERE Transaction_Time BETWEEN '2021-10-01' and  '2021-12-31 23:59:59.999'
GROUP BY Status;

--Q1 2022 
SELECT Status, SUM(Transaction_Amount) AS value_of_transactions_Q1
FROM [ShopNow Transactions from Oct 2021 to March 2022_edit]
WHERE Transaction_Time BETWEEN '2022-01-01' and '2022-03-31 23:59:59.999'
GROUP BY Status;

--OCTOBER 2021
SELECT Status, SUM(Transaction_Amount) AS value_of_transactions_OCTOBER
FROM [ShopNow Transactions from Oct 2021 to March 2022_edit]
WHERE Transaction_Time BETWEEN '2021-10-01' and  '2021-10-31 23:59:59.999'
GROUP BY Status;

--NOV 2021
SELECT Status, SUM(Transaction_Amount) AS value_of_transactions_NOV
FROM [ShopNow Transactions from Oct 2021 to March 2022_edit]
WHERE Transaction_Time BETWEEN '2021-11-01' and  '2021-11-30 23:59:59.999'
GROUP BY Status;

--DEC 2021
SELECT Status, SUM(Transaction_Amount) AS value_of_transactions_DEC
FROM [ShopNow Transactions from Oct 2021 to March 2022_edit]
WHERE Transaction_Time BETWEEN '2021-12-01' and  '2021-12-31 23:59:59.999'
GROUP BY Status;

--JAN 2022
SELECT Status, SUM(Transaction_Amount) AS value_of_transactions_jan
FROM [ShopNow Transactions from Oct 2021 to March 2022_edit]
WHERE Transaction_Time BETWEEN '2022-01-01' and  '2022-01-31 23:59:59.999'
GROUP BY Status;

--FEB 2022
SELECT Status, SUM(Transaction_Amount) AS value_of_transactions_feb
FROM [ShopNow Transactions from Oct 2021 to March 2022_edit]
WHERE Transaction_Time BETWEEN '2022-02-01' and  '2022-02-28 23:59:59.999'
GROUP BY Status;

--MAR 2022
SELECT Status, SUM(Transaction_Amount) AS value_of_transactions_mar
FROM [ShopNow Transactions from Oct 2021 to March 2022_edit]
WHERE Transaction_Time BETWEEN '2022-03-01' and  '2022-03-31 23:59:59.999'
GROUP BY Status;