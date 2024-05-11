#!/bin/bash

# shellcheck disable=SC2016,SC2119

. "${BASH_SOURCE%/*}"/../format/format.sh

print_source "${BASH_SOURCE%/*}"/hello_world_lib_nested.sh

print_title "Load hello_world_lib_nested.sh"
print_code <<<'. "${BASH_SOURCE%/*}"/hello_world_lib_nested.sh'
. "${BASH_SOURCE%/*}"/hello_world_lib_nested.sh

print_title "Try to execute hello_world function which is defined within the main function"
print_code <<<'hello_world "$@"'
hello_world "$@"
print_note "Does not work yet"

print_title "Execute main function"
print_code <<<'main "$@"'
main "$@"

print_title "Execute hello_world function which is defined within the main function"
print_code <<<'hello_world "$@"'
hello_world "$@"
