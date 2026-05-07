# Accessibility Community of Practice Charter

> **Draft for Review** (Please provide feedback by our first working session on Wednesday, May 13th, 2026)

This charter defines the Accessibility Community of Practice at 8th Light: how we operate, what problems we solve, and how we measure success.

---

## Problem Domain

The Accessibility Community of Practice exists to address three interconnected challenges facing 8th Light as we scale inclusive design across our distributed consultancy.

### Theme 1: Quality Brand vs Accessibility Reality

**Core Problem:** 8th Light sells quality, but accessibility is not integrated into our delivery standard.

1. **8th Light's brand promise is quality craftsmanship, yet accessibility (a fundamental quality dimension) has no systematic focus.** This creates a credibility gap with clients who expect quality to include inclusive design. The perception that "there's no money in accessibility" means engineers don't prioritize it, despite evidence that the purple pound represents $13 trillion globally and UK businesses lose £17 billion annually to inaccessible websites.

2. **Reactive remediation is 100× more expensive than proactive prevention.** Because accessibility is not built into our standard workflows, every project that later needs accessibility creates a massive remediation backlog. Fixing issues in production costs ~$2,500/issue vs. ~$25 in development, and legal remediation escalates to 1000× baseline cost. This destroys project margins and client trust.

3. **Our distributed workforce needs motivation, training, and time-efficient workflows. Not more individual responsibility.** Engineers across multiple projects lack: (a) a clear reason to care beyond compliance, (b) role-specific training that fits billable constraints, and (c) systematic workflows that make accessibility easy rather than a time sink. When accessibility depends on individual heroes, it fails under deadline pressure.

### Theme 2: AI Governance + Standard Workflow Integration

**Core Problem:** AI-powered delivery workflows lack accessibility governance and validation checkpoints.

1. **8th Light's AI workflows (RPI: research, plan, implement) need a built-in accessibility review step, but one doesn't exist.** Without a governance checkpoint after implementation, AI-generated code ships with accessibility violations that automated testing alone cannot catch. We need a standard review step that validates both AI-generated and human-written code against WCAG 2.2 AA before client delivery.

2. **AI tools are powerful but not self-governing; they require human oversight and structured prompts.** Coinbase's experience shows that even mature AI workflows (1,541 automated flags) achieve only 20% resolution rates without human expertise. 8th Light needs governance frameworks that define: when to use AI review vs. human AT testing, how to validate AI suggestions, and how to integrate findings into delivery workflows.

3. **Governance means defining what gets automated, what requires human judgment, and who is accountable.** AI can catch 30-50% of WCAG violations via CI/CD automation, but cannot replace screen reader walkthroughs or user testing. 8th Light must establish clear boundaries: automated checks for regressions, human AT testing for new features, specialist review for complex patterns.

### Theme 3: Distributed Workforce Enablement

**Core Problem:** Knowledge is concentrated in specialists; capability must scale across teams.

1. **60-80% of accessibility work falls to a single specialist, creating an unsustainable bottleneck.** The EnGen engagement showed this pattern clearly: when only one person carries the expertise, the practice cannot scale across 8th Light's distributed teams. Engineers, designers, QA, and PMs all need baseline capability so specialists can focus on complex problems, not basic implementation.

2. **Training investment has proven ROI: ~40 hours upfront reduces specialist dependence by 50-75% after 6 months.** But training alone isn't enough. Teams need role-specific workflows, templates, and tooling. Designers need WCAG guidance for design decisions. Engineers need acceptance criteria templates. QA needs screen reader testing protocols. All must integrate into existing delivery processes, not create new overhead.

3. **Billable time constraints make ad-hoc learning impossible. Workflows must be efficient by design.** When engineers have OKRs to learn accessibility but "don't have bandwidth" due to deadlines, and PR review rigor erodes under time pressure, accessibility fails. Unless accessibility workflows are as efficient as current practices (or more so via automation), they will be deprioritized every time.

---

## Scope Boundaries

To maintain focus, this CoP defines clear boundaries around what problems we solve versus what falls outside our domain.

### In-Scope Accessibility Concerns

| Concern | Description |
|---------|-------------|
| **Technical Conformance** | Interpretation and implementation of WCAG 2.2 AA standards |
| **Inclusive Design** | Proactive consideration of diverse user personas (visual, cognitive, motor, auditory impairments) |
| **Tooling and Automation** | Selection, configuration, and maintenance of accessibility testing tools (axe-core, Playwright, LLM review agents) |
| **Capacity Building** | Internal training, structured mentorship, and resource creation (templates, runbooks, decision records) |
| **Workflow Integration** | Embedding accessibility into RPI workflows, CI/CD pipelines, and quality gates |
| **AI Governance** | Defining when AI review is appropriate, how to validate AI suggestions, and accountability frameworks |

