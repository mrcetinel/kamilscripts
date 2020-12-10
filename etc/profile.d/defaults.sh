#!/bin/sh

appendpath () {
	case ":$PATH:" in
		*:"$1":*) ;;
		*) PATH="${PATH:+$PATH:}$1"; ;;
	esac
}

appendpath "$HOME"/bin
appendpath "${XDG_CONFIG_HOME:-"$HOME"/.config}"/bin
appendpath "$KCDIR"/bin
appendpath /usr/local/sbin
appendpath /usr/local/bin
appendpath /usr/sbin
appendpath /usr/bin
appendpath /sbin
appendpath /bin
export PATH

# https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap08.html
if command -v nvim >/dev/null 2>&1; then
	export EDITOR=nvim
	export VISUAL=nvim
elif command -v vim >/dev/null 2>&1; then
	export EDITOR=vim
	export VISUAL=vim
fi
export TMPDIR=/tmp
export COUNTRY=PL
export HISTSIZE=
export HISTFILESIZE=
mesg y

# https://wiki.archlinux.org/index.php/Makepkg
export PACKAGER="Kamil Cukrowski <kamilcukrowski@gmail.com>"

# https://wiki.archlinux.org/index.php/Node.js
appendpath "$HOME/.node_modules/bin"
export npm_config_prefix="$HOME/.node_modules"

unset -f appendpath
