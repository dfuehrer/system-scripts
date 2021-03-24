#!/bin/sh
[ "$(pgrep -x stalonetray)" ] && p='^' || p='v'
geometry="1x1+$(( 1920-$(xwininfo -root | sed -n 's/^.*id: 0x.*"\(.*\)"/\1/p' | ansifilter | wc -m)*8+4-8 ))+20"
case "$BLOCK_BUTTON" in
    1) [ $p = v ] && { setsid -f stalonetray --geometry $geometry && pkill -RTMIN+27 dwmblocks; } || { killall -e stalonetray; pkill -RTMIN+27 dwmblocks; };;
    2) "$TERMINAL" -e "$EDITOR" "$0" ;;
    '') printf $p;;
esac
