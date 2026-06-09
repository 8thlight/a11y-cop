---
name: scribe-retrospective
description: >
  Use after committing a CoP session transcript. Asks if you fixed anything
  manually after Claude's review and updates skill tables if needed.
---

# Scribe Retrospective

Lightweight post-session check to capture anything Claude missed and feed it back into the workflow for next time.

## When to Use

After Step 3 (Transform and Review Notes), before Step 5 (Commit and Create PR).

## Core Pattern

1. Ask one question
2. If fixes were made, propose table updates
3. Confirm and apply

---

## Step 1: Ask

```
After Claude's review in Step 4, did you manually fix anything in the session notes?

For example:
• A client name Claude didn't catch
• A technical term or ASR mishear not in the tables
• A speaker name inconsistency
• Any PII or sensitive content Claude missed

If nothing — just say "no" and we'll move on.
```

**If no:** Respond "No improvements identified — proceed to Step 7 (PR)." Done.

**If yes:** Continue to Step 2.

---

## Step 2: Map Findings to Tables

For each item the scribe fixed, identify which skill owns that concern. The principle: `scribe-workflow/SKILL.md` is the orchestrator — it says which skills to run in what order, not how to review content. Detailed tables and review logic live in the skill that does the work.

| Finding Type | Target File |
|---|---|
| Client name or project name | `prepare-cop-notes/SKILL.md` — "Other items to check" → client names table |
| Technical term or ASR mishear | `prepare-cop-notes/SKILL.md` — "Technical terms and ASR mishears" table |
| Speaker name variation | `prepare-cop-notes/SKILL.md` — "Names to check" section |
| PII pattern | `prepare-cop-notes/SKILL.md` — PII bullet |
| Other sensitivity | `prepare-cop-notes/SKILL.md` — "Open-ended scan" bullets |
| Step ordering or which skill to invoke | `scribe-workflow/SKILL.md` — orchestration only |
| Git/commit/PR conventions | `using-git/SKILL.md` or `using-git/IMPLEMENTATION.md` |

Draft the proposed additions (new rows or bullet points only — do not restructure).

---

## Step 3: Present and Apply

Show all proposed changes in a single summary:

```
Proposed skill updates:

• [table name]: add row "[garbled form]" → "[correct form]"
• ...

Apply these changes? (yes/no)
```

**If yes:** Edit the appropriate skill file (see table above) with the new rows/entries. Confirm what was added and where.

**If no:** "Findings noted, not applied — proceed to Step 7 (PR)."

---

## Step 4: Write PR Summary

Whether or not skill tables were updated, write a summary file to `.tmp/retro-YYYY-MM-DD.md` (replacing YYYY-MM-DD with the session date). The scribe will paste this into the PR description.

```markdown
## Manual Fixes

The following items were caught manually after Claude's review and corrected before commit:

| Type | Found As | Corrected To |
|---|---|---|
| [Mishear / Client name / PII / etc.] | "[original text]" | "[corrected text]" |

_These have been added to the scribe-workflow skill tables for future sessions._
```

If nothing was fixed manually, write:

```markdown
## Manual Fixes

None — Claude's review caught everything.
```

Tell the scribe: "PR summary saved to `.tmp/retro-YYYY-MM-DD.md`. Paste it into the Manual Fixes section of your PR description."

---

## Critical Rules

- One question only — do not ask the scribe to review the conversation for friction
- Never restructure existing tables, only append
- Present ALL changes before asking for approval
- If nothing to update, say so and move on immediately

## Related Skills

- **`/scribe-workflow`** — calls this skill at Step 4
- **`/using-git`** — used at Step 7 after this completes
