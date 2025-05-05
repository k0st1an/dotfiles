# dotfiles

> macOS, iTerm2

## brew

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && \
export PATH="/opt/homebrew/bin:$PATH" >> ~/.zshrc
```

## coreutils

```sh
brew install coreutils
```

## color theme

- https://gogh-co.github.io/Gogh/
- `104`, `Ibm 3270 (High Contrast)`

## fonts

- https://github.com/tonsky/FiraCode
- https://github.com/tonsky/FiraCode/wiki/Installing

```sh
brew tap homebrew/cask-fonts && \
brew install --cask font-fira-code
```

```
iTerm2 > Settings... > Profiles > Text > Font > FiraCode
```
## oh-my-zsh

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### plugins
#### zsh-interactive-cd

- https://github.com/junegunn/fzf

```sh
brew install fzf
```

## tools

[pipx](https://pipx.pypa.io/stable/) and [poetry](https://python-poetry.org/docs/)

```shell
brew install pipx && pipx install poetry
```

## golangci-lint

```sh
curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.62.2
golangci-lint --version
```

([link](https://golangci-lint.run/welcome/install/#binaries))

## colima

- https://github.com/abiosoft/colima

```sh
brew install colima
```

```sh
colima start --cpu 4 --memory 5 --disk 10 --vm-type vz -p default
```

## libpq

```sh
brew install libpq
```

Update the path:

```sh
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
```
