#!/usr/bin/env bash

. "${BASH_SOURCE%/*}"/../os/get_os.sh
. "${BASH_SOURCE%/*}"/setup_bash_tools.sh
. "${BASH_SOURCE%/*}"/../../dev/tools/setup_dev_tools.sh
. "${BASH_SOURCE%/*}"/../../python/tools/setup_python_tools.sh

print_usage() {
    echo "Usage: ${BASH_SOURCE[0]} [all|dev|bash|python]"
}

setup_tools() {
    local profile=${1:-all}

    if [[ $# -ge 2 ]]; then
        print_usage
        exit 1
    fi

    os=$(get_os)
    if [[ -z ${os} ]]; then
        exit 1
    fi

    case "${profile}" in
    all)
        setup_dev_tools "${os}"
        setup_bash_tools "${os}"
        setup_python_tools "${os}"
        ;;
    dev)
        setup_dev_tools "${os}"
        ;;
    bash)
        setup_bash_tools "${os}"
        ;;
    python)
        setup_python_tools "${os}"
        ;;
    *)
        print_usage
        exit 1
        ;;
    esac
}

if [[ ${BASH_SOURCE[0]} == "$0" ]]; then
    setup_tools "$@"
fi
