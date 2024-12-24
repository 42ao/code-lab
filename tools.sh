#!/bin/bash

. "${BASH_SOURCE%/*}"/setup_tools.sh
. "${BASH_SOURCE%/*}"/remove_tools.sh

print_usage() {
  echo "Usage: ${BASH_SOURCE[0]} <command> <profile>"
  echo "Usage: ${BASH_SOURCE[0]} [setup|remove] [all|bash|dev|python]"
}

tools() {
  local cmd=$1
  local profile=$2

  if [[ $# -ne 2 ]]; then
    print_usage
    exit 1
  fi

  case "$cmd" in
  setup)
    setup_tools "${profile}"
    ;;
  remove)
    remove_tools "${profile}"
    ;;
  *)
    print_usage
    exit 1
    ;;
  esac
}

if [[ ${BASH_SOURCE[0]} == "$0" ]]; then
  tools "$@"
fi
