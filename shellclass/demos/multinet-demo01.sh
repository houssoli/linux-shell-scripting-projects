#!/bin/bash

# This script pings a list of servers and reports their status.

SERVER_LIST='/vagrant/servers'

if [[ ! -e "${SERVER_LIST}" ]]
then
  echo "Cannot open ${SERVER_LIST}." >&2
  exit 1
fi

for SERVER in $(cat ${SERVER_LIST})
do
  echo "Pinging ${SERVER}"
  ping -c 1 ${SERVER} &> /dev/null
  if [[ "${?}" -ne 0 ]]
  then
    echo "${SERVER} down."
  else
    echo "${SERVER} up."
  fi
done
