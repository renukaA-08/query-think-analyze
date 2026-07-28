## Problem

A Microsoft Azure Supercloud customer is defined as a customer who has purchased at least one product from every product category listed in the products table.

Write a query that identifies the customer IDs of these Supercloud customers.

## Link

https://datalemur.com/questions/supercloud-customer

##  Approach

1. Join the `customer_contracts` table with the `products` table using `product_id` to identify the category of each purchased product.
2. Group the records by `customer_id`.
3. Count the **distinct product categories** purchased by each customer.
4. Compare this count with the **total number of distinct product categories** present in the `products` table.
5. Return customers whose counts are equal, meaning they have purchased products from every category.

## 💡 SQL Concepts Used

- `INNER JOIN`
- `GROUP BY`
- `COUNT(DISTINCT ...)`
- `HAVING`
- Scalar Subquery
