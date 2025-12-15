
# ---------------------------
# Zsh Configuration
# ---------------------------

# ---------------------------
# Keybindings for History Search
# ---------------------------
# Ensure CTRL-R works for reverse search
bindkey -e  # emacs mode
bindkey '^R' history-incremental-search-backward

# ---------------------------
# History Settings
# ---------------------------
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS    # optional: ignore duplicate entries
setopt INC_APPEND_HISTORY      # append to history immediately

# ---------------------------
# Aliases
# ---------------------------
alias pd="pushd"
alias pp="popd"

# Use zoxide for fast directory jumping instead of plain cd
# This preserves history for cd operations
eval "$(zoxide init zsh)"
alias cd="z"

# tmux aliases
export TMUX_CONF="$HOME/.config/tmux/tmux.conf"
alias tmux="tmux a -f $TMUX_CONF || tmux -f $TMUX_CONF"

# Chrome/Brave
export CHROME_PATH="/run/current-system/sw/bin/brave"

# Cargo (Rust)
export PATH="$HOME/.cargo/bin:$PATH"

# ---------------------------
# Prompt
# ---------------------------
# Starship prompt
eval "$(starship init zsh)"

# ---------------------------
# Optional: Helpful Options
# ---------------------------
setopt AUTO_CD             # allows typing 'foldername' to cd
setopt EXTENDED_HISTORY    # save timestamp for each command

