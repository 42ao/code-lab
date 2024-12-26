#!/usr/bin/env bash

global_var="global"

hello_world() {
    local local_fun_var="${*:-world}"
    fun_var="fun"
    echo "global_var        : ${global_var}"
    echo "fun_var           : ${fun_var}"
    echo "local_fun_var     : ${local_fun_var}"
}

subshell() (
    # With () instead of {}, the function is executed in a subshell
    local local_subshell_var="local_subshell"
    subshell_var="subshell"
    hello_world "$@"
    echo "subshell_var      : ${subshell_var}"
    echo "local_subshell_var: ${local_subshell_var}"
)

if [[ ${BASH_SOURCE[0]} == "$0" ]]; then
    subshell "$@"
fi
