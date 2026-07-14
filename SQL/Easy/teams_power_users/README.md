## Teams Power Users

## Problem

Write a query to identify the top 2 Power Users who sent the highest number of messages on Microsoft Teams in August 2022. Display the IDs of these 2 users along with the total number of messages they sent. Output the results in descending order based on the count of the messages.

Assumption:

No two users have sent the same number of messages in August 2022.

## Link

https://datalemur.com/questions/teams-power-users

## Approach

To solve this problem, I first filtered the records to include only the messages sent during **August 2022** using the `WHERE` clause.

After filtering, I used `GROUP BY sender_id` to group all messages by each sender and `COUNT(*)` to calculate the total number of messages sent by each user.

Then, I sorted the results in descending order of `message_count` using `ORDER BY` so that the users with the highest number of messages appear first.

Finally, I used `LIMIT 2` to return only the top two users who sent the most messages during August 2022.

### SQL Concepts Used
- `WHERE`
- `GROUP BY`
- `COUNT()`
- `ORDER BY`
- `LIMIT`
