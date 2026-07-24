## Problem

Given a table of Facebook posts, for each user who posted at least twice in 2021, write a query to find the number of days between each user’s first post of the year and last post of the year in the year 2021. Output the user and number of the days between each user's first and last post.

## Link

https://datalemur.com/questions/sql-average-post-hiatus-1

## Approach 

The solution first filters the data to include only posts created in **2021**. It then groups the records by `user_id` so that each user's posts are processed together.

For every user:
- `MIN(post_date)` finds the first post date.
- `MAX(post_date)` finds the last post date.
- `DATEDIFF()` calculates the number of days between these two dates.

Finally, the `HAVING` clause ensures that only users with **more than one post** are included in the result.

## SQL topics 

- Aggregation functions (`min()` , `max()` , `count()`)
- Datediff()
- where
- group by
- having

