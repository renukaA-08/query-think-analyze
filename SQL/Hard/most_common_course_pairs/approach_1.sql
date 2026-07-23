with toppers as (
    select 
        user_id 
    from course_completions 
    group by user_id
    having avg(course_rating) >= 4
        and count(*) >=5
) ,
courses as
(
    select 
        t.user_id , 
        course_id ,
        course_name ,
        row_number() over(partition by t.user_id order by completion_date) as rn 
    from course_completions c join toppers t
        on t.user_id = c.user_id

), 
course_pairs as (
    select 
        c1.course_name as first_course ,
        c2.course_name as second_course 
    from 
        courses c1 join courses c2 
        on 
            c1.user_id = c2.user_id 
            and c1.course_id != c2.course_id 
            and c1.rn = c2.rn - 1
)
select 
    first_course ,
    second_course ,
    count(*) as transition_count
from course_pairs
group by 
    first_course ,
    second_course 
order by 
    transition_count desc ,
    first_course asc,
    second_course asc 

