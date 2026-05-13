---
name: extract-meeting-insights
description: >
  Use when a cleaned CoP session transcript needs to be summarized for Slack posting.
  Creates a copy-paste-ready summary in .tmp/session-summary.md with no markdown headings,
  optimized for the #a11y-community-of-practice channel.
---

# Extract Meeting Insights

Analyzes a cleaned CoP session transcript and generates a Slack-ready summary. See [IMPLEMENTATION.md](IMPLEMENTATION.md) for detailed extraction rules and quality standards.

## When to Use

Invoke when a cleaned session transcript exists and the scribe needs a Slack-ready summary for the #a11y-community-of-practice channel.

## Core Pattern

1. **Read transcript:** Load from `a11y-cop/sessions/<date>-session-transcript.md`
2. **Extract key elements:** Decisions, action items, artifacts, parking lot, key discussions
3. **Generate summary:** Write to `.tmp/session-summary.md` (gitignored)
4. **Optimize for Slack:** No markdown headings, clean sections, copy/paste ready

## Output Format

Sections: Attendees, Decisions Made, Action Items, Artifacts Created/Planned, Parking Lot, Key Discussion Points, Next Session. Use Slack markdown: `*Section Label:*` for bold labels, `-` for bullets (not `•`). NO markdown headings (`##`). See [IMPLEMENTATION.md](IMPLEMENTATION.md) for full structure template.

## Quality Standards

**Include:** Clear ownership, due dates (if mentioned), context for deferrals, concrete artifacts

**Exclude:** Verbatim snippets, procedural details, verbose summaries (target: 150-250 words)

## Extraction Rules

| Element | Look For |
|---------|----------|
| Decisions | "we agreed", "we decided", "consensus" |
| Action items | "will", "going to" + person + task |
| Artifacts | Templates, runbooks, tools being created |
| Parking lot | "later", "defer", "blocker" |
| Key discussions | Patterns, insights driving conversation |

See [IMPLEMENTATION.md](IMPLEMENTATION.md) for detailed strategies and examples.

## File Handling

**Output:** `.tmp/session-summary.md` (gitignored)

**If .tmp/ missing:** Create with `mkdir -p .tmp`

**After creation:** Inform scribe: "Summary at .tmp/session-summary.md — ready to copy/paste into Slack."

## Critical Rules

- NO markdown headings (plain text section labels)
- Target: 150-250 words
- ALWAYS include ownership for decisions/actions
- NEVER include sensitive client details (anonymize if needed)

## Edge Cases

No decisions/actions → State explicitly | Very long transcript → Focus on working session | Sensitive names → Anonymize or omit

See [IMPLEMENTATION.md](IMPLEMENTATION.md) for edge case handling.

## Related Skills

- **`/clean-session-transcript`** — Must run first
- **`/scribe-workflow`** — Orchestrates this skill
