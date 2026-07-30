with cte as 
(
  select 
    measurement_value ,
    measurement_time ,
    row_number() 
      over(
        partition by date_trunc('day',measurement_time)
        order by measurement_time
        ) as rn
  from measurements
  )
select 
 date_trunc('day',measurement_time) as measurement_day ,
  round(
    sum(
    case 
    when rn % 2 = 1 then measurement_value
    end
    ),
    2) as odd_sum ,
  round(sum(
    case 
    when rn % 2 = 0 then measurement_value
    end),2) as even_sum 
  from cte
  group by date_trunc('day',measurement_time)
  order by date_trunc('day',measurement_time)
    
