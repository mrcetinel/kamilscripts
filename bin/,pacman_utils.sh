#!/bin/bash

,,pacman_list_installed_packages_by_date_helper() {
	sed 's/.*/[ALPM] installed & /' |
	grep -Ff - /var/log/pacman.log |
	sed 's/\[ALPM\] installed //; s/ *(.*)$//; s/\[\([^ ]*\) \([^ ]*\)\]/\[\1T\2:00+0000\]/' |
	sort -k1,1r |
	sort -u -k2,2 |
	sort -k1,1
}

,pacman_list_installed_packages_by_date() {
	local tmp
	pacman -Qq | ,,pacman_list_installed_packages_by_date_helper
}

,pacman_list_explicitly_installed_packages_by_date() {
	local tmp
	pacman -Qe | awk '{print $1}' | ,,pacman_list_installed_packages_by_date_helper
}

,pacman_list_packages_by_size ()  { 
	pacman -Qi |
		awk -F: '/^Name *:/{n=$2} /^Installed Size *:/{print n, $2}' |
		awk '{print $2 gensub("B$", "", "g", $3), $1, $2 $3 }' |
		numfmt --field 1 --from=auto |
		sort -k1n
}

,pacman_list_packages_from_aur() {
	pacman -Qqem
}

,pacman_list_installed_optional_dependencies() {
	comm -13 <(pacman -Qqdt | sort) <(pacman -Qqdtt | sort)
}

,pacman_list_installed_packages() {
	pacman -Qqe
}

,pacman_find_files_not_owned_by_any_packages() {
	find /etc /usr /opt /var |
		LC_ALL=C pacman -Qqo - 2>&1 >/dev/null |
		cut -d ' ' -f 5-
}

. ,lib_lib "$BASH_SOURCE" ',pacman_' "$@"
