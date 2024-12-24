#!/bin/bash

. "${BASH_SOURCE%/*}"/python_tools.sh
. "${BASH_SOURCE%/*}"/../../bash/os/get_os.sh
. "${BASH_SOURCE%/*}"/../../bash/brew/remove_brew_packages.sh

pip="pip3"

pip_package_installed() {
  local package=$1
  ${pip} show "${package}" &>/dev/null
}

remove_pip_packages() {
  local packages=("$@")
  for package in "${packages[@]}"; do
    if ! pip_package_installed "${package}"; then
      echo "${package} is not installed."
    else
      echo "Removing ${package}..."
      ${pip} uninstall -y "${package}"
    fi
  done
}

remove_python_tools_on_macos() {
  remove_brew_packages "${PYTHON_BREW_PACKAGES[@]}"
}

remove_python_tools_on_ubuntu() {
  remove_pip_packages "${PYTHON_PIP_PACKAGES[@]}"
}

remove_python_tools() {
  local os=$1
  echo "Setup python tools"
  case "${os}" in
  macOS)
    remove_python_tools_on_macos
    ;;
  ubuntu)
    remove_python_tools_on_ubuntu
    ;;
  *)
    echo >&2 "Unsupported OS ${os}"
    exit 1
    ;;
  esac
  echo
}

if [[ ${BASH_SOURCE[0]} == "$0" ]]; then
  remove_python_tools "$1"
fi
