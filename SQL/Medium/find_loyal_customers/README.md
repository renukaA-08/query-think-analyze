## Problem

Write a solution to find loyal customers. A customer is considered loyal if they meet ALL the following criteria:

Made at least 3 purchase transactions.
Have been active for at least 30 days.
Their refund rate is less than 20% .
Refund rate is the proportion of transactions that are refunds, calculated as the number of refund transactions divided by the total number of transactions (purchases plus refunds).

Return the result table ordered by customer_id in ascending order.

## Link

https://leetcode.com/problems/find-loyal-customers/

## Approach

I grouped the transactions by `customer_id` so that I could evaluate each customer's transaction history individually.

Then, I used the `HAVING` clause to filter customers based on the required conditions after aggregation.

- To calculate the total number of purchases, I used `SUM(transaction_type = 'purchase')`.
- To calculate the customer's active period, I used `DATEDIFF(MAX(transaction_date), MIN(transaction_date))`.
- To calculate the refund rate, I used `AVG(transaction_type = 'refund')`, which returns the proportion of refund transactions.
- Finally, I filtered customers who satisfied all the conditions and returned the result ordered by `customer_id` in ascending order.

## SQL topics used 

1. `GROUP BY`
2. `HAVING`
3. Aggregate Functions (`SUM()`, `AVG()`, `MIN()`, `MAX()`)
4. Conditional Aggregation using Boolean Expressions
5. `DATEDIFF()`
6. `ORDER BY`
