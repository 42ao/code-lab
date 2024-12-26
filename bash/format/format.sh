#!/usr/bin/env bash

. "${BASH_SOURCE%/*}"/../ansi/ansi.sh

COLOR_SECTION=${COLOR_SECTION:-GREEN}
COLOR_TITLE=${COLOR_TITLE:-BRIGHT_GREEN}
COLOR_CODE=${COLOR_CODE:-GRAY}
COLOR_NOTE=${COLOR_NOTE:-BRIGHT_YELLOW}
COLOR_FILE=${COLOR_FILE:-BRIGHT_CYAN}

PADDING_WIDTH=${PADDING_WIDTH:-80}

format() {
    local fmt=$1
    local text=$2
    echo -e "${ANSI[$fmt]}${text}${ANSI[RESET]}"
}

bold() {
    local text=$1
    format "BOLD" "${text}"
}

padded() {
    local input=$1
    local padding_char=${2:-_}
    local padding_count
    local padding
    padding_count=$((PADDING_WIDTH - 1 - ${#input}))
    padding=$(printf "%.0s${padding_char}" $(seq 1 "${padding_count}"))
    echo -e "${input} ${padding}"
}

print_section() {
    local section=$1
    echo
    bold "$(format "${COLOR_SECTION}" "$(padded "${section^^}")")"
}

print_title() {
    local title=$1
    echo
    format "${COLOR_TITLE}" "${title}"
}

# shellcheck disable=SC2120,SC2086
print_code() {
    local code
    code=$(cat $1)
    format "${COLOR_CODE}" "${code}"
}

print_note() {
    local note=$1
    format "${COLOR_NOTE}" "NOTE ${note}"
}

print_bof() {
    local file_name=$1
    format "${COLOR_FILE}" "$(padded "BOF ${file_name}" "\`")"
}

print_eof() {
    local file_name=$1
    format "${COLOR_FILE}" "$(padded "EOF ${file_name}" "\`")"
}

print_source() {
    local source=$1
    print_title "SOURCE"
    print_bof "${source}"
    print_code <"${source}"
    print_eof "${source}"
}
