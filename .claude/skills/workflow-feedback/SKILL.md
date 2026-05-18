---
name: workflow-feedback
description: >
  Use when you need to capture subjective user feedback on what didn't work well
  in the scribe workflow (documentation, skills, or process). Focuses only on
  improvements, offers options for how to handle the feedback (add to PR, create
  issue, or contact facilitator).
---

# Workflow Feedback

Capture user feedback on workflow friction and improvement opportunities in documentation, skills, and process. See [IMPLEMENTATION.md](IMPLEMENTATION.md) for detailed handling options and examples.

## When to Use

Invoke after scribe-retrospective completes, when you want to capture subjective user experience feedback that goes beyond objective friction signals.

**Timing:** Run AFTER scribe-retrospective, BEFORE final git operations

## Core Pattern

1. Ask: "What didn't work well? What could be improved?"
2. Capture feedback without judgment
3. Offer handling options: A) Add to PR, B) Create issue, C) Contact facilitator
4. Execute chosen option

**Never ask:** "What went well?" (improvements only)

## Handling Options

| Option | When to Use | Action |
|--------|-------------|--------|
| A) Add to PR | Quick fixes, clear solutions | Apply edits → stage → include in commit |
| B) Create issue | Complex changes, needs discussion | Guide user to issue template |
| C) Contact facilitator | Policy/charter/facilitation concerns | Provide contact info + save feedback |

## Critical Rules

- Never ask "What went well?" (improvements only)
- Always offer all three options (A, B, C)
- User chooses — don't decide for them
- Option A: apply immediately; Option B: guide only (don't create issue); Option C: provide contact info

## Quick Reference

**Option A output:**
```
Applied: [skill]: [changes]. Included in PR.
```

**Option B output:**
```
Create issue at: https://github.com/8thLight/a11y-cop/issues/new/choose
Include: [feedback], [skills], [suggestions]
```

**Option C output:**
```
Contact: Celeste Aronow (caronow@8thlight.com)
Feedback noted: [summary]
```

## Related Skills

- **`/scribe-retrospective`** — Runs before this skill, handles objective friction analysis
- **`/using-git`** — Runs after this skill, handles git operations
- **`/scribe-workflow`** — Orchestrates the full workflow including this feedback step
