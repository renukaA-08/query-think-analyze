select 
  coalesce(a.user_id,p.user_id) as user_id  ,
  case
    when p.paid is null then 'CHURN'
    when a.status is null then 'NEW'
    when a.status ='CHURN' then 'RESURRECT'
    else 'EXISTING'
    end as new_status
FROM
  advertiser a full outer join daily_pay p
  on a.user_id = p.user_id
order by user_id
