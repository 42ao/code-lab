#!/bin/bash

. "${BASH_SOURCE%/*}"/../os/get_os.sh
. "${BASH_SOURCE%/*}"/remove_bash_tools.sh
. "${BASH_SOURCE%/*}"/../../dev/tools/remove_dev_tools.sh
. "${BASH_SOURCE%/*}"/../../python/tools/remove_python_tools.sh

print_usage() {
    echo "Usage: ${BASH_SOURCE[0]} [all|dev|bash|python]"
}

remove_tools() {
    if [[ $# -ne 1 ]]; then
        print_usage
        exit 1
    fi

    os=$(get_os)
    if [[ -z ${os} ]]; then
        exit 1
    fi

    case "$1" in
    all)
        remove_dev_tools "${os}"
        remove_bash_tools "${os}"
        remove_python_tools "${os}"
        ;;
    dev)
        remove_dev_tools "${os}"
        ;;
    bash)
        remove_bash_tools "${os}"
        ;;
    python)
        remove_python_tools "${os}"
        ;;
    *)
        print_usage
        exit 1
        ;;
    esac
}

if [[ ${BASH_SOURCE[0]} == "$0" ]]; then
    remove_tools "$@"
fi
