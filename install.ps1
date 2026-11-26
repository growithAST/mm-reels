# Windows PowerShell: copies the skill into Claude / Gemini CLI / Antigravity skill folders.
# The skill's scripts still need WSL2 Ubuntu to RUN (see README.md). Usage:  .\install.ps1
$src = Join-Path $PSScriptRoot ".claude\skills\meanwhile-mayank-style-reels"
$targets = @("$HOME\.claude\skills", "$HOME\.gemini\skills", "$HOME\.gemini\antigravity\skills")
foreach ($t in $targets) {
  New-Item -ItemType Directory -Force -Path $t | Out-Null
  $dst = Join-Path $t "meanwhile-mayank-style-reels"
  if (Test-Path $dst) { Remove-Item -Recurse -Force $dst }
  Copy-Item -Recurse $src $dst
  Write-Host "installed -> $dst"
}
Write-Host "Restart the agent. To render, open Ubuntu (WSL2) and run the skill from there."
