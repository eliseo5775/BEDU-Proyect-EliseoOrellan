USE MovieRatings;

DESCRIBE Personality;

SELECT * FROM Personality;

SELECT * FROM Ratings;

-- cuales son las personalidades mas comunes?

SELECT assigned_metric ,  count(*)
FROM Personality
group by assigned_metric;

-- cual es perfil con mas openness?
SELECT assigned_metric , avg(openness) as apertura
FROM Personality
group by assigned_metric
ORDER BY apertura DESC;
-- cual es perfil con mas agreebleness?alter
SELECT assigned_metric , avg(agreeableness) as agradable
FROM Personality
group by assigned_metric
ORDER BY agradable DESC;
-- cual es perfil con mas emotional stability?
SELECT assigned_metric , avg(emotional_stability) as Estabilidad
FROM Personality
group by assigned_metric
ORDER BY Estabilidad DESC;
-- cual es perfil con mas extraversion?
SELECT assigned_metric , avg(emotional_stability) as Extrovertido
FROM Personality
group by assigned_metric
ORDER BY Extrovertido DESC;

-- que perfiles terminan con "TY"
SELECT distinct assigned_metric
FROM Personality
WHERE assigned_metric LIKE "%TY";

-- Que perfiles no tienen "TY"
SELECT distinct assigned_metric
FROM Personality
WHERE assigned_metric not LIKE "%TY";
-- Que porcentaje del total tienen una metrica de apertura por encima del promedio de apertura

SELECT assigned_metric , COUNT(*)/134 AS "Porcentaje arriba del promedio"
FROM Personality
WHERE openness > (SELECT avg(openness) FROM Personality)
GROUP BY assigned_metric ;

-- Que porcentaje del total tienen una metrica de apertura por encima del promedio de agradable
SELECT assigned_metric , COUNT(*)/134 AS "Porcentaje arriba del promedio"
FROM Personality
WHERE agreeableness > (SELECT avg(agreeableness) FROM Personality)
GROUP BY assigned_metric ;

-- Que porcentaje del total tienen una metrica de apertura por encima del promedio de estabilidad

SELECT assigned_metric , COUNT(*)/134 AS "Porcentaje arriba del promedio"
FROM Personality
WHERE emotional_stability > (SELECT avg(emotional_stability) FROM Personality)
GROUP BY assigned_metric ;