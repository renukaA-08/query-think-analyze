## Problem

You're provided with two tables: the advertiser table contains information about advertisers and their respective payment status, and the daily_pay table contains the current payment information for advertisers, and it only includes advertisers who have made payments.

Write a query to update the payment status of Facebook advertisers based on the information in the daily_pay table. The output should include the user ID and their current payment status, sorted by the user id.

The payment status of advertisers can be classified into the following categories:

New: Advertisers who are newly registered and have made their first payment.
Existing: Advertisers who have made payments in the past and have recently made a current payment.
Churn: Advertisers who have made payments in the past but have not made any recent payment.
Resurrect: Advertisers who have not made a recent payment but may have made a previous payment and have made a payment again recently.
Before proceeding with the question, it is important to understand the possible transitions in the advertiser's status based on the payment status. The following table provides a summary of these transitions:

| Current Status | Payment on Day T | Updated Status |
|---------------|------------------|----------------|
| NEW | Paid | EXISTING |
| NEW | Not Paid | CHURN |
| EXISTING | Paid | EXISTING |
| EXISTING | Not Paid | CHURN |
| CHURN | Paid | RESURRECT |
| CHURN | Not Paid | CHURN |
| RESURRECT | Paid | EXISTING |
| RESURRECT | Not Paid | CHURN |
"Current Status" column: Represents the advertiser's current status.
"Payment Status" column: Represents the updated payment status based on the conditions
"Payment on Day T" column: Indicates whether the advertiser made a payment on a specific day (T) or not.
The transitions between payment statuses in the provided table can be summarized as follows:

Rows 2, 4, 6, and 8: If an advertiser does not make a payment on day T, regardless of their previous status, their payment status transitions to "CHURN" as the updated status.
Rows 1, 3, 5, and 7: If an advertiser makes a payment on day T, the status is updated to either "EXISTING" or "RESURRECT" based on their previous status. If the previous status was "CHURN," the updated status is "RESURRECT." For any other previous status, the updated status is "EXISTING."

## Link

https://datalemur.com/questions/updated-status

## Approach

1. Perform a **FULL OUTER JOIN** between `advertiser` and `daily_pay` on `user_id`.
2. Use `COALESCE()` to return the available `user_id` from either table.
3. Apply a `CASE` statement to determine the advertiser's new status.

---

## Status Rules

| Condition | New Status |
|-----------|------------|
| User exists in `advertiser` but not in `daily_pay` | `CHURN` |
| User exists in `daily_pay` but not in `advertiser` | `NEW` |
| Previous status is `CHURN` and user paid today | `RESURRECT` |
| User exists in both tables and previous status is not `CHURN` | `EXISTING` |


## Key SQL Concepts Used

- FULL OUTER JOIN
- `COALESCE()`
- CASE
- `ORDER BY`
