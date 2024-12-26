#!/usr/bin/env bash

echo "Activate virtual environment"
. ../.venv/bin/activate

echo "Use pytest from virtual environment"
which pytest

echo "Run test functions"
pytest -v -k test_to_ansi_returns_ansi_instance_for_ansi_instance
pytest -v -k test_to_ansi_returns_ansi_instance_for_valid_ansi_name
pytest -v -k test_to_ansi_raises_value_error_for_invalid_ansi_name
