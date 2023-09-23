# confs

> macOS, iTerm2

## brew

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && \
export PATH="/opt/homebrew/bin:$PATH" >> ~/.zshrc
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

iTerm2 > Settings... > Profiles > Text > Font > FiraCode

## oh-my-zsh

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### plugins
#### zsh-interactive-cd

https://github.com/junegunn/fzf

```sh
brew install fzf
```
