#!/bin/bash

. "${BASH_SOURCE%/*}"/dev_tools.sh
. "${BASH_SOURCE%/*}"/../../bash/snap/remove_snap_packages.sh
. "${BASH_SOURCE%/*}"/../../bash/brew/remove_brew_packages.sh

remove_dev_tools_on_macos() {
  remove_brew_packages "${DEV_BREW_PACKAGES[@]}"
}

remove_dev_tools_on_ubuntu() {
  remove_snap_packages "${DEV_SNAP_PACKAGES[@]}"
}

remove_dev_tools() {
  local os=$1
  echo "Remove dev tools"
  case "${os}" in
  macOS)
    remove_dev_tools_on_macos
    ;;
  ubuntu)
    remove_dev_tools_on_ubuntu
    ;;
  *)
    echo >&s "Unsupported OS ${os}"
    exit 1
    ;;
  esac
  echo
}

if [[ ${BASH_SOURCE[0]} == "$0" ]]; then
  remove_dev_tools "$1"
fi
