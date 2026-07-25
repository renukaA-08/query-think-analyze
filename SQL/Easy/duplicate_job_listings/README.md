## Problem

Assume you're given a table containing job postings from various companies on the LinkedIn platform. Write a query to retrieve the count of companies that have posted duplicate job listings.

Definition:

Duplicate job listings are defined as two job listings within the same company that share identical titles and descriptions.

## Link

https://datalemur.com/questions/duplicate-job-listings

## Approach 

- Group the table by company_id, title, and description to identify identical job listings within each company.
- Use HAVING COUNT(*) > 1 to keep only duplicate job listings.
- Select DISTINCT company_id so each company is counted only once.
- Finally, use COUNT(*) in the outer query to return the total number of companies that have at least one duplicate job listing.

## SQL topics 

- `distinct`
- subquery
- `group by `
- `having`
- Aggregation function `count()`
