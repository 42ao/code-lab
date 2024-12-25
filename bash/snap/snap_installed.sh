#!/bin/bash

snap_installed() {
    local package=$1
    snap list | grep -q "${package}"
}

if [[ ${BASH_SOURCE[0]} == "$0" ]]; then
    snap_installed "$1"
fi
