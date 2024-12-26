#!/usr/bin/env bash

# shellcheck disable=SC2119

. "${BASH_SOURCE%/*}"/../format/format.sh

print_title "Define array"
print_code <<<'array=("a b" "c d" "e f")'
array=("a b" "c d" "e f")

print_title "Pass array to function by value"
print_code <<'EOF'
function print_array {
    local array=("$1")
    for element in "${array[@]}"; do
        echo "${element}"
    done
}
print_array "${array[@]}"
EOF
function print_array {
    local array=("$@")
    for element in "${array[@]}"; do
        echo "${element}"
    done
}
print_array "${array[@]}"

print_title "Pass array to function by reference"
print_code <<'EOF'
function print_array_ref {
    local -n a=$1
    for element in "${a[@]}"; do
        echo "${element}"
    done
}
print_array_ref array
EOF
function print_array_ref {
    local -n a=$1
    for element in "${a[@]}"; do
        echo "${element}"
    done
}
print_array_ref array
print_note "The array variable 'a' within the function must not have the same name as any variable in the global scope."

print_title "Return array from function by value and read it into a variable with readarray"
print_code <<'EOF'
function create_array {
    local array=()
    array+=('a b')
    array+=('c*')
    array+=('%d')
    array+=('e.f')
    for element in "${array[@]}"; do
        echo "${element}"
    done
}
unset array
array=()
readarray -t array < <(create_array)
print_array_ref array
EOF
function create_array {
    local array=()
    array+=('a b')
    array+=('c*')
    array+=('%d')
    array+=('e.f')
    for element in "${array[@]}"; do
        echo "${element}"
    done
}
unset array
array=()
# shellcheck disable=SC2312
readarray -t array < <(create_array)
print_array_ref array

print_title "Return array from function by reference"
print_code <<'EOF'
function create_array_ref {
	local -n a=$1
	a+=('a b')
	a+=('c*')
	a+=('%d')
	a+=('e.f')
}
unset array
array=()
create_array_ref array
print_array_ref array
EOF
function create_array_ref {
    local -n a=$1
    a+=('a b')
    a+=('c*')
    a+=('%d')
    a+=('e.f')
}
unset array
array=()
create_array_ref array
print_array_ref array
