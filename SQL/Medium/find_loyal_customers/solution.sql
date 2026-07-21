select customer_id 
from customer_transactions
group by customer_id
having 
    sum(transaction_type='purchase') >= 3
    and datediff(max(transaction_date),min(transaction_date)) >= 30
    and avg(transaction_type='refund') < 0.2
order by customer_id asc
