select
    month(curr_mnth.event_date) as month,
    count(distinct curr_mnth.user_id) as monthly_active_users
from user_actions as curr_mnth
where 
  exists 
(
  select 
  prev_mnth.user_id 
  from
  user_actions as prev_mnth
  where curr_mnth.user_id = prev_mnth.user_id
        and month(prev_mnth.event_date) = month(date_sub(curr_mnth.event_date , interval 1 month))
        and year(prev_mnth.event_date) = year(curr_mnth.event_date)
)
  and month(curr_mnth.event_date) = 7 
  and year(curr_mnth.event_date) = 2022
group by month ;
