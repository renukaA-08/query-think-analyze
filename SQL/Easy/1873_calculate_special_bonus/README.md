# Problem
Write a solution to calculate the bonus of each employee. The bonus of an employee is 100% of their salary if the ID of the employee is an odd number and the employee's name does not start with the character 'M'. The bonus of an employee is 0 otherwise.

Return the result table ordered by employee_id.

# Link
https://leetcode.com/problems/calculate-special-bonus/

# Approach
In this solution, I used a CASE statement to determine the bonus for each employee based on the given conditions.

If the employee_id is odd and the employee's name does not start with 'M', then the employee receives a bonus equal to their salary.
Otherwise, the bonus is set to 0.

Finally, I sorted the result by employee_id in ascending order as required.

