--------------------------------------------------------------------------------Exploratory Data Analysis (EDA) & Feature Profiling----------------------------------------------------------------------------------------------------------

USE tourtravelsdb;


SELECT * FROM CustomerDetails;

------------1 Overall Churn Rate

SELECT 
  COUNT(*) AS Total_Customers,
  SUM(CAST(Target AS INT)) AS Total_Churned,
  100.0 * SUM(CAST(Target AS INT)) / COUNT(*) AS Churn_Percent
FROM CustomerDetails;

-- Gives overall churn % in your dataset

-----------2. Churn Rate By Feature
---By Age

SELECT 
  Age,
  COUNT(*) AS Total_Customers,
  SUM(CAST(Target AS INT)) AS Churned_Customers,
  100.0 * SUM(CAST(Target AS INT)) / COUNT(*) AS Churn_Rate
FROM CustomerDetails
GROUP BY Age
ORDER BY Age;

---By ServicesOpted

SELECT 
  ServicesOpted,
  COUNT(*) AS Total_Customers,
  SUM(CAST(Target AS INT)) AS Churned_Customers,
  100.0 * SUM(CAST(Target AS INT)) / COUNT(*) AS Churn_Rate
FROM CustomerDetails
GROUP BY ServicesOpted
ORDER BY ServicesOpted;

---By FrequentFlyer

SELECT 
  FrequentFlyer,
  COUNT(*) AS Total_Customers,
  SUM(CAST(Target AS INT)) AS Churned_Customers,
  100.0 * SUM(CAST(Target AS INT)) / COUNT(*) AS Churn_Rate
FROM CustomerDetails
GROUP BY FrequentFlyer;

---By AccountSyncedToSocialMedia

SELECT 
  AccountSyncedToSocialMedia,
  COUNT(*) AS Total_Customers,
  SUM(CAST(Target AS INT)) AS Churned_Customers,
  100.0 * SUM(CAST(Target AS INT)) / COUNT(*) AS Churn_Rate
FROM CustomerDetails
GROUP BY AccountSyncedToSocialMedia;

---By BookedHotelOrNot

SELECT 
  BookedHotelOrNot,
  COUNT(*) AS Total_Customers,
  SUM(CAST(Target AS INT)) AS Churned_Customers,
  100.0 * SUM(CAST(Target AS INT)) / COUNT(*) AS Churn_Rate
FROM CustomerDetails
GROUP BY BookedHotelOrNot;

---By AnnualIncomeClass

SELECT 
  AnnualIncomeClass,
  COUNT(*) AS Total_Customers,
  SUM(CAST(Target AS INT)) AS Churned_Customers,
  100.0 * SUM(CAST(Target AS INT)) / COUNT(*) AS Churn_Rate
FROM CustomerDetails
GROUP BY AnnualIncomeClass;

--------------3. Churn Rate by Two Segments
---by Age and AnnualIncomeClass

SELECT 
  Age,
  AnnualIncomeClass,
  COUNT(*) AS Total_Customers,
  SUM(CAST(Target AS INT)) AS Churned_Customers,
  100.0 * SUM(CAST(Target AS INT)) / COUNT(*) AS Churn_Rate
FROM CustomerDetails
GROUP BY Age, AnnualIncomeClass
ORDER BY Age, AnnualIncomeClass;

---by ServicesOpted and FrequentFlyer

SELECT 
  ServicesOpted,
  FrequentFlyer,
  COUNT(*) AS Total_Customers,
  SUM(CAST(Target AS INT)) AS Churned_Customers,
  100.0 * SUM(CAST(Target AS INT)) / COUNT(*) AS Churn_Rate
FROM CustomerDetails
GROUP BY ServicesOpted, FrequentFlyer
ORDER BY ServicesOpted, FrequentFlyer;

---by BookedHotelOrNot and AnnualIncomeClass

SELECT 
  BookedHotelOrNot,
  AnnualIncomeClass,
  COUNT(*) AS Total_Customers,
  SUM(CAST(Target AS INT)) AS Churned_Customers,
  100.0 * SUM(CAST(Target AS INT)) / COUNT(*) AS Churn_Rate
FROM CustomerDetails
GROUP BY BookedHotelOrNot, AnnualIncomeClass
ORDER BY BookedHotelOrNot, AnnualIncomeClass;

---by AccountSyncedToSocialMedia and ServicesOpted

SELECT 
  AccountSyncedToSocialMedia,
  ServicesOpted,
  COUNT(*) AS Total_Customers,
  SUM(CAST(Target AS INT)) AS Churned_Customers,
  100.0 * SUM(CAST(Target AS INT)) / COUNT(*) AS Churn_Rate
FROM CustomerDetails
GROUP BY AccountSyncedToSocialMedia, ServicesOpted
ORDER BY AccountSyncedToSocialMedia, ServicesOpted;

---by Age and BookedHotelOrNot

SELECT 
  Age,
  BookedHotelOrNot,
  COUNT(*) AS Total_Customers,
  SUM(CAST(Target AS INT)) AS Churned_Customers,
  100.0 * SUM(CAST(Target AS INT)) / COUNT(*) AS Churn_Rate
FROM CustomerDetails
GROUP BY Age, BookedHotelOrNot
ORDER BY Age, BookedHotelOrNot;

