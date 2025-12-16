Select * from sm_addiction_data;

-- Check if any cleaning is needed
Describe sm_addiction_data;
Select distinct Gender From sm_addiction_data;
Select distinct Academic_Level From sm_addiction_data;
Select distinct Country From sm_addiction_data;
Select distinct Most_Used_Platform From sm_addiction_data;
Select distinct Affects_Academic_Performance From sm_addiction_data;
Select distinct Relationship_Status From sm_addiction_data;

-- Cleaning the Data
-- 01) Duplicate Student ID
Select Student_ID, Count(Student_ID)
From sm_addiction_data
Group By Student_ID
Having Count(Student_ID) > 1;

-- 02) Checking for impossible values
SELECT Max(Age) as max_age, Min(Age) as min_age
from sm_addiction_data;
SELECT Max(Avg_Daily_Usage_Hours) as max_Avg_Daily_Usage_Hours, Min(Avg_Daily_Usage_Hours) as min_Avg_Daily_Usage_Hours
from sm_addiction_data;
SELECT Max(Mental_Health_Score) as max_Mental_Health_Score, Min(Mental_Health_Score) as min_Mental_Health_Score
from sm_addiction_data;
SELECT Max(Addicted_Score) as max_Addicted_Score, Min(Addicted_Score) as min_Addicted_Score
from sm_addiction_data;

-- There were no null values as well


-- Analysis
-- 01) Finding which social media platform has the most addicted scores
Select Most_Used_Platform, Round(Avg(Addicted_Score), 2) as average_addicted_score
from sm_addiction_data
group by Most_Used_Platform
order by average_addicted_score DESC;

-- 02) Analyzing popularity of each social media
Select Most_Used_Platform, Count(Country) as countries_used
from sm_addiction_data
group by Most_Used_Platform
order by countries_used DESC;

-- 03) Addiction vs Mental Health
With addiction_buckets as (
Select Student_ID, Mental_Health_Score,
case when Addicted_Score >= 7 then 'High Addiction'
	when Addicted_Score > 3 and Addicted_Score < 7 then 'Moderate Addiction'
    else 'Low Addiction'
end as addiction_level
from sm_addiction_data)

Select addiction_level,
Count(Student_ID) as total_students,
Round(AVG(Mental_Health_Score), 2) as average_mental_health,
Max(Mental_Health_Score) as best_score,
Min(Mental_Health_Score) as worst_score
From addiction_buckets
Group by addiction_level
Order by average_mental_health DESC;

-- 04) Addiction vs Sleep Quality
With addiction_buckets as (
Select Student_ID, Sleep_Hours_Per_Night,
case when Addicted_Score >= 7 then 'High Addiction'
	when Addicted_Score > 3 and Addicted_Score < 7 then 'Moderate Addiction'
    else 'Low Addiction'
end as addiction_level
from sm_addiction_data)

Select addiction_level,
Count(Student_ID) as total_students,
Round(AVG(Sleep_Hours_Per_Night), 2) as average_sleep_hours,
Max(Sleep_Hours_Per_Night) as best_score,
Min(Sleep_Hours_Per_Night) as worst_score
From addiction_buckets
Group by addiction_level
Order by average_sleep_hours DESC;

-- 05) Identifying if addiction affect sleep quality differently by gender
With addiction_buckets as (
Select Gender, 
Sleep_Hours_Per_Night, 
Student_ID,
case when Addicted_Score >= 7 then 'High Addiction'
	when Addicted_Score > 3 and Addicted_Score < 7 then 'Moderate Addiction'
    else 'Low Addiction'
end as addiction_level
from sm_addiction_data)

Select Gender,
addiction_level,
ROUND(AVG(Sleep_Hours_Per_Night), 2) as avg_sleep_hours,
COUNT(*) as total_students
From addiction_buckets
Group by Gender, addiction_level
Order by addiction_level, Gender;

-- 06) Identifying if addiction affect mental health differently by gender
With addiction_buckets as (
Select Gender, 
Mental_Health_Score, 
Student_ID,
case when Addicted_Score >= 7 then 'High Addiction'
	when Addicted_Score > 3 and Addicted_Score < 7 then 'Moderate Addiction'
    else 'Low Addiction'
end as addiction_level
from sm_addiction_data)

Select Gender,
addiction_level,
ROUND(AVG(Mental_Health_Score), 2) as avg_mental_health,
COUNT(*) as total_students
From addiction_buckets
Group by Gender, addiction_level
Order by addiction_level, Gender;

-- 07) Indeitfying the amount of usage hours which causes a significant amount of mental health & sleep hour drop
Select Round(Avg_Daily_Usage_Hours * 2) / 2 as parts_of_half_hour,
Count(Student_ID) as student_count,
ROUND(AVG(Mental_Health_Score), 2) as avg_mental_health,
ROUND(AVG(Sleep_Hours_Per_Night), 2) as avg_sleep_hours
From sm_addiction_data
Group by Round(Avg_Daily_Usage_Hours * 2) / 2
Order by parts_of_half_hour ASC;