==================================================================
Getting and Cleaning Data Coursera project 
Version 1.0
==================================================================
Craig Larmer, @craiglarmer 
==================================================================

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

==================================================================
The repo contains the following files
==================================================================
- 'README.md': this explanation

- 'CodeBook.md': an explanation of how the data was collected and description of the datasets

- 'run_analysis.R': The R script that generates the tidy_data.csv and tidy_summary.csv files

- 'tidy_data.csv': The data set tidied and cleaned

- 'tify_summary.csv': A summarised version of the tidy_data.csv dataset. 

==================================================================
Instructions for use:
==================================================================
1.  Download or clone the repository to a local directory
2.  Download the required raw data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
3.  Extract the contents of the zip file to the same directory as the R repository
4.  Open RStudio and set the working directory to the same directory as the R repository
5.  Execute the run_analysis.R script to generate the tidy data and summary