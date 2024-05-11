#!/bin/bash

# shellcheck disable=SC2119,SC2016

. "${BASH_SOURCE%/*}"/../format/format.sh

print_bof "try_script_path_nested.sh"

print_title "Execute try_script_path.sh"
print_code <<<'"${BASH_SOURCE%/*}"/try_script_path.sh'
"${BASH_SOURCE%/*}"/try_script_path.sh

print_title "Load try_script_path.sh"
print_code <<<'". ${BASH_SOURCE%/*}"/try_script_path.sh'
. "${BASH_SOURCE%/*}"/try_script_path.sh

print_eof "try_script_path_nested.sh"
