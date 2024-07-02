#!/bin/bash


# Check if the provided argument is a path to a directory
# If it is a path to a directory proceed with the calculations
if [ -d $1 ]; then
	# This is how the calculations are done:
	# 1st list the present files in the provided directory with details (-l)
	# 2nd pipe to grep to search the beginning of the lines for "d" (directory), "-" (regular file), or "l" (symbolic link)
	# 3rd pipe to wc (word count) to count the number of lines (-l) that satisfy the condition provided to grep
	
	# Calculate the number of directories in the provided directory
	directories=`ls $1 -l | grep ^d | wc -l`
	
	# Calculate the number of regular files in the provided directory
	files=`ls $1 -l | grep ^- | wc -l`
	
	# Calculate the number of symbolic links in the provided directory
	links=`ls $1 -l | grep ^l | wc -l`
	
	# Display the calculated number of files
	echo Number of directories: $directories directories
	echo Number of regular files: $files files
	echo Number of symbolic links: $links symbolic links


# If the provided argument is not a path to a directory, check if the path exists
# If the path exists display a message
elif [ -e $1 ]; then
	echo "The provided path is not a directory."


# Else, the path does not exist, display a message
else
	echo "The provided path does not exist."


fi

