#!/usr/bin/env bash

. "${BASH_SOURCE%/*}"/../colorize/colorize.sh

# LOG parameters
LOG_LEVEL=${LOG_LEVEL:-INFO}
LOG_COLORED=${LOG_COLORED:-true}

# LOG constants
if [[ -z ${LOG_LEVELS[*]} ]]; then
    declare -A -r LOG_LEVELS=(
        [DEBUG]=0
        [INFO]=1
        [WARN]=2
        [ERROR]=3
    )
fi

if [[ -z ${LOG_LEVEL_COLORS[*]} ]]; then
    declare -A -r LOG_LEVEL_COLORS=(
        [DEBUG]="BRIGHT_BLUE"
        [INFO]="BRIGHT_GREEN"
        [WARN]="BRIGHT_YELLOW"
        [ERROR]="BRIGHT_RED"
    )
fi

# LOG functions

log() (
    log_message_compact() {
        local level=${1^^}
        local message=${2}
        local level_size=5

        if [[ ${LOG_LEVELS[${level}]} -ge ${LOG_LEVELS[${LOG_LEVEL:-INFO}]} ]]; then
            if [[ ${LOG_COLORED} == true ]]; then
                level_size=14
                local level_color=${LOG_LEVEL_COLORS[${level}]}
                level=$(colorize "${level_color}" "${level}")
                message=$(colorize "BRIGHT_WHITE" "${message}")
            fi
            printf "%${level_size}s ${message}\n" "${level}"
        fi
    }
    log_message_compact "$@"
)

log_d() {
    local level=DEBUG
    local message=${1}
    log "${level}" "${message}"
}

log_i() {
    local level=INFO
    local message=${1}
    log "${level}" "${message}"
}

log_w() {
    local level=WARN
    local message=${1}
    log "${level}" "${message}"
}

log_e() {
    local level=ERROR
    local message=${1}
    log "${level}" "${message}"
}
