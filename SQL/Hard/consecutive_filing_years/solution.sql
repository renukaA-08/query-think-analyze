with cte as (
  select 
    user_id ,
    extract(year from filing_date ) as yr 
  from
    filed_taxes
  where lower(product) like 'turbotax%'
)
select
  distinct user_id 
FROM
(
  select 
    user_id ,
    yr as curr_yr ,
    lag(yr) over(partition by user_id order by yr) as prev_yr ,
    lead(yr) over(partition by user_id order by yr) as nxt_yr 
  FROM
    cte
)t
where 
  curr_yr = prev_yr +1 
  and curr_yr = nxt_yr -1
order by user_id 
