#!/bin/bash

. "${BASH_SOURCE%/*}"/python_tools.sh
. "${BASH_SOURCE%/*}"/../../bash/os/get_os.sh

pip="pip3"

pip_package_installed() {
  local package=$1
  ${pip} show "${package}" &>/dev/null
}

install_pip_packages() {
  local packages=("$@")
  for package in "${packages[@]}"; do
    if pip_package_installed "${package}"; then
      echo "${package} is already installed."
    else
      echo "Installing ${package}..."
      ${pip} install "${package}"
    fi
  done
}

setup_python_tools_on_ubuntu() {
  install_pip_packages "${PYTHON_PIP_PACKAGES[@]}"
}

setup_python_tools() {
  local os=$1
  echo "Setup python tools"
  case "${os}" in
  ubuntu)
    setup_python_tools_on_ubuntu
    ;;
  *)
    echo >&2 "Unsupported OS ${os}"
    exit 1
    ;;
  esac
  echo
}

if [[ ${BASH_SOURCE[0]} == "$0" ]]; then
  setup_python_tools "$1"
fi
