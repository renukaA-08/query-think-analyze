with high_low_open as (
  select 
    ticker ,
    max(open) as highest_open	,
    min(open) as lowest_open 
  from
    stock_prices
  group by ticker
),
highest_mnth as(
  select 
    s.ticker ,
    to_char(date , 'Mon-YYYY') as highest_mth
  from
    stock_prices s join high_low_open lh 
    on s.ticker = lh.ticker 
    and s.open = lh.highest_open
),
lowest_mnth as(
  select 
    s.ticker ,
    to_char(date , 'Mon-YYYY') as lowest_mth
  from
    stock_prices s join high_low_open lh 
    on s.ticker = lh.ticker
    and s.open = lh.lowest_open
)
select 
  lh.ticker ,
  h.highest_mth ,
  lh.highest_open ,
  l.lowest_mth ,
  lh.lowest_open
from
  high_low_open lh join lowest_mnth l 
  on lh.ticker = l.ticker
  join highest_mnth h 
  on lh.ticker = h .ticker
order by l.ticker
