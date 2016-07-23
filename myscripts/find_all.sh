#!/bin/bash

################################################################################
#
#                                   FIND_ALL 
#
# Search entire computer, except root folders that start with 'V' (to avoid    
# `/Volumes`), for a filename containing supplied string. Optionally add string
# that must also be in path.
#
# @param string SEARCH_TERM   (required) String that must appear in filename
# @param string PATH_CONTAINS (optional) String that must appear in path
#
# Example call: `. find_all.sh php.ini /MAMP/`
#
################################################################################

case $# in
	0)  echo No argument supplied. Exiting... 
		return 1
		;;
	1)  SEARCH_TERM=$1
		;;
	*)  SEARCH_TERM=$1
		PATH_CONTAINS=$2
		;;
esac


echo ----switching to root directory----
cd / 

for f in [^V]*
	do find "$f" -name "$SEARCH_TERM" 2>&1 | grep -v "find:" | grep --color=never "$PATH_CONTAINS"
done

echo -e "\n"--returning to original directory--
cd -

