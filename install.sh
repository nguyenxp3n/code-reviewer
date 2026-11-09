#!/usr/bin/env bash
# Code Reviewer - Skill & Agent Installer for Unix / macOS / Linux
# Usage:
#   curl -sSL https://raw.githubusercontent.com/nguyenxp3n/code-reviewer/main/install.sh | bash

set -e

REPO_RAW="https://raw.githubusercontent.com/nguyenxp3n/code-reviewer/main"
HOME_DIR="${HOME}"

echo "=========================================================="
echo "  Installing Code Reviewer (Agent & Skill)"
echo "=========================================================="

# Claude Code
mkdir -p "${HOME_DIR}/.claude/skills/code-reviewer/references"
mkdir -p "${HOME_DIR}/.claude/agents"

curl -sSL "${REPO_RAW}/skills/code-reviewer/SKILL.md" -o "${HOME_DIR}/.claude/skills/code-reviewer/SKILL.md"
curl -sSL "${REPO_RAW}/skills/code-reviewer/references/bug-patterns.md" -o "${HOME_DIR}/.claude/skills/code-reviewer/references/bug-patterns.md"
curl -sSL "${REPO_RAW}/agents/code-reviewer.md" -o "${HOME_DIR}/.claude/agents/code-reviewer.md"
echo "[OK] Installed to Claude Code (~/.claude)"

# Antigravity / Gemini
mkdir -p "${HOME_DIR}/.gemini/config/skills/code-reviewer/references"
mkdir -p "${HOME_DIR}/.gemini/config/agents"

cp "${HOME_DIR}/.claude/skills/code-reviewer/SKILL.md" "${HOME_DIR}/.gemini/config/skills/code-reviewer/SKILL.md"
cp "${HOME_DIR}/.claude/skills/code-reviewer/references/bug-patterns.md" "${HOME_DIR}/.gemini/config/skills/code-reviewer/references/bug-patterns.md"
cp "${HOME_DIR}/.claude/agents/code-reviewer.md" "${HOME_DIR}/.gemini/config/agents/code-reviewer.md"
echo "[OK] Installed to Antigravity (~/.gemini/config)"

# OpenAI Codex
if [ -d "${HOME_DIR}/.codex" ]; then
    mkdir -p "${HOME_DIR}/.codex/skills/code-reviewer"
    cp "${HOME_DIR}/.claude/skills/code-reviewer/SKILL.md" "${HOME_DIR}/.codex/skills/code-reviewer/SKILL.md"
    echo "[OK] Installed to OpenAI Codex (~/.codex)"
fi

echo ""
echo "Installation completed successfully!"
