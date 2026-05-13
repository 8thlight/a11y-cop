---
name: skill-retrospective
description: >
  Use when a skill workflow has just completed and you need to capture user feedback
  for improvement. Reviews the conversation for friction points, asks the user what
  could be smoother, and proposes skill edits if needed.
---

# Skill Retrospective

Post-execution review to capture friction points and continuously improve skill workflows. See [IMPLEMENTATION.md](IMPLEMENTATION.md) for detailed friction signals, question templates, and edge case handling.

## When to Use

Invoke when a skill workflow has just completed and the user is about to move to the next phase (typically git operations).

**Timing:** Run AFTER main workflow completes, BEFORE git operations

## Core Pattern

1. **Scan conversation:** Review for friction signals (unclear steps, corrections, workarounds, repeated questions)
2. **Ask user:** "Did you notice any friction points or things that could be smoother?" (always optional)
3. **If friction found:** Identify affected skill(s), propose concrete edits, ask permission
4. **If approved:** Read skill file → apply edits → explain changes → include in PR
5. **If no friction/user skips:** Proceed to next step

## Friction Signals

**Conversation indicators:**
- "Wait, I meant..." (misunderstanding)
- "Actually, I need to..." (missing step)
- "How do I...?" (unclear instruction)
- Multiple back-and-forth to clarify single step

**Workflow indicators:**
- Steps requiring repetition
- Information user provided multiple times
- Incorrect assumptions made
- Edge cases handled poorly

See [IMPLEMENTATION.md](IMPLEMENTATION.md) for complete list and examples.

## Question Template

**Initial ask (always optional):**
```
Before we commit, quick retrospective: Did you notice any friction points or things that could be smoother in this workflow?

(It's totally fine to say "no" or "looks good" — this is optional!)
```

**If friction identified:**
```
I noticed [specific friction point]. Would it help if I updated the skill to [proposed improvement]?

Should I include this skill improvement in the PR?
```

## Skill Edit Guidelines

**What to edit:**
- Add missing steps or clarifications
- Update examples to match common use cases
- Add edge case handling
- Improve wording for unclear instructions

**What NOT to edit:**
- Complete restructuring (separate task)
- Features user didn't request
- Working instructions without confirmation

## Critical Rules

- ALWAYS make retrospective optional (user can skip)
- NEVER pressure for feedback
- ONLY propose edits for concrete friction in THIS session
- ALWAYS ask permission before editing skill files
- If user says "no friction" or "skip", immediately move to next step

## Output Format

**If edits approved:**
```
Retrospective completed. I've updated [skill-name] to:
• [Change 1]
• [Change 2]

These changes will be included in the PR.
```

**If no friction/skipped:**
```
Retrospective skipped — proceeding to git operations.
```

## Related Skills

- **`/scribe-workflow`** — Invokes this retrospective before git operations
- **`/clean-session-transcript`** — Common target for improvements
- **`/using-git`** — Runs after retrospective completes
