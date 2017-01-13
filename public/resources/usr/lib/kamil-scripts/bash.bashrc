#!/bin/bash

# ------------------- GLOBAL ----------------------
[ -d /etc/bash_completion.d ] && . /etc/bash_completion.d/*

# colors
_RED="$(tput setaf 1 2>/dev/null)"
_GREEN="$(tput setaf 2 2>/dev/null)"
_BOLD="$(tput bold 2>/dev/null)"
_BLUE="$(tput setaf 4 2>/dev/null)"
_YELLOW="\[\033[33;1m\]"
_NORMAL="$(tput sgr0 2> /dev/null)"
# PS1
if  test "$UID" -eq 0 -a -t; then
	export PS1="$_YELLOW\$? ${_RED}$(hostname) ${_BOLD}${_BLUE}\w$_NORMAL\n\\$ "
else
	export PS1="$_YELLOW\$? ${_GREEN}\u@$(hostname) ${_BOLD}${_BLUE}\w$_NORMAL\n\\$ "
fi

export EDITOR="/usr/bin/vim"
export VISUAL="/usr/bin/vim"
export HISTSIZE=600000
export HISTCONTROL="ignorespace:erasedups"
alias l='ls -alF --color -h --group-directories-first'
alias o='less'
alias hist='history | grep -a '


# ------------- local -----------------

if ! test "$UID" -eq 0 -a -t; then
        alias pacman='sudo pacman'
	alias pacmann='sudo pacman --noconfirm'
fi

export PATH="/home/users/kamil/bin:$PATH"
export HISTFILE=$HOME/.bash_history
export HISTIGNORE="123:l:ls:[bf]g:exit:su:su -:history:hist:reboot:poweroff:mnsstat:kotekkc:rm *:wipefs *:mkfs *:[ \t]*:pwd:clear" # more
export VDPAU_DRIVER=r600
export SDL_AUDIODRIVER=alsaa

# For good measure, make all history environment variables read-only.
typeset -r HISTCONTROL
typeset -r HISTFILE
typeset -r HISTFILESIZE
typeset -r HISTIGNORE
typeset -r HISTSIZE

shopt -s histappend # append to history, dont overwrite
shopt -s cmdhist # multiple commands in one line
export TMP=/tmp
export TMPDIR=/tmp
mesg y

hist2() {
	history | grep -a "$@";
}
alias ls='ls --color -F'
hash rsync && alias cp='rsync --info=progress2 '
alias ping='ping -4'

notifycomplete() { 
	local pre='notifycomplete:'
	echo "$pre last command exited with $?"; 
	local sound="paplay --volume=65536 /usr/share/sounds/freedesktop/stereo/complete.oga"
	while true; do
		$sound >/dev/null
		sleep 2; 
	done;
}


