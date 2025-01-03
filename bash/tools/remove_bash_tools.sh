#!/usr/bin/env bash

. "${BASH_SOURCE%/*}"/bash_tools.sh
. "${BASH_SOURCE%/*}"/../snap/remove_snap_packages.sh
. "${BASH_SOURCE%/*}"/../brew/remove_brew_packages.sh

remove_bash_tools_on_macos() {
    remove_brew_packages "${BASH_BREW_PACKAGES[@]}"
}

remove_bash_tools_on_ubuntu() {
    remove_snap_packages "${BASH_SNAP_PACKAGES[@]}"
}

remove_bash_tools() {
    local os=$1
    echo "Remove bash tools"
    case "${os}" in
    macOS)
        remove_bash_tools_on_macos
        ;;
    ubuntu)
        remove_bash_tools_on_ubuntu
        ;;
    *)
        echo >&s "Unsupported OS ${os}"
        exit 1
        ;;
    esac
    echo
}

if [[ ${BASH_SOURCE[0]} == "$0" ]]; then
    remove_bash_tools "$1"
fi
