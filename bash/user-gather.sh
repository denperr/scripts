#!/bin/bash

# Define the directory to do the work in
temp_dir='data_gather'

 # Define the files to write to
priv_users='privileged-users'
filtered_users='filtered-privileged-users'
filtered_csv='filtered-privileged-users.csv'
log_file='user_info_gather.log'
ocm_log_file='ocm.log'
filter_file='filter-users.sh'
error_log='data_gather_error.log'

# Create the temporary directory and the file to write to
mkdir -p $temp_dir

# Check to make sure the directory is created
if [[ ! -d $temp_dir ]]; then
    echo
    echo "The process has failed!"
    echo "See 'data_gather_error.log' for more details."
    echo "The directory '$temp_dir' does not exist!" >> $error_log
    echo
    exit 1
else
    # Change directory into data_gather directory
    cp $filter_file $temp_dir
    cd $temp_dir

    # Setup log and privileged user files
    touch $log_file
    touch $priv_users

    echo "The environment has been successfully provisioned!" | ts '[%Y-%m-%d %H:%M:%S]' | tee -a $log_file
    echo

    # Get the user information from OCM
    echo "Gathering privileged user data from OCM..." | ts '[%Y-%m-%d %H:%M:%S]' | tee -a $log_file
    echo
    ocm account users -v 1 --roles="APPSRE,CSSRE,SREP,SREPAutomation,SREPLead,SuperAdmin,UHCSupport" > $priv_users 2>> $ocm_log_file
    sleep 15s
    echo "Privileged user data gather complete!" | ts '[%Y-%m-%d %H:%M:%S]' | tee -a $log_file
    echo
fi

# Run the separate bash scipt to get the non-banned users
echo "Filtering out banned users..." | ts '[%Y-%m-%d %H:%M:%S]' | tee -a $log_file
echo
./filter-users.sh $priv_users > $filtered_users
cp $filtered_users $filtered_csv
rm -rf $filtered_users
echo
echo "Users have been filtered." | ts '[%Y-%m-%d %H:%M:%S]' | tee -a $log_file
echo
sleep 3s
echo "The process has completed successfully!" | ts '[%Y-%m-%d %H:%M:%S]' | tee -a $log_file
echo

# Run the cleanup after a successful run
echo "Cleaning up..." | ts '[%Y-%m-%d %H:%M:%S]' | tee -a $log_file
echo
echo "Removing temp directory..." | ts '[%Y-%m-%d %H:%M:%S]' | tee -a $log_file
echo
rm -rf 'holding-'*
rm -rf $filter_file
echo "Clean up done!" | ts '[%Y-%m-%d %H:%M:%S]' | tee -a $log_file