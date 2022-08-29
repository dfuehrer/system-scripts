#!/bin/sh
clargs='flags: h; parameters: s,sig;'
eval $(echo "$clargs" | clparser "$@")
[ $h ] && echo $clargs && exit
#echo $s "$defaults" $(pgrep $defaults) | tee -a ~/rp.txt
# TODO this is lazy so change it, dont really need to do this for all but whatever
#[ "$(pgrep ${defaults% *})" ] && echo its already handled im good || { echo gonna start "$defaults" && "$defaults"; } &
baseprog="${defaults%% *}"
echo "$baseprog"
[ -z "$(pgrep $baseprog)" ] && echo "i shouldnt be doing this" && $defaults &
[ $s ] && { echo "using sig" "$s" && pkill "$baseprog" -"$s"; } || { echo "killing all" && killall $baseprog; setsid -f $defaults; }
#echo done >> ~/rp.txt
