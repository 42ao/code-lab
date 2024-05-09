#!/bin/bash

. "${BASH_SOURCE%/*}"/bash/os/get_os.sh
. "${BASH_SOURCE%/*}"/bash/tools/remove_bash_tools.sh
. "${BASH_SOURCE%/*}"/python/tools/remove_python_tools.sh

print_usage() {
  echo "Usage: ${BASH_SOURCE[0]} [all|bash|python]"
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
    remove_bash_tools "${os}"
    remove_python_tools "${os}"
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
