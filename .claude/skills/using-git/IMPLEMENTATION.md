# Using Git - Implementation Guide

## Full Command Sequences

### Option A - Automated (gh CLI installed)

```bash
git checkout -b <branch-name>
git add <files>
git commit -m "<commit-message>"
git push -u origin <branch-name>
gh pr create --title "<PR-title>"
# Note: For session transcripts, omit --body to let GitHub load the PR template
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

For session transcripts: GitHub will automatically load the PR template. Fill out all sections, including missed items from Step 5 validation findings.
```

### Option B - Manual (gh CLI installed)

**Before providing commands:** Write PR description to `.tmp/pr-description-<branch-name>.md` (ensure `.tmp/` exists at repo root).

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
gh pr create --title "<PR-title>"
# Note: For session transcripts, omit --body to let GitHub load the PR template

# PR description saved to: .tmp/pr-description-<branch-name>.md
```

**For session transcripts:** Note that GitHub will auto-load the PR template. The saved `.tmp/` file contains a starter template they can reference while filling out the web form.

### Option B - Manual (gh CLI NOT installed)

**Before providing commands:** Write PR description to `.tmp/pr-description-<branch-name>.md` (ensure `.tmp/` exists at repo root).

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
3. For session transcripts: GitHub will load the PR template automatically. Complete all sections.
   Reference: .tmp/pr-description-<branch-name>.md (contains starter template)
4. For other PR types: Fill in description from .tmp/pr-description-<branch-name>.md
5. Click "Create pull request"

# PR description saved to: .tmp/pr-description-<branch-name>.md
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

**PR template:** GitHub will automatically load the session transcript PR template when the scribe creates the PR. The template includes structured sections for:
- Session summary
- Topics covered
- Decisions made
- Missed items for prompt improvement (Step 5 findings from validation phase)
- Scribe checklist

The scribe fills out the template in the GitHub web UI after the PR is created.

**Full automated command sequence:**
```bash
git checkout -b transcript/2026-05-13-cop-session
git add sessions/2026-05-13-session-transcript.md
# If skill edits included:
# git add .claude/skills/scribe-workflow/SKILL.md
git commit -m "docs(sessions): add cleaned transcript for 2026-05-13 CoP session"
git push -u origin transcript/2026-05-13-cop-session
gh pr create --title "Add cleaned transcript: 2026-05-13 CoP session"
# Note: --body flag omitted so GitHub loads the PR template automatically
```

**After PR creation:** The scribe opens the PR in GitHub and completes all sections of the template, including any missed items from Step 5 validation findings.

## Retrospective and Feedback Integration

### When to Run

**Before git operations begin** — after main workflow completes but before any git commands

**Sequence:**
1. Main workflow completes (e.g., transcript cleaned, summary generated)
2. User confirms work is ready
3. **Run scribe-retrospective** (mandatory)
4. **Optionally run workflow-feedback** (ask user)
5. Proceed with git operations (checkout, add, commit, push, PR)

### Skill Retrospective (Mandatory)

**Purpose:** Automatically analyze skills for objective friction points

**Process:**
```
Running skill retrospective on the skills used in this workflow...

[Analysis runs automatically]

Retrospective analysis complete. I identified the following improvement opportunities:

Skill: clean-session-transcript
- Add path selection decision tree for clarity
- Include file path format example

Apply these changes? (yes/no)
```

**If user approves:**
- Read affected skill files
- Apply edits using Edit tool
- Stage changes for commit
- Include in PR with main work

**If user declines:**
- Proceed to git operations without changes

**Result:** Skill improvements (if any) are included in the same commit as the main work

### Skill Feedback (Optional)

**Purpose:** Capture subjective user experience feedback

**When to offer:**
```
Would you like to provide additional feedback on what didn't work well? (yes/no)

(Recommended for first-time scribes or if the workflow felt problematic)
```

**If user says yes:**
- Run `/workflow-feedback`
- User shares subjective feedback
- User chooses handling option (add to PR, create issue, or contact facilitator)
- If "add to PR" chosen, changes are staged along with retrospective changes

**If user says no:**
- Skip workflow-feedback and proceed to git operations

### Combined Retrospective + Feedback Example

**Scenario:** Scribe completed transcript processing, both retrospective and feedback apply improvements

```bash
# After retrospective and feedback complete, files staged:
git status
# Output:
# Changes to be committed:
#   modified:   sessions/2026-05-13-session-transcript.md
#   modified:   .claude/skills/clean-session-transcript/SKILL.md
#   modified:   .claude/skills/scribe-workflow/SKILL.md

# Commit includes all changes:
git commit -m "docs(sessions): add cleaned transcript for 2026-05-13 CoP session

Also includes improvements to clean-session-transcript and scribe-workflow based on retrospective analysis and scribe feedback."
```

**PR includes:**
- Session transcript
- Skill improvements from retrospective
- Skill improvements from user feedback (if applicable)

### Retrospective-Only Example

**Scenario:** Retrospective identifies changes, user declines feedback

```bash
# Retrospective changes applied and staged:
git status
# Output:
# Changes to be committed:
#   modified:   sessions/2026-05-13-session-transcript.md
#   modified:   .claude/skills/clean-session-transcript/SKILL.md

