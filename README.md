# Getting-and-Cleaning-Data
John Hopkins course

## Part 0 - Downloading the data

Data is taken from the website https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
Extracted the data on 4/19/2019
Additional information on dataset is here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  
Readme file of ZIP contains variable descriptions

## Part 1 - Data Preperation
Training datasets are split into 3 parts, they're then combined into 1 dataset - the same is done
with the test dataset.  
Datasets are labelled train and test respectively. The datasets are then appended together

#Part 2 - Measurement Extraction
File containing feature descriptions are scanned for columns that contain mean() or std()
in their names. The element locations are then saved. Element locations are incremented to match the structure of the merged dataset in part 1. Data is then combined containing only the elements of interest, the test subject no. and the y variable

## Part 3 - Activity Labelling
Activity labels are extracted and renamed for easier reference.
These are merged onto the main dataset by the key/ y-variable

## Part4 - Feature Names Labelling
Feature names are extracted and then changed from factor to character.
This is so that the actual names are in the vector.
Names are then selected, keeping in mind the non variable columns.

## Part5 - Summarizing data to create tidy data dataset
Using DPLYR package, the data is grouped and summarized to grab the average variable figure.
The names are adjusted so that "average of" are added to the calculated figures.
Group-by variables are unchanged.
