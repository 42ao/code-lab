#!/usr/bin/env bash

# shellcheck disable=SC2016

. "${BASH_SOURCE%/*}"/format.sh

print_source "${BASH_SOURCE%/*}"/format.sh

print_title "Set title color env var"
print_code <<<'COLOR_TITLE="BRIGHT_RED"'
COLOR_TITLE="BRIGHT_RED"

print_title "Padded with default padding character"
print_code <<<'padded "This string is padded until ${PADDING_WIDTH} characters"'
padded "This string is padded until ${PADDING_WIDTH} characters"

print_title "Padded with #"
print_code <<<'padded "This string is padded until ${PADDING_WIDTH} characters with #" "#"'
padded "This string is padded until ${PADDING_WIDTH} characters with #" "#"

print_title "Section"
print_code <<<'print_section "section"'
print_section "section"

echo
print_code <<<'print_title "This is a title"'
print_title "This is a title"

print_title "Single line code"
print_code <<<"print_code <<<'Single line code'"

print_title "Multi-line code"
print_code <<'END'
print_code <<'EOF'
echo "Some"
echo "multiline"
echo "code"
EOF
END
echo "Some"
echo "multiline"
echo "code"

print_title "Note"
print_code <<<'print_note "This is a note"'
print_note "This is a note"

print_title "Beginning of file"
print_code <<<'print_bof "file_name.ext"'
print_bof "file_name.ext"

print_title "End of file"
print_code <<<'print_eof "file_name.ext"'
print_eof "file_name.ext"
