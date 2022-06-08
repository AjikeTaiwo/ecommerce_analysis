-- transaction status bank breakdown
-- success table
SELECT Status,Transaction_Amount,Bank_Name, Card_Network,Payment_Channel,country_name
FROM [ShopNow Transactions from Oct 2021 to March 2022_edit]
WHERE Status = 'success';

-- test
SELECT COUNT (Status)
FROM 
	(SELECT Status,Transaction_Amount,Bank_Name, Card_Network,Payment_Channel,country_name
	FROM [ShopNow Transactions from Oct 2021 to March 2022_edit]
	WHERE Status = 'success') AS success_table


-- banks
-- All(october 2021 to March  2022)
SELECT Bank_Name, SUM(Transaction_Amount) AS value_of_transactions,COUNT(Status) AS number_of_transactions
FROM 
	(SELECT Status,Transaction_Amount,Bank_Name, Card_Network,Payment_Channel,country_name
	FROM [ShopNow Transactions from Oct 2021 to March 2022_edit]
	WHERE Status = 'success') AS success_table
	GROUP BY Bank_Name;

--Q4 2021
SELECT Bank_Name, SUM(Transaction_Amount) AS value_of_transactions_Q4,COUNT(Status) AS number_of_transactions_Q4
FROM 
	(SELECT Status,Transaction_Amount,Bank_Name, Card_Network,Payment_Channel,country_name,Transaction_Time
	FROM [ShopNow Transactions from Oct 2021 to March 2022_edit]
	WHERE Status = 'success') AS success_table
	WHERE Transaction_Time BETWEEN '2021-10-01' and  '2021-12-31 23:59:59.999'
	GROUP BY Bank_Name;


--Q1 2022 
SELECT Bank_Name, SUM(Transaction_Amount) AS value_of_transactions_Q1,COUNT(Status) AS number_of_transactions_Q1
FROM 
	(SELECT Status,Transaction_Amount,Bank_Name, Card_Network,Payment_Channel,country_name,Transaction_Time
	FROM [ShopNow Transactions from Oct 2021 to March 2022_edit]
	WHERE Status = 'success') AS success_table
	WHERE Transaction_Time BETWEEN '2022-01-01' and '2022-03-31 23:59:59.999'
	GROUP BY Bank_Name;

	-- CARD_NETWORK
-- All(october 2021 to March  2022)
SELECT Card_Network, SUM(Transaction_Amount) AS value_of_transactions,COUNT(Status) AS number_of_transactions
FROM 
	(SELECT Status,Transaction_Amount,Bank_Name, Card_Network,Payment_Channel,country_name
	FROM [ShopNow Transactions from Oct 2021 to March 2022_edit]
	WHERE Status = 'success') AS success_table
	GROUP BY Card_Network;

--Q4 2021
SELECT Card_Network, SUM(Transaction_Amount) AS value_of_transactions_Q4,COUNT(Status) AS number_of_transactions_Q4
FROM 
	(SELECT Status,Transaction_Amount,Bank_Name, Card_Network,Payment_Channel,country_name,Transaction_Time
	FROM [ShopNow Transactions from Oct 2021 to March 2022_edit]
	WHERE Status = 'success') AS success_table
	WHERE Transaction_Time BETWEEN '2021-10-01' and  '2021-12-31 23:59:59.999'
	GROUP BY Card_Network;


--Q1 2022 
SELECT Card_Network, SUM(Transaction_Amount) AS value_of_transactions_Q1,COUNT(Status) AS number_of_transactions_Q1
FROM 
	(SELECT Status,Transaction_Amount,Bank_Name, Card_Network,Payment_Channel,country_name,Transaction_Time
	FROM [ShopNow Transactions from Oct 2021 to March 2022_edit]
	WHERE Status = 'success') AS success_table
	WHERE Transaction_Time BETWEEN '2022-01-01' and '2022-03-31 23:59:59.999'
	GROUP BY Card_Network;


-- PAYMENT_CHANNEL
-- All(october 2021 to March  2022)
SELECT Payment_Channel, SUM(Transaction_Amount) AS value_of_transactions,COUNT(Status) AS number_of_transactions
FROM 
	(SELECT Status,Transaction_Amount,Bank_Name, Card_Network,Payment_Channel,country_name
	FROM [ShopNow Transactions from Oct 2021 to March 2022_edit]
	WHERE Status = 'success') AS success_table
	GROUP BY Payment_Channel;

--Q4 2021
SELECT Payment_Channel, SUM(Transaction_Amount) AS value_of_transactions_Q4,COUNT(Status) AS number_of_transactions_Q4
FROM 
	(SELECT Status,Transaction_Amount,Bank_Name, Card_Network,Payment_Channel,country_name,Transaction_Time
	FROM [ShopNow Transactions from Oct 2021 to March 2022_edit]
	WHERE Status = 'success') AS success_table
	WHERE Transaction_Time BETWEEN '2021-10-01' and  '2021-12-31 23:59:59.999'
	GROUP BY Payment_Channel;


--Q1 2022 
SELECT Payment_Channel, SUM(Transaction_Amount) AS value_of_transactions_Q1,COUNT(Status) AS number_of_transactions_Q1
FROM 
	(SELECT Status,Transaction_Amount,Bank_Name, Card_Network,Payment_Channel,country_name,Transaction_Time
	FROM [ShopNow Transactions from Oct 2021 to March 2022_edit]
	WHERE Status = 'success') AS success_table
	WHERE Transaction_Time BETWEEN '2022-01-01' and '2022-03-31 23:59:59.999'
	GROUP BY Payment_Channel;


-- COUNTRY
-- All(october 2021 to March  2022)
SELECT country_name, SUM(Transaction_Amount) AS value_of_transactions,COUNT(Status) AS number_of_transactions
FROM 
	(SELECT Status,Transaction_Amount,Bank_Name, Card_Network,Payment_Channel,country_name
	FROM [ShopNow Transactions from Oct 2021 to March 2022_edit]
	WHERE Status = 'success') AS success_table
	GROUP BY country_name;

