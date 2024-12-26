#!/usr/bin/env bash

# LOG parameters
LOG_LEVEL=${LOG_LEVEL:-INFO}
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

# LOG functions

current_time() {
    local timestamp
    timestamp=$(date -u "${LOG_DATE_FORMAT}")
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
            printf "%s%s %s, %s %s, %s %s, %s %s%s\n" \
                "{" \
                '"timestamp":' "\"${timestamp}\"" \
                '"source":' "\"${source}\"" \
                '"level":' "${level}" \
                '"message":' "\"${message}\"" \
                "}"
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
