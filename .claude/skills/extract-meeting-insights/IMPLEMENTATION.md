# Extract Meeting Insights - Implementation Guide

## Complete Output Structure

```
CoP Session Summary — <YYYY-MM-DD>

Attendees: [list names from transcript]

Decisions Made:
• Decision 1 [Owner: Name]
• Decision 2 [Owner: Name]

Action Items:
• Task 1 [Owner: Name, Due: date]
• Task 2 [Owner: Name, Due: date]

Artifacts Created/Planned:
• Artifact 1 — brief description
• Artifact 2 — brief description

Parking Lot:
• Topic 1 — why deferred
• Topic 2 — blocker identified

Key Discussion Points:
• Insight 1 — context
• Insight 2 — context

Next Session: <date/topic if mentioned>
```

## Detailed Extraction Strategies

### Decisions Made

**What to look for:**
- Language: "we agreed", "we decided", "we're going with", "consensus", "settled on"
- Outcome language: "we'll use", "the approach is", "we're committing to"
- Resolution after debate: "after discussing pros/cons, we decided..."

**How to extract:**
- State the decision clearly (not the debate that led to it)
- Include owner if mentioned
- Omit: rationale details (save for decision doc if needed)

**Example extraction:**

**From transcript:**
```
**Celeste:** So after discussing both options, I think we should go with axe-core for our automated testing. It's more widely used and better documented.
**Tim:** Agreed. I'll set up the initial config.
**Chris:** Sounds good to me.
```

**Summary output:**
```
Decisions Made:
• Use axe-core for automated accessibility testing [Owner: Tim (setup)]
```

### Action Items

**What to look for:**
- Explicit commitments: "I'll", "I will", "I'm going to"
- Task delegation: "Can you...", "Would you mind..."
- Implicit assignments: "Tim's going to", "Celeste will"
- Deadlines: "by next week", "before the next session", specific dates

**How to extract:**
- Start with verb (e.g., "Set up", "Create", "Review")
- Include owner name
- Include due date if mentioned (even if approximate: "next session")

**Example extraction:**

**From transcript:**
```
**Tim:** I'll set up the axe-core config by next week.
**Celeste:** Great. And Chris, can you review the documentation and flag any gaps?
**Chris:** Sure, I can do that before our next session.
```

**Summary output:**
```
Action Items:
• Set up axe-core config [Owner: Tim, Due: next week]
• Review documentation and flag gaps [Owner: Chris, Due: next session]
```

### Artifacts Created/Planned

**What to look for:**
- Templates being created or discussed
- Runbooks, checklists, guides
- Tools, scripts, configurations
- Documentation pages
- Tangible outputs (not just "documentation" — be specific)

**How to extract:**
- Name the artifact clearly
- Brief description of purpose (1 line)
- State "planned" if not yet created

**Example extraction:**

**From transcript:**
```
**Celeste:** We should create a runbook for setting up axe-core in new projects.
**Tim:** Good idea. I'll draft that as part of the config work.
**Chris:** And we probably need a checklist for manual testing too.
**Celeste:** Let's table the checklist for now and focus on the axe setup first.
```

**Summary output:**
```
Artifacts Created/Planned:
• axe-core setup runbook — guide for adding automated testing to projects (planned)
```

Note: Checklist goes in Parking Lot (deferred), not Artifacts

### Parking Lot

**What to look for:**
- Explicit deferral: "let's table that", "save that for later", "not now"
- Blockers: "we need X before we can do Y", "waiting on"
- Future considerations: "we should revisit", "keep this in mind"
- Tangents acknowledged but not pursued: "good point, but out of scope"

**How to extract:**
- State the topic deferred
- Include why (briefly): blocked, out of scope, future consideration

**Example extraction:**

**From transcript:**
```
**Chris:** What about Pa11y? Should we compare it to axe?
**Celeste:** Let's table the Pa11y comparison for now — we need to get axe working first.
**Tim:** Agreed. We can revisit once we have baseline automation.
```

