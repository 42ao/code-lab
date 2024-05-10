#!/bin/bash

. "${BASH_SOURCE%/*}"/../../bash/format/format.sh

print_title "Get module help via import"
python3 -c "import hello_world; help(hello_world)"

print_note "This still executes the script itself"
