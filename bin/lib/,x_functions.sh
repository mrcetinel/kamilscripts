#!/bin/bash
set -o pipefail

# x-server functions functions

# @return name width height xoff yoff
,x_get_monitors() {
	xrandr |
	sed -E '
		/^([^ ]*) connected /!d
		s/^([^ ]*).*[^-0-9]([-0-9]+)x([-0-9]+)\+([-0-9]+)\+([-0-9]+)[^-0-9].*$/\1 \2 \3 \4 \5/
	'
}

# @param X position X
# @param Y position Y
# @return window name and parameters for that position
,x_find_monitor_for_position() {
	,x_get_monitors |
	awk -v x="$1" -v y="$2" '
	{ name=$1; width=$2; height=$3; xoff=$4; yoff=$5; }
	x >= xoff && y >= yoff && x < xoff + width && y < yoff + height { found=1 }
	found
	found { exit }
	END { 
		if (!found) {
			print "Could not find any monitor for the current mouse position" > "/dev/stderr"
			exit 1
		}
	}
	'
}

,x_get_window_geometry() {
	,x_get_monitors | grep "^$1 "
}

# @return windowid positionX positionY geometryX geometryY
,x_get_window_geometry() {
	if (($#)); then
		xdotool getwindowgeometry "$1"
	else
		xdotool getactivewindow getwindowgeometry
	fi |
	sed -nE '
	/Window ([0-9]+).*/{
		s//\1/
		H
	}
	/.*Position: ([0-9]+),([0-9]+).*/{
		s//\1 \2/
		H
	}
	/.*Geometry: ([0-9]+)x([0-9]+).*/{
		s//\1 \2/
		H
		g
		s/\n/ /g
		s/^ //
		p
	}
	'
}

# @return @see ,x_get_monitors
,x_get_window_monitor() {
	local pos
	pos=$(,x_get_window_geometry "$@" | awk '{print $2,$3}') &&
	,x_find_monitor_for_position $pos
}

,x_get_desktop_geometry() {
	xrandr | sed -E '/Screen 0:.*current *([0-9]+) *x *([0-9]+).*/!d; s//\1 \2/'
}

# http://unix.stackexchange.com/questions/14159/how-do-i-find-the-window-dimensions-and-position-accurately-including-decoration
# @returns left right top bottom
,x_get_window_border_info() {
	xprop _NET_FRAME_EXTENTS -id "$1" |
	sed 's/.*= \([0-9]*\), \([0-9]*\), \([0-9]*\), \([0-9]*\)/\1 \2 \3 \4/'
}

# @return windowID left right top bottom autohide-behavior
,x_get_xfce4_panel_info() {
	local tmp tmp2
	tmp=$(
		wmctrl -l -G |
		awk '
		/ xfce4-panel$/{print $1,$3,$4,$5,$6; found=1}
		END {
			if(!found) {
				print "No xfce4-panel found" > "/dev/stderr"
				exit 1
			}
		}'
	) &&
	tmp2=$(xfconf-query -c xfce4-panel -p /panels/panel-1/autohide-behavior get) &&
	echo "$tmp $tmp2"
}

