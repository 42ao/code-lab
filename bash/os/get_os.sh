#!/bin/bash

get_os() {
    local id
    os_release="/etc/os-release"
    if [[ -f ${os_release} ]]; then
        # ubuntu
        id=$(awk -F= '/^ID=/{print $2}' /etc/os-release)
    elif [[ $(which sw_vers) ]]; then
        # macOS
        id=$(sw_vers -productName)
    else
        echo >&2 "Cannot determine OS"
        return 1
    fi
    echo "${id}"
}

if [[ ${BASH_SOURCE[0]} == "$0" ]]; then
    get_os
fi
