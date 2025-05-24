-- queries.sql
-- Complete each mission by writing your SQL query below the instructions.
-- Don't forget to end each query with a semicolon ;

SELECT
    reg.name AS region_name,
    reg.country,
    COUNT(DISTINCT obs.species_id) AS total_species
FROM regions reg
JOIN observations obs ON reg.id = obs.region_id
GROUP BY reg.id, reg.name, reg.country
ORDER BY total_species DESC;

SELECT
    strftime('%m', observation_date) AS mes,
    COUNT(observation_date) cantidad_observación
FROM observations
GROUP BY mes
ORDER BY cantidad_observación DESC;

SELECT
    obs.species_id,
    sp.scientific_name,
    SUM(obs.count) AS total_individuos
FROM observations obs
JOIN species sp ON obs.species_id = sp.id
GROUP BY obs.species_id, sp.scientific_name
HAVING total_individuos < 5
ORDER BY total_individuos ASC;

SELECT
    reg.name AS region_name,
    reg.country,
        COUNT(DISTINCT obs.species_id) AS total_species
FROM regions reg
JOIN observations obs ON reg.id = obs.region_id
GROUP BY reg.id, reg.name, reg.country
ORDER BY total_species DESC
LIMIT 1;

SELECT 
    obs.species_id,
    sp.common_name,
        SUM(obs.count) AS total_observación
    FROM observations obs
JOIN species sp ON obs.species_id = sp.id
GROUP BY obs.species_id, sp.common_name
ORDER BY total_observación DESC;

SELECT
    observer,
    COUNT(*) AS total_registros
FROM observations
GROUP BY observer
ORDER BY total_registros DESC;

SELECT
    sp.id,
    sp.common_name,
    sp.scientific_name
FROM species sp
LEFT JOIN observations obs ON sp.id = obs.species_id
WHERE obs.species_id IS NULL;

SELECT
    observation_date,
    COUNT(DISTINCT species_id) AS especies_distintas
FROM observations
GROUP BY observation_date
ORDER BY especies_distintas DESC;
