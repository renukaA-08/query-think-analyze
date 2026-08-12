## Problem

This is the same question as problem #31 in the SQL Chapter of Ace the Data Science Interview!

Imagine you're provided with a table containing information about user logins on Facebook in 2022. Write a query that determines the number of reactivated users for a given month. Reactivated users are those who were inactive the previous month but logged in during the current month.

Output the month in numerical format along with the count of reactivated users.

Here's some important assumptions to consider:

The user_logins table only contains data for the year 2022 and there are no missing dates within that period.
For instance, if a user whose first login date is on 3 March 2022, we assume that they had previously logged in during the year 2021. Although the data for their previous logins is not present in the user_logins table, we consider these users as reactivated users.
As of Aug 4th, 2023, we have carefully reviewed the feedback received and made necessary updates to the solution.

## Link

https://datalemur.com/questions/reactivated-users

## Approach

1. Convert Login Dates into Monthly Records

The login table may contain multiple login records for the same user within the same month.

Therefore, the first step is to consider only one record per user per month. This prevents multiple logins within the same month from being incorrectly interpreted as periods of inactivity and reactivation.

2. Find the Previous Login Month

For each user, arrange their monthly login records chronologically and identify the month in which they previously logged in.

This allows us to compare the user's current login month with their previous active month.

3. Identify Reactivated Users

A user is considered reactivated when:

There is no previous login month in the available data. This represents the user's first login in 2022, which is assumed to follow activity in 2021.
There is a gap of more than one month between the previous login month and the current login month.

If the previous and current months are consecutive, the user was continuously active and should not be counted as reactivated.

4. Compare Actual Months

Instead of comparing only numerical month values such as 12 and 1, compare complete month values.

This is important because December and January are consecutive months even though their numerical values are 12 and 1.

Using complete month values also makes the solution work correctly across year boundaries.

5. Count Reactivated Users

After identifying the reactivation events, group them by month and count the distinct users who became active again during each month.

## SQL Concepts Used
- CTEs (WITH) — Break the query into logical steps.
- DISTINCT — Remove duplicate user-month combinations.
- DATE_TRUNC() — Convert login dates to month-level dates.
- LAG() — Retrieve the previous login month for each user.
- Window Functions — Compare a user's current activity with their previous activity.
- INTERVAL — Compare month-to-month differences correctly.
- COUNT(DISTINCT) — Count unique reactivated users.
- GROUP BY — Aggregate users by month.
- ORDER BY — Arrange the output chronologically.
