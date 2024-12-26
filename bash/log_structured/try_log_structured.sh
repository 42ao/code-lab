#!/usr/bin/env bash

. "${BASH_SOURCE%/*}"/../format/format.sh
. "${BASH_SOURCE%/*}"/log_structured.sh

print_title "Define message"
print_code <<<'message="abc123"'
message="abc123"

try_log_structured_with_log_level_debug() {
    LOG_LEVEL=DEBUG

    print_title "Log structured with log level ${LOG_LEVEL} and no color"
    print_code <<'EOF'
log_d "$message"
log_i "$message"
log_w "$message"
log_e "$message"
EOF

    log_d "${message}"
    log_i "${message}"
    log_w "${message}"
    log_e "${message}"
}
try_log_structured_with_log_level_debug

try_log_structured_with_log_level_info() {
    LOG_LEVEL=INFO

    print_title "Log structured with log level ${LOG_LEVEL} and no color"
    print_code <<'EOF'
log_d "$message"
log_i "$message"
log_w "$message"
log_e "$message"
EOF

    log_d "${message}"
    log_i "${message}"
    log_w "${message}"
    log_e "${message}"
}
try_log_structured_with_log_level_info

try_log_structured_with_log_level_warn() {
    LOG_LEVEL=WARN

    print_title "Log structured with log level ${LOG_LEVEL} and no color"
    print_code <<'EOF'
log_d "$message"
log_i "$message"
log_w "$message"
log_e "$message"
EOF

    log_d "${message}"
    log_i "${message}"
    log_w "${message}"
    log_e "${message}"
}
try_log_structured_with_log_level_warn

try_log_structured_with_log_level_error() {
    LOG_LEVEL=ERROR

    print_title "Log structured with log level ${LOG_LEVEL} and no color"
    print_code <<'EOF'
log_d "$message"
log_i "$message"
log_w "$message"
log_e "$message"
EOF

    log_d "${message}"
    log_i "${message}"
    log_w "${message}"
    log_e "${message}"
}
try_log_structured_with_log_level_error
