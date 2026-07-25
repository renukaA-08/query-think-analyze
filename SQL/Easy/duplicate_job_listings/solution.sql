select 
  count(*) duplicate_companies 
from 
  (
  select 
    distinct company_id 
  from job_listings 
  group by 
    company_id ,	
    title	, 
    description 
  having count(*) > 1
  )t
