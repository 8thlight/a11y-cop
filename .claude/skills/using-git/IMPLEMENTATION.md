# Using Git - Implementation Guide

## Full Command Sequences

### With gh CLI installed

```bash
git checkout -b <branch-name>
git add <files>
git commit -m "<commit-message>"
git push -u origin <branch-name>
gh pr create --title "<PR-title>"
# For session transcripts, omit --body to let GitHub load the PR template
```

### Without gh CLI

```bash
git checkout -b <branch-name>
git add <files>
git commit -m "<commit-message>"
git push -u origin <branch-name>
```

Then provide the manual PR URL:
```
https://github.com/8thLight/a11y-cop/pull/new/<branch-name>
```

## Complete Session Transcript Example

**Branch:** `transcript/2026-05-27-cop-session`

**Two-commit flow (retro produced changes):**
```bash
git checkout -b transcript/2026-05-27-cop-session
git add sessions/2026-05-27-session-notes.md
git commit -m "docs(sessions): add 2026-05-27 session notes"

git add .claude/skills/ docs/ scripts/
git commit -m "chore(scribe): apply retro improvements"

git push -u origin transcript/2026-05-27-cop-session
gh pr create --title "Add 2026-05-27 CoP session transcript"
```

**Single-commit flow (no retro changes):**
```bash
git checkout -b transcript/2026-05-27-cop-session
git add sessions/2026-05-27-session-notes.md
git commit -m "docs(sessions): add 2026-05-27 session notes"
git push -u origin transcript/2026-05-27-cop-session
gh pr create --title "Add 2026-05-27 CoP session transcript"
```

**After PR creation:** Fill out the session transcript template in the GitHub web UI.


## PR Title and Body Formats by Type

### Session Transcripts

**Title:** `Add <YYYY-MM-DD> CoP session notes`

**PR Template:** GitHub will automatically load the session transcript PR template at `.github/PULL_REQUEST_TEMPLATE/session_transcript.md` when creating PRs.

**When using `gh pr create`:** If a `.tmp/session-YYYY-MM-DD.md` file exists (written by `/prepare-cop-notes` and `/scribe-retrospective` during the workflow), read it and use its contents to populate `--body`. Otherwise omit `--body` and let GitHub load the template in the web UI for the scribe to complete manually.

**`.tmp/session-YYYY-MM-DD.md`:** Written by the scribe workflow skills to accumulate session context — corrections made, client names replaced, retro findings. Reading this file lets `/using-git` pre-fill the PR description without the scribe having to remember everything.

### Artifacts

**Title:** `Add <artifact-name>`

**Body:**
```
Created <artifact-name> to <purpose>.

Addresses: <problem or decision that prompted this artifact>
```

### Decisions

**Title:** `Document decision: <topic>`

**Body:**
```
Documented decision on <topic> from <date> CoP session.

Context: <brief context>
Decision: <what was decided>
```

### Charter Changes

**Title:** `Update charter: <change-description>`

**Body:**
```
Updated charter to <change-description>.

Rationale: <why this change>
Approved by: <vote count or consensus method>
```

## Edge Cases and Troubleshooting

### .tmp Folder

**Note:** `.tmp/` is gitignored. Session context files written here during the workflow can be deleted after the PR is created:
```bash
rm .tmp/session-YYYY-MM-DD.md
```

### Multiple Files to Commit

**Problem:** Need to commit transcript + skill improvements

**Solution:** List all files explicitly in `git add`:
```bash
git add sessions/2026-05-27-session-notes.md .claude/skills/prepare-cop-notes/SKILL.md
```

**Avoid:** `git add .` or `git add -A` (may include unintended files)

### User Cancels Mid-Workflow

**If branch already created but no commit:**
```bash
git checkout main
git branch -D <branch-name>
```

**If committed but not pushed:**
```bash
git reset --soft HEAD~1
git checkout main
git branch -D <branch-name>
```

**If already pushed:**
```bash
git checkout main
git push origin --delete <branch-name>
git branch -D <branch-name>
```

### Branch Already Exists

**Problem:** `git checkout -b` fails because branch name already exists

**Solution:** Ask user:
```
Branch <branch-name> already exists. Should I:
- A) Use a different name (suggest: <branch-name>-v2)
- B) Checkout the existing branch and add commits to it
- C) Delete the existing branch and start fresh
```

**If choice A:** Use suggested alternative name  
**If choice B:** `git checkout <branch-name>` (skip `git checkout -b`)  
**If choice C:** `git branch -D <branch-name>` then proceed with `git checkout -b`

### Merge Conflicts on Push

**Problem:** `git push` fails with merge conflict error

**Solution:** Guide user through conflict resolution:
```bash
# Pull latest changes
git pull origin main

# Resolve conflicts (user must do manually)
# After conflicts resolved:
git add <conflicted-files>

# Continue with push
git push -u origin <branch-name>
```

**Inform user:**
```
There are merge conflicts. You'll need to:
1. Open the conflicted files and resolve the markers (<<<<, ====, >>>>)
2. Save the files
3. Run the commands above to complete the push
```

### gh CLI Check Fails

**Problem:** `which gh` returns nothing (gh not installed)

**Solution:** Skip `gh pr create` and provide the manual PR URL instead:
```
https://github.com/8thLight/a11y-cop/pull/new/<branch-name>
```

**Do NOT:**
- Attempt to install gh (requires admin permissions)
- Proceed with `gh pr create` command (will fail)

### Repository Not Found

**Problem:** Commands fail because not in a11y-cop directory

**Solution:** Ensure you're in the repository root:
```bash
pwd
# Should end with: a11y-cop
```

**If not in repo:**
```bash
# Navigate to the a11y-cop repository directory
cd <path-to-repo>
```

## Commit Message Examples by Type

### Session Transcripts
```
docs(sessions): add 2026-05-27 session notes
```

### Artifacts
```
feat(artifacts): add WCAG 2.2 AA audit template
feat(artifacts): add keyboard nav testing checklist
feat(artifacts): add axe-core integration runbook
```

### Decisions
```
docs(decisions): document axe-core vs Pa11y choice
docs(decisions): document meeting cadence change rationale
```

### Charter Changes
```
docs(charter): update meeting cadence to biweekly
docs(charter): add new core member role definition
docs(charter): revise artifact creation approval process
```

### Retro Improvements
```
chore(scribe): apply retro improvements
```
