#!/bin/bash

# shellcheck disable=SC2016,SC2119

. "${BASH_SOURCE%/*}"/../format/format.sh

print_title "Define array"
print_code <<<'array=("a b" "c d" "e f")'
array=("a b" "c d" "e f")

print_title "Iterate array via '@' using \""
print_code <<'EOF'
for element in "${array[@]}"; do
    echo "${element}"
done
EOF
for element in "${array[@]}"; do
    echo "${element}"
done

print_title "Iterate array via indices"
print_code <<'EOF'
for index in "${!array[@]}"; do
    echo $index: "${array[$index]}"
done
EOF
for index in "${!array[@]}"; do
    echo "${index}": "${array[${index}]}"
done

print_title "Iterate array via '*' without \""
print_code <<'EOF'
for element in ${array[*]}; do
    echo "${element}"
done
EOF
# shellcheck disable=SC2048
for element in ${array[*]}; do
    echo "${element}"
done
print_note '${array[*]} without quotes splits the elements at whitespaces or words.'

print_title "Iterate array via '*' using \""
print_code <<'EOF'
for element in "${array[*]}"; do
    echo "${element}"
done
EOF
# shellcheck disable=SC2066
for element in "${array[*]}"; do
    echo "${element}"
done
print_note '"${array[*]}" with double quotes concatenates the array to a string and the loop only runs once.'
