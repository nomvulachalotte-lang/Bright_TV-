-- Databricks notebook source
SELECT *
FROM bright_tv.brighttv_schema.user_profiles;

DESCRIBE bright_tv.brighttv_schema.user_profiles;

DESCRIBE bright_tv.brighttv_schema.viewership;


SELECT *
FROM bright_tv.brighttv_schema.viewership
LIMIT 10;
----Total users 
SELECT COUNT(*) AS Total_Users
FROM bright_tv.brighttv_schema.user_profiles;

---gender distribution
SELECT
    Gender,
    COUNT(*) AS Total_Users
FROM bright_tv.brighttv_schema.user_profiles
GROUP BY Gender
ORDER BY Total_Users DESC;

----race distribution
SELECT
    Race,
    COUNT(*) AS Total_Users
FROM bright_tv.brighttv_schema.user_profiles
GROUP BY Race
ORDER BY Total_Users DESC;

----province distribution
SELECT
    Province,
    COUNT(*) AS Total_Users
FROM bright_tv.brighttv_schema.user_profiles
GROUP BY Province
ORDER BY Total_Users DESC;

---age distribution
SELECT
    Age,
    COUNT(*) AS Users
FROM bright_tv.brighttv_schema.user_profiles
GROUP BY Age
ORDER BY Age;

---age groups
SELECT
CASE
    WHEN Age BETWEEN 18 AND 24 THEN '18-24'
    WHEN Age BETWEEN 25 AND 34 THEN '25-34'
    WHEN Age BETWEEN 35 AND 44 THEN '35-44'
    WHEN Age BETWEEN 45 AND 54 THEN '45-54'
    ELSE '55+'
END AS Age_Group,
COUNT(*) AS Total_Users
FROM bright_tv.brighttv_schema.user_profiles
GROUP BY
CASE
    WHEN Age BETWEEN 18 AND 24 THEN '18-24'
    WHEN Age BETWEEN 25 AND 34 THEN '25-34'
    WHEN Age BETWEEN 35 AND 44 THEN '35-44'
    WHEN Age BETWEEN 45 AND 54 THEN '45-54'
    ELSE '55+'
END
ORDER BY Total_Users DESC;

----most popular channels
SELECT
    Channel2,
    COUNT(*) AS Views
FROM bright_tv.brighttv_schema.viewership
GROUP BY Channel2
ORDER BY Views DESC;

--------top 10 most active users 
SELECT
    UserID,
    COUNT(*) AS Sessions
FROM bright_tv.brighttv_schema.viewership
GROUP BY UserID
ORDER BY Sessions DESC
LIMIT 10;
----total records in user profiles----

SELECT COUNT(*) AS Total_Users
FROM bright_tv.brighttv_schema.user_profiles;

---total viewing records
SELECT COUNT(*) AS Total_Viewing_Records
FROM bright_tv.brighttv_schema.viewership;

----duplicate users----
SELECT COUNT(*) AS Total_Viewing_Records
FROM bright_tv.brighttv_schema.viewership;

----users with missing email addresses----

SELECT *
FROM bright_tv.brighttv_schema.user_profiles
WHERE Email IS NULL;

---missing provinces----
SELECT *
FROM bright_tv.brighttv_schema.user_profiles
WHERE Province IS NULL;

----male vs female users----
SELECT Gender,
COUNT(*) AS Users
FROM bright_tv.brighttv_schema.user_profiles
GROUP BY Gender;

-----race distribution---------
SELECT Race,
COUNT(*) AS Users
FROM bright_tv.brighttv_schema.user_profiles
GROUP BY Race
ORDER BY Users DESC;

------province distribution----
SELECT Province,
COUNT(*) AS Users
FROM bright_tv.brighttv_schema.user_profiles
GROUP BY Province
ORDER BY Users DESC;

----average user age-----

SELECT
AVG(Age) AS Average_Age
FROM bright_tv.brighttv_schema.user_profiles;

----youngest and oldest users----
SELECT
MIN(Age) AS Youngest,
MAX(Age) AS Oldest
FROM bright_tv.brighttv_schema.user_profiles;

-----users aged over 40----

SELECT *
FROM bright_tv.brighttv_schema.user_profiles
WHERE Age > 40;

--------users from gauteng----
SELECT *
FROM bright_tv.brighttv_schema.user_profiles
WHERE Province='Gauteng';

-----number of channels wached---
SELECT *
FROM bright_tv.brighttv_schema.user_profiles
WHERE Province='Gauteng';

------number of unique channelss-----

SELECT
COUNT(DISTINCT Channel2) AS Total_Channels
FROM bright_tv.brighttv_schema.viewership;

