#!/bin/bash

################################################################################
#
#                                   FIND_ALL 
#
# Search entire disc (except `/Volumes` directory) for a filename containing
# the supplied string. Optionally add string that must also be in path.
#
# @param string searchTerm   (required) String that must appear in filename
# @param string pathContains (optional) String that must appear in path
#
# Example call: `. find_all.sh php.ini /MAMP/`
#
################################################################################

# Check how many command-line arguments were supplied. If none, exit.
# Otherwise set variables accordingly
case $# in
	0)  echo No argument supplied. Exiting... 
		return 1
		;;
	1)  searchTerm=$1
		;;
	*)  searchTerm=$1
		pathContains=$2
		;;
esac

# Change to root directory
cd / 

# Perform search in each directory, except `/Volumes`
for f in *
do
	if [ "$f" != 'Volumes' ]
	then
		find "$f" -name "$searchTerm" 2>&1 | grep -v "find:" | grep --color=never "$pathContains"
	fi
done

# Change back to original directory (suppress output)
cd - >/dev/null

# Clean up variables
unset searchTerm
unset pathContains

