-- 1.	¿Cuántos usuarios se tiene registrados en Personalities con un Assigned Metric de Popularity? 
SELECT count(*) from Personality
WHERE assigned_metric = "popularity"; 

-- 2.	¿Cuántos usuarios se tiene registrados  en Personalities con un Assigned Metric de Serendepity? 
SELECT count(*) from Personality
WHERE assigned_metric = "serendipity"; 

-- 3.	¿Qué películas recibieron Ratings de “4 y 5”?
SELECT movie_id from Ratings
where rating IN (4,5);

-- 4.	¿Qué películas recibieron Ratings de “entre 0.5 y 2”?
SELECT movie_id from Ratings
where rating BETWEEN 0.5 AND 2;
-- 5.	¿Qué usuarios tienen una con un Assigned Metric de Popularity  , grado de Assigned Condition : Alto?
SELECT userid from Personality
WHERE assigned_metric = "popularity" AND assigned_condition = "high"; 
-- 6.	¿Qué usuarios tienen una con un Assigned Metric de Serendepity  , grado de Assigned Condition : Bajo?
SELECT userid from Personality
WHERE assigned_metric = "serendipity" AND assigned_condition = "low"; 
-- 7.	¿Qué usuarios tienen un Assigned Metric de Diversity , un  grado de Assigned Condition : Medio y opinan que la lista de películas fue personalizada para ellos entre 4 y 5?
SELECT userid, assigned_metric, assigned_condition , is_personalized from Personality
WHERE assigned_metric = "diversity" AND assigned_condition = "medium" AND is_personalized BETWEEN 4 and 5 ; 
-- 8.	¿Qué usuarios tienen un Assigned Metric de Serendepity , un  grado de Assigned Condition : Medio y opinan que la lista de películas fue personalizada para ellos?
SELECT userid, assigned_metric, assigned_condition , is_personalized from Personality
WHERE assigned_metric = "serendipity" AND assigned_condition = "medium" AND is_personalized BETWEEN 1 and 2 ; 



-- 9.	¿Cual es Assigned Metric con mayor nivel de Openness en promedio?
SELECT assigned_metric , avg(openness) as openness from Personality
group by assigned_metric
order by openness desc
limit 1;

-- 10.	¿Cual es Assigned Metric con mayor nivel de Emotional Stability en promedio?
SELECT assigned_metric , avg(emotional_stability) as emotional_stability from Personality
group by assigned_metric
order by emotional_stability desc
limit 1;
-- 11.	¿Cual es Assigned Metric con mayor nivel de extroversion en promedio?
SELECT assigned_metric , avg(extraversion) as extraversion from Personality
group by assigned_metric
order by extraversion desc
limit 1;
-- 12.	¿Cuál es Assigned Metric más común?
SELECT assigned_metric, count(*) as no_de_usuarios from Personality
group by assigned_metric
order by no_de_usuarios desc
limit 1;
-- 13.	¿Cuál es Assigned Metric menos común?
SELECT assigned_metric, count(*) as no_de_usuarios from Personality
group by assigned_metric
order by no_de_usuarios asc
limit 1;
-- 14.	¿Cuál es Assigned Metric por cada tipo y el promedio de que tanto disfrutaron la lista de peliculas?
SELECT assigned_metric, count(*) as no_de_usuarios , avg(enjoy_watching)  from Personality
group by assigned_metric
order by no_de_usuarios desc;
-- 15.	15.	¿Cuál fue el promedio de “Rating” de cada “Assigned Metric” agrupados por su “Assigned Metric”, adicional mostrar el promedio del grado Linkert de si pensaron que la lista fue personalizada y el promedio de que tanto disfrutaron la lista de películas
SELECT  p.assigned_metric, avg(p.rating), avg(p.is_personalized) , avg(p.enjoy_watching)
from (select p.assigned_metric , p.assigned_condition ,  r.rating , p.is_personalized , p.enjoy_watching from Personality p 
join Ratings r
on p.userid = r.userid ) as p
group by p.assigned_metric ;

-- Vistas 

CREATE VIEW Rating_por_metrica_asignada AS
SELECT  p.assigned_metric, avg(p.rating), avg(p.is_personalized) , avg(p.enjoy_watching)
from (select p.assigned_metric , p.assigned_condition ,  r.rating , p.is_personalized , p.enjoy_watching from Personality p 
join Ratings r
on p.userid = r.userid ) as p
group by p.assigned_metric ;
