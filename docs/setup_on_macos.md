# Setup on macOS

- [Setup on macOS](#setup-on-macos)
  - [Bash setup](#bash-setup)
    - [Check Bash version](#check-bash-version)
    - [Install Bash](#install-bash)
    - [Change default shell](#change-default-shell)

## Bash setup

macOS includes an older version of Bash due to licensing. The scripts in this repository require a newer version of Bash to function correctly, including color support.

### Check Bash version
Check the current Bash version with:
```sh
bash --version
```
or
```sh
bash -c 'echo $BASH_VERSION'
```

### Install Bash
Install the latest version of Bash using Homebrew:
```sh
brew install bash
```
Add the new Bash to the list of available shells:
```sh
echo "$(brew --prefix)/bin/bash" | sudo tee -a /etc/shells
```
Verify that the new Bash has been added:
```sh
cat /etc/shells
```

### Change default shell
Change the default shell to the newly installed Bash:
```sh
chsh -s "$(brew --prefix)/bin/bash"
```
