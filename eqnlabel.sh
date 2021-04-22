#!/bin/sh
# this script is a groff preprocessor
# it reads stdin (or a file i guess) and spits out the file changing label references to equations to number references
# so you can label something in the file in a way that makes sense but have nice numbers in the pdf
# read in from a file or stdin
[ -f "$1" ] && file="$1" || file='-'
data="$(cat "$file")"
# get the labels from the .EQ lines
labels="$(printf "%s\n" "$data" | sed -n 's/\.EQ\s\+\((.*)\)\s*/\1/p')"
# if there was nothing to label just spit the data out and quit (otherwise it actually crashes)
[ -z "$labels" ] && printf "%s\n" "$data" && exit
# cleanup when exiting
cleanup () { rm -f "$tmpfile"; kill -s CHLD 0; exit; }
trap cleanup EXIT
trap '' CHLD
# make a temp file for the numbers since i need to have at least 1 file for stuff
tmpfile="$(mktemp -u)"
# fifo file means im not using io on the filesystem for no reason
mkfifo "$tmpfile"
# get numbers the same length as the labels, surround in ()
echo "$labels" | wc -l | xargs seq | sed 's/^/(/' > "$tmpfile" &
# i wish i could get paste to do multi char delimeters
# paste them together on the same line with / between
# then use sed to add the rest of the sed replacement command for the end
rep="$(echo "$labels" | paste -d '/' - "$tmpfile" | sed 's/^/s\//;s/$/)\/\;/')"
# replace the labels with the numbers to stdout
printf "%s\n" "$data" | sed "$rep"
