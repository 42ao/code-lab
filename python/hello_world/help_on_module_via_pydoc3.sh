#!/usr/bin/env bash

. "${BASH_SOURCE%/*}"/../../bash/format/format.sh

print_title "Get module help via pydoc3"
pydoc3 hello_world

print_note "This still executes the script itself"
