Customer Churn Analysis Dashboard 📊
![Dashboard Screenshot](Snapshort-of-Dashboard.jpg Overview ✨

This repository presents a comprehensive business intelligence dashboard for analyzing customer churn drivers in a tour & travel agency, built using Power BI. The solution integrates data cleaning, exploratory data analysis (EDA), and predictive modeling to deliver actionable insights for reducing customer attrition and maximizing retention.

Problem Statement ❓
A travel agency is experiencing significant customer churn 😟, threatening its long-term sustainability and profitability. This project aims to:

Predict which customers are most likely to discontinue services 🔮

Identify key churn drivers across product engagement and demographic segments 🎯

Recommend targeted retention actions to improve loyalty and revenue 💡

Dataset 📂
Source: Kaggle - Tour Travels Customer Churn 🔗

Records: 954 customers 👤

Features: 7 columns (Age, Frequent Flyer, Annual Income Class, Services Opted, Account Synced to Social Media, Booked Hotel or Not, Churn) 📈

Each row represents a unique customer and their engagement/attrition status.

Key Features & Metrics Visualized 🚦
Executive Summary: KPIs for average services opted, customer bookings, frequent flyers, churn, and retention rate 🏆

Churn Rate by Number of Services Opted: Impact of multi-service adoption on churn 🔢

Distribution by Services Opted: Segmented customer counts 🍰

Churn by Hotel Booking: Churn analysis for customers who booked vs. not booked hotels 🏨

Churn Breakdown – Frequent Flyer: Comparison of retention between loyalty program members and others ✈️

Retention & Churn Rates: Overall ratio and trend indicators 📉📈

Sample KPIs:

Average Services Opted: 2.44

Customers Booked Hotel: 378

Frequent Flyers: 286

Churn Rate: 23.5%

Retention Rate: 76.5%

Technology & Tools Used 🛠️
Power BI: Data modeling, visualization, dashboard design

Python (Logistic Regression): Predictive analytics 🐍

SQL & Excel: Data cleaning and EDA 🧹

Project Workflow 🚀
Data Cleaning: Standardized missing values, removed duplicates, and formatted categorical features 🧽

Exploratory Data Analysis: Identified patterns in churn across age, income, service adoption, and engagement 🔍

Predictive Modeling: Built a logistic regression model to estimate churn probability 📊

Dashboard Development: Translated business questions into interactive Power BI visuals and KPIs 🖼️

Insights & Recommendations 💡
Hotel booking is strongly linked to retention; non-bookers are at higher risk 🏨➡️😬

High income and frequent flyer segments show unexpectedly high churn—targeted satisfaction and loyalty interventions recommended 💰✈️📉

Customers opting for 3 services have the lowest churn; both very low and very high engagement can increase attrition risk ⚖️

Social media account sync correlates with higher churn—address privacy/engagement concerns 🔗📉

Targeted campaigns recommended for at-risk segments identified via dashboard 📢

Getting Started 🏁
Download or clone the repository 💻

Open Customertravel.csv in Power BI

Load the .pbix dashboard (contact for file) or recreate using visuals as per the sample image 🖼️

Review supplementary files for data cleaning (Excel/SQL) and modeling scripts (Python) 🔍

File Structure 🗂️
Customertravel.csv - Cleaned customer data

logistic_regression_churn_data.ipynb - Predictive modeling notebook (Python)

CustomerChurnAnalysisFinal.pptx - Project report/summary

Travels-Problem-Statement.pdf - Problem statement and dataset details

Snapshort-of-Dashboard.jpg - Dashboard screenshot

Author 🙋
Anshuman Sharma

[LinkedIn/GitHub profile if desired]

License 📄
Feel free to use and adapt for educational or non-commercial projects. For commercial use, please contact the author.

For questions or collaboration, open an issue or reach out via contributor profile. 🤝
