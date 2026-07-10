# Problem
Write a solution to report the IDs of all the employees with missing information. The information of an employee is missing if:

The employee's name is missing, or
The employee's salary is missing.
Return the result table ordered by employee_id in ascending order.

# Link
https://leetcode.com/problems/employees-with-missing-information/

# Approach

In this solution, I used both LEFT JOIN and RIGHT JOIN to identify employee IDs with missing information.

> First, I performed a LEFT JOIN from the Employees table to the Salaries table to find employees who do not have a corresponding salary record.
> Next, I performed a RIGHT JOIN to find salary records that do not have a corresponding employee record.
> I combined both result sets using UNION ALL since the two sets are mutually exclusive and do not contain duplicate employee IDs.
> Finally, I sorted the output by employee_id in ascending order.
