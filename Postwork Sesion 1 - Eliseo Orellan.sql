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
