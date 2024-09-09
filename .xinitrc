#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then

  xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
  xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then

  xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
  xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Keyboard layout
setxkbmap jp &
setxkbmap -option ctrl:swapcaps &

# Set touchpad properties
DEVICE="9"
xinput set-prop "$DEVICE" "libinput Tapping Enabled" 1
xinput set-prop "$DEVICE" "libinput Natural Scrolling Enabled" 1
xinput set-prop "$DEVICE" "libinput Disable While Typing Enabled" 1

# Wallpaper
feh --bg-fill /home/muhamad/.config/background &

slstatus &
picom -f &
xss-lock -- slock &
caffeine &
dunst &

# Loop
# while true; do
#   dwm >/dev/null 2>&1
# done

# Execute DWM
exec dwm
