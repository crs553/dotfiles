#!/usr/bin/env bash
# Install TPM (Tmux Plugin Manager) and plugins

set -euo pipefail

TPM_DIR="${HOME}/.tmux/plugins/tpm"

# Check for git
if ! command -v git &>/dev/null; then
	echo "Error: git is not installed"
	exit 1
fi

# Check for tmux
if ! command -v tmux &>/dev/null; then
	echo "Error: tmux is not installed"
	exit 1
fi

# Install TPM if not present
if [ ! -d "$TPM_DIR" ]; then
	echo "Installing TPM..."
	git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
else
	echo "TPM already installed"
fi

# Install plugins (requires tmux session)
echo "Installing tmux plugins..."
tmux new-session -d -s _tpm_install
tmux run-shell "$TPM_DIR/bin/install_plugins"
tmux kill-session -t _tpm_install

echo "Done. You can also press prefix + I inside tmux to reinstall plugins."
