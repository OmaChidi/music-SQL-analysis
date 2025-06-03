# Music Taste Data Analysis with SQL
This project uses SQL to analyze the most liked music genre in percentage.

#Dataset
-Source[Kaggle Music Dataset}(https://www.kaggle.com/datasets/tenzintsamphel/music-preferences?resource=download)]

#Tools
-MySQL
-MYSQL Workbench
-Vs Code
-Git & Github

#Questions Answered
-What is the Most Popular Music Genre?
-What is the Least Popular Music Genre?



'''sql
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






