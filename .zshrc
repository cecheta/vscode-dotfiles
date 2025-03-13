# AZ CLI completion
[[ -f /etc/bash_completion.d/azure-cli ]] && source /etc/bash_completion.d/azure-cli || :

# azd completion
if [[ $(command -v azd) && ! -f /usr/local/share/zsh/site-functions/_azd ]]; then
    azd completion zsh | sudo tee /usr/local/share/zsh/site-functions/_azd >/dev/null 
fi
