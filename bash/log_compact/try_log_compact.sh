#!/bin/bash

# shellcheck disable=SC2119

. "${BASH_SOURCE%/*}"/../format/format.sh
. "${BASH_SOURCE%/*}/log_compact.sh"

print_title "Define message"
print_code <<<'message="abc123"'
message="abc123"

try_log_compact_with_log_level_debug_and_no_color() {
	LOG_LEVEL=DEBUG
	LOG_COLORED=false

	print_title "Log compact with log level ${LOG_LEVEL} and no color"
	print_code <<'EOF'
log_d "${message}"
log_i "${message}"
log_w "${message}"
log_e "${message}"
EOF

	log_d "${message}"
	log_i "${message}"
	log_w "${message}"
	log_e "${message}"
}
try_log_compact_with_log_level_debug_and_no_color

try_log_compact_with_log_level_info_and_no_color() {
	LOG_LEVEL=INFO
	LOG_COLORED=false

	print_title "Log compact with log level ${LOG_LEVEL} and no color"
	print_code <<'EOF'
log_d "${message}"
log_i "${message}"
log_w "${message}"
log_e "${message}"
EOF

	log_d "${message}"
	log_i "${message}"
	log_w "${message}"
	log_e "${message}"
}
try_log_compact_with_log_level_info_and_no_color

try_log_compact_with_log_level_warn_and_no_color() {
	LOG_LEVEL=WARN
	LOG_COLORED=false

	print_title "Log compact with log level ${LOG_LEVEL} and no color"
	print_code <<'EOF'
log_d "${message}"
log_i "${message}"
log_w "${message}"
log_e "${message}"
EOF

	log_d "${message}"
	log_i "${message}"
	log_w "${message}"
	log_e "${message}"
}
try_log_compact_with_log_level_warn_and_no_color

try_log_compact_with_log_level_error_and_no_color() {
	LOG_LEVEL=ERROR
	LOG_COLORED=false

	print_title "Log compact with log level ${LOG_LEVEL} and no color"
	print_code <<'EOF'
log_d "${message}"
log_i "${message}"
log_w "${message}"
log_e "${message}"
EOF

	log_d "${message}"
	log_i "${message}"
	log_w "${message}"
	log_e "${message}"
}
try_log_compact_with_log_level_error_and_no_color

try_log_compact_with_log_level_debug_and_color() {
	LOG_LEVEL=DEBUG
	LOG_COLORED=true

	print_title "Log compact with log level ${LOG_LEVEL} and color"
	print_code <<'EOF'
log_d "${message}"
log_i "${message}"
log_w "${message}"
log_e "${message}"
EOF

	log_d "${message}"
	log_i "${message}"
	log_w "${message}"
	log_e "${message}"
}
try_log_compact_with_log_level_debug_and_color

try_log_compact_with_log_level_info_and_color() {
	LOG_LEVEL=INFO
	LOG_COLORED=true

	print_title "Log compact with log level ${LOG_LEVEL} and color"
	print_code <<'EOF'
log_d "${message}"
log_i "${message}"
log_w "${message}"
log_e "${message}"
EOF

	log_d "${message}"
	log_i "${message}"
	log_w "${message}"
	log_e "${message}"
}
try_log_compact_with_log_level_info_and_color

try_log_compact_with_log_level_warn_and_color() {
	LOG_LEVEL=WARN
	LOG_COLORED=true

	print_title "Log compact with log level ${LOG_LEVEL} and color"
	print_code <<'EOF'
log_d "${message}"
log_i "${message}"
log_w "${message}"
log_e "${message}"
EOF

	log_d "${message}"
	log_i "${message}"
	log_w "${message}"
	log_e "${message}"
}
try_log_compact_with_log_level_warn_and_color

try_log_compact_with_log_level_error_and_color() {
	LOG_LEVEL=ERROR
	LOG_COLORED=true

	print_title "Log compact with log level ${LOG_LEVEL} and color"
	print_code <<'EOF'
log_d "${message}"
log_i "${message}"
log_w "${message}"
log_e "${message}"
EOF

	log_d "${message}"
	log_i "${message}"
	log_w "${message}"
	log_e "${message}"
}
try_log_compact_with_log_level_error_and_color
