# Get_Clean_Data
This repo is part of the Getting and Cleaning JHU Coursera Final Project

Repo contains:
  This readme file - outlining analysis and files
  run_analysis.R - main script to ingest, clean and create tidy data set
  run_analysis_out.txt - output of tidy data set in text format
  CodeBook.md - codebook of variables in output file

This work pulls on the data from the Human Activity Recognition Using Smartphones program
which captured sensor data for 30 subjets while walking, walking upstairs, walking downstairs,
sitting, standing and laying.  For each subject and each activity, the following data was captured:

  - Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
  - Triaxial Angular velocity from the gyroscope. 
  - A 561-feature vector with time and frequency domain variables. 
  - Its activity label. 
  - An identifier of the subject who carried out the experiment.

The run_Analysis.R file reads in three ets of data from both a training and a test set.  Each group of files
contains the raw measurement data, a label file and a subject identifier file.  Activity code tables and
feature labels are also read in. 

The data is merged into a single file, with label names cleaned, coded variables labeled and averages calculated
for each of the mean and standard deviation measurements.  This cleaned data is then collapsed by subject and
activity to show only the average of each measurement.  The resulting data frame is saved in the run.Analysis_out.txt 
file.
