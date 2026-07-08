## Problem
Write a solution to identify zombie sessions, sessions where users appear active but show abnormal behavior patterns. A session is considered a zombie session if it meets ALL the following criteria:

The session duration is more than 30 minutes.
Has at least 5 scroll events.
The click-to-scroll ratio is less than 0.20 .
No purchases were made during the session.
Return the result table ordered by scroll_count in descending order, then by session_id in ascending order.

# Link
https://leetcode.com/problems/find-zombie-sessions/
---

## Approach

I solved this problem by grouping all events belonging to the same session and user. After grouping, I calculated all the required metrics using aggregate functions.

### Steps:
1. Group the records by **session_id** and **user_id**.
2. Find the session duration using the earliest and latest event timestamps with `TIMESTAMPDIFF()`.
3. Count the number of scroll events using a conditional `SUM()`.
4. Calculate the click-to-scroll ratio using conditional aggregation.
5. Ensure that there are no purchase events in the session.
6. Filter the required sessions using the `HAVING` clause.
7. Sort the final output based on scroll count (descending) and session ID (ascending).

---

## SQL Concepts Used

- `GROUP BY`
- `MIN()`
- `MAX()`
- `TIMESTAMPDIFF()`
- Conditional aggregation using `SUM(condition)`
- `HAVING`
- `ORDER BY`

---
