#!/bin/bash

# This script demonstrates the case statement.

# Instead of an if statement like this, consider using a case statement instead.
# if [[ "${1}" = 'start' ]]
# then
#   echo 'Starting.'
# elif [[ "${1}" = 'stop' ]]
# then
#   echo 'Stopping.'
# elif [[ "${1}" = 'status' ]]
# then
#   echo 'Status:'
# else
#   echo 'Supply a valid option.' >&2
#   exit 1
# fi

# This ideal format of a case statement follows.
# case "${1}" in
#   start)
#     echo 'Starting.'
#     ;;
#   stop)
#     echo 'Stopping.'
#     ;;
#   status|state|--status|--state)
#     echo 'Status:'
#     ;;
#   *)
#     echo 'Supply a valid option.' >&2
#     exit 1
#     ;;
# esac


# Here is a compact version of the case statement.
case "${1}" in
  start) echo 'Starting.' ;;
  stop) echo 'Stopping.' ;;
  status) echo 'Status:' ;;
  *)
    echo 'Supply a valid option.' >&2
    exit 1
    ;;
esac

