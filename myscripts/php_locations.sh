#!/bin/bash

################################################################################
#
#                               PHP_LOCATIONS         
#
# By default, search the entire disc (except the `Volumes` directory) for the
# location of all `config.ini` files whose path includes the system php
# version. You can also specify any other filename on the command line when
# calling the script.
#
# @param string SEARCH_TERM (optional) String that must appear in filename
#
# Example call: `. php_locations.sh xdebug.so`
#
################################################################################

# Check if we got any command-line arguments and set SEARCH_TERM accordingly
if [ $# -eq 0 ]; then
	SEARCH_TERM=php.ini
else
	SEARCH_TERM=$1
fi

# Parse the system's php version
PHP_VERSION=`php --version | sed -E -e 's/^PHP ([0-9.]*) .*/\1/' -e 's/^[CZ].*//'`
echo -e "\n"System PHP Version: "$PHP_VERSION""\n"

echo ----switching to root directory----
cd /
echo "$SEARCH_TERM" locations:

# Perform search in each folder in the root directory, except `/Volumes`
for f in *
do
	if [ "$f" != 'Volumes' ]
	then
		find "$f" -name "$SEARCH_TERM" 2>&1 | grep -v "find:" | grep --color=never "$PHP_VERSION"
	fi
done

echo -e "\n"--returning to original directory--
cd -

