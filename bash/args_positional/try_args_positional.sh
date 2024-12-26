#!/usr/bin/env bash

. "${BASH_SOURCE%/*}"/../format/format.sh

print_source "${BASH_SOURCE%/*}"/args_positional.sh

print_title "Execute args_positional.sh without required argument"
print_code <<'EOF'
"${BASH_SOURCE%/*}"/args_positional.sh
echo "Exit code: $?"
EOF
"${BASH_SOURCE%/*}"/args_positional.sh
echo "Exit code: $?"

print_title "Execute args_positional.sh with 1 required argument"
print_code <<'EOF'
"${BASH_SOURCE%/*}"/args_positional.sh arg1
echo "Exit code: $?"
EOF
"${BASH_SOURCE%/*}"/args_positional.sh arg1
echo "Exit code: $?"

print_title "Execute args_positional.sh with 2 arguments"
print_code <<'EOF'
"${BASH_SOURCE%/*}"/args_positional.sh arg1 arg2
echo "Exit code: $?"
EOF
"${BASH_SOURCE%/*}"/args_positional.sh arg1 arg2
echo "Exit code: $?"

print_title "Execute args_positional.sh with 3 arguments"
print_code <<'EOF'
"${BASH_SOURCE%/*}"/args_positional.sh arg1 arg2 arg3'
echo "Exit code: $?"
EOF
"${BASH_SOURCE%/*}"/args_positional.sh arg1 arg2 arg3
echo "Exit code: $?"
