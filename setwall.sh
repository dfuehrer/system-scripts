#!/bin/sh
# TODO add in an option to copy instead of symlink since the background breaks if the file thats symliked disappears
eval $(echo 'flags: f,force,q L,last recover,r,R list,l; parameters: b,bgdir searchdir,s;' | clparser "$@")
[ -z "$bgdir" ] && bgdir="${XDG_DATA_HOME:-$HOME/.local/share}/backgrounds"
[ $list ] && { ls -lh --color=auto "$bgdir"; exit; }
[ -z "$searchdir" ] && searchdir="/usr/share/backgrounds/*"
[ $f ] && i=-f || i=-i
[ $last ] && { echo setting last wallpaper; last="$(readlink -f "$bgdir/wallpaper-last")" && ln -s $i "$(readlink -f "$bgdir/wallpaper")" "$bgdir/wallpaper-last" && ln -s $i "$last" "$bgdir/wallpaper"; } || 
    { [ -z "$recover" ] && { [ -z "$defaults" ] && defaults="$(sxiv $searchdir -ot)";
    echo setting wallpaper to $defaults; ln -s $i "$(readlink -f "$bgdir/wallpaper")" "$bgdir/wallpaper-last" && ln -s $i "$(readlink -f "$defaults")" "$bgdir/wallpaper"; }; }
xwallpaper --zoom "$bgdir/wallpaper"
