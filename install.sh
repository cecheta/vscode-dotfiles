#!/usr/bin/env bash

set -euo pipefail

sudo apt-get update && sudo apt-get install -y \
    gnupg2 \
    ripgrep \
    vim

# Configure package feeds for npm, pip, and uv
printf '%s\n' \
    'registry=https://packagefeedproxy.microsoft.io/npm/' \
    > ~/.npmrc

mkdir -p ~/.config/{pip,uv}
printf '%s\n' \
    '[global]' \
    'index-url = https://packagefeedproxy.microsoft.io/pypi/simple/' \
    > ~/.config/pip/pip.conf

printf '%s\n' \
    '[[index]]' \
    'url = "https://packagefeedproxy.microsoft.io/pypi/simple/"' \
    'default = true' \
    > ~/.config/uv/uv.toml

declare -A completion_args=(
    ["azd"]="completion zsh"
    ["gh"]="completion -s zsh"
    ["copilot"]="completion zsh"
    ["uv"]="generate-shell-completion zsh"
    ["poe"]="_zsh_completion"
)

sudo mkdir -p /usr/local/share/zsh/site-functions

for key in "${!completion_args[@]}"; do
    if command -v "$key" > /dev/null 2>&1; then
        IFS=' ' read -r -a args <<< "${completion_args[$key]}"
        "$key" "${args[@]}" | sudo tee "/usr/local/share/zsh/site-functions/_$key" > /dev/null
    fi
done

# Add to ~/.zshrc
cat .zshrc >> ~/.zshrc

# Global gitignore
cp .gitignore_global ~/.gitignore_global
