# Problem

Amazon wants to implement the Customers who bought this also bought... feature based on co-purchase patterns. Write a solution to :

Identify distinct product pairs frequently purchased together by the same customers (where product1_id < product2_id)
For each product pair, determine how many customers purchased both products
A product pair is considered for recommendation if at least 3 different customers have purchased both products.

Return the result table ordered by customer_count in descending order, and in case of a tie, by product1_id in ascending order, and then by product2_id in ascending order.

# Link

https://leetcode.com/problems/find-product-recommendation-pairs/

# Approach

### Initial Idea

My first idea was to join the `ProductPurchases` table with `ProductInfo` in a Common Table Expression (CTE) to get each purchased product along with its category. Then, I performed a self-join on the CTE using `user_id` to generate all unique pairs of products purchased by the same customer. Finally, I grouped the pairs and counted how many customers purchased each pair together.

Although this approach works correctly, the extra CTE is not necessary because it is only used once.

### Optimized Approach

To simplify the query, I removed the CTE and directly joined the `ProductPurchases` table with itself. The self-join is performed on `user_id`, while the condition `p1.product_id < p2.product_id` ensures that each product pair is generated only once and avoids duplicate combinations like `(A, B)` and `(B, A)`.

After generating the product pairs, I joined the `ProductInfo` table twice to retrieve the categories of both products. Then, I grouped the results by the product IDs and their categories, counted the number of customers who purchased each pair together, filtered pairs purchased by at least **3 customers** using the `HAVING` clause, and finally sorted the output based on:

* Customer count in descending order.
* Product 1 ID in ascending order.
* Product 2 ID in ascending order.


