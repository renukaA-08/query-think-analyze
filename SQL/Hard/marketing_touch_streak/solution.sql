with weekly AS
(
  select 
    distinct 
    contact_id ,
    event_type , 
    extract(week from event_date) as week
  from marketing_touches 
),
cte AS
(
  select 
    contact_id 
  from
    (select 
       contact_id ,
       event_type ,
       week - row_number() over(partition by contact_id order by week) as  grp
      from 
       weekly
    )t
  group by contact_id , grp 
    having sum(case when event_type = 'trial_request' then 1 else 0 end) > 0
      and count(*) >= 3
)
SELECT
  email
from 
crm_contacts
where contact_id in (select contact_id from cte)
