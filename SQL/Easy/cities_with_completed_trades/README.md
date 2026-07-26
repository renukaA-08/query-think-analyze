## Problem

  Assume you're given the tables containing completed trade orders and user details in a Robinhood trading system.

  Write a query to retrieve the top three cities that have the highest number of completed trade orders listed in descending order. Output the city name and the corresponding number of completed trade orders.

## Link

  https://datalemur.com/questions/completed-trades

## Approach

- Join the users and trades tables using user_id.
- Filter the joined records to include only trades whose status is Completed.
- Group the records by city.
- Count the number of completed orders in each city using COUNT(order_id).
- Sort the cities by the number of completed orders in descending order.
- Return only the top 3 cities using LIMIT 3.


## SQL Concepts Used

- JOIN
- `GROUP BY`
- `COUNT()`
- `ORDER BY`
- `LIMIT`
- Filtering in the JOIN condition
