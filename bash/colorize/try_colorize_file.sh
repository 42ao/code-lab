#!/usr/bin/env bash

# shellcheck disable=SC2016,SC2119

. "${BASH_SOURCE%/*}"/../format/format.sh
. "${BASH_SOURCE%/*}"/colorize.sh

print_source "${BASH_SOURCE%/*}/colorize.sh"

print_title "Define color"
print_code <<<'color="bright_yellow"'
color="bright_yellow"

print_title "Colorize file content"
print_code <<<'colorize "${color}" "$(cat "${BASH_SOURCE%/*}/try_colorize_colors.sh")"'
colorize "${color}" "$(cat "${BASH_SOURCE%/*}/try_colorize_colors.sh")"
