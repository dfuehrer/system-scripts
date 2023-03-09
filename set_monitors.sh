#!/usr/bin/env sh

my_setup () {
    xrandr --output DP-0 --mode 1920x1080 --rate 144
    xrandr --output DP-2 --mode 1920x1080 --rate 144 --right-of DP-0
}

general () {
    # TODO read monitors from xrandr and select highest frame rate and stuff, add monitors left to right in order?
    :
}

# TODO maybe make some sort of interface
my_setup
