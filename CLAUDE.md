# CLAUDE.md

This file provides guidance to Claude Code and other AI assistants when working in this repository.

## Project Overview

This is the public repository for **8th Light's Accessibility Community of Practice (CoP)**. The CoP exists to solve concrete accessibility problems together while building shared expertise across the organization. We focus on working sessions over presentations, creating reusable artifacts, and distributing accessibility capability beyond a single specialist.

**Key Principles:**
- Solve real problems, not hypothetical ones
- Create artifacts that work on actual projects
- Work together, learn together, build together
- Share knowledge openly (within public/private boundaries)

## Model Preference

**Default model: Haiku** for all CoP scribe workflow tasks (transcript validation, curation, transformation).

**Rationale:** CoP scribe workflows are routine, well-structured tasks that don't require advanced reasoning. Most CoP members access Claude Code via client accounts, where token efficiency is critical. Haiku provides excellent performance for these workflows while minimizing token usage.

**When to use Sonnet or Opus:**
- Complex reasoning tasks (strategic planning, architectural decisions)
- Large-scale refactoring across multiple files
- Novel problem-solving that requires creative approaches
- Explicit user request for a different model

**Implementation:** The `/transcript-processing` skill and scribe workflow documentation both assume Haiku as the default. Users can override with `/model sonnet` or `/model opus` if needed for specific tasks.

## Repository Structure

```
a11y-cop/
├── charter/                 # CoP charter and operating model
├── sessions/                # Cleaned meeting transcripts (future)
├── decisions/               # Decision records from working sessions (future)
├── artifacts/               # Templates, runbooks, tools (future)
├── .claude/skills/          # Claude Code skills for CoP workflows
├── .github/ISSUE_TEMPLATE/  # Problem submission template
├── CLAUDE.md                # This file
└── README.md                # Public-facing project description
```

## How to Use This Repository

### For AI Assistants

When helping with this repository:

- Use the `/transcript-processing` skill for post-session transcript processing
- Future skills will support artifact creation and decision documentation
- Follow the conventions and workflows detailed below

## Key Conventions and Workflows

### Problem Submission Process

1. Create a GitHub Issue using the problem submission template
2. Include: Context, What I've Tried, Help Needed, Desired Outcome
3. Facilitator triages problems, selects 1-2 per session
4. Selected problems get focused collaborative time

### Session Format (90 minutes)

- **First 10 min:** Quick wins, announcements, charter check-ins
- **Next 50 min:** Collaborative problem-solving on selected issues
- **Last 30 min:** Document decisions, create artifacts, assign follow-ups

### Scribe Workflow

1. Use Gemini Live for transcription during sessions
2. Process notes using `/scribe-workflow` skill in Claude Code (runs `/prepare-cop-notes`, `/scribe-retrospective`, and `/using-git`)
3. Post summary to Slack within 48 hours
4. Create PR with cleaned notes to `sessions/`

**Keeping workflow docs in sync:** `docs/SCRIBE-WORKFLOW.md` (human-facing reference) and `.claude/skills/scribe-workflow/SKILL.md` (Claude-facing skill) describe the same workflow. When updating one, update the other.

### File Naming Conventions

- Session transcripts: `YYYY-MM-DD-session-transcript.md`
- Decision records: Use descriptive names based on the decision topic
- Artifacts: Use descriptive names based on what problem they solve

### Branch and Commit Format

**Branch naming:**
- `transcript/<date>-cop-session` for session transcripts
- `artifact/<name>` for new artifacts
- `decision/<topic>` for decision records
- `charter/<change-description>` for charter amendments

**Commit format:**
```
type(scope): description

Types: docs, feat, fix, refactor, chore
Scopes: sessions, artifacts, decisions, charter
```

**Examples:**
- `docs(sessions): add 2026-05-13 session transcript`
- `feat(artifacts): add WCAG 2.2 audit template`
- `docs(decisions): document axe-core vs Pa11y choice`

**Process:** Always branch and PR, never commit directly to main.

## AI Assistant Guidance

### CoP Context

- This is a working group solving real accessibility problems for 8th Light client work
- Focus areas: WCAG 2.2 AA compliance, inclusive design, AI-assisted workflows
- Target: Reduce accessibility specialist bottleneck from 60-80% to 20-30%
- Goal: Create 6 reusable artifacts by December 2026

