#!/bin/bash
set -euo pipefail
shopt -s nullglob

# This script should recreate ssh cofiguration from template files.
# The template files are stored in ~/.ssh/config.d/*.sh
# If one of template files changes, the configuration should be recreated.
# If ~/.ssh/config is newer then newest file from ~/.ssh/config.d, then error.

name=$(basename "$0")

fatal() {
	echo "$name: ERROR:" "$*" >&2
	exit 2
}

if [[ -d ~/.ssh/config.d ]]; then
	if [[ -e ~/.ssh/config.d/kamilscripts.conf ]]; then
		fatal "file ~/.ssh/config.d/kamilscripts.conf should be removed"
	fi

	if [[ -e ~/.ssh/config.d/kamilscripts || -L ~/.ssh/config.d/kamilscripts ]]; then
		fatal "file ~/.ssh/config.d/kamilscripts should be removed"
	fi

	# additional checking is done by checking if the file has our uuidmark
	if [[ -e ~/.ssh/config ]] && ! grep -q '# UUIDMARK 6b248e21-6024-4544-8051-35cb3e3d2c4c' ~/.ssh/config; then
		fatal '~/.ssh/config does not have uuid mark. Remove ~/.ssh/config to refresh configuration.'
	fi

	newest=""
	oldest=""
	for i in ~/.ssh/config.d ~/.ssh/config.d/*.sh; do
		if [[ -e "$i" && ( -z "$newest" || "$i" -nt "$newest" ) ]]; then
			newest="$i"
		fi
		if [[ -e "$i" && ( -z "$oldest" || "$i" -ot "$oldest" ) ]]; then
			oldest="$i"
		fi
	done

	if [[ -n "$newest" && ~/.ssh/config -nt "$newest" ]]; then
		fatal '~/.ssh/config is newer then the newest file in ~/.ssh/config.d/*.sh. Remove ~/.ssh/config to refresh configuration.'
	fi

	if [[ -n "$oldest" && ~/.ssh/config -ot "$oldest" ]]; then
		echo "$name: Recreating ~/.ssh/config"
		tmp=$(
			for i in ~/.ssh/config.d/*.sh; do
				if [[ -r "$i" ]]; then
					"$i"
				fi
			done
		)
		cat <<<"$tmp" > ~/.ssh/config
		touch --reference="$HOME/.ssh/config" ~/.ssh/config.d/*.sh
	fi
fi

command ssh "$@"
