#!/bin/bash

# sh -c "$(curl -fsSL https://raw.githubusercontent.com/k0st1an/dotfiles/main/linux_env_init.sh)"

set -e

GO_VERSION=1.24.4

apt update
apt install -y python3 make git

# docker
sh -c "$(curl -fsSL https://get.docker.com)"

# go
wget https://go.dev/dl/go${GO_VERSION}.linux-amd64.tar.gz
tar -C /usr/local -xzf go${GO_VERSION}.linux-amd64.tar.gz
rm -rf go${GO_VERSION}.linux-amd64.tar.gz

#shellcheck disable=SC2016
echo 'export PATH=$PATH:/usr/local/go/bin:~/bin' >> .zshenv

mkdir -p ~/bin

# ssh-agent
mkdir -p ~/.config/systemd/user
cat <<EOF > ~/.config/systemd/user/ssh-agent.service
[Unit]
Description=SSH key agent for %i
After=network.target

[Service]
Type=simple
Environment=SSH_AUTH_SOCK=%t/ssh-agent.sock
ExecStart=/usr/bin/ssh-agent -D -a %t/ssh-agent.sock
Restart=on-failure

[Install]
WantedBy=default.target
EOF

systemctl --user enable --now ssh-agent.service
#shellcheck disable=SC2016
echo 'export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.sock"' >> .zshenv

# werf
curl -sSL https://werf.io/install.sh | bash -s -- --version 2 --channel stable
#shellcheck disable=SC1090,SC2046
source $(~/bin/trdl use werf "2" "stable")
mkdir -p ~/.werf
chmod 0750 ~/.werf
touch ~/.werf/global_secret_key
chmod 0640 ~/.werf/global_secret_key

# kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x ./kubectl
mv ./kubectl ~/bin/kubectl

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
