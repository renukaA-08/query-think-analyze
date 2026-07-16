select 
    p1.product_id as product1_id ,
    p2.product_id as product2_id ,
    i1.category as product1_category ,
    i2.category as product2_category ,
    count(*) as customer_count 
from 
    ProductPurchases p1 
    join ProductPurchases p2
        on p1.product_id < p2.product_id
        and p1.user_id = p2.user_id
    join ProductInfo i1 
        on p1.product_id = i1.product_id
    join ProductInfo i2
        on p2.product_id = i2.product_id
group by 
    p1.product_id , 
    p2.product_id ,
    i1.category ,
    i2.category
    having customer_count >= 3
order by 
    customer_count desc , 
    product1_id asc , 
    product2_id asc

