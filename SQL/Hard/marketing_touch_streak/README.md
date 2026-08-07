## Problem

As a Data Analyst on Snowflake's Marketing Analytics team, your objective is to analyze customer relationship management (CRM) data and identify contacts that satisfy two conditions:

Contacts who had a marketing touch for three or more consecutive weeks.
Contacts who had at least one marketing touch of the type 'trial_request'.
Marketing touches, also known as touch points, represent the interactions or points of contact between a brand and its customers.

Your goal is to generate a list of email addresses for these contacts.

## Link

https://datalemur.com/questions/marketing-touch-streak

## Approach
- Extract the week number from each marketing touch record.
- For every contact, order the marketing touches by week and assign a sequential row number.
- Compute a grouping key by subtracting the row number from the week number. This key remains the same for consecutive weeks, allowing consecutive marketing touches to be grouped together.
- Group the data by contact and the computed grouping key so that each group represents one consecutive streak of weeks.
- Filter the groups to keep only those that contain at least three consecutive weeks and include at least one trial_request marketing touch.
- Retrieve the contact IDs that satisfy these conditions.
- Filter the crm_contacts table using these contact IDs to return the corresponding email addresses.

## Key SQL Concepts Used

- Common Table Expressions (CTEs)
- Window Functions (`ROW_NUMBER()`)
- Gaps and Islands Pattern
- `EXTRACT()`
- Conditional Aggregation
- `GROUP BY`
- `HAVING`
- Subqueries (`IN`)