**Summary output:**
```
Parking Lot:
• Pa11y comparison — deferred until axe-core baseline established
```

### Key Discussion Points

**What to look for:**
- Patterns identified: "we're seeing this across projects"
- Insights: "the real issue is X, not Y"
- Questions that drove conversation: "how do we handle dynamic content?"
- Principles articulated: "accessibility is a design problem, not just testing"

**How to extract:**
- Focus on insights, not just topics
- Include brief context (1 line)
- Avoid: play-by-play of the conversation

**Example extraction:**

**From transcript:**
```
**Celeste:** I'm noticing a pattern — most of our accessibility issues come from third-party components that we don't control.
**Tim:** Yeah, that's been a blocker on my project too. Even when we write accessible code, vendor widgets break it.
**Chris:** So maybe we need guidance on evaluating components before we adopt them?
**Celeste:** Exactly. A pre-adoption accessibility checklist could save us a lot of rework.
```

**Summary output:**
```
Key Discussion Points:
• Third-party component accessibility — most issues stem from vendor widgets; need pre-adoption evaluation checklist
```

### Next Session

**What to look for:**
- Explicit scheduling: "next session is May 20"
- Topic planning: "next time we'll focus on..."
- Implicit next steps: "we'll continue this next time"

**How to extract:**
- Date if mentioned
- Topic if mentioned
- If neither: omit this section

**Example extraction:**

**From transcript:**
```
**Celeste:** Let's reconvene in two weeks — May 27 — and Tim can show us the axe config he's set up.
**Tim:** Sounds good.
```

**Summary output:**
```
Next Session: May 27 — Tim demos axe-core config setup
```

## Quality Standards Detailed

### Clear Ownership

**❌ Avoid vague ownership:**
```
• Set up axe-core config [Owner: TBD]
• Someone will review documentation
```

**✅ Include specific names:**
```
• Set up axe-core config [Owner: Tim]
• Review documentation [Owner: Chris]
```

**If no owner assigned:**
```
• Set up axe-core config [Owner: Not assigned — needs volunteer]
```

### Due Dates (When Mentioned)

**❌ Don't infer dates:**
```
• Set up axe-core config [Owner: Tim, Due: next week]  ← NOT mentioned in transcript
```

**✅ Include only if stated:**
```
• Set up axe-core config [Owner: Tim]  ← No due date mentioned
```

**✅ Capture approximate dates:**
```
• Set up axe-core config [Owner: Tim, Due: before next session]  ← Mentioned
```

### Context for Parking Lot

**❌ Just list the topic:**
```
• Pa11y comparison
```

**✅ Include why deferred:**
```
• Pa11y comparison — deferred until axe-core baseline established
```

### Concrete Artifacts

**❌ Vague descriptions:**
```
• Documentation
• Some templates
```

**✅ Specific artifacts:**
```
• axe-core setup runbook — step-by-step guide for adding to projects
• WCAG 2.2 AA audit template — spreadsheet for tracking violations
```

## Edge Case Handling

### No Decisions Made

**If transcript has no formal decisions:**

```
CoP Session Summary — <YYYY-MM-DD>

Attendees: [list]

Decisions Made:
No formal decisions made in this session.

Action Items:
[continue with rest of structure]
```

**Don't force decisions if none were made** — exploratory sessions are valid

### No Action Items

**If transcript has no action items assigned:**

```
Action Items:
No action items assigned in this session.
```

**Common reasons:** Exploratory discussion, demo session, retrospective

### Very Long Transcript

**Problem:** Transcript includes 30+ minutes of procedural opening/closing

**Solution:** Focus extraction on working session portion

**How to identify working session:**
- Look for: problem statements, active discussion, decisions being made
- Skip: introductions, scheduling discussions, logistics

**Example:**
```
[Skip transcript lines 1-50: Introductions, calendar check]
[Extract from lines 51-200: Problem-solving on axe-core setup]
[Skip lines 201-220: Closing, next session scheduling]
```

