#!/bin/bash

. "${BASH_SOURCE%/*}"/bash_tools.sh
. "${BASH_SOURCE%/*}"/../snap/install_snap.sh
. "${BASH_SOURCE%/*}"/../snap/snap_installed.sh

install_snap_packages() {
  local packages=("$@")
  for package in "${packages[@]}"; do
    if snap_installed "${package}"; then
      echo "${package} is already installed."
    else
      echo "Installing ${package}..."
      sudo snap install "${package}"
    fi
  done
}

setup_bash_tools_on_ubuntu() {
  install_snap_via_apt
  install_snap_packages "${SNAP_PACKAGES[@]}"
}

setup_bash_tools() {
  local os=$1
  echo "Setup bash tools"
  case "${os}" in
  ubuntu)
    setup_bash_tools_on_ubuntu
    ;;
  *)
    echo >&s "Unsupported OS ${os}"
    exit 1
    ;;
  esac
  echo
}

if [[ ${BASH_SOURCE[0]} == "$0" ]]; then
  setup_bash_tools "$1"
fi
