# Polarized Book Ratings

## Problem

Write a solution to find books that have polarized opinions - books that receive both very high ratings and very low ratings from different readers.

A book has polarized opinions if it has at least one rating ≥ 4 and at least one rating ≤ 2
Only consider books that have at least 5 reading sessions
Calculate the rating spread as (highest_rating - lowest_rating)
Calculate the polarization score as the number of extreme ratings (ratings ≤ 2 or ≥ 4) divided by total sessions
Only include books where polarization score ≥ 0.6 (at least 60% extreme ratings)
Return the result table ordered by polarization score in descending order, then by title in descending order.
The polarization score should be rounded to 2 decimal places.

## LeetCode Link

https://leetcode.com/problems/find-books-with-polarized-opinions/

# Approach

1. Joined the `Reading_Sessions` and `Books` tables using `book_id` to retrieve the book details along with the session ratings.

2. Grouped the records by the book information so that all reading sessions of the same book were processed together.

3. Calculated the required values for each book:
   - **Rating Spread** using:
     - `MAX(session_rating) - MIN(session_rating)`
   - **Polarization Score** using:
     - `SUM(session_rating != 3) / COUNT(*)`
     - Here, the expression `session_rating != 3` evaluates to `1` for ratings other than 3 and `0` otherwise. Summing these values gives the number of ratings that are not equal to 3.

4. Used the `HAVING` clause to filter only those books that satisfy all the required conditions:
   - Maximum rating is at least 4.
   - Minimum rating is at most 2.
   - The book has at least 5 reading sessions.
   - The polarization score is at least 0.60.

5. Finally, sorted the result by polarization score in descending order and book title in descending order.


## SQL Topics Used

- INNER JOIN
- Aggregate Functions
  - `MAX()`
  - `MIN()`
  - `SUM()`
  - `COUNT()`
  - `ROUND()`
- `GROUP BY`
- `HAVING`
- Boolean Expressions in SQL (`session_rating != 3`)
- Arithmetic Operations
- Result Sorting (`ORDER BY`)
