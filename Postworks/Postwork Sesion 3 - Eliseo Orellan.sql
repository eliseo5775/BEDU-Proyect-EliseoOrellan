USE MovieRatings;

DESCRIBE Personality;

SELECT * FROM Personality;

SELECT * FROM Ratings;

-- 1 cuantos usuarios diferentes hay en la bbdd de ratings

select distinct userid from Ratings;

-- 2 cuantos raitings reales de los estudios de personalidad se tienen

select distinct Ratings.userid from Ratings
right join Personality
on Personality.userid = Ratings.userid
;

-- 3 cuantas calificaciones de la primera prediccion fueron evaluadas

select distinct p.movie_1 as Movie_ID , p.predicted_rating_1 as Predicted_Rating, r.rating as Actual_Rating from Personality p
inner join Ratings r
on r.userid = p.userid
;

-- 4 cual fue el promedio de las predicción vs la calificación actual de cada pelicula

select p.movie_1 as Movie_ID , round(avg( p.predicted_rating_1),2) as Predicted_Rating, round(avg(r.rating),2) as Actual_Rating from Personality p
inner join Ratings r
on r.userid = p.userid
group by p.movie_1
order by Actual_Rating desc
;

-- 5 cual fue el promedio de las predicción vs la calificación actual del total del algoritmo

select round(avg( p.predicted_rating_1),2) as Predicted_Rating, round(avg(r.rating),2) as Actual_Rating from Personality p
inner join Ratings r
on r.userid = p.userid
;