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

for f in *
do
	if [ "$f" != 'Volumes' ]
	then
		find "$f" -name "$FA_SEARCH_TERM" 2>&1 | grep -v "find:" | grep --color=never "$FA_PATH_CONTAINS"
	fi
done

# Change back to original directory (and suppress output of directory to stdout)
cd - >/dev/null

# Clean up our variables
unset FA_SEARCH_TERM
unset FA_PATH_CONTAINS

