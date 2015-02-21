#Code Book
This code book describes the variables, data and transformations performed in this course project.

##Background Information - Description of Dataset

###Human Activity Recognition Using Smartphones Dataset
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

##Transformation
###Merging the 'training' and 'test' datasets into a single dataset
The 'training' and 'test' datasets were merged into a single 'data.frame' containing the columns for 'Subject', the 'Activity_ID' and measurements containing 'mean() and 'std()'.

###Using descriptive activity names to name the activities in the data set.
A new column 'Activity' was created and its value assigned based on the value in the 'Activity_ID'.
The values are assigned based on the following:

Activity_ID | Activity
------------|----------
1 | WALKING
2 | WALKING_UPSTAIRS
3 | WALKING_DOWNSTAIRS
4 | SITTING
5 | STANDING
6 | LAYING

###Labelling the data set with descriptive variable names.  
The columns of the dataset were labelled with descriptive variable. Time domain signals were prefixed with `Time-domain` and frequency domain signals which calculated using Fast Fourier Transform (FFT) on the measurements were prefixed with `Freq-domain`. Mean and standard deviation values were denoted with `Mean` and `StdDev` in their column names respectively. `X`, `Y` and `Z` denote measurements made in the X-axis, Y-axis and Z-axis respectively.

The following 68 column names were defined in the data set:

1. Subject                                       
2. Time-domain-BodyAcc-Mean-X                    
3. Time-domain-BodyAcc-Mean-Y                    
4. Time-domain-BodyAcc-Mean-Z                    
5. Time-domain-BodyAcc-StdDev-X                  
6. Time-domain-BodyAcc-StdDev-Y                  
7. Time-domain-BodyAcc-StdDev-Z                  
8. Time-domain-GravityAcc-Mean-X                 
9. Time-domain-GravityAcc-Mean-Y                 
10. Time-domain-GravityAcc-Mean-Z                 
11. Time-domain-GravityAcc-StdDev-X               
12. Time-domain-GravityAcc-StdDev-Y               
13. Time-domain-GravityAcc-StdDev-Z               
14. Time-domain-BodyAccJerk-Mean-X                
15. Time-domain-BodyAccJerk-Mean-Y                
16. Time-domain-BodyAccJerk-Mean-Z                
17. Time-domain-BodyAccJerk-StdDev-X              
18. Time-domain-BodyAccJerk-StdDev-Y              
19. Time-domain-BodyAccJerk-StdDev-Z              
20. Time-domain-BodyGyro-Mean-X                   
21. Time-domain-BodyGyro-Mean-Y                   
22. Time-domain-BodyGyro-Mean-Z                   
23. Time-domain-BodyGyro-StdDev-X                 
24. Time-domain-BodyGyro-StdDev-Y                 
25. Time-domain-BodyGyro-StdDev-Z                 
26. Time-domain-BodyGyroJerk-Mean-X               
27. Time-domain-BodyGyroJerk-Mean-Y               
28. Time-domain-BodyGyroJerk-Mean-Z               
29. Time-domain-BodyGyroJerk-StdDev-X             
30. Time-domain-BodyGyroJerk-StdDev-Y             
31. Time-domain-BodyGyroJerk-StdDev-Z             
32. Time-domain-BodyAcc-Magnitude-Mean            
33. Time-domain-BodyAcc-Magnitude-StdDev          
34. Time-domain-GravityAcc-Magnitude-Mean         
35. Time-domain-GravityAcc-Magnitude-StdDev       
36. Time-domain-BodyAccJerk-Magnitude-Mean        
37. Time-domain-BodyAccJerk-Magnitude-StdDev      
38. Time-domain-BodyGyro-Magnitude-Mean           
39. Time-domain-BodyGyro-Magnitude-StdDev         
40. Time-domain-BodyGyroJerk-Magnitude-Mean       
41. Time-domain-BodyGyroJerk-Magnitude-StdDev     
42. Frequency-domain-BodyAcc-Mean-X               
43. Frequency-domain-BodyAcc-Mean-Y               
44. Frequency-domain-BodyAcc-Mean-Z              
45. Frequency-domain-BodyAcc-StdDev-X             
46. Frequency-domain-BodyAcc-StdDev-Y             
47. Frequency-domain-BodyAcc-StdDev-Z             
48. Frequency-domain-BodyAccJerk-Mean-X           
49. Frequency-domain-BodyAccJerk-Mean-Y           
50. Frequency-domain-BodyAccJerk-Mean-Z           
51. Frequency-domain-BodyAccJerk-StdDev-X         
52. Frequency-domain-BodyAccJerk-StdDev-Y         
53. Frequency-domain-BodyAccJerk-StdDev-Z         
54. Frequency-domain-BodyGyro-Mean-X              
55. Frequency-domain-BodyGyro-Mean-Y              
56. Frequency-domain-BodyGyro-Mean-Z              
57. Frequency-domain-BodyGyro-StdDev-X            
58. Frequency-domain-BodyGyro-StdDev-Y            
59. Frequency-domain-BodyGyro-StdDev-Z            
60. Frequency-domain-BodyAcc-Magnitude-Mean       
61. Frequency-domain-BodyAcc-Magnitude-StdDev     
62. Frequency-domain-BodyAccJerk-Magnitude-Mean   
63. Frequency-domain-BodyAccJerk-Magnitude-StdDev 
64. Frequency-domain-BodyGyro-Magnitude-Mean      
65. Frequency-domain-BodyGyro-Magnitude-StdDev    
66. Frequency-domain-BodyGyroJerk-Magnitude-Mean  
67. Frequency-domain-BodyGyroJerk-Magnitude-StdDev
68. Activity       

