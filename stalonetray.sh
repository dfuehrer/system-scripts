#!/bin/sh
[ "$(pgrep -x stalonetray)" ] && p='^' || p='v'

# using tr to get rid of every control character in the name cause its used in dwmblocks to decide which block is which
geometry="1x1+$(( 1920-$(xwininfo -root | sed -n 's/^.*id: 0x.*"\(.*\)"/\1/p' | tr -d '[:cntrl:]' | wc -L)*8 ))+20"
case "$BLOCK_BUTTON" in
    1) [ $p = v ] && { setsid -f stalonetray --geometry $geometry && pkill -RTMIN+27 dwmblocks; } || { killall -e stalonetray; pkill -RTMIN+27 dwmblocks; };;
    2) edit "$0" ;;
    '') printf $p;;
esac
