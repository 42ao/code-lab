#!/usr/bin/env bash

. "${BASH_SOURCE%/*}"/../os/get_os.sh
. "${BASH_SOURCE%/*}"/bash_tools.sh
. "${BASH_SOURCE%/*}"/../../dev/tools/dev_tools.sh
. "${BASH_SOURCE%/*}"/../../python/tools/python_tools.sh

print_usage() {
    echo "Usage: ${BASH_SOURCE[0]} <profile>"
    echo "Usage: ${BASH_SOURCE[0]} [all|bash|dev|python]"
}

list_packages() {
    local packages=("$@")
    for package_with_options in "${packages[@]}"; do
        package=${package_with_options%% *}
        echo "${package}"
    done
}

list_tools() {
    local profile=${1:-all}

    os=$(get_os)
    if [[ -z ${os} ]]; then
        exit 1
    fi

    case "${profile}" in
    all)
        case "${os}" in
        ubuntu)
            echo "bash tools:"
            list_packages "${BASH_SNAP_PACKAGES[@]}"
            echo
            echo "dev tools:"
            list_packages "${DEV_SNAP_PACKAGES[@]}"
            echo
            echo "python tools:"
            list_packages "${PYTHON_PIP_PACKAGES[@]}"
            ;;
        macOS)
            echo "bash tools:"
            list_packages "${BASH_BREW_PACKAGES[@]}"
            echo
            echo "dev tools:"
            list_packages "${DEV_BREW_PACKAGES[@]}"
            echo
            echo "python tools:"
            list_packages "${PYTHON_BREW_PACKAGES[@]}"
            ;;
        *)
            print_usage
            exit 1
            ;;
        esac
        ;;
    bash)
        case "${os}" in
        ubuntu)
            list_packages "${BASH_SNAP_PACKAGES[@]}"
            ;;
        macOS)
            list_packages "${BASH_BREW_PACKAGES[@]}"
            ;;
        *)
            print_usage
            exit 1
            ;;
        esac
        ;;
    dev)
        case "${os}" in
        ubuntu)
            list_packages "${DEV_SNAP_PACKAGES[@]}"
            ;;
        macOS)
            list_packages "${DEV_BREW_PACKAGES[@]}"
            ;;
        *)
            print_usage
            exit 1
            ;;
        esac
        ;;
    python)
        case "${os}" in
        ubuntu)
            list_packages "${PYTHON_PIP_PACKAGES[@]}"
            ;;
        macOS)
            list_packages "${PYTHON_BREW_PACKAGES[@]}"
            ;;
        *)
            print_usage
            exit 1
            ;;
        esac
        ;;
    *)
        print_usage
        exit 1
        ;;
    esac
}

if [[ ${BASH_SOURCE[0]} == "$0" ]]; then
    list_tools "$@"
fi
