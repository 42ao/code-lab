#!/usr/bin/env bash

# shellcheck disable=SC2016

. "${BASH_SOURCE%/*}"/../../bash/format/format.sh

python="/usr/bin/env python3"
print_title "Use ${python}"

print_source "${BASH_SOURCE%/*}"/hello_world.py

print_section "execute script via shebang interpreter"
print_code <<<'./SCRIPT.py [ARGS]'

print_title "without arguments"
print_code <<<'"${BASH_SOURCE%/*}"/hello_world.py'
"${BASH_SOURCE%/*}"/hello_world.py

print_title "with one argument"
print_code <<<'"${BASH_SOURCE%/*}"/hello_world.py "yourself"'
"${BASH_SOURCE%/*}"/hello_world.py "yourself"

print_title "with multiple arguments"
print_code <<<'"${BASH_SOURCE%/*}"/hello_world.py first and last name'
"${BASH_SOURCE%/*}"/hello_world.py first and last name

print_section "execute script via command line interpreter"
print_code <<<"${python} ./SCRIPT.py [ARGS]"

print_title "without arguments"
print_code <<<"${python} \"${BASH_SOURCE%/*}\"/hello_world.py"
${python} "${BASH_SOURCE%/*}"/hello_world.py

print_title "with one argument"
print_code <<<"${python} \"${BASH_SOURCE%/*}\"/hello_world.py \"yourself\""
${python} "${BASH_SOURCE%/*}"/hello_world.py "yourself"

print_title "with multiple arguments"
print_code <<<'${python} "${BASH_SOURCE%/*}"/hello_world.py first and last name'
${python} "${BASH_SOURCE%/*}"/hello_world.py first and last name

print_section "execute module via command line interpreter"
print_code <<<"${python} -m MODULE [ARGS]"

print_note "Only works from within the module directory"

print_title "without arguments"
print_code <<<"${python} -m hello_world"
${python} -m hello_world

print_title "with one argument"
print_code <<<"${python} -m hello_world \"yourself\""
${python} -m hello_world "yourself"

print_title "with multiple arguments"
print_code <<<"${python} -m hello_world first and last name"
${python} -m hello_world first and last name

print_section "execute imported module in python command string"
print_code <<<"${python} -c \"import MODULE\""

print_title "without arguments"
print_code <<<"${python} -c \"import hello_world\""
${python} -c "import hello_world"
print_note "Only works from within the module directory"
print_note "No arguments can be passed"

print_section "execute module folder via command line interpreter"
print_code <<<"${python} -m MODULE_FOLDER [ARGS]"

print_source "${BASH_SOURCE%/*}"/__main__.py

print_title "go to parent directory"
print_code <<<'cd ..'
cd ..

print_title "without arguments"
print_code <<<"${python} -m hello_world"
${python} -m hello_world

print_title "with one argument"
print_code <<<"${python} -m hello_world \"yourself\""
${python} -m hello_world "yourself"

print_title "with multiple arguments"
print_code <<<"${python} -m hello_world first and last name"
${python} -m hello_world first and last name
