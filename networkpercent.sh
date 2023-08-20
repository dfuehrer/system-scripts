#!/bin/sh
case "$BLOCK_BUTTON" in
    1) exec nmtray ;;
    2) exec edit "$0" ;;
    3) exec ${TERMINAL:-st} -e sh -c 'ip -c a; read -p "Press [Enter] to exit.." in';;
    '') timeout 0.05s dumbclient "$HOME"/.cache/dwmblocks/networkpercent/networkpercent.sock;;
esac
