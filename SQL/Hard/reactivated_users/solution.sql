with users AS
(
  select 
    distinct user_id ,
    date_trunc( 'month' , login_date) as login_date
  from
    user_logins
) ,
prev_curr as (
  select 
    user_id ,
    login_date as curr_mnth ,
    lag(login_date) over(partition by user_id order by login_date) as prev_mnth 
  FROM
    users
) 
select
  extract(month from curr_mnth) as mth ,
  count(user_id) as reactivated_users 
from
  prev_curr
where prev_mnth is null or curr_mnth > prev_mnth + INTERVAL '1 month'
group by curr_mnth
order by mth
