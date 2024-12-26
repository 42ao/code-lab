#!/usr/bin/env bash

# shellcheck disable=SC2016

. "${BASH_SOURCE%/*}"/../format/format.sh

print_title "Define array"
print_code <<<'array=("a b" "c d" "e f")'
array=("a b" "c d" "e f")

print_title "Access individual elements"
print_code <<<'echo "${array[0]}"'
echo "${array[0]}"
print_code <<<'echo "${array[1]}"'
echo "${array[1]}"
print_code <<<'echo "${array[2]}"'
echo "${array[2]}"

print_title "Access all elements with '*'"
print_code <<<'echo "${array[*]}"'
echo "${array[*]}"

print_title "Access all elements with '@'"
print_code <<<'echo "${array[@]}"'
echo "${array[@]}"

print_title "Number of elements via '#' and '*'"
print_code <<<'echo "${#array[*]}"'
echo "${#array[*]}"

print_title "Number of elements via '#' and '@'"
print_code <<<'echo "${#array[@]}"'
echo "${#array[@]}"
