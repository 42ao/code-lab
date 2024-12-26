#!/usr/bin/env bash

. "${BASH_SOURCE%/*}"/../format/format.sh
. "${BASH_SOURCE%/*}"/args_builtin.sh

"${BASH_SOURCE%/*}"/../hello_world/hello_world.sh
print_arg '$?' "Last command exist status:" "$?"
print_arg '$!' "Last command process id  :" "$!"

print_note "TODO The \$! does not provide the process id of the last command"
