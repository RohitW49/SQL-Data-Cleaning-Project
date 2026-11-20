
# Layoffs Data Cleaning | SQL (MySQL)

**Cleaning and transforming real-world layoffs data using MySQL.**

## 📌 Project Overview

This project focuses on cleaning a raw layoffs dataset using MySQL. The objective is to identify and resolve data quality issues, including duplicate records, missing values, inconsistent text, and incorrect data types, to prepare the dataset for further analysis.

## 📊 Dataset Overview

| Metric | Details |
|---|---:|
| Total Records | 2,361 |
| Total Columns | 9 |
| Exact Duplicate Rows | 5 |
| Database | MySQL |
| Tool | MySQL Workbench |

## 🔍 Data Cleaning Process

- **Data Exploration:** Examined records, columns, and data types.
- **Staging Tables:** Created staging tables to preserve the original dataset.
- **Duplicate Removal:** Identified and removed duplicates using `ROW_NUMBER()` and CTEs.
- **Text Standardization:** Removed unwanted spaces using `TRIM()` and standardized industry and country values.
- **Date Conversion:** Converted text-based dates into DATE format using `STR_TO_DATE()`.
- **NULL Handling:** Identified missing values and converted empty strings into NULL.
- **Missing Data Recovery:** Used self-joins to populate missing industry values.
- **Record Removal:** Removed records where both layoff measures were NULL.
- **Final Cleanup:** Removed temporary columns and validated the cleaned dataset.

## 🛠️ SQL Skills Demonstrated

`CTEs` | `Window Functions` | `ROW_NUMBER()` | `JOINS` | `TRIM()` | `UPDATE` | `DELETE` | `STR_TO_DATE()` | `ALTER TABLE`

## 📁 Project Structure

```text
Layoffs-Data-Cleaning/
│
├── Dataset/
│   └── layoffs.csv
│
├── SQL/
│   └── layoffs_data_cleaning.sql
│
├── Screenshots/
│   ├── 01_data_exploration.png
│   ├── 02_duplicate_detection.png
│   ├── 03_data_standardization.png
│   ├── 04_null_handling.png
│   └── 05_final_validation.png
│
└── README.md
```

## 📸 Project Screenshots

### 1. Data Exploration
<!-- Add data exploration screenshot here -->

### 2. Duplicate Detection & Removal
<!-- Add duplicate detection screenshot here -->

### 3. Data Standardization
<!-- Add standardization screenshot here -->

### 4. NULL Value Handling
<!-- Add NULL handling screenshot here -->

### 5. Final Data Validation
<!-- Add final validation screenshot here -->

## 📈 Key Outcomes

- Identified 5 exact duplicate records.
- Standardized inconsistent industry and country values.
- Converted text-based dates into proper DATE format.
- Handled missing and empty values.
- Recovered missing industry information using self-joins.
- Created a cleaned staging table while preserving the original dataset.

**Requirement:** MySQL 8.0 or later.

## 💡 Key Learning

Gained practical experience in SQL-based data cleaning, data standardization, duplicate removal, NULL handling, window functions, CTEs, and joins.

---

**Project Type:** Data Cleaning & Data Preparation  
**Database:** MySQL  
**IDE:** MySQL Workbench  
**Author:** Rohit Wagh
