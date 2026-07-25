SELECT
  round(
    count(t.email_id) / (count(e.email_id) * 1.0)
    , 2 ) as confirm_rate
FROM
  emails e left join texts t
  on e.email_id = t.email_id 
    and t.signup_action = 'Confirmed'
  
