with cte as (
    select 
      user_id ,
      count(prompt) as prompt_count ,
      round(avg(tokens),2) as avg_tokens 
    from
        prompts 
    group by user_id
    having prompt_count >=3 )
select *
from cte c
where exists 
    (select 
        p.user_id 
    from prompts p 
    where p.user_id = c.user_id 
        and p.tokens > c.avg_tokens)
order by avg_tokens desc , user_id asc
