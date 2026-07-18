# Find Inventory Imbalance

## Problem

Write a solution to find stores that have inventory imbalance - stores where the most expensive product has lower stock than the cheapest product.

For each store, identify the most expensive product (highest price) and its quantity
For each store, identify the cheapest product (lowest price) and its quantity
A store has inventory imbalance if the most expensive product's quantity is less than the cheapest product's quantity
Calculate the imbalance ratio as (cheapest_quantity / most_expensive_quantity)
Round the imbalance ratio to 2 decimal places
Only include stores that have at least 3 different products
Return the result table ordered by imbalance ratio in descending order, then by store name in ascending order.
For each qualifying store:


## LeetCode Link

https://leetcode.com/problems/find-stores-with-inventory-imbalance/

# Approach

## Before Optimization

1. Used two separate Common Table Expressions (CTEs):
   - One to identify the most expensive product in each store.
   - Another to identify the cheapest product in each store.
2. Used the `ROW_NUMBER()` window function to rank products by price.
3. Filtered the top-ranked product from each CTE.
4. Joined both CTEs on `store_id`.
5. Considered only stores with at least three products and where the cheapest product's quantity was greater than the most expensive product's quantity.
6. Calculated the imbalance ratio and sorted the final result.

**Drawback**

- The `Inventory` table was scanned twice to compute the rankings, making the query less efficient.

---

## After Optimization

1. Used a single CTE to rank products by both:
   - Highest price (`high`)
   - Lowest price (`low`)
2. Used `COUNT()` as a window function to count the number of products in each store.
3. Performed a self join on the ranked CTE:
   - `high = 1` gives the most expensive product.
   - `low = 1` gives the cheapest product.
4. Filtered stores having at least three products.
5. Checked that the cheapest product's quantity is greater than the most expensive product's quantity.
6. Calculated the imbalance ratio and sorted the final output.

### Optimization

- Reduced two scans of the `Inventory` table to a single scan.
- Computed both rankings in one CTE using window functions.
- Improved readability by keeping all ranking logic in one place.
- Reduced redundant computations while producing the same result.

---

# SQL Topics Used

- Common Table Expressions (CTE)
- Self Join
- Window Functions
  - `ROW_NUMBER()`
  - `COUNT() OVER()`
- `PARTITION BY`
- `ORDER BY`
- Filtering using `WHERE`
- Arithmetic Operations
- `ROUND()`
- Result Sorting (`ORDER BY`)
