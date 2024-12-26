#!/usr/bin/env bash

. "${BASH_SOURCE%/*}"/../../bash/format/format.sh

python="/bin/python3"
print_title "Use ${python}"

print_title "Get module help via import"
${python} -c "import hello_world; help(hello_world)"

print_note "This still executes the script itself"