git commit -m "docs(sessions): add cleaned transcript for 2026-05-13 CoP session

Also includes improvements to clean-session-transcript based on retrospective analysis."
```

### No Changes Example

**Scenario:** Retrospective finds no friction, user declines feedback

```bash
# Only main work staged:
git status
# Output:
# Changes to be committed:
#   modified:   sessions/2026-05-13-session-transcript.md

git commit -m "docs(sessions): add cleaned transcript for 2026-05-13 CoP session"
```

### Handling Retrospective in Automated Mode (Option A)

**Full command sequence with retrospective:**

1. Main workflow completes
2. Run scribe-retrospective (may apply changes)
3. Optionally run workflow-feedback (may apply more changes)
4. Proceed with git automation:

```bash
git checkout -b transcript/2026-05-13-cop-session
git add sessions/2026-05-13-session-transcript.md
# If skill changes were applied:
git add .claude/skills/clean-session-transcript/SKILL.md .claude/skills/scribe-workflow/SKILL.md
git commit -m "docs(sessions): add cleaned transcript for 2026-05-13 CoP session

Also includes improvements to clean-session-transcript and scribe-workflow based on retrospective analysis and scribe feedback."
git push -u origin transcript/2026-05-13-cop-session
gh pr create --title "Add cleaned transcript: 2026-05-13 CoP session"
```

### Handling Retrospective in Manual Mode (Option B)

**Before providing commands:** Write PR description to `.tmp/pr-description-transcript-2026-05-13-cop-session.md` with session transcript starter template.

**Provide commands with conditional skill files:**

```bash
# Create and checkout branch
git checkout -b transcript/2026-05-13-cop-session

# Stage files (adjust based on what retrospective/feedback changed)
git add sessions/2026-05-13-session-transcript.md

# If skill improvements were applied, also stage:
# git add .claude/skills/clean-session-transcript/SKILL.md
# git add .claude/skills/scribe-workflow/SKILL.md

# Commit (adjust message based on what's included)
git commit -m "docs(sessions): add cleaned transcript for 2026-05-13 CoP session"
# Or, if skill changes included:
# git commit -m "docs(sessions): add cleaned transcript for 2026-05-13 CoP session
#
# Also includes improvements to clean-session-transcript and scribe-workflow based on retrospective analysis."

# Push branch
git push -u origin transcript/2026-05-13-cop-session

# Create PR
gh pr create --title "Add cleaned transcript: 2026-05-13 CoP session"
# Note: GitHub will load the PR template automatically

# PR description starter saved to: .tmp/pr-description-transcript-2026-05-13-cop-session.md
```

**Note:** Adjust the `git add` and commit message based on what files were actually modified during retrospective/feedback.

## PR Title and Body Formats by Type

### Session Transcripts

**Title:** `Add cleaned transcript: <YYYY-MM-DD> CoP session`

**PR Template:** GitHub will automatically load the session transcript PR template at `.github/PULL_REQUEST_TEMPLATE/session_transcript.md` when creating PRs. The template includes:
- Session summary
- Topics covered
- Decisions made
- Missed items for prompt improvement (critical for continuous improvement)
- Scribe checklist

**When using `gh pr create`:** Omit the `--body` flag to allow GitHub to load the template in the web UI. The scribe will complete all sections after the PR is created.

**Manual mode PR description file (Option B):** Write a starter template to `.tmp/pr-description-<branch-name>.md` containing:

```markdown
## Session Summary
[Brief overview of the session - 2-3 sentences]

## Topics Covered
- [Topic 1]
- [Topic 2]
- [Topic 3]

## Decisions Made
- [Decision 1]
- [Decision 2]

## Missed Items for Prompt Improvement
[Items from Step 5 validation findings that should be added to the transcript processing prompt]
- [Missed item 1]
- [Missed item 2]

## Scribe Checklist
- [ ] Transcript cleaned and formatted
- [ ] Speaker names normalized
- [ ] ASR errors corrected
- [ ] Decisions extracted
- [ ] Action items identified
- [ ] Step 5 validation completed
```

The scribe references this file while completing the GitHub PR template form.

**If providing a body manually (not recommended for session transcripts):**
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

**Manual mode:** Write this body to `.tmp/pr-description-<branch-name>.md` before providing git commands.

### Decisions

**Title:** `Document decision: <topic>`

**Body:**
```
Documented decision on <topic> from <date> CoP session.

Context: <brief context>
Decision: <what was decided>
```

**Manual mode:** Write this body to `.tmp/pr-description-<branch-name>.md` before providing git commands.

### Charter Changes

**Title:** `Update charter: <change-description>`

**Body:**
```
Updated charter to <change-description>.

Rationale: <why this change>
Approved by: <vote count or consensus method>
```

**Manual mode:** Write this body to `.tmp/pr-description-<branch-name>.md` before providing git commands.

## Edge Cases and Troubleshooting

### .tmp Folder Creation

**Problem:** `.tmp/` folder doesn't exist at repo root

**Solution:** Create it before writing PR description files:
```bash
mkdir -p .tmp
```

**Note:** `.tmp/` is gitignored. These files can be deleted after the PR is created.

**Cleanup:** After PR creation, user can remove the file:
```bash
rm .tmp/pr-description-<branch-name>.md
```

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
