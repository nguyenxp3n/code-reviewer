# Code Reviewer (Agent & Skill Plugin)

Universal senior code review framework for AI agents and LLMs. Includes both a specialized **Subagent** role and a progressive **Skill** workflow that hunts for real correctness bugs, concurrency race conditions, security vulnerabilities, and data loss with concrete failure scenarios.

Compatible with **ChatGPT / Custom GPTs**, **Claude Code**, **Google Antigravity**, **OpenAI Codex**, and **Cursor**.

---

## 🌟 What's Inside

1. **Agent (`agents/code-reviewer.md`)**: A specialized Staff/Principal engineer persona dedicated to high-signal code reviews, maintaining strict focus on code quality, security, and SOLID principles.
2. **Skill (`skills/code-reviewer/SKILL.md`)**: A disciplined 5-step code review procedure:
   - Scopes the diff precisely (`git diff`, `gh pr diff`).
   - Reads surrounding context and callers/callees.
   - Actively checks against established [bug patterns](skills/code-reviewer/references/bug-patterns.md).
   - Proves every single issue before raising it (reproducible failure scenario).
   - Ranks findings by severity (`[CRITICAL]`, `[HIGH]`, `[MEDIUM]`, `[LOW]`).
3. **ChatGPT Integration (`integrations/chatgpt/`)**: Ready-to-use instructions and system prompt to build an instant **Custom GPT** on ChatGPT.

---

## 🚀 Quick Setup & Usage

### 1. Connect to ChatGPT (Custom GPT)
To use this as your personal Code Reviewer in ChatGPT:
1. Open [ChatGPT](https://chatgpt.com) -> **Explore GPTs** -> **+ Create**.
2. Follow the step-by-step instructions in [integrations/chatgpt/instructions.md](integrations/chatgpt/instructions.md).
3. Paste the provided System Prompt and start reviewing pull requests and diffs immediately!

---

### 2. Install to Claude Code

#### Via Plugin Marketplace
```bash
/plugin marketplace add nguyenxp3n/code-reviewer
/plugin install code-reviewer@code-reviewer-marketplace
```

#### Via One-Click Installer (PowerShell on Windows)
```powershell
irm https://raw.githubusercontent.com/nguyenxp3n/code-reviewer/main/install.ps1 | iex
```

#### Via One-Click Installer (Bash on macOS / Linux)
```bash
curl -sSL https://raw.githubusercontent.com/nguyenxp3n/code-reviewer/main/install.sh | bash
```

---

### 3. Install to Google Antigravity / Gemini Desktop
Copy the `skills/code-reviewer` folder into your global skills directory:
```text
~/.gemini/config/skills/code-reviewer/
```
Or run the `install.ps1` script above, which installs to Antigravity automatically.

---

## 📐 Review Methodology & Philosophy

> "A review is judged by its findings, not its length. One confirmed bug with a reproducible scenario is worth more than twenty 'consider refactoring' remarks. An empty report is a valid result when the change is sound."

| Severity | Definition | Action Required |
|---|---|---|
| **CRITICAL** | Security exploit, silent data loss, monetary rounding issue, or crash in main user path. | Must block merge. |
| **HIGH** | Major functional regression, unhandled error crashing workflows, or race condition under load. | Fix before production. |
| **MEDIUM** | Edge-case failure, memory leak, or subtle logic inconsistency under atypical input. | Strongly recommended fix. |
| **LOW** | Minor non-blocking issue, small optimization, or maintenance trap for future changes. | Optional cleanup. |

---

## 📁 Repository Structure

```text
code-reviewer/
├── .claude-plugin/
│   ├── plugin.json              # Claude Code & Antigravity plugin manifest
│   └── marketplace.json         # Distribution marketplace manifest
├── agents/
│   └── code-reviewer.md         # Subagent persona & operational guidelines
├── skills/
│   └── code-reviewer/
│       ├── SKILL.md             # Review methodology & execution rules
│       └── references/
│           └── bug-patterns.md  # Curated catalog of subtle bug patterns
├── integrations/
│   └── chatgpt/
│       └── instructions.md      # Custom GPT setup guide & system prompt
├── install.ps1                  # 1-click Windows installer (PowerShell)
├── install.sh                   # 1-click Unix / macOS installer (Bash)
├── LICENSE                      # MIT License
└── README.md                    # Project overview & documentation
```

---

## 📄 License
MIT License © 2026 [Hoang Chiem Nguyen](https://github.com/nguyenxp3n). Based on components from [Claude Code Templates](https://aitmpl.com).
