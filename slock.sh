#!/bin/sh
eval $(echo 'flags: w,wait screensaver,s; parameters: t,wait-time=5 T,sleep-time=10m;' | clparser "$@")
# if told to wait, sleep 5 seconds and check if the system has been idle for about 5 seconds
# if so check if the screensaver is required and if so check if its on and if all that exit
# if screensaver not required exit if idle for < 2 secs
time_ms=$((wait_time * 1000))
if [ $w ]; then
    sleep 5
    [ $(xssstate -i) -ge $((time_ms * 19/20)) ] && [ ! $s ] || [ $(xssstate -s) = 'on' ] || exit
fi
# TODO add something to make this go to sleep after some amount of time
echo $sleep_time
sleep "$sleep_time" && systemctl suspend &
sleep_pid="$!"
trap "kill $sleep_pid" EXIT
# otherwise just slock
slock $defaults