### Sensitive Client Names Mentioned

**Problem:** Transcript mentions "Acme Corp" (confidential client)

**Solution:** Anonymize or omit

**Anonymization strategies:**
- Replace with: "Client A", "Client engagement", "unnamed client"
- Omit entirely if not essential to summary

**Example:**

**From transcript:**
```
**Tim:** On the Acme Corp project, we're struggling with their legacy form library.
```

**Summary output:**
```
Key Discussion Points:
• Legacy form library challenges on client engagement — need guidance for vendor widget evaluation
```

### Mixed Session (Multiple Topics)

**Problem:** Session covered 3 unrelated topics

**Solution:** Group by topic if helpful, or keep flat list

**Flat list (default):**
```
Decisions Made:
• Decision 1 (Topic A)
• Decision 2 (Topic B)

Action Items:
• Task 1 (Topic A)
• Task 2 (Topic B)
```

**Grouped (if very long):**
```
Session covered: axe-core setup, WCAG 2.2 updates, client engagement patterns

[Use subsections if needed, but keep Slack-friendly — no markdown headings]
```

### Attendees Not Clearly Listed

**Problem:** Transcript doesn't have attendee list upfront

**Solution:** Extract speaker names from transcript

**Scan for:** All names with **Name:** format

**Example output:**
```
Attendees: Celeste Aronow, Tim Dorr, Chris Peak
```

If speaker names were normalized during cleaning, those names will be consistent

## Target Length Guidance

**Target:** 150-250 words (Slack-optimized)

**Why:** Long summaries don't get read in Slack

**How to stay concise:**
- One line per decision/action/insight
- No elaboration (save for decision docs if needed)
- Omit procedural details
- Focus on actionable information

**Word count check:**
```bash
wc -w .tmp/session-summary.md
# Target: 150-250 words
```

**If over 250 words:** Review for verbosity, remove elaboration, tighten phrasing

## Slack Posting Instructions (For Scribe)

**After summary generated:**
```
Summary created at .tmp/session-summary.md — ready to copy/paste into Slack.

To post to #a11y-community-of-practice:
1. Open .tmp/session-summary.md
2. Copy all contents (Cmd+A, Cmd+C)
3. Paste into Slack channel (Cmd+V)

The file has no markdown headings, so it will paste cleanly. Bullet points will render correctly.

Post within 48 hours of the session while it's still fresh.
```

## Example Full Summary

```
CoP Session Summary — 2026-05-13

Attendees: Celeste Aronow, Tim Dorr, Chris Peak, Jordan Lee

Decisions Made:
• Use axe-core for automated accessibility testing (Pa11y comparison deferred) [Owner: Tim (setup)]
• Create pre-adoption checklist for evaluating third-party components [Owner: Chris (draft)]

Action Items:
• Set up axe-core config and integration in sample project [Owner: Tim, Due: next session]
• Draft component evaluation checklist (accessibility criteria) [Owner: Chris, Due: May 27]
• Review WCAG 2.2 changes and flag anything impacting current projects [Owner: Jordan, Due: next session]

Artifacts Created/Planned:
• axe-core setup runbook — step-by-step guide for adding to projects (planned)
• Third-party component accessibility checklist — pre-adoption evaluation criteria (planned)

Parking Lot:
• Pa11y vs axe-core comparison — deferred until axe baseline established
• Manual testing workflow documentation — prioritize automation first
• ARIA pattern library — future artifact, not urgent

Key Discussion Points:
• Most accessibility issues stem from third-party vendor widgets we don't control — need pre-adoption evaluation to prevent issues
• Current projects blocked on legacy form libraries with poor accessibility — need workaround strategies
• WCAG 2.2 focus indicator requirements may impact existing patterns — needs audit

Next Session: May 27 — Tim demos axe-core config, Chris presents draft component checklist
```

**Word count:** ~215 words (within target)
