/*
/*Approach - 1 */
with performance_reviews as 
(
    select * from 
    (
        select * ,
        row_number() over(partition by employee_id order by review_date desc) as rn 
        from performance_reviews 
    )t
    where rn <= 3
)
select 
    p1.employee_id ,
    e1.name ,
    p1.rating - p3.rating as improvement_score 
from 
    performance_reviews p1 
    join performance_reviews p2
        on p1.review_date > p2.review_date 
        and p1.rating > p2.rating
        and p1.employee_id = p2.employee_id
    join performance_reviews p3
        on p2.review_date > p3.review_date 
        and p2.rating > p3.rating
        and p2.employee_id = p3.employee_id
    join employees e1 
    on e1.employee_id =  p1.employee_id
order by improvement_score desc ,name asc 
*/

/* Approach 2 */
select 
    employee_id ,
    name,
    next - prev as improvement_score
from
(
    select 
        p.employee_id ,
        p.rating ,
        e.name,
        row_number() over(partition by p.employee_id order by p.review_date desc) as rn,
        lag(p.rating) over(partition by p.employee_id order by p.review_date desc) as next ,
        lead(p.rating) over(partition by p.employee_id order by p.review_date desc) as prev
    from performance_reviews p
    join employees e
    on p.employee_id = e.employee_id
) t
where t.rn<=2 and t.rating > prev and t.rating < next
order by improvement_score desc ,name asc 
