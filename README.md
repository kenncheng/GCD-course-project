<h1>Analysis of the UCI HAR Dataset</p>

<This repo contains an R script that was used on the UCI HAR Dataset to obtain a tidy data set.</p>

<h2>Objectives of the analysis</h2>

<p>Create a R script called run_analysis.R that does the following<p>

<ul>
<li>Merges the training and the test sets to create one data set.</li>
<li>Extracts only the measurements on the mean and standard deviation for each measurement. </li>
<li>Uses descriptive activity names to name the activities in the data set</li>
<li>Appropriately labels the data set with descriptive variable names.</li>
<li>From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.</li>
<ul>

<h2>R Code</h2>

<p>The R code that is used for the analysis is called run_Analysis.R</p>

<p>The R code is applied to the UCI HAR Dataset which has been downloaded to the working directory<p>

<p>The output of the R code is stored in a file called "tidy_data.txt"</p>

<h2>The general steps are outlined as follows:</h2>

<p>The run_Analysis.R script requires installing the dplyr and tidyr packages.</p>

<p>The training and test data were separately extracted by combining the subject, activity and features from the original data and then both data sets were merged together.</p>

<p>Then a subset of the merged data with feature variables containing the mean or standard deviation were selected.</p>

<p>Descriptive activity names were assigned to the activities in the resulting dataset.</p>

<p>The appropriate labelling of the data set with descriptive variables were done using a sequence of "gsub" and "tolower" functions to filter and use more meaningful variable names.</p> 

<p>A table frame was created and summarized by the mean function on the measurements, by subject and activity.</p>

<p>The final tidy data set was saved as "tidy_data.txt" file in the working directory.</p>

<h2>Data CodeBook</h2>

<p>The <a href="https://github.com/kenncheng/GCD-course-project/blob/master/CodeBook.md"> codebook</a> for this repo describes the variables, the data, and transformations that was performed to clean up the data</p>

