
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
HISTSIZE=100000
SAVEHIST=50000
setopt HIST_IGNORE_ALL_DUPS
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# ---------------------------
# Aliases
# ---------------------------
alias pd="pushd"
alias pp="popd"

# Use zoxide for fast directory jumping instead of plain cd
# This preserves history for cd operations
eval "$(zoxide init zsh)"
# alias cd="z"  # use 'z' alongside cd for fuzzy jumping

# tmux aliases
export TMUX_CONF="$HOME/.config/tmux/tmux.conf"
alias tmux="command tmux a -f $TMUX_CONF || command tmux -f $TMUX_CONF"

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
setopt AUTO_CD
setopt EXTENDED_HISTORY
setopt INTERACTIVE_COMMENTS
setopt CORRECT

# Completion
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select

# Edit command line in $EDITOR
autoload -Uz edit-command-line && zle -N edit-command-line
bindkey '^X^E' edit-command-line

