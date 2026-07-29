with cte as (
select 
  searches ,
  num_users ,
  sum(num_users) over(order by searches) as cmf ,
  sum(num_users) OVER () as tot_cnt
FROM
  search_frequency
)
SELECT
  ROUND(AVG(searches),1) as median
FROM
  cte
where 
  ((tot_cnt+1)/2 between cmf - num_users +1 and cmf )
  OR
  ((tot_cnt+2)/2 between cmf - num_users +1 and cmf )
