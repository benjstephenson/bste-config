#!/usr/bin/bash

if [[ $(hostname) = "bennix" ]]; then
	xrandr --dpi 192
	xrdb -merge ~/.Xresources
fi
