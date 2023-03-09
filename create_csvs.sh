#!/usr/bin/env sh

set -e

conversion="$1" && shift

if [ -n "$1" ]; then
    # if given a directory as the second arg, cd into it
    cd "$script_dir"
fi

# get all pdfs and csvs, replace csv with pdf and remove all the duplicated names to be left with only pdfs without csvs, pass back through find to remove csvs without pdfs renamed to pdfs that dont exist
uniq_pdfs="$(find -maxdepth 1 -name '*.pdf' -print0 -o -name '*.csv' -print0 | sed -z 's/\.csv$/.pdf/' | sort -z | uniq -zu | find -files0-from - -maxdepth 0 2>/dev/null || true)"

echo "$uniq_pdfs" | parallel "$conversion" '{}' '>' '{.}.csv'
