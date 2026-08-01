## Problem

Write a solution to find the nth highest distinct salary from the Employee table. If there are less than n distinct salaries, return null.

## Link

https://leetcode.com/problems/nth-highest-salary

## Approach

1. Convert `N` from **1-based indexing** to **0-based indexing** by subtracting `1`.
   - The `OFFSET` clause starts counting from `0`.
   - For example:
     - 1st highest salary → `OFFSET 0`
     - 2nd highest salary → `OFFSET 1`
     - 3rd highest salary → `OFFSET 2`

2. Select only **distinct salaries** to ensure duplicate salary values are counted only once.

3. Sort the salaries in **descending order** so that the highest salary appears first.

4. Use:
   - `LIMIT 1` to return exactly one salary.
   - `OFFSET N` to skip the first `N` distinct salaries and retrieve the desired one.

5. If the requested offset exceeds the number of distinct salaries, MySQL automatically returns `NULL`, satisfying the problem requirement.

## SQL Concepts Used

- **CREATE FUNCTION** – Defines a reusable SQL function.
- **DISTINCT** – Removes duplicate salary values.
- **ORDER BY DESC** – Sorts salaries from highest to lowest.
- **LIMIT** – Restricts the result to one row.
- **OFFSET** – Skips a specified number of rows before returning the result.
