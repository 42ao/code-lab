#!/bin/bash

brew_installed() {
    local package=$1
    brew list | grep -q "${package}"
}

if [[ ${BASH_SOURCE[0]} == "$0" ]]; then
    brew_installed "$1"
fi
