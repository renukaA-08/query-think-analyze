with total_songs AS
(
  (  select 
      user_id ,
      song_id ,
      count(*) as song_plays 
    FROM
      songs_weekly 
    where listen_time < '08-05-2022'
    group BY
      user_id ,
      song_id 
  )
  union ALL
  (
    select 
      user_id ,
      song_id ,
      song_plays 
    FROM
      songs_history
  )
)
select 
  user_id ,
  song_id ,
  sum(song_plays) as song_plays
FROM
  total_songs
group by 
  user_id ,
  song_id 
order by song_plays desc
  
