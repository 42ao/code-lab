#!/bin/bash

# shellcheck disable=SC2119,SC2016

. "${BASH_SOURCE%/*}"/../format/format.sh

print_bof "try_0.sh"

print_title "Execute lib/0.sh"
print_code <<<'"${BASH_SOURCE%/*}"/lib/0.sh'
"${BASH_SOURCE%/*}"/lib/0.sh

print_title "Load 0.sh"
print_code <<<'. "${BASH_SOURCE%/*}"/lib/0.sh'
. "${BASH_SOURCE%/*}"/lib/0.sh

print_eof "try_0.sh"
