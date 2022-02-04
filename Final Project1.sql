-- I will now be looking at our datasets, using the codes below.  

SELECT * FROM project.happiness_2019;
SELECT * FROM project.happiness_2020; 

-- As we can see the 2019 table has 9 columns and the 2020 table has 20 rows. We can also see that the primary key is the country name as this is common in both datasets and is unique. 

-- What are the Top 10 Countries with highest happiness scores for 2019 and 2020

SELECT * FROM project.happiness_2019
ORDER BY Score DESC
LIMIT 10;

SELECT * FROM project.happiness_2020
ORDER BY Ladder_score DESC
LIMIT 10;

-- As we can see there doesn't seem to be much of a difference between the countries in the top 10 between 2019 and 2020. Some countries have have dropped out of the top 10 such as Canada dropping to number 11 in the ranks.

-- What  Bottom 10 Countries with lowest happiness scores

SELECT * FROM project.happiness_2019
ORDER BY Score ASC
LIMIT 10;

SELECT * FROM project.happiness_2020
ORDER BY Ladder_score ASC
LIMIT 10;

-- As we can see there appears to be some difference in the positioning of countries, we can also see that India has moved into the top 10 countries with the lowest happiness scores, this is most likely due to how badly India was affected by COVID 19.

-- What is the average Score of each variable by Region 

SELECT Regional_indicator, AVG(Ladder_score) AS 'AvgScore', AVG(Perceptions_of_corruption) AS 'AvgCorruption', AVG(Healthy_life_expectancy) AS 'AvgLifeExpectancy', AVG(Freedom_to_make_life_choices) AS 'AvgLifeChoices',AVG(Generosity) AS 'AvgGenerosity', AVG(Social_support) AS 'AvgSocialSUPPORT'
from project.happiness_2020
GROUP BY Regional_indicator; 

-- As we can see Western Europe appears to be on top in most of the variables which tallies with the majority of countries appearing in the top 10 happines scores being in Western Europe. However North America and ANZ comes up top in the actual average ladder score, which is quite interesting considering and it also comes up top in the variables of Freedom to make life choices and Perceptions of corruption.

-- I will now be looking at the UK to see whether there has been much change between 2019 and 2020

SELECT * FROM  project.happiness_2020
WHERE Country_name = 'United Kingdom'

SELECT * FROM project.happiness_2019
WHERE Country_name = 'United Kingdom'


-- As we can see the UK appears to have moved up in position, however this may be due to 3 countries dropping off because there seems to have been a drop in the scores of soem of the variables such as social support and freedom to make life choices this is again most likely due to Covid and the restrictions placed on citizens.
 

	-- Countries with a score below 3 and countries with a score equal to  7 and above - how does this relate to each region

SELECT Country_name, Ladder_score, Regional_indicator, CASE
WHEN Ladder_score <= 3 THEN 'Lowest Happiness Scores' 
WHEN Ladder_score >= 7 THEN 'Highest Happiness Scores'
ELSE ' Scores in Between' END AS 'Range of Scores' 
FROM project.happiness_2020

-- As we can see the majority of the countries with a score of 7 and above appear to be in Western Europe and North America and ANZ which is consistent with what we have seen above. We can also see that regions such as Sub-Saharan Africa seem to be amongst the lowest of happiness scores.


-- 	Which countries have the maximum & minimum scores for each variable. 

SELECT Country_name, ROUND(MIN(Social_support),2) AS MinSocialSupport, ROUND(MIN(Healthy_life_expectancy),2) AS MinLifeExpectancy, ROUND(Min(Freedom_to_make_life_choices),2) AS MinLifeChoices, ROUND(Min(Generosity),2) AS MinGenerosity, ROUND(MIN(Perceptions_of_corruption),2) AS MinCorruption
,ROUND(MAX(Social_support),2) AS MaxSocialSupport, ROUND(MAX(Healthy_life_expectancy),2) AS MaxLifeExpectancy, ROUND(MAX(Freedom_to_make_life_choices),2) AS MaxLifeChoices, ROUND(MAX(Generosity),2) AS MaxGenerosity, ROUND(MAX(Perceptions_of_corruption),2) AS MaxCorruption
FROM project.happiness_2020
GROUP BY Country_name;

-- As we can see the min and max appears to be consistent with the ranking of the happiness scores, there are a few outliers but that is to be expected with such a large dataset and some countries may be better with things like healthcare as opposed to something like social support.

-- I will now combine the datasets based on countries as that is our primary key

SELECT * FROM project.happiness_2020 tb1
INNER JOIN project.happiness_2019 tb2
ON tb1.Country_name = tb2.Country_name; 


