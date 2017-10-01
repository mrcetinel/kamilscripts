#!/bin/bash
set -euo pipefail

# functions #####################################

usage() {
	n=qqscp-speed-test.sh
	cat <<EOF
Usage: $n [OPTIONS] [user@]hostname [file size in kB]

Tests ssh connection speed by uploading and then downloading a test file
Default file size is 10000kB

Options:
	-h		print this help end exit
	-s path		set src file location [default: \$(mktemp)]
			specifing src file location disables autogenerating it
	-d path		set dest file location [default: \$(ssh remote_host mktemp)]a
	-S arg		pass additional argument arg to ssh command
	-C arg		pass additional argument arg to scp command
	-B arg 		pass additional argument arg to both ssh and scp commands

Examples:
	$n host@hostname 200
	$n -S -p -C -P -B 10022 -B -o -B ConnectTimeout=4 myuser@myhostname

Written by Kamil Cukrowski. Jointly under MIT License and Beetware license.
Based on scp-speed-test.sh from  Alec Jacobson alecjacobsonATgmailDOTcom
EOF
}

error() { echo "ERROR: $@" >&2; exit 2; }
trap_exit() {
	local r=$?
	if [ "$r" -ne 0 ]; then
		echo "ERROR: last command returned status=$r" >&2
	fi
}
trap trap_exit EXIT

# main ##########################################

# getopt ##############
ARGS=$(getopt -n qqscp-speed-test.sh -o hd:s:S:C:B: -- "$@")
eval set -- "$ARGS"
if [ $# -lt 1 ]; then usage; exit; fi;

# input parameters #####
dst_file="" src_file="" ssh=( ssh ) scp=( scp -v )
while true; do
	case "$1" in
		-h) usage; exit 1; ;;
		-d) dst_file="$2"; shift; ;;
		-s) src_file="$2"; shift; ;;
		-S) ssh+=( "$2" ); shift; ;;
		-C) scp+=( "$2" ); shift; ;;
		-B) ssh+=( "$2" ); scp+=( "$2" ); shift; ;;
		--) shift; break; ;;
		*) echo "Internal error" >&2; exit 1; ;;
	esac
	shift;
done
ssh_server=$1
test_size=${2:-10000}

# generate src_file ######
if [ -z "$src_file" ]; then
	src_file=$(mktemp)
	trap "trap_exit; rm -f \"$src_file\";" EXIT
	echo "Generating $test_size kB test file $src_file from urandom..."
	dd if=/dev/urandom of="$src_file" bs="$(echo "$test_size*1024" | bc)" count=1 &> /dev/null
else
	if [ ! -e "$test_file" ]; then
		error "test_file $test_file does not exists!"
	fi
	echo "Using specified test file $test_file with size $(echo "$(wc -c <$test_file)/1024"|bs) kB..."
fi

# generate dst_file ###
if [ -z "$dst_file" ]; then
	echo "Generating destination file location"
	dst_file="$("${ssh[@]}" "$ssh_server" "mktemp")"
fi

# some info
# if $VERBOSE; then
echo "> Testing transfer \"$ssh_server:$dst_file\" <-> \"$src_file\""
echo "> ssh command: ${ssh[@]}"
echo "> scp command: ${scp[@]}"
# fi

# work ##########################################
# upload test
echo "Testing upload to $ssh_server ..."
up_speed=$("${scp[@]}" "$src_file" "$ssh_server:$dst_file" 2>&1 | \
  grep "Bytes per second" | \
  sed "s/^[^0-9]*\([0-9.]*\)[^0-9]*\([0-9.]*\).*$/\1/g")
up_speed=$(echo "($up_speed*0.0009765625*100.0+0.5)/1*0.01" | bc)

# download test
echo "Testing download from $ssh_server ..."
down_speed=$("${scp[@]}" "$ssh_server:$dst_file" "$src_file" 2>&1 | \
  grep "Bytes per second" | \
  sed "s/^[^0-9]*\([0-9.]*\)[^0-9]*\([0-9.]*\).*$/\2/g")
down_speed=$(echo "($down_speed*0.0009765625*100.0+0.5)/1*0.01" | bc)

# clean up
echo "Removing dest file $ssh_server:$dst_file ..."
if ! "${ssh[@]}" "$ssh_server" "rm \"$dst_file\""; then
	echo "removing file $ssh_server:$dst_file failed" | tee /dev/stderr
fi
echo "Removing src file $src_file ..."
if ! rm "$src_file"; then
	echo "ERROR: removing file $src_file failed" | tee /dev/stderr
fi
trap "trap_exit" EXIT

# print result
echo
echo "
Upload speed:   #$up_speed#kB/s
Download speed: #$down_speed#kB/s" | rev | column -s'#' -o' ' -t | rev

