# CoP Scribe Workflow

This guide documents the step-by-step workflow for transforming AI-generated CoP meeting notes into vault-ready artifacts. The workflow typically takes 20-30 minutes per session.

> **Notes tab only.** Google Meet creates two document tabs after a session: **Notes** (Gemini's auto-generated summary, 2-5 pages) and **Transcript** (verbatim record, 40+ pages). Work only on the Notes tab. Do not open or touch the Transcript tab.

**Key locations:**
- **Source:** [CoP Shared Drive](https://drive.google.com/drive/folders/0AM6hUKtSmPmgUk9PVA) → A11y Community of Practice → Session Transcripts
- **Destination:** a11y-cop repository → `sessions/` directory

---

## Step 1: Open the Meeting Notes from Calendar

**Goal:** Access the auto-generated Google Doc from the calendar event.

1. **Open Google Calendar** and navigate to the day of the CoP working session

2. **Click on the "A11y CoP Working Session" event** to open the event details

3. **Click on the attached Google Drive document** labeled with the meeting notes

   ![Calendar event details showing attached Google Doc](screenshots/calendar-details-a11y-cop-working-session.png)

4. **The document opens** in a new tab with two tabs: Notes and Transcript. Navigate to the **Notes tab** — this is the only tab you will work with.

---

## Step 2: Move File to Session Transcripts Folder

**Goal:** Move the Google Doc from the calendar event owner's personal Drive to the shared 8th Light A11y Drive.

**Why:** Gemini creates the document in the calendar event owner's personal Drive. Moving it to the shared Session Transcripts folder makes it accessible to all CoP members.

1. **In the open Google Doc, click the folder icon** in the top toolbar (or use File → Move)

   ![File move icon in Google Docs toolbar](screenshots/file-move.png)

2. **Navigate to:** A11y Community of Practice → Session Transcripts

3. **Click "Move" to confirm** the new location

   ![Move dialog showing Session Transcripts folder selection](screenshots/move-prompt-session-transcripts.png)

4. **Confirm ownership change** if prompted (changing from calendar event owner to shared drive)

   ![Change ownership confirmation modal](screenshots/change-ownership-confirmation-modal.png)

5. **Verify the move succeeded** — you'll see a confirmation toast

   ![Move confirmation toast notification](screenshots/move-file-confirmation-toast.png)

---

## Step 3: Export Notes Tab

**Goal:** Download the Notes tab as a markdown file for processing.

1. **Make sure you are on the Notes tab** (not the Transcript tab)

2. **File → Download → Markdown (.md)**

   ![File download to Markdown menu](screenshots/file-download-markdown.png)

3. **In the export dialog, select "Current Tab"** to export only the Notes tab

   ![Download modal showing tab selection](screenshots/download-modal-current-tab.png)

4. **Click Export** and save to your local machine

---

## Step 4: Transform and Review Notes with Claude Code

**Goal:** Format the exported notes, add frontmatter, and review for issues before committing.

In Claude Code, run the `/prepare-cop-notes` skill with the path to your exported file:

```
/prepare-cop-notes ~/Downloads/Meeting notes - YYYY-MM-DD.md
```

The skill will:
- Remove transcript section (if accidentally included in export)
- Remove timestamp references (e.g., `([00:05:12](#00:05:12))`)
- Extract the session date and attendee names from the document
- Add the required frontmatter
- Save to `a11y-cop/sessions/YYYY-MM-DD-session-notes.md`
- Review the output for speaker name inconsistencies, client name redaction, and PII — and report findings for your review

Review any flagged items and apply corrections directly in the saved file before committing.

---

## Step 5: Commit and Create Pull Request

**Goal:** Version the notes and request review.

**Tool:** Git and GitHub

**Steps:**

1. **Create git branch and commit:**

   **Optional automation:** Invoke the `/using-git` skill in Claude Code to automate this process or generate copy/paste commands.

   If you prefer to run the commands manually:

   ```bash
   git checkout -b transcript/YYYY-MM-DD-cop-session
   git add sessions/YYYY-MM-DD-session-notes.md
   git commit -m "docs(sessions): add YYYY-MM-DD session transcript"
   git push origin transcript/YYYY-MM-DD-cop-session
   ```

2. **Create pull request:**

   When you create the PR on GitHub, the session transcript template will automatically load. Fill in:

   - **Title:** "Add YYYY-MM-DD CoP session transcript"
   - **Session Summary:** 2-3 sentence overview
   - **Topics Covered:** Bullet list of main discussion points
   - **Decisions Made:** Action items or decisions from the session
   - **Scribe Checklist:** Confirm all steps completed

   Request review from another CoP member.

---

## Verification Checklist

Before marking your scribe work complete:

- [ ] All five workflow steps completed
- [ ] Speaker names consistent and correct
- [ ] Client names redacted with bracketed placeholders (e.g., `[Education Client]`)
- [ ] No PII or confidential content in committed file
- [ ] Notes tab exported (not full transcript)
- [ ] Frontmatter added with correct date and attendees
- [ ] File named correctly: `YYYY-MM-DD-session-notes.md`
- [ ] ASR mishears and technical terms verified
- [ ] Committed to branch and PR created
- [ ] Full transcript remains on CoP Shared Drive for reference

---

## Resources

- **CoP Shared Drive:** [A11y Community of Practice](https://drive.google.com/drive/folders/0AM6hUKtSmPmgUk9PVA)
- **Repository:** [github.com/8thlight/a11y-cop](https://github.com/8thlight/a11y-cop)
- **CoP Charter:** `charter/8L-A11y-CoP-Charter.md` in this repo
- **Questions?** Ask in #a11y-community-of-practice Slack channel
