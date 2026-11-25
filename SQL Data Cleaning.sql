use emp_layoff;
SET SQL_SAFE_UPDATES = 0;

-- Check all records
select * from layoffs;

-- Check total rows
select count(*) as row_count from layoffs;

-- Check columns
describe layoffs;

-- create stagging_layoffs table for data cleaning
CREATE TABLE stagging_layoffs LIKE layoffs;
insert into stagging_layoffs select * from layoffs;

-- Verify the staging table
select * from stagging_layoffs;
select count(*) from stagging_layoffs;

-- 1. Remove Duplicates

-- Identify duplicate rows
select *, row_number() over(partition by company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) as row_num
from stagging_layoffs;

-- Identify duplicate rows
with duplicates as (
select *, row_number() over(partition by company, location, industry, total_laid_off, percentage_laid_off, 'date', stage, country, funds_raised_millions) as row_num
from stagging_layoffs
)
select * from duplicates where row_num > 1;

CREATE TABLE `stagging_layoffs2` (
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

insert into stagging_layoffs2 
select *, row_number() over(partition by company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) as row_num
from stagging_layoffs;

select * from stagging_layoffs2 where row_num >1;

-- remove duplicate rows
delete from stagging_layoffs2 where row_num > 1;

select count(*) from stagging_layoffs2;

-- 2. Standardize Data

-- Handling space
update stagging_layoffs2 
set company = trim(company);

update stagging_layoffs2 
set location = trim(location);

update stagging_layoffs2 
set industry = trim(industry);

-- Clear inconsistency
select distinct industry from stagging_layoffs2 where industry like "cryp%";

update stagging_layoffs2 
set industry = "Crypto" 
where industry like "Crypto%";

select distinct country from stagging_layoffs2 where country like "United States%";

update stagging_layoffs2 
set country = "United States" 
where country like "United States%";

-- Handling Data Type
select * from stagging_layoffs2;

update stagging_layoffs2 
set `date` = str_to_date(`date`, '%m/%d/%Y');

alter table stagging_layoffs2 
modify column `date` Date;


-- Handling Null Values
select * from stagging_layoffs2 where industry = '' or industry is null;

update stagging_layoffs2 
set industry = Null where industry = ''; 

select t1.industry, t2.industry
from stagging_layoffs2 t1 
join stagging_layoffs2 t2 on t1.company = t2.company 
where t1.industry is null and t2.industry is not null;

update stagging_layoffs2 t1
join stagging_layoffs2 t2 on t1.company = t2.company
set t1.industry = t2.industry
where t1.industry is null and t2.industry is not null;

select company, industry from stagging_layoffs2 where company = "Airbnb";

-- deleting null values
select * 
from stagging_layoffs2 
where total_laid_off is null and percentage_laid_off is null;

delete from stagging_layoffs2 
where total_laid_off is null and percentage_laid_off is null;

select * 
from stagging_layoffs2;

-- droping unwated column

alter table stagging_layoffs2
drop column row_num;

select * from stagging_layoffs2;