#!/bin/bash

. "${BASH_SOURCE%/*}"/bash_tools.sh
. "${BASH_SOURCE%/*}"/../snap/install_snap.sh
. "${BASH_SOURCE%/*}"/../snap/snap_installed.sh

remove_snap_packages() {
  local packages=("$@")
  for package in "${packages[@]}"; do
    if ! snap_installed "${package}"; then
      echo "${package} is not installed."
    else
      echo "Removing ${package}..."
      sudo snap remove "${package}"
    fi
  done
}

remove_bash_tools_on_ubuntu() {
  remove_snap_packages "${SNAP_PACKAGES[@]}"
}

remove_bash_tools() {
  local os=$1
  echo "Remove bash tools"
  case "${os}" in
  ubuntu)
    remove_bash_tools_on_ubuntu
    ;;
  *)
    echo >&s "Unsupported OS ${os}"
    exit 1
    ;;
  esac
  echo
}

if [[ ${BASH_SOURCE[0]} == "$0" ]]; then
  remove_bash_tools "$1"
fi
