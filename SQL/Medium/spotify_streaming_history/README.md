## Problem

You're given two tables containing data on Spotify users' streaming activity: songs_history which has historical streaming data, and songs_weekly which has data from the current week.

Write a query that outputs the user ID, song ID, and cumulative count of song plays up to August 4th, 2022, sorted in descending order.

Assume that there may be new users or songs in the songs_weekly table that are not present in the songs_history table.

Definitions:

song_weeklytable only contains data for the week of August 1st to August 7th, 2022.
songs_history table contains data up to July 31st, 2022. The query should include historical data from this table.

## Link

https://datalemur.com/questions/spotify-streaming-history


## Approach

### Step 1: Aggregate Weekly Plays

Count the number of listens for each `(user_id, song_id)` from the `songs_weekly` table before the cutoff date.

### Step 2: Merge with Historical Data

Combine the aggregated weekly plays with the historical play counts using `UNION ALL`.

`UNION ALL` is used because we want to preserve every record and sum the play counts later.

### Step 3: Calculate Total Plays

Group the combined dataset by `user_id` and `song_id` and calculate the total number of plays using `SUM()`.

## SQL Concepts Used

- Common Table Expressions (CTE)
- `COUNT(*)`
- `SUM()`
- `GROUP BY`
- `UNION ALL`
- Date filtering
- Aggregation
- Sorting with `ORDER BY`
