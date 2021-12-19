#!/bin/sh
case "$BLOCK_BUTTON" in
    1) "$TERMINAL" -e htop ;;
    2) edit "$0" ;;
    3) "$TERMINAL" -e btop ;;
    '') timeout 0.05s dumbclient "$HOME"/.cache/dwmblocks/cpupercent/cpupercentfifoOut "$HOME"/.cache/dwmblocks/cpupercent/cpupercentfifoIn;;
    #'') cpupercent | tr -d '\n';;
esac
