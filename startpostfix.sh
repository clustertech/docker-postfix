#!/bin/bash

trap "postfix stop" SIGTERM
newaliases
rsyslogd
postfix check
/usr/libexec/postfix/master -d &
wait
