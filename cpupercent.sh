#!/bin/sh
case "$BLOCK_BUTTON" in
    1) exec ${TERMINAL:-st} -e htop ;;
    2) exec edit "$0" ;;
    3) exec ${TERMINAL:-st} -e btop ;;
    '') timeout 0.05s dumbclient "$HOME"/.cache/dwmblocks/cpupercent/cpupercent.sock;;
    #'') cpupercent | tr -d '\n';;
esac
