#!/bin/bash

# Make sure the script is being executed with superuser privileges.
if [[ "${UID}" -ne 0 ]]
then
   echo 'Please run with sudo or as root.' >&2
   exit 1
fi

if [ "$#" -ne 3 ]; then
  echo "Changing the UID of a User and modify ownership of his files and directories."
  echo "Usage: changeUID.sh [username] [oldUID] [newUID]" >&2
  exit 1
fi

read -p "Changing the UID of user '$1' from $2 to $3. Proceed (y/n)? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  # check user
  USEREXISTS=$(cat /etc/passwd | grep -e "$1:[^:]*:$2" | wc -l)
  if [ "$USEREXISTS" -ne 1 ]; then
    echo "User '$1' with UID $2 not found in /etc/passwd"
    echo "Aborted"
    exit 1
  fi
  UIDEXISTS=$(cat /etc/passwd | grep -e "[^:]*:[^:]*:$3" | wc -l)
  if [ "$UIDEXISTS" -ne 0 ]; then
    echo "UID $3 already exists."
    echo "Aborted"
    exit 1
  fi
  # start modifiyng
  usermod -u $3 $1
  find / -user $2 -exec chown -h $3 {} \;
  exit 0
fi

echo "Aborted"
exit 1
