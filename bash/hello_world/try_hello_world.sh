#!/bin/bash

# shellcheck disable=SC2016,SC2119

. "${BASH_SOURCE%/*}"/../format/format.sh

print_source "${BASH_SOURCE%/*}"/hello_world.sh

print_section "execute script via shebang bash"
print_code <<<'./SCRIPT.sh [ARGS]'

print_title "without arguments"
print_code <<<'"${BASH_SOURCE%/*}"/hello_world.sh'
"${BASH_SOURCE%/*}"/hello_world.sh

print_title "with one argument"
print_code <<<'"${BASH_SOURCE%/*}"/hello_world.sh "yourself"'
"${BASH_SOURCE%/*}"/hello_world.sh "yourself"

print_title "with multiple arguments"
print_code <<<'"${BASH_SOURCE%/*}"/hello_world.sh first and last name'
"${BASH_SOURCE%/*}"/hello_world.sh first and last name

print_section "execute script via command line bash"
print_code <<<'bash SCRIPT.sh [ARGS]'

print_title "without arguments"
print_code <<<'bash "${BASH_SOURCE%/*}"/hello_world.sh'
bash "${BASH_SOURCE%/*}"/hello_world.sh

print_title "with one argument"
print_code <<<'bash "${BASH_SOURCE%/*}"/hello_world.sh "yourself"'
bash "${BASH_SOURCE%/*}"/hello_world.sh "yourself"

print_title "with multiple arguments"
print_code <<<'bash "${BASH_SOURCE%/*}"/hello_world.sh first and last name'
bash "${BASH_SOURCE%/*}"/hello_world.sh first and last name

print_section "execute script via bash command string"
print_code <<<'bash -c "SCRIPT.sh [ARGS]"'

print_title "without arguments"
print_code <<<'bash -c "${BASH_SOURCE%/*}"/hello_world.sh'
bash -c "${BASH_SOURCE%/*}/hello_world.sh"

print_title "with one argument"
print_code <<<'bash -c "${BASH_SOURCE%/*}/hello_world.sh yourself"'
bash -c "${BASH_SOURCE%/*}/hello_world.sh yourself"

print_title "with multiple arguments"
print_code <<<'bash -c "${BASH_SOURCE%/*}/hello_world.sh first and last name"'
bash -c "${BASH_SOURCE%/*}/hello_world.sh first and last name"
