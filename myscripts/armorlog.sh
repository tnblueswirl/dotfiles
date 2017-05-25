#!/bin/bash

################################################################################
#                                                                              #
#                                   ARMORLOG                                   #
#                                                                              #
# Tail today's application log. If it does not exist, make it, then tail it.   #
#                                                                              #
# PARAMETER 1:  integer  The negative offset from GMT in hours. If not         #
#                        provided, defaults to Pacific Time.                   #
#                                                                              #
################################################################################

# Did we get a specified offset?
if [[ $# = 0 ]]; then
  # No?, just use Pacific Time (currently -7; adjust as necessary)
  time_adjust=7
else
  time_adjust="$1"
fi

desired_file="application-$(date -u -j -v "-${time_adjust}H" "+%Y-%m-%d").log"

if [ ! -e "./${desired_file}" ]; then
  touch "${desired_file}"
fi

tail -600f "${desired_file}"

unset desired_file
unset time_adjust
