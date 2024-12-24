#!/bin/bash

. "${BASH_SOURCE%/*}"/../os/get_os.sh
. "${BASH_SOURCE%/*}"/bash_tools.sh
. "${BASH_SOURCE%/*}"/../../dev/tools/dev_tools.sh
. "${BASH_SOURCE%/*}"/../../python/tools/python_tools.sh
. "${BASH_SOURCE%/*}"/../brew/brew_installed.sh
. "${BASH_SOURCE%/*}"/../pip/pip_installed.sh
. "${BASH_SOURCE%/*}"/../snap/snap_installed.sh

print_usage() {
  echo "Usage: ${BASH_SOURCE[0]} <profile>"
  echo "Usage: ${BASH_SOURCE[0]} [all|bash|dev|python]"
}

list_packages_status() {
  local package_type=$1
  shift
  local packages=("$@")
  for package_with_options in "${packages[@]}"; do
    package=${package_with_options%% *}
    # shellcheck disable=SC2183
    padding=$(printf '%*s' $((20 - ${#package})))
    if "${package_type}_installed" "${package}"; then
      echo "${package}${padding}is installed     via ${package_type}"
    else
      echo "${package}${padding}is not installed via ${package_type}"
    fi
  done
}

status_tools() {
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
      list_packages_status snap "${BASH_SNAP_PACKAGES[@]}"
      echo
      echo "dev tools:"
      list_packages_status snap "${DEV_SNAP_PACKAGES[@]}"
      echo
      echo "python tools:"
      list_packages_status pip "${PYTHON_PIP_PACKAGES[@]}"
      ;;
    macOS)
      echo "bash tools:"
      list_packages_status brew "${BASH_BREW_PACKAGES[@]}"
      echo
      echo "dev tools:"
      list_packages_status brew "${DEV_BREW_PACKAGES[@]}"
      echo
      echo "python tools:"
      list_packages_status brew "${PYTHON_BREW_PACKAGES[@]}"
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
      list_packages_status snap "${BASH_SNAP_PACKAGES[@]}"
      ;;
    macOS)
      list_packages_status brew "${BASH_BREW_PACKAGES[@]}"
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
      list_packages_status snap "${DEV_SNAP_PACKAGES[@]}"
      ;;
    macOS)
      list_packages_status brew "${DEV_BREW_PACKAGES[@]}"
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
      list_packages_status pip "${PYTHON_PIP_PACKAGES[@]}"
      ;;
    macOS)
      list_packages_status brew "${PYTHON_BREW_PACKAGES[@]}"
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
  status_tools "$@"
fi
