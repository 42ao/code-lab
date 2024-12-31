#!/usr/bin/env bash

echo "Activate virtual environment"
. ../.venv/bin/activate

echo "Use pytest from virtual environment"
which pytest

echo "Run tests"
pytest -v
