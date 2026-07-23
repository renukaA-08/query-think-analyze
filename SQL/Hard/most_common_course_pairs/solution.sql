with toppers as (
    select 
        user_id 
    from course_completions 
    group by user_id
    having avg(course_rating) >= 4
        and count(*) >= 5
) ,
course_pairs as (
    select 
        c.course_name as first_course ,
        lead(c.course_name) over(partition by c.user_id order by completion_date ) as second_course 
    from course_completions c join toppers t
    on t.user_id = c.user_id
)
select 
    first_course ,
    second_course ,
    count(*) as transition_count
from course_pairs
where second_course is not null
group by 
    first_course ,
    second_course 
order by 
    transition_count desc ,
    first_course asc,
    second_course asc

