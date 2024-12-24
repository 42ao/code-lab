# Arno's Code Lab

Welcome to my personal code lab! This is where I experiment with code in various programming languages, as I find that hands-on coding is the best way for me to learn.

The flat folder structure in this repository is designed to be simple and easy to navigate. It has only two levels: `language/topic` or `language/topic_variant`. Each folder contains minimal working examples for specific topics. This structure facilitates easy comparisons of implementations in different languages, as the topics are mostly language-agnostic.

The code in this repository should be self-explanatory and is designed to be directly executable. This means that you can easily experiment with the code yourself. Feel free to explore the code and have fun with it!

## Available languages

* [Development - language agnostic](./dev/dev.md)
* [Bash](./bash/bash.md)
* [Python](./python/python.md)

## Tools

Helpful development tools can be installed via
```sh
./tools.sh setup [all|dev|bash|python]
```
removed via
```sh
./tools.sh remove [all|dev|bash|python]
```
listed via
```sh
./tools.sh list [all|dev|bash|python]
```
or listed with its installation status via
```sh
./tools.sh status [all|dev|bash|python]
```
Supported operating systems are Ubuntu and MacOS.
