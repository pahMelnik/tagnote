#!/bin/bash

set -e

INSTALL_DIR="$HOME/.local/bin"
TARGET="$INSTALL_DIR/tagnotes"
SCRIPT_URL="https://raw.githubusercontent.com/pahMelnik/tagnote/refs/heads/main/main.sh"

# Create folder if it does not exist
mkdir -p "$INSTALL_DIR"

echo "📥 Downloading script from GitHub..."
curl -fsSL "$SCRIPT_URL" -o "$TARGET"

# Make file executable
chmod +x "$TARGET"

echo "✅ tagnotes installed to $TARGET"
echo "👉 You can now run: tagnotes /path/to/notes"

# Check that ~/.local/bin in $PATH 
if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
  echo "⚠️ Warning: $INSTALL_DIR is not in your \$PATH"
  echo "Add this line to your shell config (~/.bashrc or ~/.zshrc):"
  echo "export PATH=\"\$HOME/.local/bin:\$PATH\""
fi
