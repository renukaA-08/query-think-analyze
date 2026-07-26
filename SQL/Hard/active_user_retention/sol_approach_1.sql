select 
  month(u1.event_date) as month ,
  count(distinct u1.user_id) as monthly_active_users
from user_actions u1 
join user_actions u2
  on u1.user_id = u2.user_id 
where 
  month(u1.event_date) = 7
  and month(u2.event_date) = 6
  and year(u1.event_date) = 2022
  and year(u2.event_date) = 2022
  and u2.event_type in ("sign-in", "like", "comment")
group by month ;
