#!/bin/bash

# This script looks for the filename given on the command line throughout the
# system, except for in directories at the root level that start with 'V' (to
# avoid Volumes).

if [ $# -eq 0 ]; then
	echo No argument supplied. Exiting...
# 	kill -INT $$
	return 1
else
	SEARCH_TERM=$1
fi

echo ----switching to root directory----
cd / 

for f in [^V]*
	do find "$f" -name "$SEARCH_TERM" 2>&1 | grep -v "find:"
done

echo -e "\n"--returning to original directory--
cd -

