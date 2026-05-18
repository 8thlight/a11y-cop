---
skill: scribe-workflow
description: Use when processing CoP meeting transcripts through the full scribe workflow from Google Docs to repository commit
version: 1.0.0
tags: [cop, transcripts, workflow, gemini]
---

# CoP Scribe Workflow

Interactive guide for processing CoP meeting transcripts from Google Calendar through to repository commit. Combines manual validation steps (with Gemini prompts) and automated file transformation.

## When to Use

- After a CoP working session when you need to process the meeting transcript
- When you want step-by-step guidance through the scribe workflow
- To automate the final file organization and git commit steps

## Workflow Overview

**Manual steps (1-6.1):** User follows documented process with provided Gemini prompts
**Automated steps (6.2-7):** Skill executes file transformation, git operations, PR creation

## Step-by-Step Guide

### Steps 1-2: Document Access and Organization

**Step 1: Open Meeting Notes**
1. Open Google Calendar, find "A11y CoP Working Session" event
2. Click attached Google Drive document

**Step 2: Move to Session Transcripts Folder**
1. Click folder icon in Google Docs toolbar
2. Navigate to: A11y Community of Practice → Session Transcripts
3. Click "Move" and confirm ownership change

**Ready to continue?** Type `continue` or `next` when done.

---

### Step 3: Validation (Gemini in Google Docs)

**Goal:** Correct ASR mishears and speaker name errors.

**Gemini Prompt Location:** `a11y-cop/docs/prompts/gemini-mishears-prompt.md`

**Process:**
1. Open Gemini sidebar in Google Docs
2. Copy the mishears prompt and paste into Gemini
3. Review flagged mishears
4. Use Edit → Find and Replace to apply corrections
5. **Iterate:** Start new Gemini conversation, repeat until no new valid results
6. Verify speaker names are consistent throughout
7. Validate action items match verbal commitments

**Ready to continue?** Type `continue` or `next` when validation is complete.

---

### Step 4: Curation (Gemini in Google Docs)

**Goal:** Identify and redact confidential content.

**Gemini Prompt Location:** `a11y-cop/docs/prompts/gemini-redaction-prompt.md`

**Process:**
1. **Start fresh Gemini conversation** (do not continue from validation prompt)
2. Copy the redaction prompt and paste into Gemini
3. Review flagged items (client names, PII, internal metrics, sensitive details)
4. Apply redactions with generic placeholders or removal
5. **Iterate:** Start new Gemini conversation, repeat until no new confidential content

**Ready to continue?** Type `continue` or `next` when curation is complete.

---

### Step 5: Final Scan (Gemini in Google Docs)

**Goal:** Catch missed mishears or confidential content not in standard tables.

**Gemini Prompt Location:** `a11y-cop/docs/prompts/gemini-missing-items-prompt.md`

**Process:**
1. **Start fresh Gemini conversation** (do not continue from redaction prompt)
2. Copy the missing items prompt and paste into Gemini
3. Review flagged items with fresh eyes
4. Apply corrections or redactions as needed
5. **CRITICAL:** Document every missed item found:
   ```
   Missed Item: [correct term]
   Appeared as: [misheard version]
   Search pattern: [how to find it]
   Fix: [replacement or redaction strategy]
   Type: [mishear/confidential]
   ```

Keep your documented missed items ready for the PR description (Step 7).

**Ready for automation?** Type `automate` or `continue` when ready to proceed to automated steps.

---

### Step 6: Export and Transformation (AUTOMATED)

**From this point, the skill automates the remaining steps.**

When you type `automate` or `continue`, I will:
1. Ask you for the path to your exported markdown file
2. Process the file (remove timestamps, extract metadata, add frontmatter)
3. Save to `a11y-cop/sessions/YYYY-MM-DD-session-notes.md`
4. Create git branch and commit
5. Push to remote and create PR with template

**What you need to do first:**
- Export ONLY the Notes tab from Google Docs (File → Download → Markdown)
- Uncheck "All Tabs", select only "Notes" tab
- Save the file to your local machine

**Ready?** Provide the path to your exported markdown file when prompted.

---

### Step 7: Pull Request (AUTOMATED)

After file transformation, the skill will:
1. Create branch: `transcript/YYYY-MM-DD-cop-session`
2. Add and commit the session notes file
3. Push to remote repository
4. Create PR using the session transcript template

**You will need to complete the PR description manually:**
- Session Summary (2-3 sentences)
- Topics Covered (bullet list)
- Decisions Made (action items)
- Missed Items (from Step 5 documentation)
- Scribe Checklist (confirm all steps)

---

### Step 8: Retrospective and Workflow Improvement

**Goal:** Capture findings from Step 5 and map them to workflow improvements.

**Process:**
1. Run the `/scribe-retrospective` skill to document:
   - Missed mishears (correct term, appeared as, search pattern, fix)
   - Missed confidential content (item found, why missed, redaction strategy)
   - Prompt issues (prompt used, what it missed, suggested improvement)
2. (Optional) Run the `/workflow-feedback` skill to document other friction points encountered during the scribe process

**Why:** Each scribe session makes the workflow better for the next person. Documenting missed items creates a continuous improvement loop.

**Ready to complete?** The retrospective outputs update the mishears/redaction tables and identify prompt improvements for future sessions.

## Implementation Notes

**Model preference:** Use Haiku for scribe workflows (routine, well-structured tasks). Override with `/model sonnet` if needed.

**Common ASR mishears:**
- "8th Light" → "a flight", "8 light", "eighth light"
- "WCAG" → "W CAG", "we CAG"
- "axe" → "access", "ax"
- "ARIA" → "area", "Arya"
- "Playwright" → "playright", "play right"

**File naming:** `YYYY-MM-DD-session-notes.md`

**Branch naming:** `transcript/YYYY-MM-DD-cop-session`

**Commit format:** `docs(sessions): add YYYY-MM-DD session transcript`

## Related Resources

- **Full workflow documentation:** `a11y-cop/docs/SCRIBE-WORKFLOW.md`
- **Gemini prompts:** `a11y-cop/docs/prompts/`
- **CoP Shared Drive:** [A11y Community of Practice](https://drive.google.com/drive/folders/0AM6hUKtSmPmgUk9PVA)
- **Repository:** [github.com/8thlight/a11y-cop](https://github.com/8thlight/a11y-cop)
