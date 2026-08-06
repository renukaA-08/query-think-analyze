## Problem Statement

Intuit, a company known for its tax filing products like TurboTax and QuickBooks, offers multiple versions of these products.

Write a query that identifies the user IDs of individuals who have filed their taxes using any version of TurboTax for three or more consecutive years. Each user is allowed to file taxes once a year using a specific product. Display the output in the ascending order of user IDs.

## Link

https://datalemur.com/questions/consecutive-filing-years

## Approach

The solution uses SQL window functions (`LAG()` and `LEAD()`) to examine the previous and next filing years for each user.

### Steps

1. Filter only TurboTax products.
2. Extract the filing year.
3. For each user:
   - Use `LAG()` to retrieve the previous filing year.
   - Use `LEAD()` to retrieve the next filing year.
4. If a row satisfies:
   - Previous Year = Current Year − 1
   - Next Year = Current Year + 1
5. The user has filed for at least **three consecutive years**.
6. Return distinct user IDs.

## SQL concepts use :
- CTE(Common table expression)
- where 
- `Lower()`
- `Extract()`
- like
- window_functions (`Lag()`,`Lead()`)
- order by 
