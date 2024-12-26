#!/usr/bin/env bash

# shellcheck disable=SC2016,SC2119

. "${BASH_SOURCE%/*}"/../format/format.sh

print_source "${BASH_SOURCE%/*}"/args_builtin_last_cmd.sh

print_title "Execute args_builtin_last_cmd.sh"
print_code <<<'"${BASH_SOURCE%/*}"/args_builtin_last_cmd.sh'
"${BASH_SOURCE%/*}"/args_builtin_last_cmd.sh
