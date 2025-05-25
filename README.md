📊 Project Overview: Tech Layoffs Data Cleaning with SQL
In the wake of significant global shifts in the tech industry, understanding the patterns and impacts of employee layoffs has become more important than ever. This project aims to clean and prepare a dataset containing tech layoff events across different companies, industries, and countries for meaningful analysis.

The raw dataset includes records with inconsistencies, null values, duplicate entries, and unstructured fields, which could hinder data insights if used as-is. Through this project, I performed data cleaning and transformation using SQL, ensuring the dataset is analysis-ready and reliable.



🧩 Dataset Summary
The dataset contains the following key fields:

company: Name of the company laying off employees.

location: City or region where the layoff occurred.

industry: Sector or industry to which the company belongs.

total_laid_off: Total number of employees laid off.

percentage_laid_off: Percentage of the company's workforce affected.

date: Date of the layoff announcement.

stage: Startup stage of the company (e.g., Series A, IPO).

country: Country in which the layoff occurred.

funds_raised_millions: Total funding raised by the company in millions.



🛠️ Tools & Technologies Used
SQL (MySQL syntax) – for querying, transformation, and cleaning

Window functions – to detect duplicates efficiently

CTEs (Common Table Expressions) – for modular and readable SQL code

Data Types & String Functions – for standardizing and formatting data



🎯 Project Goals
Create a safe staging environment to work with the data without altering the original source.

Identify and remove duplicate records based on multiple attributes using SQL window functions.

Standardize data fields such as company names (trimming spaces), date formats, and country names to ensure consistency.

Handle missing values by leveraging existing non-null values for the same company where possible.

Filter out incomplete or irrelevant records, particularly where critical fields like total_laid_off and percentage_laid_off are both null.

Prepare a clean, reliable dataset (layoffs_staging2) that can be exported or used for further downstream tasks such as:

Dashboards and visualizations (e.g., in Power BI or Tableau)

Trend analysis (layoffs by industry, country, or over time)

Predictive analytics or machine learning models



✅ Final Outcome
At the end of the process, a fully cleaned, deduplicated, and standardized dataset is stored in a new staging table (layoffs_staging2). This cleaned dataset can now serve as the foundation for deeper business insights into industry trends, workforce changes, and economic indicators in the tech sector.

