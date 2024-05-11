#!/bin/bash

# shellcheck disable=SC2119,SC2016,SC2031

. "${BASH_SOURCE%/*}"/../format/format.sh

print_source "${BASH_SOURCE%/*}"/hello_world_subshell.sh

print_title "Load hello_world_subshell.sh"
print_code <<<'. "${BASH_SOURCE%/*}"/hello_world_subshell.sh'
. "${BASH_SOURCE%/*}"/hello_world_subshell.sh

print_title "Execute subshell"
print_code <<<'subshell "$@"'
subshell "$@"

print_title "Execute hello_world function"
print_code <<<'hello_world "$@"'
hello_world "$@"

print_title "Variables"
echo "Global var        : ${global_var}"
echo "Function var      : ${fun_var}"
echo "Local function var: ${local_fun_var}"
echo "Subshell var      : ${subshell_var}"
echo "Local subshell var: ${local_subshell_var}"
print_note "fun_var is globally defined"
