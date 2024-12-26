#!/usr/bin/env bash

# shellcheck disable=SC2016

. "${BASH_SOURCE%/*}"/../format/format.sh

print_source "${BASH_SOURCE%/*}"/hello_world_lib.sh

print_section "execute script via shebang bash"
print_code <<<'./SCRIPT.sh [ARGS]'

print_title "without arguments"
print_code <<<'"${BASH_SOURCE%/*}"/hello_world_lib.sh'
"${BASH_SOURCE%/*}"/hello_world_lib.sh

print_title "with one argument"
print_code <<<'"${BASH_SOURCE%/*}"/hello_world_lib.sh "yourself"'
"${BASH_SOURCE%/*}"/hello_world_lib.sh "yourself"

print_title "with multiple arguments"
print_code <<<'"${BASH_SOURCE%/*}"/hello_world_lib.sh first and last name'
"${BASH_SOURCE%/*}"/hello_world_lib.sh first and last name

print_section "execute script via command line bash"
print_code <<<'bash ./SCRIPT.sh [ARGS]'

print_title "without arguments"
print_code <<<'bash "${BASH_SOURCE%/*}"/hello_world_lib.sh'
bash "${BASH_SOURCE%/*}"/hello_world_lib.sh

print_title "with one argument"
print_code <<<'bash "${BASH_SOURCE%/*}"/hello_world_lib.sh "yourself"'
bash "${BASH_SOURCE%/*}"/hello_world_lib.sh "yourself"

print_title "with multiple arguments"
print_code <<<'bash "${BASH_SOURCE%/*}"/hello_world_lib.sh first and last name'
bash "${BASH_SOURCE%/*}"/hello_world_lib.sh first and last name

print_section "execute script via bash command string"
print_code <<<'bash -c "./SCRIPT.sh [ARGS]"'

print_title "without arguments"
print_code <<<'bash -c "${BASH_SOURCE%/*}/hello_world_lib.sh"'
bash -c "${BASH_SOURCE%/*}/hello_world_lib.sh"

print_title "with one argument"
print_code <<<'bash -c "${BASH_SOURCE%/*}/hello_world_lib.sh yourself"'
bash -c "${BASH_SOURCE%/*}/hello_world_lib.sh yourself"

print_title "with multiple arguments"
print_code <<<'bash -c "${BASH_SOURCE%/*}/hello_world_lib.sh first and last name"'
bash -c "${BASH_SOURCE%/*}/hello_world_lib.sh first and last name"

print_section "load script and execute its functions"
print_code <<'EOF'
. ./SCRIPT.sh
function [ARGS]
EOF

print_title "Load hello_world_lib.sh"
print_code <<<'. "${BASH_SOURCE%/*}"/hello_world_lib.sh'
. "${BASH_SOURCE%/*}"/hello_world_lib.sh

print_title "without arguments"
print_code <<<'hello_world'
hello_world

print_title "with one argument"
print_code <<<'hello_world "yourself"'
hello_world "yourself"

print_title "with multiple arguments"
print_code <<<'hello_world first and last name'
hello_world first and last name
