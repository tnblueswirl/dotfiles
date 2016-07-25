#!/bin/bash

################################################################################
#
#                               PHP_LOCATIONS         
#
# By default, search the entire disc (except `/Volumes` directory) for the
# location of all `config.ini` files whose path includes the system php
# version. You can also specify any other filename on the command line when
# calling the script.
#
# @param string searchTerm (optional) String that must appear in filename
#     or a shell pattern surrounded in quotes
#
# Example calls: `. php_locations.sh xdebug.so`
#                `. php_locations.sh '*.ini'`
#
################################################################################

(  # Run as subprocess by enclosing in parentheses

# Check for command-line arguments and set searchTerm accordingly
if [ $# -eq 0 ]
then
	searchTerm=php.ini
else
	searchTerm=$1
fi

# Parse the system's php version
phpVersion=`php --version | sed -E -e 's/^PHP ([0-9.]*) .*/\1/' -e 's/^[CZ].*//'`
echo -e "\n"System PHP Version: "$phpVersion""\n"

# Change to root directory
cd /
echo "$searchTerm" locations:

# Perform search in each directory, except `/Volumes`
for f in *
do
	if [ "$f" != 'Volumes' ]
	then
		find -E "$f" -name "$searchTerm" 2>&1 | grep -v "find:" | grep --color=never "$phpVersion"
	fi
done

# Change back to original directory (suppress output)
cd - > /dev/null

)  # End of script

