SELECT COUNT(*) AS total_vehicles
FROM ev_data;

SELECT ev_category, COUNT(*) AS total
FROM ev_data
GROUP BY ev_category;

SELECT ROUND(AVG(electric_range)::numeric, 2) AS avg_range
FROM ev_data;

SELECT "Make", COUNT(*) AS total
FROM ev_data
GROUP BY "Make"
ORDER BY total DESC
LIMIT 10;

SELECT 
    "Make",
    COUNT(*) AS total,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS market_share
FROM ev_data
GROUP BY "Make"
ORDER BY total DESC
LIMIT 10;

SELECT 
    "Model Year",
    COUNT(*) AS total,
    LAG(COUNT(*)) OVER (ORDER BY "Model Year") AS prev_year,
    ROUND(
        (COUNT(*) - LAG(COUNT(*)) OVER (ORDER BY "Model Year")) * 100.0 
        / LAG(COUNT(*)) OVER (ORDER BY "Model Year"), 
    2) AS yoy_growth
FROM ev_data
GROUP BY "Model Year"
ORDER BY "Model Year";

SELECT 
    "Make",
    ev_category,
    COUNT(*) AS total
FROM ev_data
GROUP BY "Make", ev_category
ORDER BY "Make", total DESC;

SELECT *
FROM (
    SELECT 
        "Make",
        "Model",
        COUNT(*) AS total,
        ROW_NUMBER() OVER (PARTITION BY "Make" ORDER BY COUNT(*) DESC) AS rank
    FROM ev_data
    GROUP BY "Make", "Model"
) sub
WHERE rank <= 3
ORDER BY "Make", rank;

SELECT 
    CASE 
        WHEN electric_range = 0 THEN 'No Range (PHEV/Unknown)'
        WHEN electric_range < 100 THEN 'Low Range'
        WHEN electric_range BETWEEN 100 AND 250 THEN 'Medium Range'
        ELSE 'High Range'
    END AS range_segment,
    COUNT(*) AS total
FROM ev_data
GROUP BY range_segment
ORDER BY total DESC;

SELECT 
    "Model Year",
    ev_category,
    COUNT(*) AS total,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY "Model Year"), 2) AS percentage
FROM ev_data
GROUP BY "Model Year", ev_category
ORDER BY "Model Year", ev_category;