#!/bin/bash

. "${BASH_SOURCE%/*}"/bash/tools/setup_tools.sh
. "${BASH_SOURCE%/*}"/bash/tools/remove_tools.sh
. "${BASH_SOURCE%/*}"/bash/tools/list_tools.sh
. "${BASH_SOURCE%/*}"/bash/tools/status_tools.sh

print_usage() {
    echo "Usage: ${BASH_SOURCE[0]} <command> <profile>"
    echo "Usage: ${BASH_SOURCE[0]} [setup|remove|list|status] [all|bash|dev|python]"
}

tools() {
    local cmd=$1
    local profile=${2:-all}

    if [[ -z $cmd ]]; then
        print_usage
        exit 1
    fi

    case "$cmd" in
    setup)
        setup_tools "${profile}"
        ;;
    remove)
        remove_tools "${profile}"
        ;;
    list)
        list_tools "${profile}"
        ;;
    status)
        status_tools "${profile}"
        ;;
    *)
        print_usage
        exit 1
        ;;
    esac
}

if [[ ${BASH_SOURCE[0]} == "$0" ]]; then
    tools "$@"
fi
