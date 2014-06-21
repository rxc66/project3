project3
========

Getting and Cleaning Data project
Approach:
1 - Codified the download process
Here I did not create a function since the instructions seemed to indicate no variables, but I probably would make this more generic.  Here I create a directory 'project3' if it doesn't already exist and download and unzip all the project files here.  I also set the working directory to the directory of the unzipped data set.
2 - Read in and manipulate descriptive data
Here I read in both the activity labels and the features.  The features require clean descriptions so I remove parentheses and replace commas and dashes with underscores since they are more standard in dealing with column descriptions.
3 - Read in test and training data sets and add column names and descriptive labels
Here I read in training data first, add column names for the features and get the activity labels, then use a column bind to bring all the training sets together.  I then do the same for the test sets.  
4 - Merge data sets
Here I use rbind to merge the final training and test data sets.
5 - Create tidy final set
Here I use the aggregate function to create a data frame that groups on subject id and activity description.  Then I use the order function to make the data more 'tidy'.
