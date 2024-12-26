# Tools management script

This repository contains the `tools.sh` script for managing development tools on Ubuntu Linux and macOS.

## Usage
```sh
Usage: ./tools.sh <command> <profile>
Usage: ./tools.sh [setup|remove|list|status] [all|bash|dev|python]
```

## Profiles
The available tool profiles are:
```sh
all
bash
dev
python
```
The tools for each profile are configured in `/<profile>/tools/<profile>_tools.sh`.

## Commands
| Command | Description                                                                            |
| ------- | -------------------------------------------------------------------------------------- |
| setup   | Install all tools configured for the specified profile                                 |
| remove  | Remove all tools configured for the specified profile                                  |
| list    | List all tools configured for the specified profile                                    |
| status  | List all tools configured for the specified profile with their installation status     |
