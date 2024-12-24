#!/bin/bash

. "${BASH_SOURCE%/*}"/brew_installed.sh

install_brew_packages() {
	local packages=("$@")
	for package_with_options in "${packages[@]}"; do
		package=${package_with_options%% *}
		if brew_installed "${package}"; then
			echo "${package} is already installed."
		else
			echo "Installing ${package}..."
			# shellcheck disable=2086
			brew install ${package_with_options}
		fi
	done
}

if [[ ${BASH_SOURCE[0]} == "$0" ]]; then
	install_brew_packages "$@"
fi
