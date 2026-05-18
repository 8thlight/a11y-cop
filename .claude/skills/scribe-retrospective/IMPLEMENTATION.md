# Scribe Retrospective - Implementation Guide

## Step 1: Gemini Validation Findings

### Why This Comes First

The Gemini validation iteration (step 5 of scribe workflow) often reveals systematic gaps that affect all future scribe sessions. By collecting these findings first, we can:
- Prevent the same friction in future sessions
- Prioritize high-impact improvements
- Capture insights while they're fresh in the scribe's mind

### What to Ask For

**Template question:**
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

### Processing Findings

For each finding, determine:

| Finding Type | Affected Skill(s) | Edit Location |
|--------------|-------------------|---------------|
| Missed ASR mishear | `clean-session-transcript` | Find/replace tables in Phase 1 or 2 |
| Ambiguous phrase pattern | `clean-session-transcript` | Validation section or examples |
| Prompt unclear | Prompt template in workflow | Prompt text or instructions |
| Multiple correction rounds | `scribe-workflow` | Step 5 guidance or tips |

### Example: Processing Missed Word

**Finding:**
```
User: "Gemini kept transcribing 'Deque' as 'DQ' or 'deck'. 
Had to run the validation prompt 3 times to catch all instances."
```

**Analysis:**
- Type: Missed ASR mishear
- Affected skill: `clean-session-transcript`
- Location: Known ASR mishears table (Phase 2)

**Proposed edit:**
```
Add to Known ASR Mishears table:
| Deque | DQ, deck, dec |
```

**Why this matters:** Deque is the company name for a major a11y vendor — will likely appear in future CoP sessions.

### Example: Processing Prompt Issue

**Finding:**
```
User: "The Gemini prompt asked to 'check for missed words' but didn't 
specify whether to look for patterns or individual errors. Took several 
rounds to understand what level of detail was needed."
```

**Analysis:**
- Type: Ambiguous prompt instruction
- Affected skill: `clean-session-transcript` or prompt template
- Location: Step 5 instructions

**Proposed edit:**
```
Add clarification to prompt template:
"Scan for patterns of ASR errors (e.g., 'access' → 'axe' appears 5+ times) 
and flag individual critical mishears (company names, tool names, key terms)."
```

### No Findings Scenario

**User response:**
```
User: "No major issues — the prompts worked well this time."
```

**Your response:**
```
Great! No step 5 improvements needed. Now scanning conversation for other friction points...
```

## Detailed Friction Signals

### Gemini Validation Indicators (Step 5)

| Signal | What it Means | Example |
|--------|---------------|---------|
| Multiple prompt rounds | Prompt wasn't clear | "Had to run the prompt 3 times to get it right" |
| Missed terminology | Not in find/replace list | "Gemini kept missing 'DYMO' → 'Daimo'" |
| Unclear validation scope | Ambiguous instructions | "Wasn't sure if I should check for patterns or individual errors" |
| Manual correction needed | Prompt didn't catch it | "Had to manually fix 'EnGen' after Gemini" |

### Conversation Indicators

| Signal | What it Means | Example |
|--------|---------------|---------|
| "Wait, I meant..." | Misunderstanding | User: "Wait, I meant the file in Drive, not the local one" |
| "Actually, I need to..." | Missing step | User: "Actually, I need to check the file name format first" |
| "How do I...?" | Unclear instruction | User: "How do I export as markdown?" |
| "That didn't work" | Failed assumption | User: "That didn't work — the file is in a different folder" |
| Multiple clarifications | Unclear step | 3+ messages to clarify what "export" means |
| User provides unrequested info | Missing upfront question | User volunteers file path without being asked |

### Workflow Indicators

| Signal | What it Means | Example |
|--------|---------------|---------|
| Repeated steps | Step not sticky | User exports file twice because first location was wrong |
| Duplicate information | Not captured properly | User gives file path 2+ times in conversation |
| Incorrect assumptions | Skill didn't ask | Assumed file was in Downloads, actually in Drive |
| Poor edge case handling | Unexpected scenario | File already exists, skill didn't handle gracefully |

## Edge Cases and Handling

### User Says "No Findings" but Conversation Shows Gemini Friction

**Scenario:** Multiple clarifications about Gemini prompts occurred, but user says "no findings"

**Approach:** Trust the user
```
Got it — no step 5 improvements needed. Now scanning conversation for other friction points...
```

**Do NOT:**
- Insist there were findings
- List the friction signals you observed
- Ask "are you sure?"

**Rationale:** User may not perceive friction, or may not want to spend time on it

### Finding is Environmental, Not Skill-Related

**Examples:**
- "Gemini was slow to respond" (service latency)
- "I lost my place in the transcript" (user navigation)
- "My internet cut out during validation" (network issue)

**Response:**
```
Understood — that's an environmental issue, not something the skill can address. 
Moving on to conversation scan...
```

**Do NOT propose skill edits for environmental issues**

### Finding Affects Multiple Skills

**Scenario:** Missed word affects both `clean-session-transcript` (find/replace table) and prompt template

**Approach:**
```
I noticed "Deque" was consistently transcribed as "DQ". This affects:

• clean-session-transcript: Add "Deque" → "DQ" to Known ASR Mishears table
• Prompt template: Update example list to include "Deque"

Would you like me to update both?
```

**Get single approval for batch edits** — don't ask separately for each skill

### Finding is About Skill Structure

**User says:**
```
"The find/replace table is getting really long — hard to scan for what I need."
```

**Response:**
```
That's a great point, but restructuring is a bigger task than we should tackle in this PR. 
I'll note it for a future refactoring session.

For now, should we proceed with any specific term additions?
```

**Do NOT:**
- Attempt major restructuring mid-workflow
- Move content without careful review
- Change organization without testing

