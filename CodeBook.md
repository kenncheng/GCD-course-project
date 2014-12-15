<h1>CodeBook for Tidying the UCI HAR Dataset</h1>

<h2>Background</h2>
<p>This CodeBook describes the data, the variables and transformations that were performed using script run_Analysis.R to clean up the UCI HAR Dataset and produce a tidy flat text called "tidy_data.txt" that can be read using a data.table for further analysis."</p>

<p>The UCI HAR Dataset represents data collected from the accelerometers from the Samsung Galaxy S smarthphone. The original data and full description is available at this link <a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones">UCI HAR Dataset</a>.</p>"

<p>As mentioned in the README.txt file that came with original data, the data comes from experiments that have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the 3-axial linear acceleration and 3-axial angular velocity were captured at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.</p>

<p>The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.</p>

<p>For each record in the dataset, there contains:</p>

<ul>
<li>Triaxial acceleration from the accelerometer and the estimated body acceleration.</li>
<li>Triaxial Angular velocity from the gyroscope.</li>
<li>A 561-feature vector with time and frequency domain variables.</li>
<li>Activity label.</li>
<li>An identifier of the subject who carried out the experiment.</li>
</ul>

<p>The run_Analysis.R script extracts a subset of the original data that contain the mean and standard deviation features for each of 33 processed signals.  This reduced data subset contains 66 features out of the original 561 original features. There are 10299 observations with 68 variables (includes the 66 extracted features, the subject identifier and activity label).</p>

<p>The data subset is further reduced by calculating the mean of the observations that is grouped by subject and activity pair, thus resulting in 180 observations (30 subjects x 6 activities) on 68 variables. This final tidy dataset "tidy_data.txt" can be obtained by running the R script run_Analysis.R which saves the ouptut in the current working directory.</p>

<h2>Filtering and renaming of variable names</h2>

<p>The tidying of the data involved using the following steps to filter and use more meaningful variable names</p> 

<img src="/Users/admin/Desktop/filter_code.jpg" alt="alt text" title=Title" />

<p>filtered_names <- features[filtered_feature_ids]</p>
<p>filtered_names <- gsub("\\(\\)", "", filtered_names)</p>
<p>filtered_names <- gsub("Acc", "-acceleration", filtered_names)</p>
<p>filtered_names <- gsub("Mag", "-Magnitude", filtered_names)</p>
<p>filtered_names <- gsub("BodyBody", "Body", filtered_names)</p>
<p>filtered_names <- gsub("(Jerk|Gyro)", "-\\1", filtered_names)</p>
<p>filtered_names <- gsub("^t(.*)$", "\\1-time", filtered_names)</p>
<p>filtered_names <- gsub("^f(.*)$", "\\1-frequency", filtered_names)</p>
<p>filtered_names <- tolower(filtered_names)</p>

<h2>Variable Names in the tidy data</h2>

<p>The tidy dataset contains 180 observations with 66 mean measurements, subject, activity.</p>

<h3>subject</h3>

<p>A numeric identifier from (1-30) of the subject who carried out the experiment.</p>

<h3>activity</h3>

<p>The activity labels have the following possible values.</h3>

<ul>
<li>'laying'.</li>
<li>'sitting'.</li>
<li>'standing'.</li>
<li>'walking'.</li>
<li>'walking_downstairs'.</li>
<li>'walking_upstairs'.</li>
</ul>

<h3>measurement</h3>

<p>The names of the measurement for which the mean is calculated, have the possible 66 values:</p>

