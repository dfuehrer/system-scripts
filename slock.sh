#!/bin/sh
eval $(echo 'flags: w,wait screensaver,s; parameters: t,wait-time=5 T,sleep-time=10m;' | clparser -- "$@")
# if told to wait, sleep 5 seconds and check if the system has been idle for about 5 seconds
# if so check if the screensaver is required and if so check if its on and if all that exit
# if screensaver not required exit if idle for < 2 secs
time_ms=$((wait_time * 1000))
echo wait_time: $wait_time
echo time_ms: $time_ms
echo sleep_time: $sleep_time
echo args: "$@"
if $wait; then
    sleep ${wait_time}s
    #[ $(xssstate -i) -ge $((time_ms * 19/20)) ] && ! $screensaver || [ $(xssstate -s) = 'on' ] || exit
    #xssstate -i
    if [ $(xssstate -i) -le $((time_ms - 100)) ] || { $screensaver && [ $(xssstate -s) != 'on' ]; }; then
        [ $(xssstate -i) -le $((time_ms - 100)) ] && echo idle time less than wait time
        $screensaver && [ $(xssstate -s) != 'on' ] && echo screen saver $(xssstate -s) and need screensaver $screensaver
        echo exiting
        exit
    fi
fi
# TODO add something to make this go to sleep after some amount of time
echo $sleep_time
sleep "$sleep_time" && systemctl suspend &
sleep_pid="$!"
trap "kill $sleep_pid" EXIT
# otherwise just slock
slock "$@"
