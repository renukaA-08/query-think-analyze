## Problem Statement

UnitedHealth Group (UHG) has a program called Advocate4Me, which allows policy holders (or, members) to call an advocate and receive support for their health care needs – whether that's claims and benefits support, drug coverage, pre- and post-authorisation, medical records, emergency assistance, or member portal services.

Write a query to obtain the number of unique callers who made calls within a 7-day interval of their previous calls. If a caller made more than two calls within the 7-day period, count them only once.

## Link

https://datalemur.com/questions/patient-call-history

## Approach

1. Partition the call records by `policy_holder_id` so that each policy holder's calls are analyzed separately.

2. Sort each policy holder's calls chronologically using `call_date`.

3. Use the previous call date for each policy holder to compare the current call with the immediately preceding call.

4. Calculate the time difference between the current call and the previous call.

5. Keep only those calls where the difference is within 7 days.

6. Count distinct policy holders to ensure that a caller who made multiple qualifying calls is counted only once.

## Key Concepts

- Window function `LAG()`
- subquery
- WHERE
- aggregate function : `count()`
- distinct
