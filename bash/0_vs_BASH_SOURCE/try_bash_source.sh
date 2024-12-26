#!/usr/bin/env bash

# shellcheck disable=SC2016

. "${BASH_SOURCE%/*}"/../format/format.sh

print_bof "try_bash_source.sh"

print_title "Execute lib/bash_source.sh"
"${BASH_SOURCE%/*}"/lib/bash_source.sh

print_title "Load bash_source.sh"
. "${BASH_SOURCE%/*}"/lib/bash_source.sh

print_eof "try_bash_source.sh"
