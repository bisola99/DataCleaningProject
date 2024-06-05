# DataCleaningProject
 ## Data Source and Tools Used

Welcome to the Data Cleaning Project! In this project, This project aimed to clean and prepare a dataset obtained from a source recommended by Alex the Analyst on YouTube. [Download the dataset here!](https://github.com/AlexTheAnalyst/MySQL-YouTube-Series/blob/main/layoffs.csv)  Alternatively, the file will also be uploaded to this project's GitHub page. Additionally, a script containing all the SQL codes used for data cleaning is included in the repository.

![Screenshot 2024-05-30 152542](https://github.com/bisola99/DataCleaningProject/assets/123836101/d7e570ea-a38b-410e-8068-6afffce309c4)

 Using MySQL as the primary tool, the data was meticulously processed to ensure its quality and reliability for further analysis.

The goals were to demonstrate the importance of cleaning data before using it for any analysis and to outline the various steps needed to ensure a high-quality, clean dataset. This project aims to help understand the data cleaning process and inspire confidence in tackling data projects.


## Data Cleaning Steps/Process
This section outlines the steps taken to clean and prepare the dataset for analysis, ensuring data quality and consistency.

### Staging Table Creation:
A staging table named layoff_staging2 was created based on the structure of the original layoffs table. 
This allowed working with a duplicate copy of the data without altering the original dataset.

<img width="503" alt="image" src="https://github.com/bisola99/DataCleaningProject/assets/123836101/b31b4f2f-26d0-4793-87b4-c59bda299848">


### Removing Duplicates:
- Utilizing a common table expression (CTE), duplicate rows were identified and removed from the staging table based on multiple columns. 
- This ensured that each entry in the dataset was unique and accurate.

<img width="504" alt="image" src="https://github.com/bisola99/DataCleaningProject/assets/123836101/db066721-4114-4d20-8e4c-70cddcbee73c">

<img width="512" alt="image" src="https://github.com/bisola99/DataCleaningProject/assets/123836101/4a6cde97-2c6b-4804-8246-2d523a30737c">

<img width="508" alt="image" src="https://github.com/bisola99/DataCleaningProject/assets/123836101/84b5446d-dcd3-4b33-9aa0-c3fb2f46534a">




### Standardizing Data:
To standardize the data, several aspects were focused on:

- Leading and trailing whitespaces were trimmed from the company column to ensure consistency.
- Entries in the industry column related to the cryptocurrency industry were updated to "Crypto" for uniformity.
- Country names were standardized by removing trailing periods and ensuring consistent capitalization.

<img width="509" alt="image" src="https://github.com/bisola99/DataCleaningProject/assets/123836101/eb2705f1-2ad6-4dd5-aba6-c9e73d868447">
<img width="511" alt="image" src="https://github.com/bisola99/DataCleaningProject/assets/123836101/7d11cb4f-e074-4a28-a89f-4c4a74323858">
<img width="507" alt="image" src="https://github.com/bisola99/DataCleaningProject/assets/123836101/c19442e7-f261-4d92-9760-7fa702aa0d0b">



### Removing Null Values & Blanks:
Null values and blank entries in the dataset were addressed:

- Identified and handled null values in the total_laid_off and percentage_laid_off columns.
- Corrected null or blank entries in the industry column by setting them to null or updating them based on non-null values from other rows with the same company name.
- Removed rows with null values for total_laid_off and percentage_laid_off to maintain data integrity.

<img width="509" alt="image" src="https://github.com/bisola99/DataCleaningProject/assets/123836101/52d57f4c-402e-436e-bbec-ef8231d135d4">
<img width="512" alt="image" src="https://github.com/bisola99/DataCleaningProject/assets/123836101/812572b6-59b4-4ca0-805f-d475f6e7073a">


### Removing Columns and Rows:
Finally, the dataset was refined by removing unnecessary columns and rows:

- Deleted rows where both total_laid_off and percentage_laid_off were null.
- Dropped the row_num column, which was used for identifying duplicates, to streamline the table structure.

<img width="509" alt="image" src="https://github.com/bisola99/DataCleaningProject/assets/123836101/f27bf963-510c-4085-8d4b-e789358fe983">

## Project Results

All data cleaning tasks were successfully completed. The dataset is now free from duplicates, standardized, and devoid of null values or unnecessary entries. It is ready for further analysis and insights.

## Conclusion

In conclusion, this project demonstrated the importance of thorough data cleaning in ensuring the reliability and usability of datasets for analysis. By following a systematic approach and leveraging MySQL as the tool, the dataset was effectively cleaned and prepared for future analysis and decision-making processes.

