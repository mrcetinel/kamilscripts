#!/bin/bash

ssh() {
	if [[ -e "$HOME/.ssh/config.d/kamilscripts" ]]; then
		if [[ -e "$HOME/.ssh/config.d/kamilscripts.conf" &&
				"$HOME/.ssh/config.d/kamilscripts.conf" -nt "$HOME/.ssh/config.d/kamilscripts" ]]; then
			{
			echo "WARNING: kamilscripts/etc/bash.d/ssh.sh: ~/.ssh/config.d/kamilscripts.conf is newer then ~/.ssh/config.d/kamilscripts"
			echo "Fix with either:"
			echo "- cp ~/.ssh/config.d/kamilscripts.conf ~/.ssh/config.d/kamilscripts"
			echo "- rm ~/.ssh/config.d/kamilscripts.conf"
			} >&2
		fi
		if [[ "$HOME/.ssh/config.d/kamilscripts" -nt "$HOME/.ssh/config.d/kamilscripts.conf" ]]; then
			{
			cat <<-EOF
			# WARNING
			# File autogenerated by kamilscripts/etc/bash.d/ssh.sh on $(date)
			# last data modification of ~/.ssh/config.d/kamilscripts: $(stat -c %y ~/.ssh/config.d/kamilscripts)
			EOF
			cat "$HOME/.ssh/config.d/kamilscripts"
			} > "$HOME/.ssh/config.d/kamilscripts.conf"
			touch --reference="$HOME/.ssh/config.d/kamilscripts" "$HOME/.ssh/config.d/kamilscripts.conf"
		fi
	fi
	command ssh "$@"
}

