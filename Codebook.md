Variables Created:

file_url - character vector contains the URL of the zip file
dest_file - character vector contains the name used once the file is downloaded
subDir - character vector contains the directory name where all files will be downloaded

activity_labels - data frame containing all activity descriptions (sourced from activity_labels.txt)
features - data frame containing all features (sourced from features.txt)
train_y and test_y - data frames read from training data set "y_train" and "y_test"
train_y_full and test_y_full - ty data frame joined to  activity_labels data frame
train_x and test_x - data frames read from 'X_train' and 'X_test'
train_subj and test_subj - data frames read from 'subject_train' and 'subject_test'
train_cols and test_cols - numeric vectors containing the index of subject_id, activity_description and all columns with 'mean' or 'std'
train_final and test_final - data frame containing only columns described above
all_final - merged data set of the train and test final data sets

tidy - aggregated data frame of averages grouped by subject and activity description
final_tidy - aggregated data frame of tidy that is sorted