----top 10 active viewers---

SELECT
UserID,
COUNT(*) AS Sessions
FROM bright_tv.brighttv_schema.viewership
GROUP BY UserID
ORDER BY Sessions DESC
LIMIT 10;

----users thatwatched only one show----

SELECT
UserID,
COUNT(*) AS Sessions
FROM bright_tv.brighttv_schema.viewership
GROUP BY UserID
HAVING COUNT(*)=1;

-----disctict users thatwached tv-----
SELECT
COUNT(DISTINCT UserID) AS Active_Viewers
FROM bright_tv.brighttv_schema.viewership;

-----users thta watch tv distinctively----
SELECT
COUNT(DISTINCT UserID) AS Active_Viewers
FROM bright_tv.brighttv_schema.viewership;

---viewing sessions by gnder---

SELECT
u.Gender,
COUNT(*) AS Sessions
FROM bright_tv.brighttv_schema.user_profiles u
JOIN bright_tv.brighttv_schema.viewership v
ON u.UserID=v.UserID
GROUP BY u.Gender;

-----viewing sessions by province-----
SELECT
u.Province,
COUNT(*) AS Sessions
FROM bright_tv.brighttv_schema.user_profiles u
JOIN bright_tv.brighttv_schema.viewership v
ON u.UserID=v.UserID
GROUP BY u.Province
ORDER BY Sessions DESC;

---viewing sessions by race----

SELECT
u.Race,
COUNT(*) AS Sessions
FROM bright_tv.brighttv_schema.user_profiles u
JOIN bright_tv.brighttv_schema.viewership v
ON u.UserID=v.UserID
GROUP BY u.Race
ORDER BY Sessions DESC;

-------top viewers by nmes----
SELECT
u.Name,
u.Surname,
COUNT(*) AS Sessions
FROM bright_tv.brighttv_schema.user_profiles u
JOIN bright_tv.brighttv_schema.viewership v
ON u.UserID=v.UserID
GROUP BY
u.Name,
u.Surname
ORDER BY Sessions DESC;

------popula chanels by gender----
SELECT
u.Gender,
v.Channel2,
COUNT(*) AS Views
FROM bright_tv.brighttv_schema.user_profiles u
JOIN bright_tv.brighttv_schema.viewership v
ON u.UserID=v.UserID
GROUP BY
u.Gender,
v.Channel2
ORDER BY Views DESC;

----most popular chanel by provinceee----

SELECT
u.Province,
v.Channel2,
COUNT(*) AS Views
FROM bright_tv.brighttv_schema.user_profiles u
JOIN bright_tv.brighttv_schema.viewership v
ON u.UserID=v.UserID
GROUP BY
u.Province,
v.Channel2
ORDER BY Views DESC;

----average age by gender----
SELECT
Gender,
AVG(Age) AS Average_Age
FROM bright_tv.brighttv_schema.user_profiles
GROUP BY Gender;
-----number of users in each age group---
SELECT
CASE
WHEN Age BETWEEN 18 AND 24 THEN '18-24'
WHEN Age BETWEEN 25 AND 34 THEN '25-34'
WHEN Age BETWEEN 35 AND 44 THEN '35-44'
WHEN Age BETWEEN 45 AND 54 THEN '45-54'
ELSE '55+'
END AS Age_Group,
COUNT(*) AS Users
FROM bright_tv.brighttv_schema.user_profiles
GROUP BY
CASE
WHEN Age BETWEEN 18 AND 24 THEN '18-24'
WHEN Age BETWEEN 25 AND 34 THEN '25-34'
WHEN Age BETWEEN 35 AND 44 THEN '35-44'
WHEN Age BETWEEN 45 AND 54 THEN '45-54'
ELSE '55+'
END;

----users per province---

SELECT
Province,
COUNT(UserID) AS Total_Users
FROM bright_tv.brighttv_schema.user_profiles
GROUP BY Province
ORDER BY Total_Users DESC;

-----users per race----

SELECT
Race,
COUNT(UserID) AS Total_Users
FROM bright_tv.brighttv_schema.user_profiles
GROUP BY Race
ORDER BY Total_Users DESC;

-----users per gender----

SELECT
Gender,
COUNT(UserID) AS Total_Users
FROM bright_tv.brighttv_schema.user_profiles
GROUP BY Gender;

----list all channells alphabetically----

SELECT DISTINCT
Channel2
FROM bright_tv.brighttv_schema.viewership
ORDER BY Channel2;

------total viewership----

SELECT
COUNT(DISTINCT UserID) AS Total_Active_Users,
COUNT(*) AS Total_Viewing_Sessions
FROM bright_tv.brighttv_schema.viewership;

