select 
  u.city ,
  count(t.order_id) as total_orders
from
  users u join trades t
  on u.user_id = t.user_id
    and t.status = 'Completed'
group by u.city
order by total_orders desc
limit 3 ;
