[[ $- != *i* ]] && return

# https://stackoverflow.com/questions/4261876/check-if-bash-script-was-invoked-from-a-shell-or-another-script-application
# do not show calendar when su-ing
[[ ! $(ps -o stat= -p $$) =~ s && "$SHLVL" == 1 ]] && return

# Put your local functions and aliases herea
if hash cal 2>/dev/null && [[ $(cal --version 2>&1) =~ "util-linux" ]]; then
	hash color.sh 2>/dev/null && color.sh green
	if hash ,color 2>/dev/null; then ,color green; fi
	cal -3m
	if hash ,color 2>/dev/null; then ,color reset; fi
fi
hash fortune 2>/dev/null && fortune

