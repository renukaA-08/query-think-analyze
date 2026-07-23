# Course Transition Analysis Among Top Learners

## Problem

Write a solution to identify skill mastery pathways by analyzing course completion sequences among top-performing students:

Consider only top-performing students (those who completed at least 5 courses with an average rating of 4 or higher).
For each top performer, identify the sequence of courses they completed in chronological order.
Find all consecutive course pairs (Course A → Course B) taken by these students.
Return the pair frequency, identifying which course transitions are most common among high achievers.
Return the result table ordered by pair frequency in descending order and then by first course name and second course name in ascending order.

## Link

https://leetcode.com/problems/most-common-course-pairs/

## Approach 1: ROW_NUMBER() + Self Join

### Explanation

1. Create a CTE (`toppers`) to identify users whose average course rating is at least **4** and who have completed **5 or more courses**.
2. Assign a sequence number to each completed course for every qualified user using `ROW_NUMBER()` ordered by completion date.
3. Self join the numbered courses table by matching:
   - the same user
   - consecutive row numbers (`rn = rn + 1`)
4. This forms consecutive course pairs.
5. Group by the course pairs and count their occurrences.
6. Sort the result according to the required order.

### Complexity

- Time Complexity: **O(N log N)**
- Space Complexity: **O(N)**

---

## Approach 2: LEAD() Window Function (Optimized)

### Explanation

1. Identify the top learners using the same filtering criteria.
2. Use the `LEAD()` window function to directly obtain the next course completed by each user.
3. Every row represents one transition:
   - Current course → Next course
4. Ignore rows where there is no next course (`NULL`).
5. Group by the course pairs to count transition frequencies.
6. Sort according to the required order.

### Complexity

- Time Complexity: **O(N log N)**
- Space Complexity: **O(N)**

---

## Difference Between Both Approaches

### Approach 1

- Uses `ROW_NUMBER()` to assign an order to every course.
- Requires a self join to pair consecutive courses.
- More verbose and involves an additional join.

### Approach 2

- Uses `LEAD()` to directly access the next course.
- Eliminates the need for a self join.
- Simpler, cleaner, and easier to understand.
- Generally the preferred solution when window functions are available.

---

## Key SQL Concepts Used

- Common Table Expressions (CTEs)
- Aggregate Functions (`AVG()`, `COUNT()`)
- `HAVING`
- `ROW_NUMBER()`
- `LEAD()`
- Self Join
- Window Functions
- `GROUP BY`
- `ORDER BY`

---

## Learning Outcome

This problem demonstrates two different ways to solve consecutive row problems:

- Assigning sequence numbers and performing a self join.
- Using the `LEAD()` window function to directly access the next row.

Among the two, the **LEAD()** approach is more concise and avoids the additional self join, making it the preferred solution .
