#!/usr/bin/env bash

install_snap_via_apt() {
    if ! command -v snap &>/dev/null; then
        echo "Installing snap..."
        sudo apt update
        sudo apt install -y snapd
    fi
}

if [[ ${BASH_SOURCE[0]} == "$0" ]]; then
    install_snap_via_apt
fi
