select 
    e.employee_id ,
    e.employee_name ,
    e.department ,
    m.meeting_heavy_weeks
from
    (   
        select 
            employee_id ,
            count(*) as meeting_heavy_weeks
        from
            (select 
                employee_id ,
                date_sub(meeting_date , interval weekday(meeting_date) day) as start_date 
            from
                meetings 
            group by employee_id , start_date
            having sum(duration_hours) > 20
            )t
        group by employee_id
        having count(*) >=2 
    )m join employees e
        on e.employee_id = m.employee_id
order by
    meeting_heavy_weeks desc ,
    e.employee_name asc

