#!/usr/bin/env bash

# shellcheck disable=SC2016,SC2031

. "${BASH_SOURCE%/*}"/../format/format.sh

print_source "${BASH_SOURCE%/*}"/hello_world_subshell_nested.sh

print_title "Load hello_world_subshell_nested.sh"
print_code <<<'. "${BASH_SOURCE%/*}"/hello_world_subshell_nested.sh'
. "${BASH_SOURCE%/*}"/hello_world_subshell_nested.sh

print_title "Execute subshell"
print_code <<<'subshell "$@"'
subshell "$@"

print_title "Try to execute hello_world function defined within the subshell"
print_code <<<'hello_world "$@"'
hello_world "$@"
print_note "This does not work as the hello_world function is defined within a subshell"

print_title "Variables"
echo "Global var        : ${global_var}"
echo "Function var      : ${fun_var}"
echo "Local function var: ${local_fun_var}"
echo "Subshell var      : ${subshell_var}"
echo "Local subshell var: ${local_subshell_var}"
print_note "Only the global variable is defined"
