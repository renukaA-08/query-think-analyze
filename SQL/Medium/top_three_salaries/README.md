## Problem

As part of an ongoing analysis of salary distribution within the company, your manager has requested a report identifying high earners in each department. A 'high earner' within a department is defined as an employee with a salary ranking among the top three salaries within that department.

You're tasked with identifying these high earners across all departments. Write a query to display the employee's name along with their department name and salary. In case of duplicates, sort the results of department name in ascending order, then by salary in descending order. If multiple employees have the same salary, then order them alphabetically.

Note: Ensure to utilize the appropriate ranking window function to handle duplicate salaries effectively.

## Link

https://datalemur.com/questions/sql-top-three-salaries

## Approach

The solution uses a **window function** to rank employees based on their salary within each department.

### Step 1: Rank employees

- `DENSE_RANK()` assigns a salary rank for every employee within the same department.
- `PARTITION BY department_id` restarts the ranking for each department.
- `ORDER BY salary DESC` ensures the highest salary gets rank **1**.

### Step 2: Keep only the top 3 salary ranks

The outer query filters the ranked results using:

```sql
WHERE rk < 4
```

This keeps employees whose salary rank is **1, 2, or 3**, including all employees tied at the same salary.

### Step 3: Join with the Department table

The filtered employees are joined with the `department` table to retrieve the corresponding department names.

### Step 4: Sort the output

The final result is ordered by:
- Department name (ascending)
- Salary (descending)
- Employee name (ascending)

---

## Why `DENSE_RANK()`?

`DENSE_RANK()` is used because employees with the same salary should receive the same rank.

Example:

| Employee | Salary | Dense Rank |
|----------|--------:|-----------:|
| Alice    | 9000    | 1 |
| Bob      | 9000    | 1 |
| Carol    | 8500    | 2 |
| David    | 8000    | 3 |
| Eve      | 7500    | 4 |

Filtering `rk < 4` returns Alice, Bob, Carol, and David.

If `ROW_NUMBER()` were used, tied salaries would receive different ranks, causing incorrect results.

## SQL Concepts Used

- `WITH` (Common Table Expression)
- `DENSE_RANK()`
- `OVER()`
- `PARTITION BY`
- `ORDER BY`
- Window Functions
- Derived Table
- `JOIN`
- `WHERE`