### Out-of-Scope Concerns

| Concern | Why Out of Scope |
|---------|------------------|
| **General UI/UX** | Design decisions that do not specifically impact users with disabilities fall under general product design |
| **Legal Liability** | Final legal determination of compliance rests with firm legal counsel or client legal teams, not the CoP |
| **Sales and Marketing** | General promotion of 8th Light's services, unless technically specific to accessibility capabilities |
| **Individual Project Support** | Doing the actual accessibility work for a project team, unless it is a "teaching moment" or pairing session |
| **Client Budget Decisions** | Whether a client chooses to fund accessibility work is a sales/account management decision, not a CoP decision |

---

## Vision & Success Criteria

### Vision Statement

The Accessibility Community of Practice exists to **mainstream accessibility as a default quality metric at 8th Light, not an optional add-on.** We build the capability, workflows, and governance that make accessible software the natural outcome of our delivery process, not a heroic effort by specialists.

### Year 1 SMART Objectives

1. **Create 6 reusable artifacts by December 2026** (CI/CD templates, acceptance criteria templates, testing protocols, design checklists, decision records, role-specific guides) that reduce time-to-implement accessibility by 40%

2. **Reduce specialist bottleneck from 60-80% to 20-30%** by establishing distributed capability across engineers, designers, and QA through training and workflow integration

3. **Integrate accessibility review checkpoint into RPI workflow** with clear governance: automated checks catch regressions, human AT testing validates new features, specialist review handles complex patterns

### Long-Term Success Indicators (18-24 months)

- Accessibility regressions drop by 50% on projects using CoP artifacts
- 70%+ of 8th Light teams have at least one member with baseline accessibility capability
- Clients recognize 8th Light accessibility quality as a competitive differentiator
- 8th Light publishes thought leadership (blog posts, conference talks) on accessibility + AI workflows

---

## Operating Model

### When and Where We Meet

- **Cadence:** Biweekly, 90 minutes
- **Format:** Working sessions, not presentations (see session structure below)
- **Location:** #a11y-community-of-practice (Slack) + Google Meet
- **Time Tracking:** Log time in Metric under the "8th Light Internal" project, using the "A11y Community of Practice" task. This distinguishes strategic accessibility R&D from general administrative overhead and provides visibility into CoP investment.
- **Protected Time:** CoP sessions scheduled during dedicated professional development time when possible to minimize billable disruption

### Session Structure (90 minutes)

- **First 10 minutes:** Quick wins, announcements, charter check-ins
- **Next 50 minutes:** Solve 1-2 concrete problems brought by members (collaborative working session)
- **Last 30 minutes:** Document decisions, create/update artifacts, assign follow-up actions, schedule next session

### Problem Submission Process

**When to Submit:** Problems can be submitted at any time, not just before sessions. Early submission allows for better planning and collaborative refinement.

