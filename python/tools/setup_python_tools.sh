#!/bin/bash

. "${BASH_SOURCE%/*}"/python_tools.sh
. "${BASH_SOURCE%/*}"/../../bash/brew/install_brew_packages.sh
. "${BASH_SOURCE%/*}"/../../bash/os/get_os.sh
. "${BASH_SOURCE%/*}"/../../bash/pip/install_pip_packages.sh

setup_python_tools_on_macos() {
    install_brew_packages "${PYTHON_BREW_PACKAGES[@]}"
}

setup_python_tools_on_ubuntu() {
    install_pip_packages "${PYTHON_PIP_PACKAGES[@]}"
}

setup_python_tools() {
    local os=$1
    echo "Setup python tools"
    case "${os}" in
    macOS)
        setup_python_tools_on_macos
        ;;
    ubuntu)
        setup_python_tools_on_ubuntu
        ;;
    *)
        echo >&2 "Unsupported OS ${os}"
        exit 1
        ;;
    esac
    echo
}

if [[ ${BASH_SOURCE[0]} == "$0" ]]; then
    setup_python_tools "$1"
fi
