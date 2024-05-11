#!/bin/bash

. "${BASH_SOURCE%/*}"/bash_tools.sh
. "${BASH_SOURCE%/*}"/../snap/install_snap.sh
. "${BASH_SOURCE%/*}"/../snap/install_snap_packages.sh

setup_bash_tools_on_ubuntu() {
	install_snap_via_apt
	install_snap_packages "${BASH_SNAP_PACKAGES[@]}"
}

setup_bash_tools() {
	local os=$1
	echo "Setup bash tools"
	case "${os}" in
	ubuntu)
		setup_bash_tools_on_ubuntu
		;;
	*)
		echo >&s "Unsupported OS ${os}"
		exit 1
		;;
	esac
	echo
}

if [[ ${BASH_SOURCE[0]} == "$0" ]]; then
	setup_bash_tools "$1"
fi
