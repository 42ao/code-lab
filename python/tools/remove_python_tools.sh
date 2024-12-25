#!/bin/bash

. "${BASH_SOURCE%/*}"/python_tools.sh
. "${BASH_SOURCE%/*}"/../../bash/brew/remove_brew_packages.sh
. "${BASH_SOURCE%/*}"/../../bash/pip/remove_pip_packages.sh

remove_python_tools_on_macos() {
    remove_brew_packages "${PYTHON_BREW_PACKAGES[@]}"
}

remove_python_tools_on_ubuntu() {
    remove_pip_packages "${PYTHON_PIP_PACKAGES[@]}"
}

remove_python_tools() {
    local os=$1
    echo "Setup python tools"
    case "${os}" in
    macOS)
        remove_python_tools_on_macos
        ;;
    ubuntu)
        remove_python_tools_on_ubuntu
        ;;
    *)
        echo >&2 "Unsupported OS ${os}"
        exit 1
        ;;
    esac
    echo
}

if [[ ${BASH_SOURCE[0]} == "$0" ]]; then
    remove_python_tools "$1"
fi
