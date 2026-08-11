## Problem Description

Sometimes, payment transactions are repeated by accident; it could be due to user error, API failure or a retry error that causes a credit card to be charged twice.

Using the transactions table, identify any payments made at the same merchant with the same credit card for the same amount within 10 minutes of each other. Count such repeated payments.

Assumptions:

The first transaction of such payments should not be counted as a repeated payment. This means, if there are two transactions performed by a merchant with the same credit card and for the same amount within 10 minutes, there will only be 1 repeated payment.

## Link

https://datalemur.com/questions/repeated-payments

## Approach

1. Consider transactions based on the combination of **merchant, credit card, and transaction amount**.

2. For each combination, arrange the transactions in **chronological order** using the transaction timestamp.

3. Compare every transaction with the **immediately preceding transaction** for the same merchant, credit card, and amount.

4. Calculate the time difference between the current transaction and its previous transaction.

5. If the time difference is **10 minutes or less**, consider the current transaction as a repeated payment.

6. The first transaction of each combination has no previous transaction, so it is automatically excluded from the repeated-payment count.

7. Finally, count all transactions that satisfy the 10-minute condition.

## SQL Topics Used
 
 1. Common Table Expression (CTE)
 2. Window Functions - `LAG()`
 3. Partition by
 4. ORDER BY
 5. Timestamp Arithmetic
 6. WHERE Clause
 7. `COUNT()`

on of **CTE + Window Functions + LAG() + PARTITION BY + timestamp arithmetic** provides an effective way to identify accidental repeated payments while ensuring that the first transaction is not counted.
