#!/bin/bash

main() {
	hello_world() {
		local greeting="${*:-world}"
		echo "Hello, ${greeting}!"
	}
	hello_world "$@"
}

if [[ ${BASH_SOURCE[0]} == "$0" ]]; then
	main "$@"
fi
