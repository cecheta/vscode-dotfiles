#!/usr/bin/env bash

set -euo pipefail

sudo apt-get update && sudo apt-get install -y \
    gnupg2 \
    ripgrep

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
