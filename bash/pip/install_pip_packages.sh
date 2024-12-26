#!/usr/bin/env bash

. "${BASH_SOURCE%/*}"/pip_installed.sh

pip="pip3"

install_pip_packages() {
    local packages=("$@")
    for package in "${packages[@]}"; do
        if pip_installed "${package}"; then
            echo "${package} is already installed."
        else
            echo "Installing ${package}..."
            ${pip} install "${package}"
        fi
    done
}

if [[ ${BASH_SOURCE[0]} == "$0" ]]; then
    install_pip_packages "$@"
fi
