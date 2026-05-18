---
name: using-git
description: >
  Use when working in the a11y-cop repository and need to perform git or GitHub
  operations. This is THE authoritative guidance for proper git/gh interaction in
  this repo, including branching, commits, and PR creation conventions.
---

# Using Git

Authoritative guidance for git and GitHub operations in the a11y-cop repository. See [IMPLEMENTATION.md](IMPLEMENTATION.md) for detailed command sequences, examples, and troubleshooting.

## When to Use

Invoke when you need to commit changes, create branches, or create PRs in this repo. This is THE canonical source for git operations here.

## Core Principles

- **NEVER commit directly to main** — always branch + PR
- **ALWAYS get user permission** before executing git operations
- **ALWAYS offer automation choice** — let user pick automated (A) or manual (B)

## Branch Naming Conventions

| Type | Format | Example |
|------|--------|---------|
| Session transcripts | `transcript/<YYYY-MM-DD>-cop-session` | `transcript/2026-05-13-cop-session` |
| Artifacts | `artifact/<name>` | `artifact/wcag-audit-template` |
| Decisions | `decision/<topic>` | `decision/axe-vs-pa11y` |
| Charter changes | `charter/<change-description>` | `charter/update-meeting-cadence` |

## Commit Message Format

```
type(scope): description

Types: docs, feat, fix, refactor, chore
Scopes: sessions, artifacts, decisions, charter
```

Example: `docs(sessions): add cleaned transcript for 2026-05-13 CoP session`

## Workflow Options

Before executing any git operations, ALWAYS ask:

```
I can commit, push, and create the PR for you. Would you like me to:
- A) Automate it (I'll run the git commands)
- B) I'll do it manually (you give me the commands to run)
```

### Option A - Automated

1. Check for `gh` CLI: `which gh`
2. If installed, execute: checkout branch → add → commit → push → create PR
3. If NOT installed, offer: commit + push only (manual PR creation)

See [IMPLEMENTATION.md](IMPLEMENTATION.md) for full command sequence.

### Option B - Manual

Provide copy-paste-ready commands for: checkout → add → commit → push → PR creation.

If `gh` not installed, include manual PR creation URL.

See [IMPLEMENTATION.md](IMPLEMENTATION.md) for full command templates.

## Retrospective and Feedback (Before Git)

**Mandatory:** `/scribe-retrospective` — auto-analyzes friction, asks approval for changes  
**Optional:** `/workflow-feedback` — captures subjective feedback, offers handling options (PR/issue/facilitator)

**Sequence:** Main work done → retrospective (always) → ask about feedback (optional) → git operations

See [IMPLEMENTATION.md](IMPLEMENTATION.md) for integration details.

## Session Transcript Example

**Branch:** `transcript/2026-05-13-cop-session`  
**Commit:** `docs(sessions): add cleaned transcript for 2026-05-13 CoP session`  
**PR title:** `Add cleaned transcript: 2026-05-13 CoP session`

See [IMPLEMENTATION.md](IMPLEMENTATION.md) for complete workflow example with commands.

## Critical Rules

- NEVER commit directly to main
- ALWAYS request permission before executing git operations
- ALWAYS work from the repository root directory
- Check for `gh` CLI before attempting `gh pr create`
- Prefer explicit file listing in `git add` over `git add .`

## Quick Reference

**Permission template:** "I can commit, push, and create the PR. A) Automate it, or B) I'll do it manually?"

**Automation recommendation:** First-time/learning → Manual (B) | Experienced/speed → Automated (A)

