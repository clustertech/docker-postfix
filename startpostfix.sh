#!/bin/bash

if [[ ! -z $LOG_SOCKET ]]; then
  ln -s $LOG_SOCKET /dev/log
fi

trap "postfix stop" SIGTERM
newaliases
postfix check
/usr/libexec/postfix/master -d &
wait
