select
    r.book_id ,
    b.title ,              
    b.author ,
    b.genre,
    b.pages ,
    max(r.session_rating) - min(r.session_rating) as rating_spread ,
    round(sum(r.session_rating != 3 ) / count(*) ,2) as polarization_score 
from reading_sessions r
join books b
on r.book_id = b.book_id
group by 
    r.book_id ,
    b.title ,              
    b.author ,
    b.genre,
    b.pages 
having 
    max(r.session_rating) >=4
    and
    min(r.session_rating) <=2
    and 
    count(*) >= 5
    and 
    polarization_score >= 0.6
order by
    polarization_score desc ,
    b.title desc
