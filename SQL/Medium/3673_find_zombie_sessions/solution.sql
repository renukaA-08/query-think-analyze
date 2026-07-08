select 
    session_id ,
    user_id ,
    timestampdiff(minute , min(event_timestamp), max(event_timestamp)) as session_duration_minutes ,
    sum(event_type='scroll') as scroll_count 
from
    app_events 
group by session_id , user_id 
having scroll_count >=5 and
    session_duration_minutes > 30
    and (sum(event_type = 'click')/sum(event_type = 'scroll')) < 0.20
    and sum(event_type = 'purchase') = 0 
order by scroll_count DESC , session_id asc
