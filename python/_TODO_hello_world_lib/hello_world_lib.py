#!/bin/python3
"""
Hello world module

This is a simple hello world module that can be imported and used in other
programs or executed directly as a script. It provides a single function,
hello_world, that takes a list of greetings and prints them out. If no greetings
are provided, it defaults to "world".

Usage:
    $ python3 -m hello_world_lib [name ...]

Examples:
    $ python3 -m hello_world_lib
    Hello, world!

    $ python3 -m hello_world_lib to the universe
    Hello, to the universe!
"""

import sys


def hello_world(greetings: list[str]) -> None:
    """
    Hello world function

    This function takes a list of greetings and prints them out.
    If no greetings are provided, it defaults to "world".

    Args:
        greetings (list[str]): A list of greetings to print out.

    Returns:
        None

    Examples:
        >>> hello_world([])
        Hello, world!

        >>> hello_world(["to", "the", "universe"])
        Hello, to the universe!
    """
    greetings = greetings if len(greetings) else ["world"]
    greeting = " ".join(greetings)
    print(f"Hello, {greeting}!")
    return 0


def main() -> None:
    """
    Main function

    This function is the main entry point for the hello world module. It takes
    a list of greetings from the command line and passes them to the hello_world
    function.

    Returns:
        None

    Examples:
        >>> main()
        Hello, world!

        >>> main(["to", "the", "universe"])
        Hello, to the universe!
    """
    exit_code = hello_world(sys.argv[1:])
    sys.exit(exit_code)


if __name__ == "__main__":
    print(f"Executed via {__file__}")
    main()
