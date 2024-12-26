# Bourne-Again Shell - bash

|         |                                                                    |
| ------- | ------------------------------------------------------------------ |
| source  | https://github.com/gitGNU/gnu_bash                                 |
| website | https://www.gnu.org/software/bash/ <br> https://tiswww.case.edu/php/chet/bash/bashtop.html <br> https://savannah.gnu.org/projects/bash/ |
| docs    | https://www.gnu.org/software/bash/manual/bash.html                                                                            |

## Tools

The tools listed below can be installed using the [tools management script](../docs/tools_management_script.md) by
```sh
<repo_dir>/tools.sh setup bash
```

### shellcheck

|         |                                        |
| ------- | -------------------------------------- |
| tool    | Shell linter                           |
| source  | https://github.com/koalaman/shellcheck |
| website | https://www.shellcheck.net/            |
| docs    | https://www.shellcheck.net/wiki/Home   |

set -x as default argument

### shfmt

|        |                                                |
| ------ | ---------------------------------------------- |
| tool   | Shell formatter                                |
| source | https://github.com/mvdan/sh                    |
| docs   | https://pkg.go.dev/mvdan.cc/sh/v3#readme-shfmt |

## Collections
https://github.com/topics/shell
https://github.com/topics/bash
https://github.com/jlevy/the-art-of-command-line
https://github.com/LeCoupa/awesome-cheatsheets/blob/master/languages/bash.sh
https://github.com/dylanaraps/pure-bash-bible
https://github.com/dylanaraps/pure-sh-bible
https://github.com/alebcay/awesome-shell
https://github.com/ibraheemdev/modern-unix
https://github.com/awesome-lists/awesome-bash

## Customization
https://github.com/starship/starship

## Configuration
https://github.com/mathiasbynens/dotfiles

## Bash functions
https://github.com/gruntwork-io/bash-commons

## Cheatsheets
https://github.com/tldr-pages/tldr
https://github.com/chubin/cheat.sh

## Setup

See also [Bash setup on macOS](../docs/setup_on_macos.md)

## Shebang

In order to use the latest version of bash which is configured in PATH, prefer to use the shebang
```sh
#!/usr/bin/env bash
```
instead of
```sh
#!/usr/bin/env bash
```
which may refer to an older Bash version, e.g., on mac systems.
