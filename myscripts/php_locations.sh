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
# @param string PL_SEARCH_TERM (optional) String that must appear in filename
#
# Example call: `. php_locations.sh xdebug.so`
#
################################################################################

# Check if we got any command-line arguments and set PL_SEARCH_TERM accordingly
if [ $# -eq 0 ]; then
	PL_SEARCH_TERM=php.ini
else
	PL_SEARCH_TERM=$1
fi

# Parse the system's php version
PL_PHP_VERSION=`php --version | sed -E -e 's/^PHP ([0-9.]*) .*/\1/' -e 's/^[CZ].*//'`
echo -e "\n"System PHP Version: "$PL_PHP_VERSION""\n"

echo ----switching to root directory----
cd /
echo "$PL_SEARCH_TERM" locations:

# Perform search in each folder in the root directory, except `/Volumes`
for f in *
do
	if [ "$f" != 'Volumes' ]
	then
		find "$f" -name "$PL_SEARCH_TERM" 2>&1 | grep -v "find:" | grep --color=never "$PL_PHP_VERSION"
	fi
done

echo -e "\n"--returning to original directory--
cd -

# Clean up our variables
unset PL_SEARCH_TERM
unset PL_PHP_VERSION

