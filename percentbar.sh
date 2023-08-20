#!/bin/sh
eval $(echo 'parameters: l,len=15 n,num;' | clparser -- "$@")
[ -z "$num" ] && { [ -z "$1" ] && exit 1 || num="$1"; }
bn=$(( $num*$len/100 ))
# TODO this still isnt actually dynamic so the bars can only be 100 long like this
full='===================================================================================================='
empty='----------------------------------------------------------------------------------------------------'
printf '|%.*s%.*s|%3d%%\n' $bn "$full" $(($len-$bn)) "$empty" $num
