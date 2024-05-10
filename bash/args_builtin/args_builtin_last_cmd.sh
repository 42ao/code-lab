#!/bin/bash

. "${BASH_SOURCE%/*}"/../format/format.sh
. "${BASH_SOURCE%/*}"/args_builtin.sh

"${BASH_SOURCE%/*}"/../hello_world/hello_world.sh
print_arg '$?' "Last command exist status:" "$?"
print_arg '$!' "Last command process id  :" "$!"

# TODO The $! does not provide the process id of the last command
