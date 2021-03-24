#!/bin/sh
case "$BLOCK_BUTTON" in
    1) "$TERMINAL" -e htop ;;
    2) edit "$0" ;;
    3) "$TERMINAL" -e bpytop ;;
    '') cpucercent | tr -d '\n';;
esac
