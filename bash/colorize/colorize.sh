#!/usr/bin/env bash

# shellcheck disable=SC2086,SC2155

. "${BASH_SOURCE%/*}"/../format/ansi.sh

colorize() {
    local color=${1^^}

    if [[ -z ${ANSI[${color}]} ]]; then
        echo "ERROR: Invalid color \"${color}\" !!!"
        exit 1
    fi

    shift 1
    for text in "$@"; do
        echo -e "${ANSI[${color}]}${text}${ANSI[RESET]}"
    done
}
