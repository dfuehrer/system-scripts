#!/bin/sh
case "$BLOCK_BUTTON" in
    1) nmtray ;;
    2) edit "$0" ;;
    3) "$TERMINAL" -e ip a ;;
    '') timeout 0.05s dumbclient "$HOME"/.cache/dwmblocks/networkpercent/networkpercentfifoOut "$HOME"/.cache/dwmblocks/networkpercent/networkpercentfifoIn;;
esac
