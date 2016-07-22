#!/bin/bash

# By default, this script shows the location of all of the config.ini files on
# this machine whose path includes the system php version. You can also specify
# any other file name on the command line when calling the script.
#
# Folders at the root level that start with 'V' are skipped, this is because I
# wanted to avoid searching the /Volumes folder.
#
# Example: `. php_locations.sh xdebug.so`

# Check if we got any command line arguments and set SEARCH_TERM accordingly
if [ $# -eq 0 ]; then
	SEARCH_TERM=php.ini
else
	SEARCH_TERM=$1
fi

# Parse the system's php version
PHP_VERSION=`php --version | sed -E -e 's/^PHP ([0-9.]*) .*/\1/' -e 's/^[CZ].*//'`
echo -e "\n" System PHP Version: "$PHP_VERSION" "\n"

echo ----switching to root directory----
cd /
echo "$SEARCH_TERM" locations:

# For each folder in the root directory, except those that start with 'V',
# perform search
for f in [^V]*
	do find "$f" -name "$SEARCH_TERM" 2>&1 | grep -v "find:" | grep --color=never "$PHP_VERSION"
done

echo -e "\n"--returning to original directory--
cd -

