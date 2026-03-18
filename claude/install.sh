#!/usr/bin/env bash
# Sets up symlinks from ~/.claude to this directory.
# Safe to run multiple times.

set -e

DOTFILES_CLAUDE="$(cd "$(dirname "$0")" && pwd)"
CLAUDE_DIR="$HOME/.claude"

mkdir -p "$CLAUDE_DIR/memory" "$CLAUDE_DIR/plugins"

link() {
  local src="$DOTFILES_CLAUDE/$1"
  local dst="$CLAUDE_DIR/$1"
  if [ -e "$dst" ] && [ ! -L "$dst" ]; then
    echo "backing up existing $dst -> ${dst}.bak"
    mv "$dst" "${dst}.bak"
  fi
  ln -sf "$src" "$dst"
  echo "linked $dst"
}

link CLAUDE.md
link MEMORY.md
link settings.json
link plugins/blocklist.json
link plugins/known_marketplaces.json

# Link individual memory files (not the directory, to allow claude to add new ones)
for f in "$DOTFILES_CLAUDE/memory"/*.md; do
  fname="$(basename "$f")"
  dst="$CLAUDE_DIR/memory/$fname"
  if [ -e "$dst" ] && [ ! -L "$dst" ]; then
    mv "$dst" "${dst}.bak"
  fi
  ln -sf "$f" "$dst"
  echo "linked $dst"
done

echo ""
echo "Done. Claude config is now managed from: $DOTFILES_CLAUDE"
