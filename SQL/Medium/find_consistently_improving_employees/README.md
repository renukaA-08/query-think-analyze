# Problem

Write a solution to find employees who have consistently improved their performance over their last three reviews.

An employee must have at least 3 review to be considered
The employee's last 3 reviews must show strictly increasing ratings (each review better than the previous)
Use the most recent 3 reviews based on review_date for each employee
Calculate the improvement score as the difference between the latest rating and the earliest rating among the last 3 reviews
Return the result table ordered by improvement score in descending order, then by name in ascending order.

## LeetCode Link

https://leetcode.com/problems/find-consistently-improving-employees/

---

# Approach 1: Self Join

### Idea

1. Use the `ROW_NUMBER()` window function to rank each employee's reviews in descending order of review date.
2. Keep only the latest **three reviews** (`rn <= 3`).
3. Self join the filtered reviews three times to obtain:
   - Latest review
   - Middle review
   - Oldest review
4. Ensure the ratings are strictly increasing:

```
Latest Rating > Middle Rating > Oldest Rating
```

5. Compute the improvement score as:

```
Latest Rating - Oldest Rating
```

6. Sort the output by:
   - Improvement Score (Descending)
   - Employee Name (Ascending)

- Self Joins : Efficient since each employee contributes at most 3 rows after filtering.

# Approach 2: Using LAG() and LEAD()

### Idea

Instead of joining the table multiple times, use window functions to access adjacent reviews.

1. Join `Employees` and `Performance_Reviews`.
2. Rank reviews using:

```sql
ROW_NUMBER() OVER(
PARTITION BY employee_id
ORDER BY review_date DESC)
```

3. Use:

- `LAG(rating)` → Rating of the newer review.
- `LEAD(rating)` → Rating of the older review.

4. Since reviews are ordered in descending order, only the **middle review** (`rn = 2`) has both adjacent reviews available.

5. Verify:

```
Middle Rating > Oldest Rating
Middle Rating < Latest Rating
```

which guarantees:

```
Latest Rating > Middle Rating > Oldest Rating
```

6. Calculate the improvement score as:

```
Latest Rating - Oldest Rating
```

using

```sql
LAG(rating) - LEAD(rating)
```

7. Order the results by improvement score (descending) and employee name (ascending).

### Why this approach?

- Eliminates multiple self joins.
- Cleaner and easier to understand.
- Makes effective use of window functions.
- Generally considered more optimized and elegant.

---

# SQL Topics Used

- Common Table Expressions (CTE)
- INNER JOIN
- Window Functions
  - `ROW_NUMBER()`
  - `LAG()`
  - `LEAD()`
- `PARTITION BY`
- `ORDER BY`
- Filtering with `WHERE`
- Arithmetic Operations
- Result Sorting (`ORDER BY`)
