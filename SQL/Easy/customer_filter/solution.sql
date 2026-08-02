select *
from customers 
WHERE
  (age BETWEEN 18 and 22 ) 
  and state in ( 'Victoria', 'Tasmania', 'Queensland' )
  and gender <> 'n/a'
  and (customer_name like 'A%' or customer_name like 'B%')
