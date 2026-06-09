---
name: using-git
description: >
  Use when working in the a11y-cop repository and need to perform git or GitHub
  operations. This is THE authoritative guidance for proper git/gh interaction in
  this repo, including branching, commits, and PR creation conventions.
---

# Using Git

Authoritative guidance for git and GitHub operations in the a11y-cop repository.

**Before proceeding:** Read `.claude/skills/using-git/IMPLEMENTATION.md` for command sequences, examples, and troubleshooting.

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

Before executing any git operations, run `git status` to see what changed. If `sessions/` files AND other changed files (e.g. `.claude/skills/`, `docs/`, `scripts/`) are both present, show the proposed split and confirm before proceeding:

```
I found changes to commit:

Commit 1 (session notes):
  sessions/2026-05-27-session-notes.md

Commit 2 (retro improvements):
  .claude/skills/scribe-workflow/SKILL.md
  docs/SCRIBE-WORKFLOW.md

Anything look wrong before I proceed?
```

If only one category of files is present, proceed with a single commit.

Then show the fully filled-in commands (real date, branch name, filenames — no placeholders) and ask:

```
Shall I run these, or would you like to copy-paste them yourself?
```

- If run: execute the commands
- If copy-paste: the user already has everything they need — all values are filled in

Check for `gh` CLI before proceeding: `which gh`. If not installed, skip `gh pr create` and provide the manual PR URL instead.

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

**Permission template:** Show fully filled-in commands → "Shall I run these, or would you like to copy-paste them yourself?"

