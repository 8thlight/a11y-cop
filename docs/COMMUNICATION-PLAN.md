# A11y CoP Communication Plan

## Purpose

This document defines how the Accessibility Community of Practice communicates about working sessions, training events, and ongoing activities across 8th Light. The goal is to maximize participation while maintaining a low-pressure, flexible environment.

## Core Principles

1. **Make it easy to join** - Clear information, direct links, simple asks
2. **Emphasize flexibility** - Partial attendance is normal and encouraged
3. **Lead with value** - Always include the problem/topic hook
4. **Normalize async participation** - Can't attend? Submit problems anyway
5. **Keep it visible** - Regular presence in company channels

## Channel Strategy

### Town Hall (#town-hall)

**Use for:**
- Regular biweekly session announcements (every session)
- Day-before reminders
- One-off special events (training sessions, guest speakers, tool demos)

**Why Town Hall:** Following successful patterns from other company working groups (e.g., Caroline's book club). Keeps CoP visible company-wide without being buried in general chatter.

**Note:** This channel choice can be adjusted based on feedback during plan review.

### CoP Channel (#a11y-community-of-practice)

**Use for:**
- Problem submissions and triage
- Artifact updates and releases
- Session follow-ups and decision summaries
- Technical discussions
- Async problem-solving
- Resource sharing

**Why CoP channel:** Allows deeper technical discussion without overwhelming company-wide channels. Members who want ongoing engagement can follow here.

### Practice Channels

**Use for:**
- Practice-specific training events only
- When content is tailored to one practice's tech stack or client needs
- Examples: Enterprise practice-specific WCAG guidance, European practice multilingual a11y

**Which practices:**
- Enterprise Practice
- European Engagements
- Emerging Solutions

## Message Templates

### Regular Biweekly Session Announcement (Town Hall)

**When:** Monday before the session (e.g., Monday for a Wednesday session)

**Template:**

```
:a11y: A11y CoP Working Session :a11y:

Hi all! Next working session: [Day, Date] at [Time ET/CT]

**What we're tackling:** [Problem title with brief hook - why it matters]
GitHub issue: [link]

**Can't make it?** Submit problems anytime via PR or Slack - we solve together, you follow up async.

**Drop in for any part** - full 90 minutes not required. Join for the problem discussion, stay for artifact creation, or just lurk.

**Want the calendar invite?** Ping me and I'll add you to the recurring event.

See you there!
```

**Key elements:**
- Emoji header (consistent visual marker)
- Friendly greeting
- Clear logistics (day, date, time)
- Problem hook (the "why should I care?")
- Flexible attendance emphasized
- Async pathway visible
- Easy join mechanism

**Example:**

```
:a11y: A11y CoP Working Session :a11y:

Hi all! Next working session: Wednesday, July 2nd at 10:30am ET / 9:30am CT

**What we're tackling:** How do we spot accessibility issues earlier? Kelsey's mapping tools to disabilities they catch, and we're building a testing checklist engineers can actually use.
GitHub issue: https://github.com/8thlight/a11y-cop/issues/2

**Can't make it?** Submit problems anytime via PR or Slack - we solve together, you follow up async.

**Drop in for any part** - full 90 minutes not required. Join for the problem discussion, stay for artifact creation, or just lurk.

**Want the calendar invite?** Ping me and I'll add you to the recurring event.

See you there!
```

### Day-Before Reminder (Town Hall)

**When:** Day before the session (e.g., Tuesday for a Wednesday session)

**Template:**

```
:a11y: Reminder: CoP Working Session Tomorrow :a11y:

Tomorrow [Time ET/CT] - [Problem title]

Drop in for any part: [Meet link]

Problem context: [GitHub issue link]
```

**Keep it short** - this is a reminder, not a re-pitch.

**Example:**

```
:a11y: Reminder: CoP Working Session Tomorrow :a11y:

Tomorrow 10:30am ET / 9:30am CT - Building an accessibility testing checklist

Drop in for any part: https://meet.google.com/hmi-ujrh-rtm

Problem context: https://github.com/8thlight/a11y-cop/issues/2
```

### Special Training Event (Town Hall)

**When:** At least 1 week before the event

**Template:**

```
:a11y: [Event Type]: [Title] :a11y:

Hi all! [Brief introduction to what this is and why it matters]

**What:** [2-3 sentences describing the session and value]
**When:** [Day, Date] at [Time ET/CT]
**Duration:** [Length] (drop in for any part)
**Where:** [Meet link or "ping me for invite"]

[Quote or testimonial if available]

[If guest speaker: Brief bio/credentials]

Come join us!
```

**Example:**

```
:a11y: Live Demo: Screen Reader Testing :a11y:

Hi all! Ever wondered what your app actually sounds like to someone using a screen reader? We're doing a live exploration session - I'll screen share NVDA/VoiceOver walking through real web apps, showing what breaks and why.

**What:** Hands-on demonstration of screen reader testing patterns, common failure modes, and quick manual testing techniques you can use on any project.
**When:** Friday, July 19th at 2:00pm ET / 1:00pm CT
**Duration:** 60 minutes (drop in for any part - first 30min is the demo, last 30min is Q&A and practice)
**Where:** https://meet.google.com/hmi-ujrh-rtm

This is the kind of visceral "oh NOW I get it" experience that makes accessibility real instead of theoretical.

Come join us!
```

### Session Follow-Up (CoP Channel)

**When:** Within 48 hours of the session

**Template:**

```
**Session Summary - [Date]**

**Problem:** [What we tackled]

**Key Decisions:**
- [Decision 1]
- [Decision 2]

**Artifacts Created/Updated:**
- [Link to PR or file]

**What's Still Open:**
- [Unresolved question or parking lot item]

**Action Items:**
- [Owner] - [Task] - [Due date]

Full transcript: [link to Google Drive or repo file if committed]
```

**Purpose:** Keep non-attendees in the loop, document decisions for future reference.

### Problem Submission Encouragement (CoP Channel)

**When:** Weekly or bi-weekly, between sessions

**Template:**

```
:thinking_face: Got an accessibility problem from your project?

Submit it for our next working session:
- **GitHub issue** (preferred): https://github.com/8thlight/a11y-cop/issues/new/choose
- **Slack thread here** - we'll convert it to an issue

Template: Context → What I've tried → Help needed → Desired outcome

You don't need to attend the session - we solve it together and post the decision summary here.
```

**Purpose:** Keep problem pipeline active, normalize async participation.

### Artifact Release (CoP Channel)

**When:** When an artifact is ready for use

**Template:**

```
:tada: New Artifact Available: [Artifact Name]

**What it is:** [1-2 sentence description]
**Use it when:** [Scenario]
**Where to find it:** [Link to file in repo]

This came out of Session [#] working on [problem]. Try it on your project and let us know what works / what's missing.
```

**Example:**

```
:tada: New Artifact Available: Accessibility Testing Checklist

**What it is:** A quick-reference checklist for manual accessibility testing during PR review - keyboard nav, screen reader basics, color contrast, zoom testing.
**Use it when:** Reviewing frontend PRs or before merging a UI feature.
**Where to find it:** https://github.com/8thlight/a11y-cop/blob/main/artifacts/testing-checklist.md

This came out of Session 3 working on Kelsey's problem about spotting issues earlier. Try it on your project and let us know what works / what's missing.
```

## Timing and Cadence

### For Biweekly Sessions

- **Monday before session:** Town Hall announcement
- **Day before session:** Town Hall reminder
- **Within 48 hours after:** CoP channel follow-up

### For Special Events

- **1 week before:** Town Hall announcement
- **Day before:** Town Hall reminder
- **Within 48 hours after:** CoP channel summary

### Ongoing

- **Weekly (between sessions):** CoP channel problem submission encouragement or artifact updates

## Calendar Invite Strategy

**Recurring invite exists for:**
- All CoP Slack channel members

**How people join:**
- Respond to Town Hall announcement: "Ping me for invite"
- Direct message to facilitator
- Self-service: Join CoP Slack channel → auto-added to calendar series

**Flexible attendance reinforcement:**
- Calendar invite description includes: "Drop in for any part - full 90 minutes not required"
- No "required" attendees (all optional)

**Action item (from 2026-06-18 meeting):**
- [ ] Invite all CoP Slack channel members to recurring calendar event

## Edge Case Handling

### Cancelled Session

**Town Hall announcement:**

```
:a11y: CoP Session Cancelled - [Date] :a11y:

Cancelling [day]'s session to avoid conflict with [reason - e.g., Apple WWDC, company event, facilitator out].

Next session: [Date] - we'll tackle [problem] then.
```

**CoP channel update:**

```
FYI - cancelled today's session due to [reason]. Next session [date]. If you had a problem queued up, it's still in the backlog: [GitHub issue link]
```

**No guilt, just facts.** Follow Caroline's pattern - casual, clear, no apology.

### Topic/Problem Change

**When:** If the selected problem changes within a week of the session

**Town Hall update (if change is significant):**

```
:a11y: CoP Session Update - [Date] :a11y:

Quick update: [day]'s session is now tackling [new problem] instead of [old problem].

**Why the change:** [Brief rationale - e.g., "blocker came up on EnGen project", "new member submitted urgent problem"]

Same time, same place - drop in for any part.
```

**CoP channel update (always, even if not announced in Town Hall):**

```
Session topic change: [Date] now covering [new problem] instead of [old problem].

**Rationale:** [Explain decision]

Original problem ([link]) moved to backlog for future session.
```

### Guest Speaker

**Town Hall announcement (use special event template):**

```
:a11y: Guest Speaker: [Name] on [Topic] :a11y:

Hi all! We're excited to have [Name], [credentials/role], joining our next CoP session to discuss [topic].

**What:** [Description of topic and why it matters]
**When:** [Day, Date] at [Time ET/CT]
**Duration:** [Length] (drop in for any part - presentation + Q&A)
**Where:** [Meet link]

[Brief guest bio - 2-3 sentences highlighting relevant expertise]

Come join us!
```

**Still emphasize flexible attendance** - even with a guest, partial attendance is fine.

### Problem Submitter Can't Attend

**This is normal and expected.** Messaging already normalizes this:

- Town Hall announcements include: "Can't make it? Submit problems anyway"
- Problem submission template doesn't assume attendance
- Session follow-up posted to CoP channel for async review

**Facilitator's job:**
- Read problem context aloud at start of session
- Group solves collaboratively
- Post decision summary in CoP channel
- Tag problem submitter or follow up directly if clarification needed

### Session Goes Long / Doesn't Finish Problem

**CoP channel update:**

```
**Session Update - [Date]**

We made progress on [problem] but didn't fully resolve it.

**What we decided:**
- [Decisions made so far]

**What's still open:**
- [Unresolved questions]

**Next steps:**
- Continue async in this thread, OR
- Pick it up again at next session ([date])

Thoughts?
```

**Don't force artificial closure.** If problem needs more time, say so.

## Success Metrics

### How We Know Communication Is Working

**Quantitative (tracked by facilitator):**

| Metric | Target | Check Frequency | Red Flag |
|--------|--------|----------------|----------|
| **Session attendance (total headcount)** | Growing or stable | Every session | <60% of prior average for 3 sessions |
| **Problem submissions per week** | 1-2 per session cycle | Weekly | Zero submissions for 2+ weeks |
| **CoP channel activity** | 10+ posts/month | Monthly | <5 posts for 2 consecutive months |
| **Calendar invite acceptance rate** | N/A (baseline first) | Quarterly | Sharp drop from baseline |

**Qualitative (reviewed quarterly):**

- Are people bringing real problems vs. just attending?
- Are partial attendance participants actually showing up?
- Are problem submissions coming from non-attendees? (async pathway working)
- Do attendees know what the session is about before joining?
- Are we seeing repeat attendees or just one-timers?

**Review Cadence:**

- **Quick check:** Facilitator reviews metrics before each session
- **Formal review:** Quarterly (aligns with charter's quarterly metric reviews)
- **Communication plan adjustments:** As needed based on feedback

**Where metrics are tracked:**

- Session attendance: Google Meet participant logs or manual headcount
- Problem submissions: GitHub issue timestamps
- CoP channel activity: Slack analytics
- Qualitative feedback: Post-session surveys (when applicable) or direct conversation

### Red Flags Requiring Intervention

If any of these occur, revisit communication strategy:

- **<60% attendance** of prior average for 3 consecutive sessions → Channel strategy or timing may be wrong
- **Zero problem submissions** for 2+ weeks → Messaging not normalizing async participation
- **Multiple "what's the CoP about?"** questions in Town Hall threads → Value proposition unclear
- **High calendar invite acceptance, low actual attendance** → Timing conflicts or value mismatch

## Approval and Iteration

**This plan will be:**

1. Reviewed by CoP team via PR
2. Presented to Shawn DeVries (executive sponsor) for input
3. Implemented starting [date after approval]
4. Reviewed quarterly alongside other CoP metrics
5. Adjusted based on feedback and what's actually working

**Open questions for review:**

- Is Town Hall the right channel for regular announcements, or should we use Water Cooler?
- Are message templates too casual / too formal?
- What's missing from edge case handling?
- Are success metrics the right ones to track?

**Future additions:**

- Practice meeting integration messaging (once we have practice-specific events scheduled)
- "Vibe to Value: AI in the Open" drop-in messaging (when relevant AI governance topics emerge)
- New member onboarding communication flow

---

**Document Owner:** Celeste Aronow (Accessibility Practice Lead)  
**Last Updated:** 2026-06-18  
**Next Review:** 2026-09 (quarterly)
