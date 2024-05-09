#!/bin/bash

. "${BASH_SOURCE%/*}"/../format/format.sh
. "${BASH_SOURCE%/*}"/colorize.sh

print_source "${BASH_SOURCE%/*}/colorize.sh"

print_color() {
	color=$1
	colorize "${color}" "${color}"
}

print_title "Try colorize with lowercase colors"
lowercase_colors=("black" "red" "green" "yellow" "blue" "magenta" "cyan" "white" "gray" "bright_black" "bright_red" "bright_green" "bright_yellow" "bright_blue" "bright_magenta" "bright_cyan" "bright_white")
for color in "${lowercase_colors[@]}"; do
	print_color "${color}"
done

print_title "Try colorize with uppercase colors"
uppercase_colors=("BLACK" "RED" "GREEN" "YELLOW" "BLUE" "MAGENTA" "CYAN" "WHITE" "GRAY" "BRIGHT_BLACK" "BRIGHT_RED" "BRIGHT_GREEN" "BRIGHT_YELLOW" "BRIGHT_BLUE" "BRIGHT_MAGENTA" "BRIGHT_CYAN" "BRIGHT_WHITE")
for color in "${uppercase_colors[@]}"; do
	print_color "${color}"
done

print_title "Try colorize with invalid color"
invalid_color="invalid"
print_color "${invalid_color}"
