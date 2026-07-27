with yearly_spend AS
(
  select 
    extract(year from transaction_date) as year ,
    product_id ,
    sum(spend) as curr_year_spend 
  from user_transactions
  group by product_id , year
),
prev_curr_spend AS
(
  SELECT
    year ,
    product_id ,
    curr_year_spend ,
    lag(curr_year_spend) 
      over(partition by product_id 
          order by year
        ) as prev_year_spend
    FROM
      yearly_spend
)
SELECT
  year ,
  product_id ,
  curr_year_spend ,
  prev_year_spend ,
  round(
    100.0 * (curr_year_spend - prev_year_spend)/prev_year_spend
    , 2
  ) as yoy_spend
FROM
  prev_curr_spend
order by product_id , year
  
