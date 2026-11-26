#!/usr/bin/env bash
# Copies the skill to where each agent looks for skills. macOS / Linux / WSL2.
# Usage: ./install.sh [claude|gemini|antigravity|all]   (default: all)
set -e
SRC="$(cd "$(dirname "$0")" && pwd)/.claude/skills/meanwhile-mayank-style-reels"
WHAT="${1:-all}"
put() { mkdir -p "$1" && rm -rf "$1/meanwhile-mayank-style-reels" && cp -R "$SRC" "$1/" && echo "installed -> $1/meanwhile-mayank-style-reels"; }
[[ $WHAT == claude      || $WHAT == all ]] && put "$HOME/.claude/skills"
[[ $WHAT == gemini      || $WHAT == all ]] && put "$HOME/.gemini/skills"
[[ $WHAT == antigravity || $WHAT == all ]] && put "$HOME/.gemini/antigravity/skills"
echo "Restart the agent so it picks the skill up. Per-project install: copy the folder into <project>/.claude/skills, <project>/.gemini/skills or <project>/.agent/skills."
