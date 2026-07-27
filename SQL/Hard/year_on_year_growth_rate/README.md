## Problem

Assume you're given a table containing information about Wayfair user transactions for different products. Write a query to calculate the year-on-year growth rate for the total spend of each product, grouping the results by product ID.

The output should include the year in ascending order, product ID, current year's spend, previous year's spend and year-on-year growth percentage, rounded to 2 decimal places.

## Link

https://datalemur.com/questions/yoy-growth-rate

## Approach

### Step 1: Calculate Yearly Spend

First, aggregate the total spend for each product in every year.
This ensures that multiple transactions in the same year are combined into a single yearly total.

### Step 2: Find Previous Year's Spend

Use the `LAG()` window function to retrieve the previous year's total spend for each product.


### Step 3: Calculate YoY Growth
Compute the year-on-year growth percentage using:

```text
((Current Year Spend - Previous Year Spend)
 / Previous Year Spend) × 100
```

Finally, round the result to two decimal places.


## Key SQL Concepts Used

- Common Table Expressions (CTEs)
- `SUM()` aggregation
- `EXTRACT(YEAR FROM date)`
- Window Functions (`LAG()`)
- `PARTITION BY`
- `ORDER BY`
- `ROUND()`

