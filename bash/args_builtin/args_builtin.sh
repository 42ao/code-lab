#!/usr/bin/env bash

# shellcheck disable=SC2016

. "${BASH_SOURCE%/*}"/../format/format.sh

print_arg() {
	local arg_ref=$1
	local arg_name=$2
	shift 2
	local arg_value=$*
	arg_ref=$(format "BRIGHT_GREEN" "${arg_ref}")
	arg_name=$(format "GRAY" "${arg_name}")
	echo "${arg_ref}" "${arg_name}" "${arg_value}"
}

if [[ ${BASH_SOURCE[0]} == "$0" ]]; then
	print_title "Built-in arguments"
	print_arg '$@             ' "All arguments  " "$@"
	print_arg '$*             ' "All arguments  " "$*"
	print_arg '$BASH_SOURCE[0]' "Script name    " "${BASH_SOURCE[0]}"
	print_arg '$0             ' "Script name    " "$0"
	print_arg '$1             ' "Argument 1     " "$1"
	print_arg '$2             ' "Argument 2     " "$2"
	print_arg '$#             ' "Argument number" "$#"
	print_arg '$$             ' "Process ID     " "$$"
	print_arg '$-             ' "Options        " "$-"
fi
