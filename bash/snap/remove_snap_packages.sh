#!/usr/bin/env bash

. "${BASH_SOURCE%/*}"/snap_installed.sh

remove_snap_packages() {
    local packages=("$@")
    for package_with_options in "${packages[@]}"; do
        package=${package_with_options%% *}
        if ! snap_installed "${package}"; then
            echo "${package} is not installed."
        else
            echo "Removing ${package}..."
            # shellcheck disable=2086
            sudo snap remove ${package}
        fi
    done
}

if [[ ${BASH_SOURCE[0]} == "$0" ]]; then
    remove_snap_packages "$@"
fi
