# Problem

Assume you're given a table containing data on Amazon customers and their spending on products in different category, write a query to identify the top two highest-grossing products within each category in the year 2022. The output should include the category, product, and total spend.

# Link

datalemur.com/questions/sql-highest-grossing

# Approach

For this problem, I first filtered the data to include only the transactions made in the year **2022**.

Next, I grouped the records by **category** and **product** to calculate the total amount spent on each product using the `SUM()` aggregate function.

After finding the total spend for every product, I used the `ROW_NUMBER()` window function to rank the products within each category based on their total spend in descending order.

Finally, I filtered the results to keep only the top **2** ranked products from each category and displayed the category, product, and total spend.

# SQL Concepts Used
-`sub query`
- `WHERE`
- `GROUP BY`
- `ORDER BY`
- `sum() - aggregate_function`
- `row_number() - window_function `

