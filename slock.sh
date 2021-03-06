#!/bin/sh
# TODO add wait as parameter to set wait time
eval $(echo 'flags: w,wait screensaver,s;' | clparser "$@")
# if told to wait, sleep 2 seconds and check if the system has been idle for about 2 seconds
# if so check if the screensaver is required and if so check if its on and if all that exit
# if screensaver not required exit if idle for < 2 secs
[ $w ] && { sleep 5 && [ $(xssstate -i) -ge 4800 ] && [ ! $s ] || [ $(xssstate -s) = 'on' ] || exit; }
# otherwise just slock
slock $defaults
