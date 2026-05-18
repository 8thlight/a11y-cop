# Skill Feedback - Implementation Guide

## Detailed Handling Options

### Option A: Add Improvements to PR

**When to recommend:**
- Feedback points to clear, actionable changes
- Changes are localized to 1-2 skills
- User wants immediate improvement
- Current branch already exists

**Process:**
1. Analyze feedback for specific skill improvements
2. Identify affected skill files
3. Read current skill content
4. Apply edits using Edit tool
5. Explain what was changed and why
6. Stage changes (they'll be included in next commit)

**Example workflow:**
```
User feedback: "The path selection was really confusing — I had to read it 3 times to understand the difference."

Analysis: Affects clean-session-transcript skill, Path Selection section

Edit applied:
- Added decision tree with clear criteria for Path A vs Path B
- Added examples for each path type
- Clarified when to use each option

Files staged: .claude/skills/clean-session-transcript/SKILL.md
```

### Option B: Create GitHub Issue

**When to recommend:**
- Feedback is complex or affects multiple skills
- Changes need discussion or design
- User wants to track separately from current work
- Feedback involves policy or charter questions

**Guidance to provide:**

```markdown
To create a GitHub issue:

1. Visit: https://github.com/8thLight/a11y-cop/issues/new/choose
2. Select template: "Problem Submission" or "Skill Improvement"
3. Fill in the following:

**Title:** [Improvement: <brief description>]

**Description:**
Context: [What workflow were you doing?]
Feedback: [What didn't work well?]
Suggestion: [What would improve it?]
Skills affected: [List relevant skills]

Session reference: [Date and type of session]
```

**Do NOT:**
- Create the issue yourself via gh CLI or API
- Fill in the issue template for the user
- Post the issue on their behalf

**Rationale:** Issue creation is a deliberate act that should be user-driven

### Option C: Contact Facilitator

**When to recommend:**
- Feedback is about facilitation or session structure
- Concerns about charter or operating model
- Personal or sensitive feedback
- User prefers direct conversation over written feedback

**Information to provide:**

```
CoP Facilitator: Celeste Aronow
Email: caronow@8thlight.com
Slack: @Celeste (in #a11y-community-of-practice channel)

Your feedback:
[Summary of what user shared]

Feel free to reach out directly to discuss this feedback.
```

**Saved feedback format:**
- Date: [Session date]
- Workflow: [What they were doing]
- Feedback: [User's exact words]
- Context: [Any relevant details from session]

## Feedback Analysis Patterns

### Pattern 1: Skill Content Issue

**Feedback examples:**
- "The instructions were unclear"
- "I didn't understand what to do next"
- "The examples didn't match my situation"

**Recommended option:** A (Add to PR) — clear content improvements

### Pattern 2: Workflow Structure Issue

**Feedback examples:**
- "The order of steps didn't make sense"
- "I had to jump between multiple skills"
- "The prerequisites weren't clear upfront"

**Recommended option:** B (GitHub issue) — needs design discussion

### Pattern 3: Facilitation Issue

**Feedback examples:**
- "I didn't know when to use this skill"
- "The session format didn't work for me"
- "I needed more guidance from the facilitator"

**Recommended option:** C (Contact facilitator) — not a skill fix

### Pattern 4: Environmental Issue

**Feedback examples:**
- "Gemini was slow"
- "My Drive was unresponsive"
- "I couldn't find the file I saved"

**Response:**
```
That sounds frustrating. Environmental issues (external services, network speed, file management) aren't something the skill can address directly.

Would you still like to provide feedback on the skill workflow itself, or would you prefer to contact the facilitator about session logistics?
```

## Edge Cases

### User Provides No Specific Feedback

**User says:** "It was fine" or "Nothing specific"

**Response:**
```
Got it — no specific feedback to capture. Proceeding to git operations.
```

**Do NOT:** Press for feedback or suggest things they might have missed

### User Provides Multiple Unrelated Issues

**User says:**
- "The path selection was confusing"
- "Also, the git commands were unclear"
- "And I think we should change the session format"

**Response:**
```
Thanks for the detailed feedback. I see three separate concerns:
1. Path selection (skill content)
2. Git commands (skill content)
3. Session format (facilitation)

Would you like to:
A) Apply skill improvements (items 1 & 2) to this PR, and separately contact the facilitator about session format (item 3)?
B) Create separate GitHub issues for each concern?
C) Contact the facilitator about all three?
```

**Adapt options based on feedback complexity**

### User Picks Option A but Changes Are Too Large

**Scenario:** User wants immediate fixes, but changes require restructuring

**Response:**
```
I see what you're describing. The improvements you're suggesting would require significant restructuring (moving sections, changing workflow order, etc).

That's too large to tackle in this PR. Would you like to:
- Create a GitHub issue to track this as a larger improvement project?
- Contact the facilitator to discuss workflow redesign?

For now, I can apply smaller improvements (clearer wording, added examples) if that would help.
```

### User Picks Option B but Doesn't Want to Create Issue

**User says:** "I want to track it separately, but I don't want to create the issue right now"

**Response:**
```
No problem. Here's a summary of your feedback that you can reference later:

Feedback summary:
[What user shared]

When you're ready to create the issue, visit:
https://github.com/8thLight/a11y-cop/issues/new/choose

Proceeding to git operations now.
```

## Example Feedback Sessions

### Example 1: Clear Skill Improvement

**Feedback:** "The file path instructions were confusing — I didn't know which directory to save to."

**Options presented:** A, B, C

**User chooses:** A

**Actions taken:**
- Read clean-session-transcript/SKILL.md
- Edit "File Handling" section to clarify path: `sessions/<filename>.md`
- Add example: `sessions/2026-05-13-session-transcript.md`
- Stage changes

**Output:**
```
I've applied the following improvements:
• clean-session-transcript: Clarified file path format and added example

These changes will be included in the PR.
```

### Example 2: Complex Workflow Issue

**Feedback:** "I had to bounce between scribe-workflow and clean-session-transcript constantly. It felt disjointed."

**Options presented:** A, B, C

**User chooses:** B

**Output:**
```
To create a GitHub issue:

1. Visit: https://github.com/8thLight/a11y-cop/issues/new/choose
2. Select template: "Skill Improvement"
3. Fill in:

Title: Improvement: Reduce skill-switching friction in scribe workflow

Description:
Context: CoP scribe workflow (transcript processing)
Feedback: Had to switch between scribe-workflow and clean-session-transcript frequently, felt disjointed
Suggestion: Consider consolidating instructions or improving handoff points
Skills affected: scribe-workflow, clean-session-transcript

Session reference: 2026-05-XX scribe session
```

### Example 3: Facilitation Feedback

**Feedback:** "I wasn't sure when I was supposed to use this workflow. Was it immediately after the session, or the next day?"

**Options presented:** A, B, C

**User chooses:** C

**Output:**
```
CoP Facilitator: Celeste Aronow
Email: caronow@8thlight.com
Slack: @Celeste (in #a11y-community-of-practice channel)

Your feedback:
"I wasn't sure when I was supposed to use this workflow. Was it immediately after the session, or the next day?"

This is a great question about session logistics and scribe expectations. The facilitator can clarify timing and add this to scribe onboarding.

Feel free to reach out directly.
```

## Integration with Other Skills

### After scribe-retrospective

**Sequence:**
1. scribe-retrospective runs automatically (objective friction analysis)
2. skill-feedback asks for subjective feedback (this skill)
3. Both sets of improvements can be included in the same PR

**Coordination:**
- scribe-retrospective findings are presented first
- skill-feedback asks if there's anything else beyond what was already identified
- If user feedback overlaps with retrospective findings, acknowledge and don't duplicate

**Example:**
```
Earlier, I identified some friction points automatically (path selection clarity). 

Beyond those findings, is there anything else that didn't work well in this workflow?
```

### Before using-git

**Sequence:**
1. scribe-retrospective completes
2. skill-feedback captures additional user input
3. All changes staged
4. using-git handles commit/push/PR

**File staging:**
- scribe-retrospective changes already staged
- skill-feedback changes added to same staging area
- Single commit includes all improvements

## Question Variations

### For First-Time Scribes

```
Now that we've completed the retrospective, I'd like to capture your experience.

What didn't work well for you in this workflow? What felt confusing, frustrating, or slower than expected?
```

**Why different:** Explicitly connects to just-completed retrospective, uses plain language

### For Experienced Scribes

```
Beyond the friction points I identified, any other feedback on what could be improved?
```

**Why different:** Assumes familiarity with retrospective process, more concise

### When No Retrospective Changes Found

```
The retrospective didn't identify any objective friction signals, but I'd like to hear your subjective experience.

What didn't work well in this workflow? What could be improved?
```

**Why different:** Explains context, sets expectation for subjective feedback
