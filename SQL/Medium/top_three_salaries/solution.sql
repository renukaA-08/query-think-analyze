with ranked as(
  select
    name ,
    salary ,
    department_id 
  from
  (
    select 
      name ,
      salary ,
      department_id ,
      dense_rank() over(partition by department_id order by salary desc) as rk
    from
    employee
  )t
  where rk<4
)
SELECT
  d.department_name	,
  r.name,
  r.salary
FROM
  ranked r
  join department d
  on r.department_id = d.department_id
order by
  d.department_name asc ,
  r.salary desc ,
  r.name asc
