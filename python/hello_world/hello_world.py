#!/usr/bin/env python3
"""
Hello world script

This is a simple hello world script that takes a list of greetings and prints
them out. If no greetings are provided, it defaults to "world".

Usage:
    python3 hello_world.py [name ...]

Examples:
    $ python3 hello_world.py
    Hello, world!

    $ python3 hello_world.py to the universe
    Hello, to the universe!
"""

import sys

greetings = sys.argv[1:] if sys.argv[1:] else ["world"]
greeting = " ".join(greetings)

print(f"Hello, {greeting}!")
