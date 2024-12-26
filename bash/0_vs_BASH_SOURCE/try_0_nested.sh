#!/usr/bin/env bash

# shellcheck disable=SC2016

. "${BASH_SOURCE%/*}"/../format/format.sh

print_bof "try_0_nested.sh"

print_title "Execute try_0.sh"
print_code <<<'"${BASH_SOURCE%/*}"/try_0.sh'
"${BASH_SOURCE%/*}"/try_0.sh

echo
print_note "\$0 in the loaded 0.sh script within the executed try_0.sh script is the executed script's path."

print_title "Load try_0.sh"
print_code <<<'". ${BASH_SOURCE%/*}"/try_0.sh'
. "${BASH_SOURCE%/*}"/try_0.sh

echo
print_note '$0 in the loaded 0.sh script within the loaded try_0.sh script is the path of the outer loading script try_0_nested.sh or the executing shell.'

print_eof "try_0_nested.sh"
