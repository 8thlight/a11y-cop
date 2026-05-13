---
name: clean-session-transcript
description: >
  Use when a CoP scribe has a raw meeting transcript that needs cleaning before
  archival. Handles ASR mishears, name normalization, and provides two cleaning
  paths: export-to-markdown or Gemini-assisted find/replace.
---

# Clean Session Transcript

Guides CoP scribes through transcript cleaning with two path options. See [IMPLEMENTATION.md](IMPLEMENTATION.md) for full Gemini prompts, troubleshooting, and file handling details.

## When to Use

Invoke when a scribe has a raw transcript from Gemini Live that needs ASR corrections and name normalization before archiving in `a11y-cop/sessions/`.

## Core Pattern

**Note:** 90-minute session transcripts are typically 20k-30k tokens. Handle large files as the default case.

**Path A - Export as Markdown (~5-10 min):**
1. Export: Instruct scribe: File → Download → Markdown → All Tabs → Export
2. Import: Request file path, attempt read (fallback: copy to repo), create `.tmp/` if missing
3. Clean: Edit tool for ASR mishears and name normalization
4. Review: Checklist confirmation

**Path B - Gemini Find/Replace (~3-5 min):**
1. Prompt sequence: Two Gemini prompts (terminology → names)
2. Export: File → Download → Markdown
3. Import: Request file path, attempt read
4. Review: Checklist confirmation

## Path Selection

**Ask scribe:** "Which path would you prefer?"
- **A) Export as Markdown** (I'll clean it here)
- **B) Gemini Find/Replace** (I'll give you prompts to run first)

**Recommendations:**
- First-time scribe → B | Experienced → A
- Simple transcript → B | Complex/multi-tab → A

## Common ASR Mishears

| Spoken Term | Common Mishears |
|-------------|-----------------|
| 8th Light | a flight, aflight, aphite, eighth alight |
| WCAG | W CAG, WAG, wicked, WKed, WKEG |
| CPACC | cpac, C-PAC |
| Playwright | playright |
| axe | access, ax, acts (tool context only) |
| DYMO | Daimo, DAO, Dinamo, Dynamo |
| Deque | DQ |
| npm | mpm |

See [IMPLEMENTATION.md](IMPLEMENTATION.md) for full list and Gemini prompts.

## Review Checklist

Before confirming transcript ready:
- [ ] Speaker names consistent
- [ ] Names match known CoP members
- [ ] ASR mishears corrected (8th Light, WCAG, axe)
- [ ] No sensitive info (addresses, phone, financial)
- [ ] File naming: `<YYYY-MM-DD>-session-transcript.md`
- [ ] Clean markdown (no HTML tags)

## File Handling

**Target:** `a11y-cop/sessions/<YYYY-MM-DD>-session-transcript.md`

**If sessions/ missing:** Create with `mkdir -p a11y-cop/sessions`

**If file exists:**
1. Confirm date
2. Offer: `-revised` version or overwrite
3. Multiple sessions: Use `-session-2` suffix

## Critical Rules

- File naming: `<YYYY-MM-DD>-session-transcript.md`
- ALWAYS get scribe confirmation before saving
- Gemini prompts scoped to "this document" only
- NEVER commit directly to main (caller handles git)

## Example Invocations

```
/clean-session-transcript

I have today's CoP transcript in Drive and need it cleaned for archiving.
```

## Related Skills

- **`/scribe-workflow`** — Orchestrator that invokes this skill
- **`/extract-meeting-insights`** — Runs after cleaning completes
- **`/using-git`** — Handles commit/PR after cleaning