**Where to Submit:**
1. **GitHub Issues (preferred):** Open an issue in the [A11y CoP repository](https://github.com/8thlight/a11y-cop) using the problem submission template
2. **Slack Channel:** Post in #a11y-community-of-practice if you prefer async discussion or don't have GitHub access

**Problem Template:**
- **Context:** What project/situation triggered this problem?
- **What I've tried:** Approaches attempted and why they didn't work
- **Help needed:** Specific guidance, decisions, or expertise required
- **Desired outcome:** What does "solved" look like?

**Triage Process:**
- Problems submitted via Slack will be converted to GitHub issues by the Accessibility Practice Lead or any CoP member with capacity
- GitHub issues are labeled by type (technical, governance, workflow, buy-in) and priority
- CoP facilitators select 1-2 problems per session based on urgency, member votes, and learning value
- Unselected problems remain in the backlog for future sessions or async resolution

### Time Tracking and Billable Hour Integration

**Time tracking visibility:**
- CoP participation is tracked in Metric under the "8th Light Internal" project, using the "A11y Community of Practice" task, to distinguish strategic R&D investment from admin overhead
- Managers can identify consultants with capacity during bench time (between client engagements) and direct them to CoP backlog items

**Bench-time management:**
- Consultants between projects are directed to CoP artifact creation work, turning idle time into valuable organizational assets

**Future program integration:**
- If 8th Light reinstates a formal apprenticeship program, the CoP will ensure accessibility is included in graduation criteria and provide structured learning paths for new practitioners
- CoP provides accessibility-focused "Code Katas" and "Breakable Toys" for skill development at all levels
- Mentors use CoP artifacts as teaching content, dual-purposing non-billable training time

### Company-Wide Meeting Integration

The CoP integrates with existing 8th Light meetings to share learnings, gather feedback, and recruit new members:

**Town Hall (Company-Wide)**
- **Cadence:** Once per year (typically Q2 or Q3)
- **Format:** 10-15 minute CoP update + open invitation
- **Content:** Share success metrics, highlight 2-3 top artifacts, client impact stories, celebrate member achievements
- **Goal:** Raise accessibility awareness across all practices, recruit interested participants

**Practice Meetings (3 practices)**
- **Cadence:** Once per year per practice (Enterprise, European Engagements, Emerging Solutions)
- **Format:** 20-30 minute deep dive on practice-relevant artifacts
- **Content:** Tailored to each practice's common tech stacks and client needs (e.g., enterprise compliance for Enterprise Practice, WCAG + multilingual for European)
- **Goal:** Embed CoP resources into practice workflows, gather practice-specific accessibility challenges

**Vibe to Value: AI in the Open**
- **Cadence:** Ad-hoc, as relevant topics emerge
- **Format:** Informal drop-in, share accessibility + AI governance learnings
- **Content:** AI-assisted WCAG review workflows, LLM prompt patterns for accessibility, Coinbase learnings, governance frameworks
- **Goal:** Position accessibility as a model case for responsible AI integration

**Integration Ownership:** Accessibility Practice Lead (Celeste) coordinates with meeting organizers and identifies appropriate session timing. CoP members volunteer to present based on expertise and availability.

---

## Governance and Roles

### Decision-Making

**Problem selection:** Core team proposes problems based on submissions; group votes in Slack (simple majority)

**Artifact approval:** All artifacts reviewed by at least 2 CoP members before publishing to team

**Charter amendments:** Any member can propose changes; requires 2/3 vote to amend

### Stakeholder Interaction

**Executive Sponsor interaction:**
- Monthly update to Shawn DeVries (progress, blockers, resource needs)
- Quarterly update to leadership team (impact metrics, success stories)

**Client manager interaction:**
- CoP artifacts available for client delivery (templates, guides, decision records)
- CoP members can be matched to client projects needing accessibility expertise

### Roles and Responsibilities

**Facilitator** (Celeste Aronow, Year 1; rotates annually after)
- Set session agendas based on problem submissions
- Timebox discussions, park tangents, keep sessions productive
- Maintain charter and artifact library
- Coordinate with Executive Sponsor

**Executive Sponsor** (Shawn DeVries)
- Advocate for CoP at leadership level
- Protect time for participation (prevent billable pressure from killing CoP)
- Provide resources (Metric access, budget for tools if needed)
- Reinforce decisions made by CoP across 8th Light

**Scribe** (rotates per session)
- Starts Gemini Live transcription at session start
- After session, processes Gemini's AI-generated transcript and summary into actionable format:
  - Extract key decisions made
  - Identify action items with owners and due dates
  - Document new artifacts created or updated
  - Capture unresolved questions or parking lot items
- Posts cleaned session summary to #a11y-community-of-practice within 48 hours
- Updates GitHub issues based on decisions (close resolved problems, update in-progress items)
- Commits any artifacts created during the session to the A11y CoP repository

**Time commitment:** ~30 minutes post-session cleanup (included in "The Give")

**Core Members** (5-8 active participants)
- Attend biweekly sessions (target: 70%+ attendance)
- Bring real problems from client work
- Contribute to artifact creation (1-2 hours between sessions)
- Use and validate CoP artifacts on their projects

**Occasional Contributors** (anyone at 8th Light)
- Submit problems via template
- Use artifacts created by CoP
- Provide feedback on artifact effectiveness

### "The Give" and "The Get"

**What members commit (The Give):**
- 90 minutes biweekly for working sessions
- 1-2 hours between sessions for artifact creation or problem prep
- Bringing real client problems, not hypotheticals
- Using CoP artifacts and reporting back on effectiveness

**What members receive (The Get):**
- Skill development in a high-demand specialty (accessibility)
- Reusable artifacts that reduce time-to-implement on future projects
- Peer support for solving complex accessibility challenges
- Career growth through thought leadership and specialized expertise
- Recognition for contributions (artifact usage tracked and celebrated)

---

## Success Metrics

We measure CoP effectiveness across three dimensions: engagement, effectiveness, and ecosystem impact.

### Engagement (Are people participating?)

**Target metrics:**
- **Attendance rate:** 70%+ for core members
- **Problem submissions:** 1-2 problems submitted per session (indicates members bringing real work)
- **Slack activity:** 10+ posts/month in #a11y-community-of-practice (indicates active discussion)

**Red flags requiring intervention:**
- Attendance below 60% for 3 consecutive sessions
- No problems submitted for 2 sessions in a row

### Effectiveness (Are we solving real problems?)

**Target metrics:**
- **Artifacts created:** 2 per quarter (target: 6+ by end of Year 1)
- **Artifact usage:** Each artifact used 3+ times within 6 months of creation
- **Decision durability:** CoP guidelines retained across 3+ subsequent projects (tracked via post-project debriefs)
- **Specialist bottleneck reduction:** From 60-80% to 20-30% by end of Year 1

**Red flags requiring intervention:**
- No artifacts created in past month
- Artifacts not being used (< 2 uses within 3 months of creation)
- Decisions getting overridden outside CoP without discussion

### Ecosystem Impact (Are we changing 8th Light?)

**Target metrics:**
- **Accessibility regressions:** 50% reduction on projects using CoP artifacts (baseline in Q1, measure Q2-Q4)
- **Client recognition:** Positive feedback on accessibility quality in client surveys or retro conversations
- **Capability distribution:** 70%+ of 8th Light teams have at least one member with baseline accessibility capability (track via surveys)
- **Thought leadership:** 2+ blog posts, conference talks, or open-source contributions by end of Year 1
- **CoP content shared at Town Hall (1x/year) and all 3 Practice meetings (3x/year minimum)**
- **Public-facing content:** Blog posts, conference talks, case studies, or open-source contributions produced from CoP work and shared with company and broader accessibility community

**How we measure:**
- Quarterly surveys: "Have you used a CoP artifact? Was it helpful? What's missing?"
- Post-project debriefs: "Were CoP guidelines followed? Did accessibility regressions occur?"
- Bug tracking: Track accessibility defects by severity and project over time
- Client surveys: Include question about accessibility quality in standard retro templates

---

## Risk-Free Environment

**This CoP is a judgment-free space.** Members can admit knowledge gaps without penalty. We solve problems together, not alone. If you don't know the answer, that's the starting point for learning, not a failure.

**Blameless problem-solving:** When we discuss accessibility failures, we focus on process and system gaps, not individual mistakes. The goal is to prevent recurrence, not assign fault.

**Celebrate learning from failure:** The best CoP artifacts often come from "I tried X and it failed badly, here's what I learned." Failed experiments that produce insights are more valuable than untested theories.

---

## Alignment with 8th Light Values

The Accessibility Community of Practice embodies 8th Light's core values:

**Quality that we are proud of:** The CoP tackles accessibility as a quality dimension, not a compliance checkbox. We solve real problems, deliver highly valued artifacts, and take pride in work that makes software genuinely usable for people with disabilities. Quality is achieved through iteration and proven best practices, exactly what the CoP's working session model provides.

**Continuous Education that fuels individual & company growth:** The CoP is fueled by curiosity and instrumental to quality. By converting our accessibility experience into learning for others, we create a continuous education engine. Members take professional risks (admitting knowledge gaps), give and receive feedback (peer review of artifacts), and fund learning pursuits that yield tangible results (artifacts used on real projects).

**Curiosity that drives improvement and innovation:** We listen more than we talk and ask questions to understand the accessibility challenges facing real users. We approach each problem with a willingness to change our minds based on evidence. We take the time to learn about our client's accessibility challenges and business context, acknowledging that the scope of our own expertise is limited.

**Honesty that builds trust:** The CoP creates a safe space for kind candor. We trust members with honest feedback about what's working and what isn't. We provide clients with thoughtful accessibility recommendations grounded in evidence, not dogma. We are trustworthy listeners and do not meet honesty with cynicism.

**A focus on Outcomes:** We aim for distinguished accessibility success. We know what our goals are (6 artifacts, 70%+ capability distribution, 50% regression reduction), find a way to achieve them (working sessions, not presentations), and celebrate the achievements of others. We describe the impact of our work through measurable outcomes, not effort expended.

By aligning our CoP operations with these values, we ensure accessibility work strengthens 8th Light's culture and identity rather than existing as a separate initiative.

---

## Charter Approval and Amendments

**Approval:** This charter will be approved during the first 10 minutes of Session 1 (May 13, 2026). Any member can propose changes before approval.

**Amendments:** After initial approval, any member can propose amendments by posting to #a11y-community-of-practice. Amendments require 2/3 vote to pass.

**Review cadence:** The charter will be reviewed every 6 months to ensure it remains relevant as the CoP matures.

---

## Practice Resources

The [8th Light Accessibility Playbook](https://docs.google.com/document/d/1C6tqFimw2Un8wvn7pxmJ_4lUoc03NvhEBUHdyEb-yFw/edit) serves as the comprehensive reference for accessibility practice at 8th Light. It contains business case material, WCAG guidance, legal context, role-specific frameworks, and curated tool lists.

CoP artifacts created during working sessions will be maintained in the [a11y-cop GitHub repository](https://github.com/8thlight/a11y-cop). These are the templates, runbooks, and decision records we create together to solve concrete problems on our projects.

---


**Questions or feedback?** Post in #a11y-community-of-practice or reach out to Celeste Aronow (facilitator) or Shawn DeVries (executive sponsor).
