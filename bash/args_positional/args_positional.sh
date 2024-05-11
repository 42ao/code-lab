#!/bin/bash

required=${1}
default_empty=${2:-}
default_value=${3:-default}

if [[ -z ${required} ]]; then
	echo "Argument 'required' is missing"
	exit 1
fi

echo "Required arg          : ${required}"
echo "Arg with empty default: ${default_empty}"
echo "Arg with default value: ${default_value}"
