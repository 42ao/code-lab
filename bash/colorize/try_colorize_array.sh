#!/usr/bin/env bash

# shellcheck disable=SC2016,SC2119

. "${BASH_SOURCE%/*}"/../format/format.sh
. "${BASH_SOURCE%/*}"/colorize.sh

print_source "${BASH_SOURCE%/*}/colorize.sh"

print_title "Define array and color"
print_code <<'EOF'
array=("Hello" "and" "goodbye")
color="bright_yellow"
EOF
array=("Hello" "and" "goodbye")
color="bright_yellow"

print_title "Colorize array elements in loop"
print_code <<'EOF'
for element in "${array[@]}"; do
  echo "$(colorize "${color}" "${element}")"
done
EOF
for element in "${array[@]}"; do
    colorize "${color}" "${element}"
done

print_title "Colorize array elements with '@'"
print_code <<<'colorize "${color}" "${array[@]}"'
colorize "${color}" "${array[@]}"

print_title "Colorize concatenated array with '*'"
print_code <<<'colorize "${color}" "${array[*]}"'
colorize "${color}" "${array[*]}"
