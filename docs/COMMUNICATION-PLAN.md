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

**Why Town Hall:** Following successful patterns from other company working groups (e.g., book club). Keeps CoP visible company-wide without being buried in general chatter.

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
- Practice-specific event communications only

## Message Templates

### Regular Biweekly Session Announcement (Town Hall)

**When:** Monday before the session (e.g., Monday for a Wednesday session)

**Template:**

```
:wheelchair: A11y CoP Working Session :wheelchair:

Hi all! Next working session: [Day, Date] at [Time ET/CT]

**What we're tackling:** [Problem title with brief hook - why it matters]
GitHub issue: [link]

**How to participate:**
- **Attend live** - Drop in for any part, full 90 minutes not required
- **Participate async** - Submit problem statements via PR or Slack anytime
  - If you submit a problem, we ask that you attend the session to discuss it if you're able
  - Submitting doesn't guarantee it will be addressed in the following meeting
- **Follow along** - Session summaries with decisions and action items posted to #a11y-community-of-practice

**Calendar invite:** Find "A11y CoP Working Session" on the global events calendar. Want automatic reminders? Ping me to be added to the invite list.

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
:wheelchair: A11y CoP Working Session :wheelchair:

Hi all! Next working session: Wednesday, July 2nd at 10:30am ET / 9:30am CT

**What we're tackling:** How do we spot accessibility issues earlier? We're mapping tools to disabilities they catch and building a testing checklist engineers can actually use.
GitHub issue: https://github.com/8thlight/a11y-cop/issues/2

**How to participate:**
- **Attend live** - Drop in for any part, full 90 minutes not required
- **Participate async** - Submit problem statements via PR or Slack anytime
  - If you submit a problem, we ask that you attend the session to discuss it if you're able
  - Submitting doesn't guarantee it will be addressed in the following meeting
- **Follow along** - Session summaries with decisions and action items posted to #a11y-community-of-practice

**Calendar invite:** Find "A11y CoP Working Session" on the global events calendar. Want automatic reminders? Ping me to be added to the invite list.

See you there!
```

### Day-Before Reminder (Town Hall)

**When:** Day before the session (e.g., Wednesday for a Thursday session)

**Format:** Reply in the thread of the Monday announcement

**Template:**

```
Reminder: Tomorrow [Time ET/CT]
[Meet link]
```

**Keep it minimal** - this is a thread reply to the original announcement.

**Example:**

```
Reminder: Tomorrow 10:30am ET / 9:30am CT
https://meet.google.com/hmi-ujrh-rtm
```

### Special Training Event (Town Hall)

**When:** At least 1 week before the event

**Template:**

```
:wheelchair: [Event Type]: [Title] :wheelchair:

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
:wheelchair: Live Demo: Screen Reader Testing :wheelchair:

Hi all! Ever wondered what your app actually sounds like to someone using a screen reader? We're doing a live exploration session - I'll screen share NVDA/VoiceOver walking through real web apps, showing what breaks and why.

**What:** Hands-on demonstration of screen reader testing patterns, common failure modes, and quick manual testing techniques you can use on any project.
**When:** Friday, July 19th at 2:00pm ET / 1:00pm CT
**Duration:** 60 minutes (drop in for any part - first 30min is the demo, last 30min is Q&A and practice)
**Where:** https://meet.google.com/hmi-ujrh-rtm

This is the kind of visceral "oh NOW I get it" experience that makes accessibility real instead of theoretical.

Come join us!
```

### Session Follow-Up (CoP Channel)

**When:** Immediately after the session ends

**Template:**

```
Hey folks, here is a post-working-session summary of action items we have decided on.

[Name]:
• [Action item 1]
• [Action item 2]

[Name]:
• [Action item]

[Context note if needed - e.g., "The above will be used to..."]

Everyone:
• [Group action item if applicable]
```

**Purpose:** Clear accountability - who is doing what and what we're expecting.

**Example:**

```
Hey folks, here is a post-working-session summary of action items we have decided on.

Celeste:
• Draft communication plan (will create PR for async input)
• Present plan to executive sponsor for official approval
• Invite all channel members to recurring event (done)

Kelsey:
• Build tools → disabilities mapping resource (create PR for async contributions)

The above will be used to plan a live exploration session with company-wide announcement.

Rachael:
• Move raw notes to a11y CoP shared drive
• Clean up notes for repo

Tim:
• Confirm what's available for a11y testing with Cypress (free vs cloud version)

Everyone:
• Review and provide feedback on Communication Plan and Tools mapping PRs once announced
```


## Timing and Cadence

### For Biweekly Sessions

- **Monday before session:** Town Hall announcement
- **Day before session:** Town Hall reminder (thread reply to Monday post)
- **Immediately after session:** CoP channel action item summary

### For Special Events

- **1 week before:** Town Hall announcement
- **Day before:** Town Hall reminder (thread reply)
- **Immediately after:** CoP channel summary

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
:wheelchair: CoP Session Cancelled - [Date] :wheelchair:

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
:wheelchair: CoP Session Update - [Date] :wheelchair:

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
:wheelchair: Guest Speaker: [Name] on [Topic] :wheelchair:

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

---

**Document Owner:** Celeste Aronow (Accessibility Practice Lead)  
**Last Updated:** 2026-06-18  
**Next Review:** 2026-09 (quarterly)
