#!/bin/bash

set -e

echo "Starting with UID : $USER_ID"
if [ "$USER" ]; then
  if [ -z "$USER_ID" ]; then
    echo >&2 'error: missing USER_ID environment variable.  This is the uid of the user the slave/agent jenkins is running on'
    exit 1
  fi
  if [ -z "$GROUP_ID" ]; then
    echo >&2 'error: missing GROUP_ID environment variable.  This is the uid of the user the slave/agent jenkins is running on'
    exit 1
  fi
  groupadd -r -g $GROUP_ID $USER 
  useradd -u $USER_ID -g $GROUP_ID $USER
  if [ "USER_GIT_CONFIG" ]; then
    printf "$USER_GIT_CONFIG" > /home/${USER}/.gitconfig
  fi
fi

exec /usr/bin/gosu $USER "$@"
