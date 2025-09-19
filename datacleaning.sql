-- Create a new database for your analysis
CREATE DATABASE tourtravelsdb;

-- Select the new database as your working context
USE tourtravelsdb;


SELECT * FROM CustomerDetails;


-- Add bit columns for each categorical Yes/No field
ALTER TABLE CustomerDetails ADD FrequentFlyerBit BIT;
ALTER TABLE CustomerDetails ADD SocialMediaBit BIT;
ALTER TABLE CustomerDetails ADD BookedHotelBit BIT;

-- Populate the new bit columns: 1 for 'Yes', 0 for 'No'
UPDATE CustomerDetails SET FrequentFlyerBit = CASE WHEN FrequentFlyer = 'Yes' THEN 1 ELSE 0 END;

UPDATE CustomerDetails SET SocialMediaBit = CASE WHEN AccountSyncedToSocialMedia = 'Yes' THEN 1 ELSE 0 END;

UPDATE CustomerDetails SET BookedHotelBit = CASE WHEN BookedHotelOrNot = 'Yes' THEN 1 ELSE 0 END;




-------------------------------------------------------------------------------------------SECTION 1: DATA CLEANING-------------------------------------------------------------------------------------------------------------------------
--------------------------1 Standardize Categorical Values

-- Replace 'No Record', 'NA', '' with 'No' (or similar) for categorical columns
UPDATE CustomerDetails
SET FrequentFlyer = 'No'
WHERE FrequentFlyer IN ('No Record', '', 'NA');

UPDATE CustomerDetails
SET AccountSyncedToSocialMedia = 'No'
WHERE AccountSyncedToSocialMedia IN ('No Record', '', 'NA');

UPDATE CustomerDetails
SET BookedHotelOrNot = 'No'
WHERE BookedHotelOrNot IN ('No Record', '', 'NA');



---------------------------2 Trim Whitespace and Standardize Case

-- Remove leading/trailing spaces, make all text upper/lower/proper case if desired
UPDATE CustomerDetails
SET
    FrequentFlyer = LTRIM(RTRIM(FrequentFlyer)),
    AccountSyncedToSocialMedia = LTRIM(RTRIM(AccountSyncedToSocialMedia)),
    BookedHotelOrNot = LTRIM(RTRIM(BookedHotelOrNot)),
    AnnualIncomeClass = LTRIM(RTRIM(AnnualIncomeClass));



    ------------------------3 Handle Missing Numeric Values

-- First, check if any NULLs present:
SELECT COUNT(*) AS NullAges FROM CustomerDetails WHERE Age IS NULL;

-----------no null ages 



-------------------------------------------------------------------------------------------SECTION 2: FINDING & FIXING DATA INCONSISTENCIES/DISCREPANCIES-----------------------------------------------------------------------------------
---------------------------1 Find Nulls / Missing Values

SELECT
  SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS NullAge,
  SUM(CASE WHEN FrequentFlyer IS NULL THEN 1 ELSE 0 END) AS NullFrequentFlyer,
  SUM(CASE WHEN AnnualIncomeClass IS NULL THEN 1 ELSE 0 END) AS NullIncome,
  SUM(CASE WHEN ServicesOpted IS NULL THEN 1 ELSE 0 END) AS NullServicesOpted,
  SUM(CASE WHEN AccountSyncedToSocialMedia IS NULL THEN 1 ELSE 0 END) AS NullSynced,
  SUM(CASE WHEN BookedHotelOrNot IS NULL THEN 1 ELSE 0 END) AS NullBooked,
  SUM(CASE WHEN Target IS NULL THEN 1 ELSE 0 END) AS NullTarget
FROM CustomerDetails;
-- no null values found


-----------------------------2 Find All Unique Values in Categorical Columns

SELECT DISTINCT FrequentFlyer FROM CustomerDetails;
SELECT DISTINCT AccountSyncedToSocialMedia FROM CustomerDetails;
SELECT DISTINCT BookedHotelOrNot FROM CustomerDetails;
SELECT DISTINCT AnnualIncomeClass FROM CustomerDetails;
-- Use these to spot typos, case mismatches, and non-standard labels.

-----------------------------3 Detect Outlier or Invalid Numeric Values

-- Ages below 18 or above 100 are suspect
SELECT * FROM CustomerDetails WHERE Age < 18 OR Age > 100;

-- ServicesOpted should be positive and reasonable (e.g., < 10)
SELECT * FROM CustomerDetails WHERE ServicesOpted < 0 OR ServicesOpted > 10;


----------------------------4 Check Target/Churn Column for Invalid Entries

-- Should only be 0 (not churned) or 1 (churned)
SELECT DISTINCT Target FROM CustomerDetails;


----------------------------5 Find Duplicate Rows

SELECT Age, FrequentFlyer, AnnualIncomeClass, ServicesOpted, AccountSyncedToSocialMedia, BookedHotelOrNot, Target, COUNT(*) AS DupCount
FROM CustomerDetails
GROUP BY Age, FrequentFlyer, AnnualIncomeClass, ServicesOpted, AccountSyncedToSocialMedia, BookedHotelOrNot, Target
HAVING COUNT(*) > 1;

---we found 205 duplicate rows
---A row being a duplicate (all columns identical) does not guarantee it refers to the same real person—it might be coincidental or the result of multiple records for similar users.









