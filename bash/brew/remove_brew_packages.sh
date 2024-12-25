#!/bin/bash

. "${BASH_SOURCE%/*}"/brew_installed.sh

remove_brew_packages() {
	local packages=("$@")
	for package_with_options in "${packages[@]}"; do
		package=${package_with_options%% *}
		if ! brew_installed "${package}"; then
			echo "${package} is not installed."
		else
			echo "Removing ${package}..."
			# shellcheck disable=2086
			brew uninstall ${package}
		fi
	done
}

if [[ ${BASH_SOURCE[0]} == "$0" ]]; then
	remove_brew_packages "$@"
fi