<ul>
<li>"body-acceleration-mean-x-time"</li>
<li>"body-acceleration-mean-y-time"</li>
<li>"body-acceleration-mean-z-time"</li>
<li>"body-acceleration-std-x-time"</li>
<li>"body-acceleration-correlation-x,z-time"</li>
<li>"body-acceleration-correlation-y,z-time"</li>
<li>"gravity-acceleration-mean-x-time"</li>
<li>"gravity-acceleration-mean-y-time"</li>
<li>"gravity-acceleration-mean-z-time"</li>
<li>"gravity-acceleration-std-x-time"</li>
<li>"gravity-acceleration-correlation-x,z-time"</li>
<li>"gravity-acceleration-correlation-y,z-time"</li>
<li>"body-acceleration-jerk-mean-x-time"</li>
<li>"body-acceleration-jerk-mean-y-time"</li>
<li>"body-acceleration-jerk-mean-z-time"</li>
<li>"body-acceleration-jerk-std-x-time"</li>
<li>"body-acceleration-jerk-correlation-x,z-time"</li>
<li>"body-acceleration-jerk-correlation-y,z-time"</li>
<li>"body-gyro-mean-x-time"</li>
<li>"body-gyro-mean-y-time"</li>
<li>"body-gyro-mean-z-time"</li>
<li>"body-gyro-std-x-time"</li>
<li>"body-gyro-correlation-x,z-time"</li>
<li>"body-gyro-correlation-y,z-time"</li>
<li>"body-gyro-jerk-mean-x-time"</li>
<li>"body-gyro-jerk-mean-y-time"</li>
<li>"body-gyro-jerk-mean-z-time"</li>
<li>"body-gyro-jerk-std-x-time"</li>
<li>"body-gyro-jerk-correlation-x,z-time"</li>
<li>"body-gyro-jerk-correlation-y,z-time"</li>
<li>"body-acceleration-magnitude-arcoeff3-time"</li>
<li>"body-acceleration-magnitude-arcoeff4-time"</li>
<li>"gravity-acceleration-magnitude-arcoeff3-time"</li>
<li>"gravity-acceleration-magnitude-arcoeff4-time"</li>
<li>"body-acceleration-jerk-magnitude-arcoeff3-time"</li>
<li>"body-acceleration-jerk-magnitude-arcoeff4-time"</li>
<li>"body-gyro-magnitude-arcoeff3-time"</li>
<li>"body-gyro-magnitude-arcoeff4-time"</li>
<li>"body-gyro-jerk-magnitude-arcoeff3-time"</li>
<li>"body-gyro-jerk-magnitude-arcoeff4-time"</li>
<li>"body-acceleration-mean-x-frequency"</li>
<li>"body-acceleration-mean-y-frequency"</li>
<li>"body-acceleration-mean-z-frequency"</li>
<li>"body-acceleration-std-x-frequency"</li>
<li>"body-acceleration-bandsenergy-1,24-frequency"</li>
<li>"body-acceleration-bandsenergy-25,48-frequency"</li>
<li>"body-acceleration-jerk-mean-x-frequency"</li>
<li>"body-acceleration-jerk-mean-y-frequency"</li>
<li>"body-acceleration-jerk-mean-z-frequency"</li>
<li>"body-acceleration-jerk-std-x-frequency"</li>
<li>"body-acceleration-jerk-bandsenergy-1,24-frequency"</li>
<li>"body-acceleration-jerk-bandsenergy-25,48-frequency"</li>
<li>"body-gyro-mean-x-frequency"</li>
<li>"body-gyro-mean-y-frequency"</li>
<li>"body-gyro-mean-z-frequency"</li>
<li>"body-gyro-std-x-frequency"</li>
<li>"body-gyro-bandsenergy-1,24-frequency"</li>
<li>"body-gyro-bandsenergy-25,48-frequency"</li>
<li>"body-acceleration-magnitude-skewness-frequency"</li>
<li>"body-acceleration-magnitude-kurtosis-frequency"</li>
<li>"body-acceleration-jerk-magnitude-skewness-frequency"</li>
<li>"body-acceleration-jerk-magnitude-kurtosis-frequency"</li>
<li>"body-gyro-magnitude-skewness-frequency"</li>
<li>"body-gyro-magnitude-kurtosis-frequency"</li>
<li>"angle(y,gravitymean)"</li>
<li>"angle(z,gravitymean)"</li>
</ul>

<h3>mean</h3>

<p>The mean of the feature measurements</p>





