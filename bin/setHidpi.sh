#!/usr/bin/bash

if [[ $(hostname) = "nixtop" ]]; then
	xrandr --dpi 192
	xrdb -merge ~/.Xresources
fi
