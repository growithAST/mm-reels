# MM Style Reels: AI agent skill

Make 9:16 tactile science / myth-buster reels (the "chai video" style) with an AI agent, free and local
(HyperFrames, rembg, whisper.cpp, ffmpeg). Works with **Claude, Gemini CLI, Antigravity, Codex** and any agent that
reads `AGENTS.md`. By Grow With AST.

## Where it runs (read this first)

The render needs Chrome, ffmpeg, Node 22 and Python, so it must run on a computer or a cloud Linux box. A phone can do the planning half only.

| Where | Planning (script, beats, image prompts) | Render | Tested |
|---|---|---|---|
| **Mac** + Claude desktop (Code tab) | yes | yes | **yes (main path)** |
| **Mac** + Gemini CLI / Antigravity | yes | yes | scripts tested; agent paths below not tested |
| **Windows**, via **WSL2 Ubuntu** | yes | yes | not tested, same scripts as Linux |
| **Windows native** (PowerShell) | yes | **no**, use WSL2 | n/a |
| **Linux** | yes | yes | not tested |
| **Claude phone app** → Code → this repo (cloud Linux) | yes | yes, slow first setup | see `steps.md` |
| **Gemini app on phone** | yes, with the Gem in `gemini-mobile/` | **no** | n/a |

## Install

**Fastest (any agent):** open this repo folder in your agent. `AGENTS.md` / `GEMINI.md` tell it to use the skill.

**Install once for everywhere** (copies to `~/.claude/skills`, `~/.gemini/skills`, `~/.gemini/antigravity/skills`):
```bash
./install.sh            # Mac / Linux / WSL2 (or: ./install.sh gemini)
```
```powershell
.\install.ps1           # Windows PowerShell
```
Skill folder names: Claude `.claude/skills/`, Gemini CLI `.gemini/skills/`, Antigravity `.agent/skills/` (per project)
or `~/.gemini/antigravity/skills/` (global). If your version of an agent looks elsewhere, copy
`.claude/skills/meanwhile-mayank-style-reels/` to the folder it names.

## Use it
1. Open the repo (or any project, after `install`) in your agent.
2. Type `/meanwhile-mayank-style-reels start` (if the agent has no slash commands, say: "use the meanwhile-mayank-style-reels skill, start").
3. It checks your setup, **asks before installing**, then asks all the reel questions at once.
   `continue` resumes a reel from its `PROGRESS.md`.

## Windows: one-time WSL2 setup
Admin PowerShell: `wsl --install -d Ubuntu`, restart, open **Ubuntu**, then:
```bash
sudo apt update && sudo apt install -y zsh git
git clone https://github.com/growithAST/mm-reels && cd mm-reels
```
Run your agent (Gemini CLI, Claude Code, Antigravity's WSL remote) inside that folder. Your Windows files are at `/mnt/c/Users/<you>/`.
The first `check_setup.sh --install` builds whisper.cpp (5-10 min) and asks for your sudo password.

## Phone
- **Claude app → Code**: cloud session, see `steps.md` (Hinglish).
- **Gemini app**: build the free "MM Reel Planner" Gem from `gemini-mobile/GEM_INSTRUCTIONS.md`, plan the reel on the phone, render on a computer.

The skill lives in `.claude/skills/meanwhile-mayank-style-reels/` (start with its `GUIDE.md`). Phone / computer steps in Hinglish: `steps.md`.

---
**Note:** this skill recreates a *style* of reel inspired by Meanwhile Mayank's science reels. It is not affiliated
with or endorsed by Meanwhile Mayank, and it contains no content from his videos: all images are our own,
all sounds are made in code, and you bring your own topic, voice and music.
