#!/bin/python3

import sys

greetings = sys.argv[1:] if sys.argv[1:] else ["world"]
greeting = " ".join(greetings)

print(f"Hello, {greeting}!")
