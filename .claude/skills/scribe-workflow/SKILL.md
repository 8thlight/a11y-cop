---
name: scribe-workflow
description: >
  Use when a CoP scribe needs to process a Community of Practice meeting transcript
  after a session. Orchestrates the full workflow from cleaning the transcript through
  PR creation, delegating to specialized sub-skills.
---

# Scribe Workflow

Orchestrates the complete post-session workflow for CoP scribes, from transcript cleaning through GitHub PR creation.

## When to Use

Invoke this skill when:
- A CoP scribe has a raw transcript from Gemini Live that needs processing
- The scribe needs to archive a cleaned transcript in the a11y-cop repository
- The full end-to-end workflow is needed (not just one isolated step)

## Core Pattern

This skill delegates to specialized sub-skills:

1. **`/clean-session-transcript`** — Cleans the raw transcript (ASR mishears, name normalization)
2. **`/extract-meeting-insights`** — Creates Slack-ready summary in `.tmp/session-summary.md`
3. **`/skill-retrospective`** — Captures scribe feedback for workflow improvement
4. **`/using-git`** — Handles proper git/gh operations for PR creation

## Workflow Steps

1. **Locate transcript:** Guide scribe to Google Calendar entry for the CoP Working Session — transcript file is linked there ~5 minutes after meeting ends
2. **Prerequisites check:** Verify a11y-cop repo exists, `sessions/` directory exists (create if needed)
3. **Clean transcript:** Invoke `/clean-session-transcript` — handles both export-to-markdown and Gemini find/replace paths
3. **Extract insights:** Invoke `/extract-meeting-insights` — generates `.tmp/session-summary.md` for Slack posting
4. **Retrospective:** Invoke `/skill-retrospective` — captures friction points and workflow improvements
5. **Create PR:** Invoke `/using-git` — handles branch creation, commit, push, and PR with proper conventions

## Scribe Interaction Points

**Confirmation required:**
- Path selection (A: Export as Markdown, B: Gemini Find/Replace)
- Transcript cleaning approval before archival
- Retrospective participation (optional, can skip)
- Git workflow preference (automated vs manual)

**Always ask permission before:**
- Executing git operations
- Editing skill files (if retrospective identifies improvements)

## File Locations

- **Cleaned transcript:** `a11y-cop/sessions/<YYYY-MM-DD>-session-transcript.md`
- **Slack summary:** `.tmp/session-summary.md` (gitignored, ready to copy/paste)
- **Skills directory:** `.claude/skills/` (for any retrospective-driven edits)

## Critical Rules

- NEVER commit directly to main (always branch + PR)
- ALWAYS get scribe confirmation before major steps
- ALWAYS request permission before executing git operations
- File naming: `<YYYY-MM-DD>-session-transcript.md`
- Branch naming: `transcript/<YYYY-MM-DD>-cop-session`
- Commit format: `docs(sessions): add cleaned transcript for <date> CoP session`

## Quick Reference

**Typical session duration:** 10-15 minutes end-to-end

**Path recommendation:**
- First-time scribe → Path B (guided Gemini prompts)
- Experienced scribe → Path A (faster, more control, higher Claude token usage)
- Simple transcript → Path B (lower Claude token usage)
- Complex transcript → Path A

**Git automation recommendation:**
- First-time or unfamiliar with git → Manual (see commands before they run)
- Experienced with git → Automated (faster, single confirmation)

## Example Invocation

```
/scribe-workflow

I have the raw transcript from today's CoP session open in Google Drive and need to clean it, create a Slack summary, and archive it in the repo.
```

## Related Skills

- **`/clean-session-transcript`** — Transcript cleaning (ASR corrections, name normalization)
- **`/extract-meeting-insights`** — Slack summary generation
- **`/skill-retrospective`** — Workflow improvement feedback capture
- **`/using-git`** — Proper git/gh interaction guidance for this repo
