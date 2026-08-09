## Problem Description

UnitedHealth Group (UHG) has a program called Advocate4Me, which allows policy holders (or, members) to call an advocate and receive support for their health care needs – whether that's claims and benefits support, drug coverage, pre- and post-authorisation, medical records, emergency assistance, or member portal services.

To analyze the performance of the program, write a query to determine the month-over-month growth rate specifically for long-calls. A long-call is defined as any call lasting more than 5 minutes (300 seconds).

Output the year and month in numerical format and chronological order, along with the growth percentage rounded to 1 decimal place.

## Link

https://datalemur.com/questions/long-calls-growth

## Approach

1. Filter the `callers` table to include only calls with a duration greater than 300 seconds.

2. Extract the **year** and **month** from `call_date`.

3. Group the filtered records by year and month.

4. Count the number of long calls for each month.

5. Use the `LAG()` window function to retrieve the previous month's call count.

6. Calculate the month-over-month growth percentage using:

   **Growth Percentage = ((Current Calls − Previous Calls) / Previous Calls) × 100**

7. Round the calculated percentage to one decimal place.

8. Sort the final result by year and month.

## SQL Concepts Used

* `EXTRACT()` – Extracting year and month from a date.
* `COUNT()` – Counting the number of long calls.
* `WHERE` – Filtering calls based on duration.
* `GROUP BY` – Aggregating calls by year and month.
* `LAG()` – Accessing the previous month's call count.
* `ROUND()` – Rounding the growth percentage.
* `ORDER BY` – Sorting the output chronologically.
* **CTE (Common Table Expression)** – Structuring the query into a logical intermediate step.
