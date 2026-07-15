select 
  category ,
  product ,
  total_sum
from 
  (
    select 
      category , 
      product , 
      sum(spend) as total_sum ,
      row_number() over (partition by category order by sum(spend)
       desc ) as rn
    from
      product_spend
    where year(transaction_date) = 2022
    group by category,product
  )t
where rn <=2
order by category , rn 
