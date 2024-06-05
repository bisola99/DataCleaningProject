-- Staging Table Creation

create table layoff_staging
like layoffs;

insert into layoff_staging2
select* from layoffs;

--  Removing Duplicates.

with cte as(
 select*, 
 row_number() over(partition by company, industry,total_laid_off,`date`,location,percentage_laid_off,country,stage,funds_raised_millions) as flag
 from layoff_staging)
 select * from cte where flag>1;
 
CREATE TABLE `layoff_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert into 
 layoff_staging2
 select *, 
 row_number() over(partition by company, industry,total_laid_off,`date`,location,percentage_laid_off,country,stage,funds_raised_millions) as row_num
 from layoff_staging;

delete 
from layoff_staging2
where row_num > 1;

-- To Standardizing Data.

select company, trim(company) from layoff_staging2;

update layoff_staging2
set company= trim(company);

select* 
 from layoff_staging2
 where industry like "crypto%";
 
 update layoff_staging2
 set industry = "Crypto"
 where industry LIKE "Crypto%";
 
 SELECT DISTINCT(country) , trim(trailing "." from country)
 FROM layoff_staging2  ORDER BY 1;
 
 update layoff_staging2
 set country =  trim(trailing "." from country)
 where country like "United state%";
 
 select distinct(country) from layoff_staging2
 order by 1;
 
select `date`, str_to_date(`date`,  "%m/%d/%Y") from layoff_staging2;

update layoff_staging2
set `date` = str_to_date(`date`,  "%m/%d/%Y");

select `date` from layoff_staging2;
alter table layoff_staging2
modify column `date` Date;

-- Removing Null Values & Blanks

select * from layoff_staging2 
where total_laid_off is null 
and percentage_laid_off is null;

select * 
from layoff_staging2 
where industry ="" or industry is null;

select t1.industry, t2.industry 
from layoff_staging2 t1 join layoff_staging2 t2 on t1.company=t2.company 
where (t1.industry is null or t1.industry="") and t2. industry is not null ;

update layoff_staging2
set industry = Null
where industry ="";

update layoff_staging2 t1
join layoff_staging2 t2 on t1.company=t2.company 
set t1.industry = t2.industry
where (t1.industry is null) and t2. industry is not null;
select * from layoff_staging2 t1;

-- Removing Columns and rows

select*  from layoff_staging2 
where total_laid_off is null 
and percentage_laid_off is null;

Delete  from layoff_staging2 
where total_laid_off is null 
and percentage_laid_off is null;


alter table layoff_staging2
drop column row_num;

select* from layoff_staging2;
