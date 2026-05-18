---
name: scribe-retrospective
description: >
  Use when CoP scribe workflow has completed. Collects Gemini validation findings
  (step 5 friction points), analyzes conversation for friction signals, generates
  improvement suggestions, and applies approved changes to workflow skills.
---

# Scribe Retrospective

Automated post-execution analysis to identify friction points and continuously improve CoP scribe workflow skills. See [IMPLEMENTATION.md](IMPLEMENTATION.md) for detailed friction signals, analysis criteria, and edge case handling.

## When to Use

Invoke when CoP scribe workflow has just completed and the user is about to move to the next phase (typically git operations).

**Timing:** Run AFTER main workflow completes, BEFORE git operations

## Core Pattern

1. **Collect Gemini validation findings**: Ask user for step 5 findings (friction points from prompt validation iteration)
2. **Apply adjustments**: Based on findings, propose improvements to workflow skills
3. **Scan conversation**: Look for additional friction signals (corrections, clarifications, repeated steps)
4. **Present all findings**: "Retrospective analysis complete. Improvements: [list]. Apply? (yes/no)"
5. **If approved**: Read skill files → apply edits → explain changes → stage for PR
6. **If declined**: Proceed without changes

## Step 1: Gemini Validation Findings

Before scanning for conversation friction, explicitly ask for the findings from step 5:

```
Before we proceed, can you share the list of findings from step 5 
(the friction points you identified during the Gemini prompt validation iteration)?

These might include:
• Missed/misheard words that weren't in the find/replace list
• Patterns that required multiple correction rounds
• Ambiguous phrases that slowed validation
• Any other friction during the Gemini prompt refinement

If there were no significant findings, just let me know!
```

**Wait for user response before proceeding to conversation scan.**

### Processing Findings

For each finding provided:
1. Determine which skill(s) it affects (e.g., `clean-session-transcript`, `scribe-workflow`, `prompt-templates`)
2. Map to specific sections (find/replace lists, validation steps, prompts)
3. Draft edits (add terms, clarify instructions, update examples)

**Include these edits in the retrospective presentation** (Step 4) alongside conversation-based findings.

## Friction Signals

| Type | Examples |
|------|----------|
| Gemini validation | Missed words, patterns requiring multiple rounds, ambiguous phrases |
| Conversation | "Wait, I meant...", "How do I...?", multiple clarifications |
| Workflow | Repeated steps, duplicate info provided, incorrect assumptions |

See [IMPLEMENTATION.md](IMPLEMENTATION.md) for complete list.

## Analysis Process

**Collect Gemini findings** → scan conversation for friction → **Generate** → map to sections, draft edits → **Present** → single summary with all changes → **Apply** → if approved, edit and stage files

## Edit Guidelines

**Do edit:** Missing steps, unclear wording, edge cases, outdated examples, missing find/replace terms  
**Don't edit:** Restructuring, unrequested features, working instructions

## Critical Rules

- ALWAYS start with Gemini validation findings (step 5)
- NEVER ask user to identify conversation friction (automatic analysis)
- Single confirmation: "Apply these changes? (yes/no)"
- Only propose edits for concrete friction in THIS session
- Present ALL changes before asking approval

## Quick Reference

| Outcome | Output |
|---------|--------|
| Approved | "Updated: [skill]: [changes]. Included in PR." |
| None found | "No improvements identified — proceeding." |
| Declined | "Findings noted but not applied — proceeding." |

## Related Skills

- **`/scribe-workflow`** — Invokes this retrospective before git operations
- **`/clean-session-transcript`** — Common target for improvements
- **`/using-git`** — Runs after retrospective completes
