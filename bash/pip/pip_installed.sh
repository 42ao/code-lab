#!/bin/bash

pip="pip3"

pip_installed() {
    local package=$1
    ${pip} show "${package}" &>/dev/null
}

if [[ ${BASH_SOURCE[0]} == "$0" ]]; then
    pip_installed "$1"
fi
