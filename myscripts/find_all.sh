#!/bin/bash

################################################################################
#
#                                   FIND_ALL 
#
# Search entire disc (except `/Volumes` directory) for a filename containing
# the supplied string. Optionally add string that must also be in path.
#
# @param string FA_SEARCH_TERM   (required) String that must appear in filename
# @param string FA_PATH_CONTAINS (optional) String that must appear in path
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
	1)  FA_SEARCH_TERM=$1
		;;
	*)  FA_SEARCH_TERM=$1
		FA_PATH_CONTAINS=$2
		;;
esac

# Change to root directory
cd / 

# Perform search in each directory, except `/Volumes`
for f in *
do
	if [ "$f" != 'Volumes' ]
	then
		find "$f" -name "$FA_SEARCH_TERM" 2>&1 | grep -v "find:" | grep --color=never "$FA_PATH_CONTAINS"
	fi
done

# Change back to original directory (suppress output)
cd - >/dev/null

# Clean up variables
unset FA_SEARCH_TERM
unset FA_PATH_CONTAINS

