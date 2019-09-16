#!/bin/bash

trap "postfix stop" SIGTERM
rsyslogd
postfix check
/usr/libexec/postfix/master -d &
wait
