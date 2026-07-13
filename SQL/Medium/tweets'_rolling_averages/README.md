# 3-Day Rolling Average of Tweets

# Problem 
Given a table of tweet data over a specified time period, calculate the 3-day rolling average of tweets for each user. Output the user ID, tweet date, and rolling averages rounded to 2 decimal places.

Notes:

A rolling average, also known as a moving average or running mean is a time-series technique that examines trends in data over a specified period of time.
In this case, we want to determine how the tweet count for each user changes over a 3-day period.

# Link 

https://datalemur.com/questions/rolling-average-tweets/

## Approach

For this problem, I used a **window function** to calculate the rolling average.

First, I partitioned the data by `user_id` so that each user's tweets are processed separately. Then I ordered the tweets by `tweet_date` to maintain the correct chronological order.

To calculate the 3-day rolling average, I used:

```sql
ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
```

This creates a window containing the current row and the previous two rows. For the first and second tweet of a user, the window automatically includes only the available rows.

Finally, I used the `ROUND()` function to round the average to 2 decimal places as required.

## SQL Concepts Used

- Window Functions (`AVG() OVER`)
- `PARTITION BY`
- `ORDER BY`
- `ROWS BETWEEN ... PRECEDING AND CURRENT ROW`
- `ROUND()`
