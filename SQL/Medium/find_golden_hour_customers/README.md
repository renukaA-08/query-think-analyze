# Customer Restaurant Order Analysis

## Problem

Write a solution to find golden hour customers - customers who consistently order during peak hours and provide high satisfaction. A customer is a golden hour customer if they meet ALL the following criteria:

Made at least 3 orders.
At least 60% of their orders are during peak hours (11:00-14:00 or 18:00-21:00).
Their average rating for rated orders is at least 4.0, round it to 2 decimal places.
Have rated at least 50% of their orders.
Return the result table ordered by average_rating in descending order, then by customer_id​​​​​​​ in descending order.

## Link 

https://leetcode.com/problems/find-golden-hour-customers/

## Approach

The solution uses **conditional aggregation** to calculate all required metrics in a single grouped query.

### Steps

1. Group all orders by `customer_id`.
2. Count the total number of orders using `COUNT(*)`.
3. Calculate the percentage of orders placed during peak hours by averaging a `CASE` expression:
   - Return `1` for peak-hour orders.
   - Return `0` for non-peak-hour orders.
   - Multiply the average by `100` to obtain the percentage.
4. Compute the average customer rating using `AVG(order_rating)`. Since `AVG()` ignores `NULL` values, only rated orders are considered.
5. Calculate the proportion of rated orders using:
   ```sql
   COUNT(order_rating) / COUNT(*)
   ```
   Here, `COUNT(order_rating)` counts only non-NULL ratings.
6. Filter customers using the `HAVING` clause based on:
   - Minimum number of orders.
   - Peak-hour order percentage.
   - Rated order percentage.
   - Average rating.
7. Round the calculated percentage and average rating for the final output.
8. Sort the results by average rating (highest first) and customer ID (highest first).

---

## SQL Topics Used

- `GROUP BY`
- Aggregate Functions (`COUNT`, `AVG`)
- Conditional Aggregation
- `CASE WHEN`
- `HAVING`
- `ROUND`
- Date & Time Functions (`HOUR`)
- `ORDER BY`
