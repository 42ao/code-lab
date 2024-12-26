#!/usr/bin/env bash

# shellcheck disable=SC2016

. "${BASH_SOURCE%/*}"/../format/format.sh

print_bof "try_script_path.sh"

print_title "Execute script_path.sh"
print_code <<<'"${BASH_SOURCE%/*}"/lib/script_path.sh'
"${BASH_SOURCE%/*}"/lib/script_path.sh

print_title "Load script_path.sh"
print_code <<<'. "${BASH_SOURCE%/*}"/lib/script_path.sh'
. "${BASH_SOURCE%/*}"/lib/script_path.sh

print_eof "try_script_path.sh"
