---
skill: scribe-workflow
description: Use when processing CoP meeting notes through the full scribe workflow from Google Docs to repository commit
version: 2.0.0
tags: [cop, session-notes, workflow]
---

# CoP Scribe Workflow

Interactive guide for processing CoP meeting notes from Google Calendar through to repository commit. Steps 1-3 are manual; Steps 4-7 are automated via Claude Code skills.

## When to Use

- After a CoP working session when you need to process the meeting notes
- When you want step-by-step guidance through the scribe workflow
- To automate file transformation, git commit, and PR creation

## Workflow Overview

**Manual steps (1-3):** Open notes, move file, export Notes tab
**Automated steps (4-7):** Claude Code transforms and reviews the file, commits the transcript, runs the retrospective, then creates the PR

---

## Step-by-Step Guide

### Steps 1-2: Document Access and Organization

**Step 1: Open Meeting Notes**
1. Open Google Calendar, find "A11y CoP Working Session" event
2. Click attached Google Drive document
3. Navigate to the **Notes tab** — do not open the Transcript tab

**Step 2: Move to Session Transcripts Folder**
1. Click folder icon in Google Docs toolbar (or File → Move)
2. Navigate to: A11y Community of Practice → Session Transcripts
3. Click "Move" and confirm ownership change if prompted

**Ready to continue?** Type `continue` or `next` when done.

---

### Step 3: Export Notes Tab

**Goal:** Download only the Notes tab as a markdown file.

1. Confirm you are on the **Notes tab** (not Transcript)
2. File → Download → Markdown (.md)
3. In the export dialog, select **"Current Tab"**
4. Save to your local machine

**Ready to continue?** Type `continue` or `next` when the file is saved.

---

### Step 4: Transform and Review Notes (AUTOMATED)

**Goal:** Format the exported notes and review for issues before committing.

Provide the path to your exported file and run:

```
/prepare-cop-notes ~/Downloads/Meeting notes - YYYY-MM-DD.md
```

After the skill saves the file to `sessions/YYYY-MM-DD-session-notes.md`, review the output for the following:

---

**1. Technical terms and ASR mishears**

Flag any of these garbled forms and suggest the correct replacement:

| Correct Term | Common Mishears |
|---|---|
| 8th Light | a flight, aflight, aphite, eighth alight, 8 light |
| WCAG | W CAG, WAG, wicked, WKed, WKEG, we CAG |
| CPACC | cpac, C-PAC, CPAC |
| CoP | COP, cop |
| Playwright | playright, play right |
| axe | access, ax, acts (when referring to the testing tool) |
| npm | mpm |
| ARIA | area, Arya, aria |
| Pa11y | pally, palley, PA11Y |
| NVDA | in VDA |
| JAWS | jaws, Jaws |
| VoiceOver | voice over, voiceover |

---

**2. Speaker names**

Check that names are used consistently throughout. If the same person appears under two different spellings, **flag it for the scribe to verify** — do not auto-correct. Both spellings may refer to different people at 8th Light.

| Name | Possible Variation | Note |
|---|---|---|
| Shawn | Sean | Both names exist at 8th Light — verify against attendee list |

*Add other members here as name variations come up in sessions.*

---

**3. Client names — replace with bracketed placeholders**

| Client/Project | Common Mishears | Replace With |
|---|---|---|
| EnGen | Engine, Engen, N-Gen, in gen, NEN | `[Education Client]` |
| DYMO | Daimo, DAO, Dinamo, Dynamo | `[Printer Client]` |
| New Brands | new brands, NewBrands | `[Printer Client's Parent Company]` |
| Other People's Pixels (OPP) | OP | `[Artist CMS Client]` |

*Add other clients here as they come up in sessions.*

---

**4. PII**

Flag any of the following:
- Email addresses (except `caronow@8thlight.com` — public-facing practice lead)
- Phone numbers
- Home addresses

---

**5. Open-ended scan**

Look for content that may not match the tables above but could still be sensitive:
- Implicit client references (project descriptions that could identify an unnamed client, industry details that narrow to one company)
- Internal process details not meant to be public (pricing models, internal tool names, proprietary methodology)
- People information that could identify someone (job title + first name, team size details for small clients)
- Accessibility violation counts tied to client names (e.g., "client X had 47 critical errors")
- Internal client communications or direct quotes from client stakeholders
- Security vulnerabilities in client systems

---

**Present all findings to the scribe for review. Do not auto-apply any changes.**

For each finding, provide:
- The exact text
- Why it's flagged (mishear, client name, PII, sensitivity concern)
- A suggested correction or replacement

**Ready to continue?** Apply any corrections to the saved file, then type `continue` or `next`.

---

### Step 5: Commit Transcript (AUTOMATED)

**Goal:** Commit the session notes to a branch.

```bash
git checkout -b transcript/YYYY-MM-DD-cop-session
git add sessions/YYYY-MM-DD-session-notes.md
git commit -m "docs(sessions): add YYYY-MM-DD session transcript"
```

**Ready to continue?** Type `continue` or `next` when done.

---

### Step 6: Retrospective (AUTOMATED)

**Goal:** Capture anything you fixed manually after Claude's review. If any skill tables need updating (client names, mishears, member names), do that now and commit those changes before creating the PR.

Run:

```
/scribe-retrospective
```

If skill files were updated, commit them:

```bash
git add .claude/skills/scribe-workflow/SKILL.md
git commit -m "chore(scribe): update skill tables from session findings"
```

**Ready to continue?** Type `continue` or `next` when done.

---

### Step 7: Create Pull Request (AUTOMATED)

**Goal:** Push the branch and open a PR for review.

```bash
git push origin transcript/YYYY-MM-DD-cop-session
```

When you create the PR on GitHub, the session transcript template loads automatically. Fill in:
- **Title:** "Add YYYY-MM-DD CoP session transcript"
- **Session Summary:** 2-3 sentence overview
- **Topics Covered:** Bullet list of main discussion points
- **Decisions Made:** Action items or decisions from the session
- **Scribe Checklist:** Confirm all steps completed

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
