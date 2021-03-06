
case "$BLOCK_BUTTON" in
    1) "$TERMINAL" -e htop ;;
    2) "$TERMINAL" -e "$EDITOR" "$0" ;;
    3) "$TERMINAL" -e bpytop ;;
    '') cpucercent | tr -d '\n';;
esac
