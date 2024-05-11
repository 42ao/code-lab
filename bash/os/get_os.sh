#!/bin/bash

get_os() {
	os_release="/etc/os-release"
	if [[ ! -f ${os_release} ]]; then
		echo >&2 "Cannot determine OS as ${os_release} does not exist"
		echo
	else
		local id
		id=$(awk -F= '/^ID=/{print $2}' /etc/os-release)
		echo "${id}"
	fi
}

if [[ ${BASH_SOURCE[0]} == "$0" ]]; then
	get_os
fi
