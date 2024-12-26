#!/usr/bin/env bash

. "${BASH_SOURCE%/*}"/../colorize/colorize.sh

# LOG parameters
LOG_LEVEL=${LOG_LEVEL:-INFO}
LOG_COLORED=${LOG_COLORED:-true}
LOG_DATE_FORMAT=${LOG_DATE_FORMAT:-"+%Y-%m-%dT%H:%M:%S.%3NZ"}

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

current_time() {
    local timestamp
    timestamp=$(date --utc "${LOG_DATE_FORMAT}")
    printf '%s' "${timestamp}"
}

log() (
    log_message_structured() {
        local source
        source=$(basename "$0")
        local level=${1^^}
        local message=$2

        if [[ ${LOG_LEVELS[${level}]} -ge ${LOG_LEVELS[${LOG_LEVEL:-INFO}]} ]]; then
            local timestamp
            local func=${FUNCNAME[3]}
            timestamp=$(current_time)
            if [[ -n ${func} ]]; then
                source="${source}:${func}"
            fi
            if [[ ${LOG_COLORED} == true ]]; then
                local level_color=${LOG_LEVEL_COLORS[${level}]}
                timestamp=$(colorize "GRAY" "\"${timestamp}"\")
                source=$(colorize "GRAY" "\"${source}"\")
                level=$(colorize "${level_color}" \""${level}"\")
                message=$(colorize "BRIGHT_WHITE" \""${message}"\")
                printf "%s %s, %s %s, %s %s, %s %s%s\n" \
                    "$(colorize "GRAY" '{"timestamp":')" \
                    "${timestamp}" \
                    "$(colorize "GRAY" '"source":')" \
                    "${source}" \
                    "$(colorize "GRAY" '"level":')" \
                    "${level}" \
                    "$(colorize "GRAY" '"message":')" \
                    "${message}" \
                    "$(colorize "GRAY" "}")" || true
            else
                printf "%s %s, %s %s, %s %s, %s %s%s\n" \
                    '"timestamp":' "\"${timestamp}\"" \
                    '"source":' "\"${source}\"" \
                    '"level":' "${level}" \
                    '"message":' "\"${message}\"" \
                    "}"
            fi
        fi
    }
    log_message_structured "$@"
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