### When Processing Transcripts and Notes

**Common ASR mishears to fix:**
- "8th Light" often transcribed as "a flight", "8 light", "eighth light"
- "WCAG" often transcribed as "W CAG", "WCAG", "we CAG"
- "axe" (the testing tool) often transcribed as "access", "ax"
- "Playwright" often transcribed as "playright", "play right"
- "ARIA" often transcribed as "area", "Arya"

**Speaker name normalization:**
- Use consistent full names throughout (not "John" in one place, "J" elsewhere)
- Extract: decisions made, action items with owners, artifacts created, parking lot items

### When Creating Artifacts

**Quality standards:**
- Only create what's needed to solve a concrete problem from a session
- Every artifact must have clear usage context and success criteria
- Test artifacts on real projects before declaring them "done"
- Include frontmatter with metadata (date created, problem addressed, last updated)

**Document structure:**
- Use frontmatter for metadata (date, attendees, problem addressed)
- Decision records should follow: Context, Decision, Consequences, Alternatives Considered
- Keep artifacts concise and actionable (runbooks, templates, checklists)
- Include examples where helpful

### When Reviewing Code

Focus on accessibility-specific concerns:
- Semantic HTML and ARIA usage
- Keyboard navigation and focus management
- Color contrast and visual indicators
- Screen reader compatibility
- Form labels and error messaging
- Dynamic content announcements

## Public Repository Boundaries

This is a **public repository**. Be mindful of what information is included.

### ❌ Do NOT Include

- Client-specific details, company names, or project codenames (unless already public)
- Internal 8th Light employee information beyond publicly listed contacts
- Proprietary methodologies or intellectual property
- Sensitive accessibility audit findings for specific clients
- Internal metrics, budget information, or compensation details
- Private Slack conversation content without permission
- Personal contact information beyond public-facing practice lead email

### ✅ DO Include

- Generalized problem patterns (anonymized)
- Reusable templates and workflows
- WCAG interpretation and implementation guidance
- Decision rationale that helps others learn
- Public references (Coinbase case studies, published research)
- Open-source tool configurations and patterns

## Technology Stack

- **Transcription:** Gemini Live (Google Meet integration)
- **Issue Tracking:** GitHub Issues
- **Communication:** Slack (#a11y-community-of-practice channel)
- **Documentation:** Markdown files in this repository
- **AI Assistance:** Claude Code with custom skills
- **Version Control:** Git + GitHub, branch-based workflow

## Success Metrics

The charter defines detailed metrics tracked quarterly and reviewed at Town Hall:

**Engagement:**
- Attendance rates (target: 75% core, 60% extended by Q4)
- Problem submissions (target: 2-3 per week by Q3)
- Slack activity (#a11y-community-of-practice)

**Effectiveness:**
- Artifacts created (target: 6 by Dec 2026)
- Artifact usage on projects
- Decision durability (how often decisions are revisited)

**Ecosystem Impact:**
- Accessibility regression reduction
- Client recognition of accessibility capability
- Capability distribution (who can handle what independently)

## Contributing

**CoP Members:**
- Bring problems to the group
- Use artifacts and provide feedback
- Participate in working sessions
- Help create and improve artifacts

**External Contributors:**
- Open issues with questions or suggestions
- Submit PRs for artifact improvements (include usage context and testing evidence)
- Share how you've adapted this model for your organization

**Charter Amendments:**
- Propose changes via PR
- Requires 2/3 vote of CoP members
- Changes reviewed at quarterly retrospectives

## Resources and References

- **Charter:** `charter/8L-A11y-CoP-Charter.md` (read this first for full context)
- **Problem Submission:** Use GitHub issue template in `.github/ISSUE_TEMPLATE/`
- **Contact:** Celeste Aronow, Accessibility Practice Lead (caronow@8thlight.com)
- **Related:** 8th Light Accessibility Playbook (Google Docs, internal reference)

## Quick Start

1. **Clone this repository**
2. **Read the charter** in `charter/8L-A11y-CoP-Charter.md`
3. **Join the Slack channel** #a11y-community-of-practice (if you're at 8th Light)
4. **Submit a problem** using the GitHub issue template
5. **Attend a working session** (schedule in charter)

Welcome to the 8th Light Accessibility Community of Practice!
