# Problem 
Write a solution to calculate the total time in minutes spent by each employee on each day at the office. Note that within one day, an employee can enter and leave more than once. The time spent in the office for a single entry is out_time - in_time.

Return the result table in any order.

# Link

https://leetcode.com/problems/find-total-time-spent-by-each-employee/

# Intuition

My first approach was to calculate the time spent in a subquery by creating a new column (`time_spent = out_time - in_time`). Then, in the outer query, I planned to group the records by `event_day` and `emp_id` and sum the `time_spent` values.

After thinking about it, I realized the subquery was unnecessary because the calculation could be done directly inside the `SUM()` function. This made the query shorter and easier to read without changing the result.

# Approach

* Group the records by `event_day` and `emp_id` so that each group represents one employee's work time for a particular day.
* Calculate the duration of each work session using `out_time - in_time`.
* Use the `SUM()` aggregate function to add the durations of all sessions for the same employee on the same day.
* Return the day, employee ID, and the total time spent.

# Complexity

* **Time Complexity:** `O(n)` – Each row is processed once during aggregation.
* **Space Complexity:** `O(1)` (excluding the space used internally by the database for grouping).
