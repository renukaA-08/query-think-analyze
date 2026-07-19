## Problem

Write a solution to find employees who are meeting-heavy - employees who spend more than 50% of their working time in meetings during any given week.

Assume a standard work week is 40 hours
Calculate total meeting hours per employee per week (Monday to Sunday)
An employee is meeting-heavy if their weekly meeting hours > 20 hours (50% of 40 hours)
Count how many weeks each employee was meeting-heavy
Only include employees who were meeting-heavy for at least 2 weeks
Return the result table ordered by the number of meeting-heavy weeks in descending order, then by employee name in ascending order.


## LeetCode Link

https://leetcode.com/problems/find-overbooked-employees/


# Approach

1. First, identified the **start date of each week** using:

   ```sql
   DATE_SUB(meeting_date, INTERVAL WEEKDAY(meeting_date) DAY)
   ```

   This converts every meeting date to the Monday of its corresponding week, allowing all meetings in the same week to be grouped together.

2. I grouped the meetings by `employee_id` and `week_start` to calculate the total meeting duration for each employee in every week.

3. Using the `HAVING` clause, I filtered only those weeks where the total meeting duration was **greater than 20 hours**. These are considered meeting-heavy weeks.

4. I then grouped the filtered result by `employee_id` and counted the number of meeting-heavy weeks for each employee.

5. Using another `HAVING` clause, I kept only employees who had **at least two meeting-heavy weeks**.

6. Finally, I joined the result with the `Employees` table to retrieve the employee name and department, and sorted the output as required.

---

## Why use `DATE_SUB()` with `WEEKDAY()`?

Instead of grouping by week numbers, I used:

```sql
DATE_SUB(meeting_date, INTERVAL WEEKDAY(meeting_date) DAY)
```

This returns the **Monday of the week** for every meeting date.

For example:

| Meeting Date | Week Start |
|--------------|------------|
|2023-06-05 (Mon)|2023-06-05|
|2023-06-06 (Tue)|2023-06-05|
|2023-06-07 (Wed)|2023-06-05|
|2023-06-11 (Sun)|2023-06-05|
|2023-06-12 (Mon)|2023-06-12|

Using the week's start date avoids issues with week numbering across different years and makes the grouping logic easier to understand.

---

## SQL Topics Used

- Nested Subqueries
- INNER JOIN
- Aggregate Functions (`SUM()`, `COUNT()`)
- `GROUP BY`
- `HAVING`
- Date Functions
  - `DATE_SUB()`
  - `WEEKDAY()`
- Result Sorting (`ORDER BY`)
```
