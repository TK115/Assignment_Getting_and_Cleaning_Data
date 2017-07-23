---
title: "Code Book"
author: "Till Kischkat"
date: "23/07/2017"
output: md_document
---

Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals TimeAcc_XYZ and TimeGyro_XYZ. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (TimeBodyAcc_XYZ and TimeGravityAcc_XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (TimeBodyAccJerk-XYZ and TimeBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (TimeBodyAccMag, TimeGravityAccMag, TimeBodyAccJerkMag, TimeBodyGyroMag, TimeBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing FourierBodyAcc_XYZ, FourierBodyAccJerk_XYZ, FourierBodyGyro_XYZ, FourierBodyAccJerkMag, FourierBodyGyroMag, FourierBodyGyroJerkMag. (Note the 'Fourier' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'_XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

TimeBodyAcc_XYZ
TimeGravityAcc_XYZ
TimeBodyAccJerk_XYZ
TimeBodyGyro_XYZ
TimeBodyGyroJerk_XYZ
TimeBodyAccMag
TimeGravityAccMag
TimeBodyAccJerkMag
TimeBodyGyroMag
TimeBodyGyroJerkMag
TimeBodyAcc_XYZ
TimeBodyAccJerk_XYZ
TimeBodyGyro_XYZ
TimeBodyAccMag
TimeBodyAccJerkMag
TimeBodyGyroMag
TimeBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean: Mean value
std: Standard deviation
meanFreq: Weighted average of the frequency components to obtain a mean frequency
