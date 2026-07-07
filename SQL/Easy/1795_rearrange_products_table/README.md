# Rearrange Products Table

# Problem 
Write a solution to rearrange the Products table so that each row has (product_id, store, price). If a product is not available in a store, do not include a row with that product_id and store combination in the result table.

Return the result table in any order.

# Link :

https://leetcode.com/problems/rearrange-products-table/

## Approach

For this problem, my goal was to convert the store columns (`store1`, `store2`, and `store3`) into separate rows.

### Steps

1. Select the `product_id`, the store name (`store1`), and its price.
2. Ignore rows where the price is `NULL` using `WHERE store1 IS NOT NULL`.
3. Repeat the same process for `store2` and `store3`.
4. Combine all the results using `UNION ALL`.

I chose `UNION ALL` instead of `UNION` because there is no need to remove duplicate rows. This makes the query more efficient.
