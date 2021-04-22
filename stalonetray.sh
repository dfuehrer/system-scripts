#!/bin/sh
[ "$(pgrep -x stalonetray)" ] && p='^' || p='v'

# using tr to get rid of every control character in the name cause its used in dwmblocks to decide which block is which
geometry="1x1+$(( 1920-$(xwininfo -root | sed -n 's/^.*id: 0x.*"\(.*\)"/\1/p' | tr -d '\01\02\03\04\05\06\07\010\011\012\013\014\015\016\017\020\021\022\023\024\025\026\027\030\031\032\033\034\035\036\037' | wc -m)*8-8-4 ))+20"
case "$BLOCK_BUTTON" in
    1) [ $p = v ] && { setsid -f stalonetray --geometry $geometry && pkill -RTMIN+27 dwmblocks; } || { killall -e stalonetray; pkill -RTMIN+27 dwmblocks; };;
    2) edit "$0" ;;
    '') printf $p;;
esac
