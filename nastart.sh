#!/bin/sh
# comList is a list that has a program and then a path to a picture for that program separated by a space
# different programs are put on different lines
comList="
barrier ${XDG_DATA_HOME:-$HOME/.local/share}/barrier/barrier.png
keynav.sh ${XDG_DATA_HOME:-$HOME/.local/share}/nastart/keynav.png
run_nb ${XDG_DATA_HOME:-$HOME/.local/share}/nastart/newsboat.png
screentranslator ${XDG_DATA_HOME:-$HOME/.local/share}/nastart/screentranslator.png
brave /usr/lib/brave-bin/product_logo_256.png
firefox /usr/share/icons/hicolor/384x384/apps/firefox.png
"
run_nb () {
    "$TERMINAL" -e newsboat
}
comList=$(echo "$comList" | grep -Ex '[^[:space:]]+\>.*\<[^[:space:]]+')      # get rid of lines that are not in this format
# com is just the progam that was selected in the thumbnail view of sxiv
com=$(echo "$comList" | awk "/$(echo "$comList" | cut -d ' ' -f 2- | sxiv -iot | tr '\n' '|' | sed 's/|$//; s|/|\\/|g')+/"' {print $1}')      # pass sxiv the path to the pics and then awk out the output for just the program in comList.  tr makes it so the options are in one line as ORs.  sed cleans up and makes it so the / are for paths not for awk
# then run the programs probably
for c in $com; do
    $c &
done;
