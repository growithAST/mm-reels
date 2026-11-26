# Agent instructions (Antigravity, Codex, Gemini CLI, any agent that reads AGENTS.md)

This repo holds one skill: `.claude/skills/meanwhile-mayank-style-reels/`.
When the user asks for a "Meanwhile Mayank / MM style / chai video" reel, or types `start` / `continue` for it:

1. Read `.claude/skills/meanwhile-mayank-style-reels/SKILL.md` fully and follow it (all `scripts/` paths there are
   relative to that folder).
2. Beginners: run `scripts/check_setup.sh`, ask before `--install`, then ask all start questions in one message.
3. Windows users must run inside WSL2 Ubuntu; a phone cannot render (see README.md "Where it runs").
4. Free and local only: no paid credits, no cloud render, no generated voices.
