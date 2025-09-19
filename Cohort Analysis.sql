-----------------------------------------------------------------------------------------------------------Cohort Analysis-----------------------------------------------------------------------------------------------------------------
USE tourtravelsdb;


SELECT * FROM CustomerDetails;
---------------------------1. Churn Rate by Age Group, FrequentFlyer, and AnnualIncomeClass (Three-way Cohort)

-- First, create 'age groups' on the fly (e.g., 20-25, 26-30, etc.)
SELECT 
  CONCAT(FLOOR(Age/5)*5, '-', FLOOR(Age/5)*5 + 4) AS Age_Group,
  FrequentFlyer,
  AnnualIncomeClass,
  COUNT(*) AS Total_Customers,
  SUM(CAST(Target AS INT)) AS Churned_Customers,
  100.0 * SUM(CAST(Target AS INT)) / COUNT(*) AS Churn_Rate
FROM CustomerDetails
GROUP BY 
  FLOOR(Age/5),
  FrequentFlyer,
  AnnualIncomeClass
ORDER BY 
  Age_Group, FrequentFlyer, AnnualIncomeClass;

  ---------------------------2. Churn Rate by ServicesOpted Group, BookedHotelOrNot, and SocialMediaSync

  SELECT
  CASE 
    WHEN ServicesOpted <= 2 THEN 'Few'
    WHEN ServicesOpted <= 5 THEN 'Some'
    ELSE 'Many'
  END AS Service_Group,
  BookedHotelOrNot,
  AccountSyncedToSocialMedia,
  COUNT(*) AS Total_Customers,
  SUM(CAST(Target AS INT)) AS Churned_Customers,
  100.0 * SUM(CAST(Target AS INT)) / COUNT(*) AS Churn_Rate
FROM CustomerDetails
GROUP BY
  CASE 
    WHEN ServicesOpted <= 2 THEN 'Few'
    WHEN ServicesOpted <= 5 THEN 'Some'
    ELSE 'Many'
  END,
  BookedHotelOrNot,
  AccountSyncedToSocialMedia
ORDER BY
  Service_Group, BookedHotelOrNot, AccountSyncedToSocialMedia;




 







  -----------------------------------------------------------------------------------------------Section 2: Feature Combination Ranking / Hotspot Cohort Analysis----------------------------------------------------------------------------------


  -- Find top 10 highest-churn 3-way combinations (example: FrequentFlyer × AnnualIncomeClass × BookedHotelOrNot)
SELECT TOP 10 
    FrequentFlyer,
    AnnualIncomeClass,
    BookedHotelOrNot,
    COUNT(*) AS Total_Customers,
    SUM(CAST(Target AS INT)) AS Churned_Customers,
    100.0 * SUM(CAST(Target AS INT)) / COUNT(*) AS Churn_Rate
FROM CustomerDetails
GROUP BY 
    FrequentFlyer, 
    AnnualIncomeClass, 
    BookedHotelOrNot
HAVING COUNT(*) > 10  -- Exclude tiny cohorts for statistical relevance
ORDER BY 
    Churn_Rate DESC,  -- Show most at-risk segments first
    Total_Customers DESC;


-- Find all 2-way combinations (choose your own feature pairs for strategic value)
SELECT
    ServicesOpted,  -- or ServicesOptedGroup if you created buckets
    BookedHotelOrNot,
    COUNT(*) AS Total_Customers,
    SUM(CAST(Target AS INT)) AS Churned_Customers,
    100.0 * SUM(CAST(Target AS INT)) / COUNT(*) AS Churn_Rate
FROM CustomerDetails
GROUP BY 
    ServicesOpted, 
    BookedHotelOrNot
ORDER BY 
    Churn_Rate DESC, 
    Total_Customers DESC;


-- Broadest: ALL 4 key segment features to spot rare but extreme risk groups
SELECT 
    FrequentFlyer,
    AnnualIncomeClass,
    BookedHotelOrNot,
    AccountSyncedToSocialMedia,
    COUNT(*) AS Total_Customers,
    SUM(CAST(Target AS INT)) AS Churned_Customers,
    100.0 * SUM(CAST(Target AS INT)) / COUNT(*) AS Churn_Rate
FROM CustomerDetails
GROUP BY 
    FrequentFlyer,
    AnnualIncomeClass,
    BookedHotelOrNot,
    AccountSyncedToSocialMedia
HAVING COUNT(*) > 5
ORDER BY 
    Churn_Rate DESC,
    Total_Customers DESC;



















