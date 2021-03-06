#!/bin/sh
[ "$(pgrep -x stalonetray)" ] && p='^' || p='v'
case "$BLOCK_BUTTON" in
    1) [ $p = v ] && { setsid -f stalonetray && pkill -RTMIN+27 dwmblocks; } || { killall -e stalonetray; pkill -RTMIN+27 dwmblocks; };;
    2) "$TERMINAL" -e "$EDITOR" "$0" ;;
    '') printf $p;;
esac
