USE music_analysis;

-- view data
SELECT*FROM music_preferences_dataset;


 -- Calculating popularity of a genre in percentage
SELECT `Favorite Music Genre` AS Genre,
  count(*) AS NumPeople,
  -- count(*) goes through dataset and counts how many times a genre was picked
  Round((COUNT(*)*100.0)/(SELECT COUNT(*) FROM music_preferences_dataset), 2) AS Percentage
  /*subquery 'select count(*) counts the total number of rows.
  so it does total number of time genre was picked/row times 100*/
  
  FROM music_preferences_dataset
  GROUP BY `Favorite Music Genre`
  ORDER BY Percentage DESC;

SELECT 
 `Favorite Music Genre` AS Genre,
 `Age` AS Age,
  COUNT(*) AS Listeners,
  ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY age), 2) AS genre_percent
FROM music_preferences_dataset
GROUP BY `age`, `Favorite Music Genre`
ORDER BY age, genre_percent DESC;

SELECT 
 `Favorite Music Genre` AS Genre,
 `Gender` AS Gender,
  COUNT(*) AS genre_count,
  ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY Gender), 2) AS genre_percent
FROM music_preferences_dataset
GROUP BY `Gender`, `Favorite Music Genre`
ORDER BY Gender, genre_percent DESC;





