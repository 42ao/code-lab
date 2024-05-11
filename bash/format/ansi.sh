#!/bin/bash

if [[ -z ${ANSI[*]} ]]; then
	# Read-only associative array
	declare -A -r ANSI=(
		[RESET]="\e[0m"
		# Formatting
		[BOLD]="\e[1m"
		[DIM]="\e[2m"
		[ITALIC]="\e[3m"
		[UNDERLINE]="\e[4m"
		[BLINK]="\e[5m"
		[INVERT]="\e[7m"
		[HIDDEN]="\e[8m"
		# Regular colors
		[BLACK]="\e[30m"
		[RED]="\e[31m"
		[GREEN]="\e[32m"
		[YELLOW]="\e[33m"
		[BLUE]="\e[34m"
		[MAGENTA]="\e[35m"
		[CYAN]="\e[36m"
		[WHITE]="\e[37m"
		[GRAY]="\e[90m"
		# Bright colors
		[BRIGHT_BLACK]="\e[90m"
		[BRIGHT_RED]="\e[91m"
		[BRIGHT_GREEN]="\e[92m"
		[BRIGHT_YELLOW]="\e[93m"
		[BRIGHT_BLUE]="\e[94m"
		[BRIGHT_MAGENTA]="\e[95m"
		[BRIGHT_CYAN]="\e[96m"
		[BRIGHT_WHITE]="\e[97m"
	)
fi
