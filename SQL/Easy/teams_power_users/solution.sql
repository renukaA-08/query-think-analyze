select 
  sender_id ,
  count(*) as message_count
from messages
where sent_date >= '2022-08-01' 
  and sent_date < '2022-09-01'
group by sender_id 
order by message_count desc 
limit 2;
