## Problem

Assume you're given a table containing information on Facebook user actions. Write a query to obtain number of monthly active users (MAUs) in July 2022, including the month in numerical format "1, 2, 3".

Hint:

An active user is defined as a user who has performed actions such as 'sign-in', 'like', or 'comment' in both the current month and the previous month.


Return:
- `month`
- `monthly_active_users`

## Link

https://datalemur.com/questions/user-retention

# Approach 1: Self Join

- Create two instances of the `user_actions` table using a self join.
- The first table (`u1`) represents user activities in **July 2022**.
- The second table (`u2`) represents user activities in **June 2022**.
- Join both tables using `user_id` to find users who were active in both months.
- Use `COUNT(DISTINCT user_id)` to ensure each user is counted only once.

### SQL Concepts Used

- Self Join
- `COUNT(DISTINCT)`
- `GROUP BY`
- `MONTH()`
- `YEAR()`

### Key Learning

- Self joins are useful for comparing rows within the same table.
- Since a user may have multiple activities in both months, duplicate rows can be produced after the join.
- `COUNT(DISTINCT)` removes these duplicates before counting users.

---

# Approach 2: EXISTS (Correlated Subquery)

- Select all user activities from **July 2022**.
- For each July activity, the correlated subquery searches for the same user's activity in the previous month.
- `EXISTS` returns `TRUE` as soon as it finds the first matching record.
- Only users with activity in both months are included.
- `COUNT(DISTINCT user_id)` ensures each active user is counted once.

### SQL Concepts Used

- `EXISTS`
- Correlated Subquery
- `COUNT(DISTINCT)`
- `DATE_SUB()`
- `MONTH()`
- `YEAR()`

### Key Learning

- `EXISTS` is ideal when you only need to check whether a matching row exists.
- Unlike a self join, it does not create unnecessary intermediate rows.
- The database stops searching after the first successful match, making it more efficient for existence checks.
- This approach is generally preferred for large datasets.


# Comparison

| Self Join                                         | EXISTS                                    |
|---------------------------------------------------|-------------------------------------------|
| Joins the table with itself                       | Checks only whether a matching row exists |
| Can generate duplicate rows                       | Stops after the first matching row        |
| Requires `COUNT(DISTINCT)` to remove duplicates   | Naturally suited for existence checks     |
| May use more memory due to the join result        | Usually more memory efficient             |
| Good for retrieving data from both tables         | Best when only checking if a match exists |

## Overall Recommendation

- Use **Self Join** when you need columns from both table instances.
- Use **EXISTS** when you only need to verify the presence of a matching record. It is typically cleaner and more efficient.
