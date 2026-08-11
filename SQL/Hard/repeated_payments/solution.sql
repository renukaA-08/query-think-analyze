with accidental_transactions AS
(
  select 
    merchant_id ,
    credit_card_id ,
    amount ,
    transaction_timestamp  -
      lag(transaction_timestamp) 
        over(partition by merchant_id , credit_card_id , amount order by transaction_timestamp) as time_diff
  FROM
    transactions
) 
select
  count(*) as cnt 
from
    accidental_transactions
where time_diff <= interval '10 MINUTE'
 
