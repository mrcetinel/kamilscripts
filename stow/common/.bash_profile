#!/bin/bash
# kamilscripts ~/.bash_profile

# https://www.gnu.org/software/bash/manual/html_node/Bash-Startup-Files.html

if [[ -e ~/.profile ]]; then
	. ~/.profile
fi

if [[ -e ~/.bashrc ]]; then
	. ~/.bashrc
fi

