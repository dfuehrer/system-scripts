#!/bin/sh
# TODO add in an option to copy instead of symlink since the background breaks if the file thats symliked disappears
#params="flags: f,force,q h,help L,last recover,r,R list,l; parameters: b,bgdir searchdir,s=/usr/share/backgrounds/*;"
params="flags: f,force,q h,help L,last recover,r,R list,l; parameters: b,bgdir searchdir,s;"
eval $(echo "$params" | clparser -- "$@")
$h && echo "$params" && exit
# TODO make this a default if you can have spaces
[ -z "$bgdir" ] && bgdir="${XDG_DATA_HOME:-$HOME/.local/share}/backgrounds"
$list && { ls -lh --color=auto "$bgdir"; exit; }
$f && i=-f || i=-i
if $last; then
    echo setting last wallpaper
    last="$(readlink -f "$bgdir/wallpaper-last")"
    ln -s $i "$(readlink -f "$bgdir/wallpaper")" "$bgdir/wallpaper-last" && ln -s $i "$last" "$bgdir/wallpaper"
elif ! "$recover"; then
    mkdir -p $bgdir
    [ "$#" -lt 2 ] && set - "$(sxiv $searchdir -ot)"
    echo setting wallpaper to $@
    ln -s $i "$(readlink -f "$bgdir/wallpaper")" "$bgdir/wallpaper-last" && ln -s $i "$(readlink -f "$@")" "$bgdir/wallpaper"
fi
xwallpaper --zoom "$bgdir/wallpaper"
