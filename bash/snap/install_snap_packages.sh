#!/bin/bash

. "${BASH_SOURCE%/*}"/snap_installed.sh

install_snap_packages() {
	local packages=("$@")
	for package_with_options in "${packages[@]}"; do
		package=${package_with_options%% *}
		if snap_installed "${package}"; then
			echo "${package} is already installed."
		else
			echo "Installing ${package}..."
			# shellcheck disable=2086
			sudo snap install ${package_with_options}
		fi
	done
}

if [[ ${BASH_SOURCE[0]} == "$0" ]]; then
	install_snap_packages "$@"
fi
