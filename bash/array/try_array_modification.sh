#!/bin/bash

# shellcheck disable=SC2119

. "${BASH_SOURCE%/*}"/../format/format.sh

print_array() {
	local -n a=$1
	for element in "${a[@]}"; do
		echo "${element}"
	done
}

print_title "Define array"
print_code <<<'array=("a b" "c d")'
array=("a b" "c d")
print_array array

print_title "Add element"
print_code <<<'array+=("e f")'
array+=("e f")
print_array array

print_title "Delete first element"
print_code <<<'unset array[0]'
unset "array[0]"
print_array array

print_title "Delete array"
print_code <<<'unset array'
unset array
print_array array
