# my scripts
- these are just the scripts I use on my system
- most of them I wrote from scratch just to do something so they're kinda gross in a lot of spots
- there might be other issues for why these don't work for you that I don't have here

## dependencies
- some depend on my configs that I don't have up yet since I haven't decided how I wanna do that
    - specifically I'm on Arch, so there may be differences with your system
    - I use dwm with a fork of dwm blocks (specifically mine that I forked from Luke's thats forked from someone else's but I fixed a bug in my version, maybe I should update it and host it) that lets you use the mouse with the bar, so BLOCK_BUTTON refers to that
- many depend on C programs I wrote for things (mostly [clparser](https://github.com/dfuehrer/clparser) but also [visualbox](chrome://crash/) and [percentbar](chrome://kill/) and [cpupercent](chrome://hang/)
- I think I might skip a bunch specifically in my lf-previewer since it has a bunch of things for visualizing stuff that I don't care about
- real dependencies (I might be forgetting many) in various scripts:
    - normal unix utilities not listed here
    - entr (you want this trust me)
    - xbacklight
    - [code-minimap](https://github.com/wfxr/code-minimap)
    - fzf
    - dmenu
    - highlight
    - ansifilter
    - bat
    - libreoffice
    - tcc
    - ueberzug
    - imagemagick
    - pandoc
    - glow
    - maim
    - [xssstate](https://tools.suckless.org/x/xssstate/)
    - [swarp](https://tools.suckless.org/x/swarp/)
    - sxiv
    - compression things like lbzip2
    - xwallpaper
    - dunst (sound and brightness use to update notification)
    - stalonetray

## TODO
- things I wanna make:
    - compress
        - general compression script, there are tons
    - encrypt
        - use gpg to encrypt a file and then shred it all in 1 step
    - fix issues with autoupdate not starting things?
    - get pacinstall working
    - update this readme to be more specific about things
        - also make a better section for random notes vs more normal helpful ones

