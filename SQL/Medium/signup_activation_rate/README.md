## Problem

New TikTok users sign up with their emails. They confirmed their signup by replying to the text confirmation to activate their accounts. Users may receive multiple text messages for account confirmation until they have confirmed their new account.

A senior analyst is interested to know the activation rate of specified users in the emails table. Write a query to find the activation rate. Round the percentage to 2 decimal places.

Definitions:

emails table contain the information of user signup details.
texts table contains the users' activation information.
Assumptions:

The analyst is interested in the activation rate of specific users in the emails table, which may not include all users that could potentially be found in the texts table.
For example, user 123 in the emails table may not be in the texts table and vice versa.

## Link

https://datalemur.com/questions/signup-confirmation-rate

## Approach 

- Perform a LEFT JOIN between the emails and texts tables on email_id.
- Move the condition signup_action = 'Confirmed' into the ON clause so that all emails are preserved, while only confirmed text records are matched.
- Count t.email_id to get the total number of confirmed signups.
- Count e.email_id to get the total number of email records.
- Multiply the denominator by 1.0 to perform floating-point division instead of integer division.
- Use ROUND(..., 2) to return the confirmation rate rounded to two decimal places.

## SQL Topics :

 - Left join
 -`count()`
 - `round()`
