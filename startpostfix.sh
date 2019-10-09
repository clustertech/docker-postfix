#!/bin/bash

trap "postfix stop" SIGTERM
rsyslogd
newaliases
postfix check
/usr/libexec/postfix/master -d &
wait
