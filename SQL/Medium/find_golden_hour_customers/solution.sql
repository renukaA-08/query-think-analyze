select
    customer_id ,
    count(*) as total_orders ,
    round(
        avg(
            case 
            when (hour(order_timestamp) between 11 and 13) 
                or (hour(order_timestamp) between 18 and 20)
            then 1 
            else 0
            end )
            *100
        ) as peak_hour_percentage ,
    round(
        avg(order_rating)
        , 2) as average_rating 
from restaurant_orders
group by customer_id
having
    count(*) >=3 
    and avg(
        case 
        when ((hour(order_timestamp) between 11 and 13) 
            or (hour(order_timestamp) between 18 and 20 ))
        then 1 
        else 0 
        end ) >= 0.6
    and count(order_rating) / count(*) >= 0.5
    and avg(order_rating) >= 4
order by average_rating desc , customer_id desc

