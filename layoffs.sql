CREATE TABLE layoffs_staging
LIKE layoffs;

SELECT * 
FROM layoffs_staging;

INSERT layoffs_staging

SELECT *, ROW_NUMBER() OVER(
PARTITION BY company, industry, total_laid_off, percentage_laid_off, `date`) AS row_num 
FROM layoffs_staging;


-- creating CTE to search for dublicates

WITH duplicates_cte AS
(SELECT *, ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num 
FROM layoffs_staging)
SELECT * 
FROM duplicates_cte
WHERE row_num > 1;



SELECT *
FROM layoffs_staging
WHERE company ='100 Thieves';



WITH duplicates_cte AS
(SELECT *, ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num 
FROM layoffs_staging)
DELETE 
FROM duplicate_cte 
WHERE row_num > 1;




CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


SELECT *
FROM layoffs_staging2;

INSERT INTO layoffs_staging2
SELECT *, 
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num 
FROM layoffs_staging;

SET SQL_SAFE_UPDATES = 0; -- To temporarily disable safe update mode

DELETE 
FROM layoffs_staging2
WHERE row_num > 1;


SELECT *
FROM layoffs_staging2;


UPDATE layoffs_staging2
SET company = TRIM(company);

SET SQL_SAFE_UPDATES = 1; 

SELECT DISTINCT industry
FROM layoffs_staging2
ORDER BY 1;

SELECT DISTINCT location
FROM layoffs_staging2
ORDER BY 1;

SELECT DISTINCT country
FROM layoffs_staging2
ORDER BY 1;


UPDATE layoffs_staging2
SET country = 'united states'
WHERE country = 'united states.';



SELECT DISTINCT country
FROM layoffs_staging2
ORDER BY 1;


SELECT `date`, 
STR_TO_DATE(`date`, '%m/%d/%Y') AS date
FROM layoffs_staging2;


UPDATE layoffs_staging2
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');


ALTER TABLE layoffs_staging2
MODIFY COLUMN `date` DATE;

SELECT ls1.industry, ls2.industry
FROM layoffs_staging2 ls1
JOIN layoffs_staging2 ls2
	ON ls1.company = ls2.company
WHERE (ls1.industry IS NULL OR ls1.industry = '')
AND ls2.industry IS NOT NULL;


UPDATE layoffs_staging2 ls1
JOIN layoffs_staging2 ls2
	ON ls1.company = ls2.company
SET ls1.industry = ls2.industry
WHERE (ls1.industry IS NULL)
AND ls2.industry IS NOT NULL;


SELECT *
FROM layoffs_staging2;





SELECT *
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;


DELETE
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;


ALTER TABLE layoffs_staging2
DROP COLUMN row_num;


SELECT *
FROM layoffs_staging2;

