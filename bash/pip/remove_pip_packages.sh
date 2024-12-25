#!/bin/bash

. "${BASH_SOURCE%/*}"/pip_installed.sh

pip="pip3"

remove_pip_packages() {
    local packages=("$@")
    for package in "${packages[@]}"; do
        if ! pip_installed "${package}"; then
            echo "${package} is not installed."
        else
            echo "Removing ${package}..."
            ${pip} uninstall -y "${package}"
        fi
    done
}

if [[ ${BASH_SOURCE[0]} == "$0" ]]; then
    remove_pip_packages "$1"
fi
