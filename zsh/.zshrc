# # Aliases
alias tmux="tmux a -f $TMUX_CONF|| tmux -f $TMUX_CONF"
alias pd="pushd"
alias pp="popd"
alias cd="z"

# Starship prompt
eval "$(starship init zsh)"

# Zoxide (directory jumping)
eval "$(zoxide init zsh)"

# Environment variables
export CHROME_PATH="/run/current-system/sw/bin/brave"
export PATH="$HOME/.cargo/bin:$PATH"
export TMUX_CONF="$HOME/.config/tmux/tmux.conf"
alias tmux="tmux"