###Creating a second, independent tidy data set
A second, independent tidy data set with the average of each variable for each activity and each subject is required to be created. 
The data set is written to the text file `tidy_data.txt` in this course project. The original data frame was melt and cast using `Subject` and `Activity` as the fixed variable and averaging the rest of the variables. The `Avg-for` was prefixed to each of the variables. 

The following are the 68 variables in the tidy data set:

1. Subject      
2. Activity                                 
3. Avg-for-Time-domain-BodyAcc-Mean-X                    
4. Avg-for-Time-domain-BodyAcc-Mean-Y                    
5. Avg-for-Time-domain-BodyAcc-Mean-Z                    
6. Avg-for-Time-domain-BodyAcc-StdDev-X                  
7. Avg-for-Time-domain-BodyAcc-StdDev-Y                  
8. Avg-for-Time-domain-BodyAcc-StdDev-Z                  
9. Avg-for-Time-domain-GravityAcc-Mean-X                 
10. Avg-for-Time-domain-GravityAcc-Mean-Y                 
11. Avg-for-Time-domain-GravityAcc-Mean-Z                 
12. Avg-for-Time-domain-GravityAcc-StdDev-X               
13. Avg-for-Time-domain-GravityAcc-StdDev-Y               
14. Avg-for-Time-domain-GravityAcc-StdDev-Z               
15. Avg-for-Time-domain-BodyAccJerk-Mean-X                
16. Avg-for-Time-domain-BodyAccJerk-Mean-Y                
17. Avg-for-Time-domain-BodyAccJerk-Mean-Z                
18. Avg-for-Time-domain-BodyAccJerk-StdDev-X              
19. Avg-for-Time-domain-BodyAccJerk-StdDev-Y              
20. Avg-for-Time-domain-BodyAccJerk-StdDev-Z              
21. Avg-for-Time-domain-BodyGyro-Mean-X                   
22. Avg-for-Time-domain-BodyGyro-Mean-Y                   
23. Avg-for-Time-domain-BodyGyro-Mean-Z                   
24. Avg-for-Time-domain-BodyGyro-StdDev-X                 
25. Avg-for-Time-domain-BodyGyro-StdDev-Y                 
26. Avg-for-Time-domain-BodyGyro-StdDev-Z                 
27. Avg-for-Time-domain-BodyGyroJerk-Mean-X               
28. Avg-for-Time-domain-BodyGyroJerk-Mean-Y               
29. Avg-for-Time-domain-BodyGyroJerk-Mean-Z               
30. Avg-for-Time-domain-BodyGyroJerk-StdDev-X             
31. Avg-for-Time-domain-BodyGyroJerk-StdDev-Y             
32. Avg-for-Time-domain-BodyGyroJerk-StdDev-Z             
33. Avg-for-Time-domain-BodyAcc-Magnitude-Mean            
34. Avg-for-Time-domain-BodyAcc-Magnitude-StdDev          
35. Avg-for-Time-domain-GravityAcc-Magnitude-Mean         
36. Avg-for-Time-domain-GravityAcc-Magnitude-StdDev       
37. Avg-for-Time-domain-BodyAccJerk-Magnitude-Mean        
38. Avg-for-Time-domain-BodyAccJerk-Magnitude-StdDev      
39. Avg-for-Time-domain-BodyGyro-Magnitude-Mean           
40. Avg-for-Time-domain-BodyGyro-Magnitude-StdDev         
41. Avg-for-Time-domain-BodyGyroJerk-Magnitude-Mean       
42. Avg-for-Time-domain-BodyGyroJerk-Magnitude-StdDev     
43. Avg-for-Frequency-domain-BodyAcc-Mean-X               
44. Avg-for-Frequency-domain-BodyAcc-Mean-Y               
45. Avg-for-Frequency-domain-BodyAcc-Mean-Z              
46. Avg-for-Frequency-domain-BodyAcc-StdDev-X             
47. Avg-for-Frequency-domain-BodyAcc-StdDev-Y             
48. Avg-for-Frequency-domain-BodyAcc-StdDev-Z             
49. Avg-for-Frequency-domain-BodyAccJerk-Mean-X           
50. Avg-for-Frequency-domain-BodyAccJerk-Mean-Y           
51. Avg-for-Frequency-domain-BodyAccJerk-Mean-Z           
52. Avg-for-Frequency-domain-BodyAccJerk-StdDev-X         
53. Avg-for-Frequency-domain-BodyAccJerk-StdDev-Y         
54. Avg-for-Frequency-domain-BodyAccJerk-StdDev-Z         
55. Avg-for-Frequency-domain-BodyGyro-Mean-X              
56. Avg-for-Frequency-domain-BodyGyro-Mean-Y              
57. Avg-for-Frequency-domain-BodyGyro-Mean-Z              
58. Avg-for-Frequency-domain-BodyGyro-StdDev-X            
59. Avg-for-Frequency-domain-BodyGyro-StdDev-Y            
60. Avg-for-Frequency-domain-BodyGyro-StdDev-Z            
61. Avg-for-Frequency-domain-BodyAcc-Magnitude-Mean       
62. Avg-for-Frequency-domain-BodyAcc-Magnitude-StdDev     
63. Avg-for-Frequency-domain-BodyAccJerk-Magnitude-Mean   
64. Avg-for-Frequency-domain-BodyAccJerk-Magnitude-StdDev
65. Avg-for-Frequency-domain-BodyGyro-Magnitude-Mean      
66. Avg-for-Frequency-domain-BodyGyro-Magnitude-StdDev    
67. Avg-for-Frequency-domain-BodyGyroJerk-Magnitude-Mean
68. Avg-for-Frequency-domain-BodyGyroJerk-Magnitude-StdDev


 