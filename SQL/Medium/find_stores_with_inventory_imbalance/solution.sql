with ranked as
(
    select * from
    (
        select 
            store_id ,
            product_name ,
            quantity ,
            count(*) over(partition by store_id) as cnt ,
            row_number() over(partition by store_id order by price desc) as high ,
            row_number() over(partition by store_id order by price ) as low
        from 
            inventory
    )t
    where cnt >=3
)
select
    m.store_id ,
    s.store_name ,
    s.location,
    m.product_name as most_exp_product ,
    c.product_name as cheapest_product ,
    round
      (
        c.quantity / m.quantity   
        , 2
      ) as imbalance_ratio
from
    ranked m 
    join ranked c
        on m.store_id = c.store_id 
        and m.high = 1
        and c.low = 1
        and m.quantity < c.quantity 
    join
        stores s
        on m.store_id = s.store_id
order by imbalance_ratio desc , s.store_name asc