### User Identifies Friction but Doesn't Want Edits

**User says:**
```
"Yeah, the prompt was confusing, but I don't want to update it right now."
```

**Response:**
```
Got it — I'll note that for future improvement. Moving on to conversation scan...
```

**Do NOT:**
- Press for why they don't want edits
- Edit the skill anyway
- Ask if they're sure

## Skill Edit Workflow Details

### Step 1: Read Current Skill

```bash
Read file_path: .claude/skills/<skill-name>/SKILL.md
```

**Scan for:** The section/instruction that caused friction

### Step 2: Apply Edits

Use Edit tool for targeted changes:
- Add missing ASR mishear to find/replace table
- Clarify unclear prompt instruction
- Add edge case handling
- Update example to match common use

**Example edit for Gemini finding:**
```
Old (Known ASR Mishears table):
| axe (tool) | access, ax, acts |

New:
| axe (tool) | access, ax, acts |
| Deque | DQ, deck, dec |
```

**Example edit for conversation finding:**
```
Old:
"Export the file as markdown"

New:
"Export the file: File → Download → Markdown (.md)"
```

### Step 3: Explain Changes

**Template:**
```
I've updated [skill-name] to [change]. This should [benefit].
```

**Example (Gemini finding):**
```
I've updated clean-session-transcript to add "Deque → DQ/deck" to the Known ASR Mishears table. 
This should reduce Gemini validation rounds when Deque is mentioned in future sessions.
```

**Example (conversation finding):**
```
I've updated clean-session-transcript to include the full File → Download path. 
This should reduce confusion about where to find the export option.
```

### Step 4: Include in PR

The skill file will be committed alongside the main work (e.g., session transcript)

**Commit message will reference skill improvement:**
```
docs(sessions): add cleaned transcript for 2026-05-13 CoP session

Also includes improvements to clean-session-transcript based on scribe retrospective.
```

## What to Edit vs. What NOT to Edit

### DO Edit

| Type | Example |
|------|---------|
| Missing ASR mishears | Add "Deque → DQ" to Known ASR Mishears table |
| Missing steps | Add "Create sessions/ dir if needed" |
| Unclear wording | "Export file" → "File → Download → Markdown" |
| Edge cases | Add handling for "file already exists" |
| Prompt instructions | Clarify "check for patterns AND individual errors" |
| Examples | Update path to match actual file location |

### DO NOT Edit

| Type | Why Not | Example |
|------|---------|---------|
| Restructuring | Too big for this PR | Moving sections, changing format |
| Features | User didn't request | Adding new functionality |
| Working instructions | Could break things | Removing steps that work fine |
| Unrelated improvements | Out of scope | Fixing typos unrelated to friction |

## Example Retrospectives

### Example 1: Gemini Finding + Conversation Friction

**Step 5 finding:**
```
User: "Gemini kept missing 'Deque' → 'DQ'. Had to run validation 3 times."
```

**Conversation friction:**
```
User asked "Which path should I use?" 3 times
User selected Path A but meant Path B
```

**Retrospective:**
```
Thanks for sharing that finding. I'll propose adding "Deque → DQ" to the Known ASR Mishears table.

I also noticed the path selection was unclear (we went back and forth a few times). 

Would you like me to update:
• clean-session-transcript: Add "Deque → DQ" to Known ASR Mishears table
• clean-session-transcript: Add decision tree for path selection

Should I include these improvements in the PR?
```

**If approved, edit both sections** and explain:
```
Retrospective completed. I've updated clean-session-transcript:
• Added "Deque → DQ/deck" to Known ASR Mishears table (will reduce Gemini validation rounds)
• Added decision tree for A/B path selection (clearer upfront guidance)

These changes will be included in the PR.
```

### Example 2: Only Gemini Finding

**Step 5 finding:**
```
User: "The prompt worked well, but I noticed 'ARIA' kept getting transcribed as 'area'. 
Not in the current list."
```

**Conversation:** Smooth flow, no clarifications needed

**Retrospective:**
```
Thanks for that finding. I'll add "ARIA → area" to the Known ASR Mishears table.

Did you notice any other friction points in the workflow itself?
```

**User response:** "Nope, all good!"

**Output:**
```
Great! I've updated clean-session-transcript to add "ARIA → area" to the Known ASR Mishears table. 
This will be included in the PR.
```

### Example 3: No Findings

**Step 5 response:**
```
User: "No major issues — the prompts worked well this time."
```

**Conversation:** Smooth flow, no clarifications needed

**Retrospective:**
```
Retrospective: Any friction points from this session that we should smooth out?
```

**User response:** "Nope, looks good!"

**Output:**
```
Great! No improvements identified — proceeding to git operations.
```

## Timing and Flow

**When to invoke:**
- After main workflow completes (transcript cleaned, summary generated, etc.)
- Before git operations begin
- When user has confirmed main work is done

**When NOT to invoke:**
- Mid-workflow (interrupts flow)
- After git operations start (too late to include in PR)
- If user is clearly in a rush (respect their time)

**Flow integration:**
```
Main workflow → Collect Gemini findings → Scan conversation → Present all findings → Git operations
```

**If retrospective adds edits:**
```
Main workflow → Collect Gemini findings → Scan conversation → Apply skill edits → Git operations (includes skill files)
```

## Summary

The scribe retrospective focuses on **preventing future friction** by:
1. Collecting step 5 findings (systematic issues from Gemini validation)
2. Scanning conversation (one-off friction in this session)
3. Proposing targeted edits (add terms, clarify steps, handle edge cases)
4. Including improvements in the same PR (workflow + skill updates together)

The goal is continuous improvement with minimal overhead — capture learnings while they're fresh, apply them immediately, and make the next scribe session smoother.
