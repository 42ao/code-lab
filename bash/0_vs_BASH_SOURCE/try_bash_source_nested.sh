#!/bin/bash

# shellcheck disable=SC2119,SC2016

. "${BASH_SOURCE%/*}"/../format/format.sh

print_bof "try_bash_source_nested.sh"

print_title "Execute try_bash_source.sh"
print_code <<<'"${BASH_SOURCE%/*}"/try_bash_source.sh'
"${BASH_SOURCE%/*}"/try_bash_source.sh

print_title "Load try_bash_source.sh"
print_code <<<'". ${BASH_SOURCE%/*}"/try_bash_source.sh'
. "${BASH_SOURCE%/*}"/try_bash_source.sh

echo
print_note '${BASH_SOURCE[0]} is the same in all cases.'

print_eof "try_bash_source_nested.sh"
