## Problem

The Bloomberg terminal is the go-to resource for financial professionals, offering convenient access to a wide array of financial datasets. As a Data Analyst at Bloomberg, you have access to historical data on stock performance.

Currently, you're analyzing the highest and lowest open prices for each FAANG stock by month over the years.

For each FAANG stock, display the ticker symbol, the month and year ('Mon-YYYY') with the corresponding highest and lowest open prices (refer to the Example Output format). Ensure that the results are sorted by ticker symbol.

## Link

https://datalemur.com/questions/sql-bloomberg-stock-min-max-1

## Approach

 - First, group the stock price data by ticker.
- Calculate the maximum opening price and minimum opening price for each ticker.
- Create a separate result for the month in which the highest opening price occurred.
- Create another result for the month in which the lowest opening price occurred.
- Match the highest and lowest month results back to the corresponding ticker.
- Combine the highest and lowest price information into a single result.
- Format the date as Mon-YYYY .
- Sort the final result by ticker.

## SQL Concepts Used

- CTEs
- GROUP BY
- Aggregate Functions : `MAX()` , `MIN()`
- JOIN
- `TO_CHAR()`
- ORDER BY
