#!/bin/sh
eval $(echo 'flags: h; parameters: l,len=15 n,num;' | clparser "$@")
[ -z "$num" ] && { [ -z "$defaults" ] && exit 1 || num="$defaults"; }
bn=$(( $num*$len/100 ))
# TODO this still isnt actually dynamic so the bars can only be 100 long like this
full='===================================================================================================='
empty='----------------------------------------------------------------------------------------------------'
printf '|%.*s%.*s|%3d%%\n' $bn "$full" $(($len-$bn)) "$empty" $num
