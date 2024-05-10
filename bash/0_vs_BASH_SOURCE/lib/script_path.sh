#!/bin/bash

# shellcheck disable=SC2312

. "${BASH_SOURCE%/*}"/../../format/format.sh

print_bof "script_path.sh"

print_title "Script path"
echo "BASH_SOURCE[0]                              : ${BASH_SOURCE[0]}"
echo "\$0                                          : $0"

print_title "Script directory"
echo "\$(dirname \"\$(realpath \"\${BASH_SOURCE[0]}\")\"): $(dirname "$(realpath "${BASH_SOURCE[0]}")")"
echo "\$(dirname \"\$(realpath \"\$0\")\")               : $(dirname "$(realpath "$0")")"
echo "\$(dirname \"\${BASH_SOURCE[0]}\")              : $(dirname "${BASH_SOURCE[0]}")"
echo "\$(dirname \"\$0\")                             : $(dirname "$0")"
echo "\${BASH_SOURCE%/*}                           : ${BASH_SOURCE%/*}"
echo "\${0%/*}                                     : ${0%/*}"

print_eof "script_path.sh"