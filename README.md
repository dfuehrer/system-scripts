# my scripts
- these are just the scripts I use on my system
- most of them I wrote from scratch just to do something so they're kinda gross in a lot of spots
- there might be other issues for why these don't work for you that I don't have here
- generally my scripts are POSIX compliant shell scripts but ones that interact with the user often are bash scripts because of the better functionality in that regard (readline is a much better ux than nothing, ansi colors aren't posix I guess)

## dependencies
- some depend on my configs
    - specifically I'm on Arch, so there may be differences with your system
    - I use dwm with a fork of dwm blocks (specifically mine that I forked from Luke's thats forked from someone else's) that lets you use the mouse with the bar, so BLOCK_BUTTON refers to that
- many depend on C programs I wrote for things (mostly [clparser](https://github.com/dfuehrer/clparser) but also [visualbox](https://github.com/dfuehrer/visualbox) and [percentbar](https://github.com/dfuehrer/percentbar) and [cpupercent](https://github.com/dfuehrer/cpupercent))
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
    - maim
    - pandoc
    - glow
    - [xssstate](https://tools.suckless.org/x/xssstate/)
    - [swarp](https://tools.suckless.org/x/swarp/)
    - sxiv
    - compression things like lbzip2
    - xwallpaper
    - dunst (sound and brightness use to update notification)
    - stalonetray

## TODO
- things I wanna make:
    - [ ] compress
        - general compression script, there are tons
    - [ ] encrypt
        - use gpg to encrypt a file and then shred it all in 1 step
    - [ ] screensaver setter
        - just for the x dkms screensaver things settings for when itll go black and stuff to replace my dependance on the silly joke of a script that is mmss
    - [ ] fix issues with autoupdate not starting things?
    - [ ] get pacinstall working
    - [ ] update this readme to be more specific about things
        - also make a better section for random notes vs more normal helpful ones

