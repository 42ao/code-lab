#!/bin/bash

. "${BASH_SOURCE%/*}"/dev_tools.sh
. "${BASH_SOURCE%/*}"/../../bash/snap/install_snap.sh
. "${BASH_SOURCE%/*}"/../../bash/snap/install_snap_packages.sh

setup_dev_tools_on_ubuntu() {
  install_snap_via_apt
  install_snap_packages "${DEV_SNAP_PACKAGES[@]}"
}

setup_dev_tools() {
  local os=$1
  echo "Setup dev tools"
  case "${os}" in
  ubuntu)
    setup_dev_tools_on_ubuntu
    ;;
  *)
    echo >&s "Unsupported OS ${os}"
    exit 1
    ;;
  esac
  echo
}

if [[ ${BASH_SOURCE[0]} == "$0" ]]; then
  setup_dev_tools "$1"
fi
