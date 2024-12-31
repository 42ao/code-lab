#!/usr/bin/env bash

# shellcheck disable=SC2016

. "${BASH_SOURCE%/*}"/../../bash/format/format.sh

python="python3"
script_path="${BASH_SOURCE%/*}/hello_world_lib.py"

print_source "$script_path"
print_code <<<"working directory: $(pwd)"

print_section "execute script via shebang interpreter"
print_code <<<'./SCRIPT.py [ARGS]'

print_title "without arguments"
print_code <<<"$script_path"
"$script_path"

print_title "with one argument"
print_code <<<"$script_path \"yourself\""
"$script_path" "yourself"

print_title "with multiple arguments"
print_code <<<"$script_path first and last name"
"$script_path" first and last name

print_section "execute script via command line interpreter"
print_code <<<"${python} ./SCRIPT.py [ARGS]"

print_title "without arguments"
print_code <<<"${python} \"$script_path\""
${python} "$script_path"

print_title "with one argument"
print_code <<<"${python} \"$script_path\" \"yourself\""
${python} "$script_path" "yourself"

print_title "with multiple arguments"
print_code <<<"${python} \"$script_path\" first and last name"
${python} "$script_path" first and last name

print_section "execute package via command line interpreter"
print_code <<<"${python} ./PACKAGE [ARGS]"

print_note "This is not a python package"

print_title "without arguments"
print_code <<<"${python} \"${BASH_SOURCE%/*}\""
${python} "${BASH_SOURCE%/*}"

print_title "with one argument"
print_code <<<"${python} \"${BASH_SOURCE%/*}\" \"yourself\""
${python} "${BASH_SOURCE%/*}" "yourself"

print_title "with multiple arguments"
print_code <<<"${python} \"${BASH_SOURCE%/*}\" first and last name"
${python} "${BASH_SOURCE%/*}" first and last name

print_section "execute module via command line interpreter"
print_code <<<"${python} -m MODULE [ARGS]"

print_note "Only works from within the module directory, or"
print_note "if the module is installed in the python path"

print_title "without arguments"
print_code <<<"${python} -m hello_world_lib"
${python} -m hello_world_lib

print_title "with one argument"
print_code <<<"${python} -m hello_world_lib \"yourself\""
${python} -m hello_world_lib "yourself"

print_title "with multiple arguments"
print_code <<<"${python} -m hello_world_lib first and last name"
${python} -m hello_world_lib first and last name

print_section "execute imported function in python command string"
print_code <<<"${python} -c \"from MODULE import function; function([ARGS])\""

print_note "Only works from within the module directory, or"
print_note "if the module is installed in the python path"

print_title "without arguments"
print_code <<<"${python} -c \"from hello_world_lib import hello_world; hello_world([])\""
${python} -c "from hello_world_lib import hello_world; hello_world([])"

print_title "with one argument"
print_code <<<"${python} -c \"from hello_world_lib import hello_world; hello_world(greetings=['yourself'])\""
${python} -c "from hello_world_lib import hello_world; hello_world(greetings=['yourself'])"

print_title "with multiple arguments"
print_code <<<"${python} -c \"from hello_world_lib import hello_world; hello_world(greetings=['first', 'and', 'last', 'name'])\""
${python} -c "from hello_world_lib import hello_world; hello_world(greetings=['first', 'and', 'last', 'name'])"
