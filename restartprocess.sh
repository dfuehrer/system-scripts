#!/bin/sh
clargs='flags: h,help; parameters: s,sig;'
eval "$(echo "$clargs" | clparser -- "$@")" || exit
#echo $s "$defaults" $(pgrep $defaults) | tee -a ~/rp.txt
# TODO this is lazy so change it, dont really need to do this for all but whatever
#[ "$(pgrep ${defaults% *})" ] && echo its already handled im good || { echo gonna start "$defaults" && "$defaults"; } &
#baseprog="${defaults%% *}"
baseprog="$1"
echo "$baseprog"
if [ -z "$(pgrep -x $baseprog)" ]; then
    echo starting $@ since it isnt running
    # i would use exec or just & but setsid -f seems to let the process be separate from entr so that it doesnt get killed with it or every time the file changes, which is better for daemons i always want running
    setsid -f "$@"
    #exec "$@"
    exit
fi
if [ -n "$s" ]; then
    echo "using sig" "$s"
    # killing with signal, not restarting because it should reload itself
    killall -s "$s" "$baseprog"
else
    # killing and restarting process
    echo "killing all"
    killall "$baseprog"
    setsid -f "$@"
    #exec "$@"
fi
#echo done >> ~/rp.txt
