#!/bin/bash

hello_world() {
	local greeting="${*:-world}"
	echo "Hello, ${greeting}!"
}

if [[ ${BASH_SOURCE[0]} == "$0" ]]; then
	hello_world "$@"
fi
