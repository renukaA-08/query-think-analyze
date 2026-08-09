with long_calls AS
(
  select 
    extract(year from call_date) as yr ,
    extract(month from call_date) as mth ,
    count(*) as curr_calls ,
    lag(count(*)) over(order by extract(year from call_date) , extract(month from call_date)) 
      as prev_calls
  from 
    callers 
  where call_duration_secs > 300
  group by yr , mth
)
select 
  yr ,
  mth ,
  round(
    100.0 *
    (curr_calls - prev_calls)/prev_calls
    , 1) as long_calls_growth_pct
from
 long_calls
order by yr , mth
