# Code Reviewer - Skill & Agent Installer for Windows (PowerShell)
# Usage:
#   irm https://raw.githubusercontent.com/nguyenxp3n/code-reviewer/main/install.ps1 | iex

param (
    [string]$Target = "all"
)

$ErrorActionPreference = "Stop"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$REPO_RAW = "https://raw.githubusercontent.com/nguyenxp3n/code-reviewer/main"
$HOME_DIR = [Environment]::GetFolderPath("UserProfile")

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "  Installing Code Reviewer (Agent & Skill)                " -ForegroundColor Cyan
Write-Host "==========================================================" -ForegroundColor Cyan

# 1. Claude Code
$claudeSkills = Join-Path $HOME_DIR ".claude\skills\code-reviewer"
$claudeAgents = Join-Path $HOME_DIR ".claude\agents"
New-Item -ItemType Directory -Force -Path $claudeSkills | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $claudeSkills "references") | Out-Null
New-Item -ItemType Directory -Force -Path $claudeAgents | Out-Null

Invoke-WebRequest -Uri "$REPO_RAW/skills/code-reviewer/SKILL.md" -OutFile (Join-Path $claudeSkills "SKILL.md")
Invoke-WebRequest -Uri "$REPO_RAW/skills/code-reviewer/references/bug-patterns.md" -OutFile (Join-Path $claudeSkills "references\bug-patterns.md")
Invoke-WebRequest -Uri "$REPO_RAW/agents/code-reviewer.md" -OutFile (Join-Path $claudeAgents "code-reviewer.md")
Write-Host "[OK] Installed to Claude Code (~/.claude)" -ForegroundColor Green

# 2. Antigravity / Gemini Desktop
$geminiSkills = Join-Path $HOME_DIR ".gemini\config\skills\code-reviewer"
$geminiAgents = Join-Path $HOME_DIR ".gemini\config\agents"
New-Item -ItemType Directory -Force -Path $geminiSkills | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $geminiSkills "references") | Out-Null
New-Item -ItemType Directory -Force -Path $geminiAgents | Out-Null

Copy-Item -Path (Join-Path $claudeSkills "SKILL.md") -Destination (Join-Path $geminiSkills "SKILL.md") -Force
Copy-Item -Path (Join-Path $claudeSkills "references\bug-patterns.md") -Destination (Join-Path $geminiSkills "references\bug-patterns.md") -Force
Copy-Item -Path (Join-Path $claudeAgents "code-reviewer.md") -Destination (Join-Path $geminiAgents "code-reviewer.md") -Force
Write-Host "[OK] Installed to Antigravity (~/.gemini/config)" -ForegroundColor Green

# 3. OpenAI Codex
$codexSkills = Join-Path $HOME_DIR ".codex\skills\code-reviewer"
if (Test-Path (Join-Path $HOME_DIR ".codex")) {
    New-Item -ItemType Directory -Force -Path $codexSkills | Out-Null
    Copy-Item -Path (Join-Path $claudeSkills "SKILL.md") -Destination (Join-Path $codexSkills "SKILL.md") -Force
    Write-Host "[OK] Installed to OpenAI Codex (~/.codex)" -ForegroundColor Green
}

Write-Host "`nInstallation completed successfully!" -ForegroundColor Cyan
