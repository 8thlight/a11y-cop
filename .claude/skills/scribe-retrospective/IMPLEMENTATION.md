# Scribe Retrospective - Implementation Guide

## Overview

The retrospective has two jobs:
1. **Ask** — what did the scribe fix manually that Claude missed?
2. **Scan** — look back through the conversation for friction signals the scribe may not have noticed

Both feed into skill table updates and a `.tmp/` PR summary.

---

## Conversation Friction Signals

Scan the conversation automatically — do not ask the scribe to identify these. Look for:

| Signal | What it Means | Example |
|--------|---------------|---------|
| "Wait, I meant..." | Misunderstanding in skill instructions | User: "Wait, I meant the Notes tab, not Transcript" |
| "How do I...?" | Step was unclear | User: "How do I export as markdown?" |
| Multiple clarifications on same point | Instruction not sticky | 3+ messages to clarify what "export" means |
| Scribe volunteered info without being asked | Skill didn't ask the right question upfront | User provides file path without being prompted |
| Repeated corrections | Same term missed multiple times | "Sean" corrected to "Shawn" in 3 places |
| Confusion about file path/name | Skill instructions too generic | User unsure which file to pass to `/prepare-cop-notes` |

---

## Processing Findings

### Routing Table

For each finding (from the scribe's manual fixes OR the conversation scan), identify which skill owns it:

| Finding Type | Target File |
|---|---|
| Client name or project name | `prepare-cop-notes/SKILL.md` — "Other items to check" → client names table |
| Technical term or ASR mishear | `prepare-cop-notes/SKILL.md` — "Technical terms and ASR mishears" table |
| Speaker name variation | `prepare-cop-notes/SKILL.md` — "Names to check" section |
| PII pattern | `prepare-cop-notes/SKILL.md` — PII bullet |
| Other sensitivity | `prepare-cop-notes/SKILL.md` — "Open-ended scan" bullets |
| Step ordering or which skill to invoke | `scribe-workflow/SKILL.md` — orchestration only |
| Git/commit/PR conventions | `using-git/SKILL.md` or `using-git/IMPLEMENTATION.md` |

### Example: Processing a Missed Client Name

**Finding:** Scribe manually replaced "Cars.com" with "[Automotive Client]" — wasn't in the table.

**Analysis:**
- Type: Client name
- Target: `prepare-cop-notes/SKILL.md`, client names table

**Proposed edit:**
```
Add to client names table:
| Cars.com | Cars project, cars.com | `[Automotive Client]` |
```

### Example: Processing a Conversation Friction Signal

**Finding:** Scribe asked "which file do I pass to prepare-cop-notes?" after seeing the skill's example path.

**Analysis:**
- Type: Unclear instruction
- Target: `scribe-workflow/SKILL.md` Step 3, or `prepare-cop-notes/SKILL.md` usage line

**Proposed edit:**
```
Clarify the usage example to show the actual Gemini export filename format:
/prepare-cop-notes '/Users/yourname/Downloads/A11y CoP Working Session - YYYY_MM_DD HH_MM EDT - Notes by Gemini.md'
```

---

## Edge Cases

### Scribe Says "Nothing" but Conversation Shows Friction

**Approach:** Trust the user — don't insist.

```
Got it — no manual fixes. I did notice [brief description of friction signal] in our conversation. 
Want me to propose an improvement for that, or skip it?
```

**Do NOT:**
- List every friction signal you found
- Ask "are you sure?"
- Apply changes without approval

### Finding Affects Multiple Skills

Present together and get a single approval:

```
"Cars.com" wasn't caught automatically. This affects:
• prepare-cop-notes: Add to client names table
• scribe-workflow: (no change needed — review tables live in prepare-cop-notes)

Apply both? (yes/no)
```

### Finding is Environmental, Not Skill-Related

Examples: slow network, fire alarm interruption, Gemini outage.

```
That sounds environmental — not something the skill can address. Moving on.
```

Do NOT propose skill edits for environmental issues.

### Finding is a Structural Issue (Too Big for This PR)

**User says:** "The client names table is getting hard to scan."

```
That's worth addressing, but restructuring is bigger than a table row addition. 
I'll note it — for now, should we add the specific term that was missing?
```

Do NOT restructure or reorganize skill files mid-retro.

---

## What to Edit vs. What NOT to Edit

### DO Edit

| Type | Example |
|------|---------|
| Missing ASR mishear | Add "Deque → DQ/deck" to technical terms table |
| Missing client name | Add "Cars.com → [Automotive Client]" to client table |
| Unclear step wording | "Export file" → "File → Download → Markdown (.md)" |
| Missing edge case | Add handling for speaker name that appears two ways |

### DO NOT Edit

| Type | Why Not |
|------|---------|
| Restructuring tables | Too big, needs its own PR |
| Unrequested features | Out of scope |
| Working instructions that didn't cause friction | Could break things |
| Content in `scribe-workflow/SKILL.md` that belongs in `prepare-cop-notes` | Wrong file |

---

## Writing the .tmp/ PR Summary

After collecting findings (whether or not any skill edits were made), write `.tmp/retro-YYYY-MM-DD.md`:

```markdown
## Manual Fixes

| Type | Found As | Corrected To |
|---|---|---|
| Client name | "Cars.com" | "[Automotive Client]" |
| Speaker name | "Sean" | "Shawn" |
| Certification | "CPAC" | "CPACC" |

_Added to prepare-cop-notes/SKILL.md tables for future sessions._
```

If nothing was fixed manually:

```markdown
## Manual Fixes

None — Claude's review caught everything.
```

Tell the scribe: "PR summary saved to `.tmp/retro-YYYY-MM-DD.md`. Paste it into the Manual Fixes section of your PR description."

---

## Timing

**When to invoke:** After `/prepare-cop-notes` completes and scribe has confirmed all corrections, before `/using-git`.

**Flow:**
```
/prepare-cop-notes → corrections confirmed → /scribe-retrospective → /using-git
```
