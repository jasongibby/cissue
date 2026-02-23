#!/usr/bin/env bash
set -euo pipefail

# Install dependencies
for cmd in gh fzf figlet jq; do
  if ! command -v "$cmd" &>/dev/null; then
    echo "Installing $cmd..."
    brew install "$cmd"
  fi
done

# Install cissue
INSTALL_DIR="${HOME}/.local/bin"
mkdir -p "$INSTALL_DIR"
cp cissue "$INSTALL_DIR/cissue"
chmod +x "$INSTALL_DIR/cissue"

# Check PATH
if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
  echo ""
  echo "Add this to your shell config (~/.zshrc or ~/.bashrc):"
  echo "  export PATH=\"\$HOME/.local/bin:\$PATH\""
else
  echo ""
  echo "cissue installed! Run it with: cissue"
fi
