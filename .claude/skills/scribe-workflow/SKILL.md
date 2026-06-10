---
skill: scribe-workflow
description: Use when processing CoP meeting notes through the full scribe workflow from Google Docs to repository commit
version: 2.0.0
tags: [cop, session-notes, workflow]
---

# CoP Scribe Workflow

Interactive guide for processing CoP meeting notes from Google Calendar through to repository commit. Steps 1-2 are manual; Steps 3-5 are automated via Claude Code skills.

## When to Use

- After a CoP working session when you need to process the meeting notes
- When you want step-by-step guidance through the scribe workflow
- To automate file transformation, git commit, and PR creation

## Workflow Overview

**Manual steps (1-2):** Open and move Gemini notes, export Notes tab
**Automated steps (3-5):** Claude Code transforms and reviews the file, runs the retrospective, then commits and creates the PR

---

## Step-by-Step Guide

### Step 1: Open and Move Gemini Notes

1. Open Google Calendar, find "A11y CoP Working Session" event
2. Click attached Google Drive document
3. Navigate to the **Notes tab** — do not open the Transcript tab
4. Click the folder icon in the toolbar (or File → Move)
5. Navigate to: A11y Community of Practice → Session Transcripts
6. Click "Move" and confirm ownership change if prompted

**Ready to continue?** Type `continue` or `next` when done.

---

### Step 2: Export Notes Tab

**Goal:** Download only the Notes tab as a markdown file.

1. Confirm you are on the **Notes tab** (not Transcript)
2. File → Download → Markdown (.md)
3. In the export dialog, select **"Current Tab"**
4. Save to your local machine

**Ready to continue?** Type `continue` or `next` when the file is saved.

---

### Step 3: Transform and Review Notes (AUTOMATED)

**Goal:** Format the exported notes and review for issues before committing.

Provide the path to your exported file and run:

```
/prepare-cop-notes '/path/to/your/exported-file.md'
```

The skill cleans the file, flags items for your review (ASR mishears, speaker names, client names, PII), and saves the result to `sessions/YYYY-MM-DD-session-notes.md`. Respond to each prompt before continuing.

**Ready to continue?** Type `continue` or `next` when done.

---

### Step 4: Retrospective (AUTOMATED)

**Goal:** Capture anything you fixed manually after Claude's review and update the workflow for future scribes.

Run:

```
/scribe-retrospective
```

The skill will ask what you corrected manually — name spellings, client names, or anything else not caught automatically. If any skill files need updating, it will apply those changes now.

**Ready to continue?** Type `continue` or `next` when done.

---

### Step 5: Commit and Create Pull Request (AUTOMATED)

**Goal:** Commit the notes and any retro improvements, then open a PR for review.

Run:

```
/using-git
```

Claude will show you what changed and confirm the commit split before proceeding:
- **Commit 1:** session notes
- **Commit 2:** retro improvements (if any)

After confirming, Claude will push the branch and create the PR. Fill in the PR template on GitHub:
- **Title:** "Add [date] CoP session transcript"
- **Session Summary:** 2-3 sentence overview
- **Topics Covered:** Bullet list of main discussion points
- **Decisions Made:** Action items or decisions from the session
- **Scribe Checklist:** Confirm all steps completed

Request review from another CoP member.

---

## Implementation Notes

**Model preference:** Use Haiku for scribe workflows (routine, well-structured tasks). Override with `/model sonnet` if needed.

**File naming:** `YYYY-MM-DD-session-notes.md`

**Branch naming:** `transcript/YYYY-MM-DD-cop-session`

**Commit format:** `docs(sessions): add YYYY-MM-DD session transcript`

## Related Resources

- **Full workflow documentation:** `a11y-cop/docs/SCRIBE-WORKFLOW.md`
- **CoP Shared Drive:** [A11y Community of Practice](https://drive.google.com/drive/folders/0AM6hUKtSmPmgUk9PVA)
- **Repository:** [github.com/8thlight/a11y-cop](https://github.com/8thlight/a11y-cop)
