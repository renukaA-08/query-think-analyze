select 
  count(distinct policy_holder_id ) as policy_holder_count
from
  (
    select 
      policy_holder_id ,
      call_date as curr_date ,
      lag(call_date) over(partition by policy_holder_id order by call_date) as prev_date
    FROM
      callers
  )t
where curr_date - prev_date <= INTERVAL '7 days'
