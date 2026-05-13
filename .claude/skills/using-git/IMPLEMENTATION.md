# Using Git - Implementation Guide

## Full Command Sequences

### Option A - Automated (gh CLI installed)

```bash
git checkout -b <branch-name>
git add <files>
git commit -m "<commit-message>"
git push -u origin <branch-name>
gh pr create --title "<PR-title>" --body "<PR-body>"
```

### Option A - Automated (gh CLI NOT installed)

Inform user first:
```
I don't see the gh CLI installed. I can still commit and push the branch for you, but you'll need to create the PR manually via GitHub's web interface. Would you like me to:
- A) Commit and push (you'll create PR manually)
- B) Give you all the commands to run manually
```

If user chooses A:
```bash
git checkout -b <branch-name>
git add <files>
git commit -m "<commit-message>"
git push -u origin <branch-name>
```

Then provide manual PR URL:
```
To create the PR manually:
Visit: https://github.com/8thLight/a11y-cop/pull/new/<branch-name>
```

### Option B - Manual (gh CLI installed)

```bash
# Create and checkout branch
git checkout -b <branch-name>

# Stage files
git add <files>

# Commit with standard message
git commit -m "<commit-message>"

# Push branch to remote
git push -u origin <branch-name>

# Create PR (requires gh CLI)
gh pr create --title "<PR-title>" --body "<PR-body>"
```

### Option B - Manual (gh CLI NOT installed)

```bash
# Create and checkout branch
git checkout -b <branch-name>

# Stage files
git add <files>

# Commit with standard message
git commit -m "<commit-message>"

# Push branch to remote
git push -u origin <branch-name>
```

Then provide manual PR creation instructions:
```
To create the PR manually:
1. Visit: https://github.com/8thLight/a11y-cop/pull/new/<branch-name>
2. Fill in title: <PR-title>
3. Fill in description: <PR-body>
4. Click "Create pull request"
```

## Complete Session Transcript Example

**Scenario:** Cleaned transcript for 2026-05-13 session

**Branch name:** `transcript/2026-05-13-cop-session`

**Files to commit:**
- `sessions/2026-05-13-session-transcript.md`
- (optionally) `.claude/skills/<skill-name>/SKILL.md` (if retrospective identified improvements)

**Commit message:**
```
docs(sessions): add cleaned transcript for 2026-05-13 CoP session
```

**PR title:**
```
Add cleaned transcript: 2026-05-13 CoP session
```

**PR body:**
```
Cleaned and archived transcript from 2026-05-13 CoP session.
```

**If skill improvements included, add to PR body:**
```
Also includes improvements to [skill-name] based on scribe feedback:
• [Change 1]
• [Change 2]
```

**Full automated command sequence:**
```bash
git checkout -b transcript/2026-05-13-cop-session
git add sessions/2026-05-13-session-transcript.md
# If skill edits included:
# git add .claude/skills/scribe-workflow/SKILL.md
git commit -m "docs(sessions): add cleaned transcript for 2026-05-13 CoP session"
git push -u origin transcript/2026-05-13-cop-session
gh pr create --title "Add cleaned transcript: 2026-05-13 CoP session" --body "Cleaned and archived transcript from 2026-05-13 CoP session."
```

## PR Title and Body Formats by Type

### Session Transcripts

**Title:** `Add cleaned transcript: <YYYY-MM-DD> CoP session`

**Body:**
```
Cleaned and archived transcript from <YYYY-MM-DD> CoP session.
```

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

### Multiple Files to Commit

**Problem:** Need to commit transcript + skill improvements

**Solution:** List all files explicitly in `git add`:
```bash
git add sessions/2026-05-13-session-transcript.md .claude/skills/scribe-workflow/SKILL.md
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

**Solution:** Offer modified workflow (see "Option A - Automated (gh CLI NOT installed)" above)

**Do NOT:**
- Attempt to install gh (requires admin permissions)
- Proceed with `gh pr create` command (will fail)
- Switch to Option B without asking user

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
docs(sessions): add cleaned transcript for 2026-05-13 CoP session
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

### Skill Improvements
```
refactor(skills): improve clean-session-transcript path selection
refactor(skills): add troubleshooting to extract-meeting-insights
```

### Mixed Commits (transcript + skill improvement)
```
docs(sessions): add cleaned transcript for 2026-05-13 CoP session

Also includes improvements to scribe-workflow based on scribe feedback.
```

## Automation Recommendation Logic

**Recommend Manual (Option B) when:**
- User is first-time scribe or new to git
- User wants to learn the git workflow
- User expressed uncertainty about automation
- Previous automation attempt failed

**Recommend Automated (Option A) when:**
- User is experienced with git
- User wants speed/efficiency
- User has successfully used automation before
- User explicitly prefers automation

**Reassurance to provide:**
```
Both options are equally valid. Option A is faster if you're comfortable with automation. Option B gives you full control and visibility into each step.
```
