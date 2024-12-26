#!/usr/bin/env bash

. "${BASH_SOURCE%/*}"/../format/format.sh

print_source "${BASH_SOURCE%/*}"/args_builtin.sh

print_title "Execute args_builtin.sh with 3 arguments"
print_code <<<"./args_builtin.sh arg1 arg2 arg3"
"${BASH_SOURCE%/*}"/args_builtin.sh arg1 arg2 arg3
