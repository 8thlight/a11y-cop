# Skill Retrospective - Implementation Guide

## Detailed Friction Signals

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

### User Identifies Friction but Doesn't Want Edits

**User says:**
```
"Yeah, the path selection was confusing, but I don't want to update the skill right now."
```

**Response:**
```
Got it — I'll note that for future improvement. Proceeding to git operations now.
```

**Do NOT:**
- Press for why they don't want edits
- Edit the skill anyway
- Ask if they're sure

### Multiple Skills Involved

**Scenario:** Friction spans scribe-workflow + clean-session-transcript

**Approach:**
```
I noticed the path selection was unclear in clean-session-transcript, and scribe-workflow could set expectations better upfront.

Would it help if I updated:
• clean-session-transcript: Add path selection decision tree
• scribe-workflow: Clarify path options in prerequisites

Should I include these improvements in the PR?
```

**Get single approval for batch edits** — don't ask separately for each skill

### Friction is Environmental, Not Skill-Related

**Examples:**
- "My Google Drive was slow" (network issue)
- "I couldn't find the file because I forgot where I saved it" (user error)
- "Gemini took a long time to respond" (external service)

**Response:**
```
Understood — that's an environmental issue, not something the skill can address. Proceeding to git operations.
```

**Do NOT propose skill edits for environmental issues**

### User Says "No Friction" but Conversation Shows Friction

**Scenario:** Multiple clarifications occurred, but user says "looks good"

**Approach:** Trust the user
```
Great! Proceeding to git operations.
```

**Do NOT:**
- Insist there was friction
- List the friction signals you observed
- Ask "are you sure?"

**Rationale:** User may not perceive friction, or may not want to spend time on it

### Friction is About Skill Structure, Not Content

**User says:**
```
"The skill works, but it's really long and hard to scan."
```

**Response:**
```
That's a great point, but restructuring is a bigger task than we should tackle in this PR. I'll note it for a future refactoring session.

For now, should we proceed with the git operations?
```

**Do NOT:**
- Attempt major restructuring mid-workflow
- Move content to IMPLEMENTATION.md without careful review
- Change the skill organization without testing

## Question Template Variations

### For First-Time Users

```
Before we commit, quick check: Was this workflow clear? Anything that felt confusing or took longer than expected?

(Totally optional — just trying to make this smoother for next time!)
```

**Why different:** First-time users may not know what "friction" means in this context

### For Experienced Users

```
Quick retrospective: Any friction points to smooth out?
```

**Why different:** Experienced users know the pattern, can be more concise

### When Friction Already Observed

```
I noticed we had to clarify [specific thing] a few times. Should I update [skill-name] to make that clearer upfront?
```

**Why different:** Don't make user identify friction you already saw

## Skill Edit Workflow Details

### Step 1: Read Current Skill

```bash
Read file_path: .claude/skills/<skill-name>/SKILL.md
```

**Scan for:** The section/instruction that caused friction

### Step 2: Apply Edits

Use Edit tool for targeted changes:
- Add missing step
- Clarify unclear wording
- Add edge case handling
- Update example to match common use

**Example edit:**
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

**Example:**
```
I've updated clean-session-transcript to include the full File → Download path. This should reduce confusion about where to find the export option.
```

### Step 4: Include in PR

The skill file will be committed alongside the main work (e.g., session transcript)

**Commit message will reference skill improvement:**
```
docs(sessions): add cleaned transcript for 2026-05-13 CoP session

Also includes improvements to clean-session-transcript based on scribe feedback.
```

## What to Edit vs. What NOT to Edit

### DO Edit

| Type | Example |
|------|---------|
| Missing steps | Add "Create sessions/ dir if needed" |
| Unclear wording | "Export file" → "File → Download → Markdown" |
| Edge cases | Add handling for "file already exists" |
| Examples | Update path to match actual file location |
| Order | Move prerequisite check earlier in workflow |

### DO NOT Edit

| Type | Why Not | Example |
|------|---------|---------|
| Restructuring | Too big for this PR | Moving sections, changing format |
| Features | User didn't request | Adding new functionality |
| Working instructions | Could break things | Removing steps that work fine |
| Unrelated improvements | Out of scope | Fixing typos unrelated to friction |

## Example Retrospectives

### Example 1: Path Selection Confusion

**Friction observed:**
- User asked "Which path should I use?" 3 times
- User selected Path A but meant Path B

**Retrospective:**
```
Quick retrospective: I noticed the path selection was unclear (we went back and forth a few times). Should I update clean-session-transcript to add a decision tree at the path selection step?
```

**If approved, edit:**
```
Before:
**Choose path:** A (Export as Markdown) or B (Gemini Find/Replace)

After:
**Choose path:**
- Path A (Export as Markdown): Best for complex transcripts, multiple tabs, or if you're experienced with markdown export
- Path B (Gemini Find/Replace): Best for simple transcripts or first-time scribes

Which path would you prefer?
```

### Example 2: Missing Prerequisite

**Friction observed:**
- User tried to save file, but sessions/ directory didn't exist
- User had to create directory manually

**Retrospective:**
```
Quick retrospective: We hit a snag because sessions/ didn't exist. Should I update clean-session-transcript to check for that directory upfront and create it if needed?
```

**If approved, edit:**
```
Add to "File Handling" section:

**If sessions/ doesn't exist:** Create it with `mkdir -p sessions`
```

### Example 3: No Friction

**Conversation:** Smooth flow, no clarifications needed

**Retrospective:**
```
Quick retrospective: Did you notice any friction points or things that could be smoother in this workflow?

(It's totally fine to say "no" or "looks good" — this is optional!)
```

**User response:** "Nope, all good!"

**Output:**
```
Great! Retrospective skipped — proceeding to git operations.
```

## Batch Edit Example

**Friction observed:**
- Scribe confused about path options (clean-session-transcript)
- Orchestrator didn't set expectations about path choice (scribe-workflow)

**Retrospective:**
```
Quick retrospective: I noticed some confusion around the path options. Would it help if I updated:

• clean-session-transcript: Add decision tree for path selection
• scribe-workflow: Mention path choice upfront in prerequisites

Should I include these improvements in the PR?
```

**If approved, edit both skills** and explain:
```
Retrospective completed. I've updated:
• clean-session-transcript: Added decision tree for A/B path selection
• scribe-workflow: Added path choice mention in prerequisites section

These changes will be included in the PR.
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
Main workflow → Retrospective → Git operations
```

**If retrospective adds edits:**
```
Main workflow → Retrospective → Apply skill edits → Git operations (includes skill files)
```
