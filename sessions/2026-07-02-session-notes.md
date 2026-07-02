---
date: 2026-07-02
contacts:
  - Celeste Aronow
  - Kelsey Roy
  - Daisy Mølving
  - Shawn DeVries
  - Rani Zilpelwar
  - Claire Nguyen
calendar_link: https://calendar.google.com/calendar/event?eid=dGE2aDhmNHFtdXNzbGMyZzNqbDY2ZzgyNnVfMjAyNjA3MDJUMTUzMDAwWiA4dGhsaWdodC5jb21fbm83NXNoY2tkZjI2ZWgwMXB1czUyYWk4N2tAZw
transcript_link: https://docs.google.com/document/d/1B-jtHnNGzmNdXnvJ-p_ddg9nic24euO-441XiXPy_GA/edit?usp=drive_web&tab=t.jyifqa66oxbm
---

# 2026-07-02 — A11y CoP Working Session

### **Summary**

Team members debated accessibility tooling architecture and selected [Light Factory](https://github.com/8thlight/lightfactory) for integration via modular, human-verified review processes.

**Accessibility Tooling Philosophy**  
The group explored automated accessibility detection, emphasizing a separation between informational content in the playbook and executable tools. Balancing manual oversight with automated checks remained a critical requirement.

**Tooling Strategy Debate**  
Participants rejected forced, heavy accessibility integrations in favor of lightweight, modular solutions. Designing tools to surface issues for human validation prevents friction and encourages team learning.

**Development Strategy Decision**  
The team decided to focus development within the Light Factory repository for code review integration. This process will adhere to Web Content Accessibility Guidelines 2.2 while prioritizing modularity.

### **Decisions**

- **Accessibility playbook documentation location set** The accessibility playbook documentation will be hosted in the repository wiki to facilitate easier organization and referencing.

- **Accessibility review tooling strategy defined** The team will develop an accessibility review tool that identifies issues for human validation, prioritizing human oversight and designer intent over automated, blanket code changes.

- **Prioritize Light Factory for review agent** The team decided to prioritize development of the new code review agent within the Light Factory repository, rather than [Forge](https://github.com/8thlight/forge), to optimize the use of limited manpower and align with higher observed usage.

- **Code review agent requires local guidance** The team established that the code review agent will utilize local, explicit guidance for accessibility and security checks, intentionally avoiding reliance on external MCP plugins or unguided model inference.

### **Next steps**

- [x] \[Kelsey Roy\] Post Notes: Post meeting notes to the CoP repo early next week.

- [ ] \[Daisy Mølving\] Review PR: Evaluate the accessibility tooling pull request to distinguish between existing playbook content and new information.

- [ ] \[Daisy Mølving\] Link Playbook: Link the accessibility mapping directly to the playbook markdown file in GitHub.

- [ ] \[Celeste Aronow\] Submit Skill: Create a pull request on Light Factory for the custom review skill.

- [ ] \[Celeste Aronow\] Integrate Plugin: Incorporate the community access plugin into Light Factory to enable accessibility checks.

- [ ] \[Celeste Aronow\] Setup Light Factory: Install software locally and create a new branch.

- [ ] \[Celeste Aronow\] Implement Review Process: Add the code review agent with accessibility checks and optimized specialist modules to the repository. Reference source locations and dates for all copied code.

- [ ] \[Daisy Mølving\] Add Design Statements: Incorporate problem statements gathered from team brainstorms.

- [ ] \[Daisy Mølving\] Invite Contributors: Recruit interested individuals to join accessibility meetings and encourage them to submit personal accessibility problem statements.

- [ ] \[Celeste Aronow\] Issue Housekeeping: Clean up and organize existing problem statements to ensure they have complete documentation.

### **Details**

- **Meeting Logistics and Introductions**: Claire Nguyen confirms they have a client standup in 30 minutes, and the team welcomes Shawn DeVries to the meeting. Daisy Mølving and Celeste Aronow discuss visibility on the global calendar invite and Slack channel, with Celeste clarifying that joining the calendar invite does not cause a name to appear elsewhere.

- **Scribing and Transcription**: Kelsey Roy volunteers to act as the scribe for the meeting but mentions they may be slightly delayed in finalizing notes due to the upcoming long weekend. Celeste Aronow notes they will be out for a week starting after the meeting. Rani Zilpelwar suggests testing the "Granola" transcription tool alongside Gemini to compare performance, a proposal that Celeste supports.

- **Accessibility Tooling Proposal**: Kelsey Roy presents the issue of ["AI-enabled accessibility skill/tooling for automated issue detection"](https://github.com/8thlight/a11y-cop/issues/3), noting that they submitted a pull request that maps specific tooling to different types of disabilities and functional needs. Celeste Aronow suggests coordinating with Daisy Mølving to ensure this work does not duplicate the existing accessibility playbook.

- **Playbook and Documentation Strategy**: Celeste Aronow and Daisy Mølving discuss the best home for accessibility resources. Celeste suggests that the playbook should contain informational content, while the repository should house practical, executable tools. Daisy Mølving suggests linking the mapping directly to the playbook, and Celeste proposes exploring GitHub Wikis as a potential long-term home for the playbook.

- **Initial Concept for Accessibility Skills**: Kelsey Roy explains that the proposal grew from a desire to integrate accessibility checks into code review agents, aiming to lower the barrier for teams to include accessibility in their workflows. Kelsey emphasizes the value of having a human-in-the-loop to validate issues, while Celeste introduces the ["Community Access" repository](https://github.com/Community-Access/accessibility-agents) and the ["Everything Claude Code" accessibility skill](https://github.com/affaan-m/ECC/blob/main/skills/accessibility/SKILL.md) as potential reference points for this work.

- **Review of Existing Tools**: Celeste Aronow and Kelsey Roy review "Everything Claude Code," with Celeste noting that while it is lightweight, it lacks the necessary depth for proper accessibility guidance. Celeste also observes that the "Community Access" website currently displays significant contrast issues, while Claire Nguyen and Daisy Mølving discuss how light and dark mode settings might influence these perceptions.

- **Accessibility Lead Agent Analysis**: The team discusses the ["Accessibility Lead" agent](https://github.com/Community-Access/accessibility-agents/blob/main/.claude/agents/accessibility-lead.md) found in the "Community Access" repo, which performs deep, thorough reviews by invoking various sub-agents. While the tool is impressive, Celeste Aronow characterizes it as "weighty" and difficult to implement. Kelsey Roy suggests adapting it to allow users to choose the level of depth for their reviews.

- **Keyboard Navigation and Designer Intent**: Daisy Mølving asks if the agent can consider designer intent regarding tab order and color tokens. Kelsey Roy highlights the importance of honoring design wireframes and ensuring the agent does not inadvertently overwrite them. Celeste Aronow notes that checking keyboard navigation is a practical, effective method for identifying accessibility issues, though the current tooling primarily focuses on checking built pages rather than design files.

- **Installation and Usability Concerns**: Celeste Aronow shares a negative experience with the "Community Access" installation scripts, which attempted to force accessibility hooks into every build. Celeste warns that this approach is problematic for most clients who do not prioritize accessibility from the outset, preferring an on-demand review process over forced integration.

- **Defining the Official Recommendation**: Celeste Aronow initiates a discussion on establishing an official 8th Light recommendation for an accessibility agent solution. Daisy Mølving asks if it would be more effective to fold accessibility checks into an existing company-wide pull request review skill rather than creating a separate, standalone tool.

- **Integration into Existing Repositories**: The team discusses utilizing existing platforms like "Light Factory" and "Forge" to share accessibility skills. Celeste Aronow expresses an intent to refine a personal review skill and potentially share it on "Light Factory," noting the need to determine whether to create local versions of accessibility specialists or add a dependency check to current review processes.

- **Customizing a Lightweight Tool**: The team debates the balance between lightweight, high-level tools and heavy, thorough agents. Kelsey Roy supports the idea of hand-rolling a custom accessibility review step to keep it lightweight. Celeste Aronow suggests scoping a tool based on the four core principles of the Web Content Accessibility Guidelines (WCAG): perceivable, operable, understandable, and robust.

- **Scoping Functionality**: Celeste Aronow and Kelsey Roy discuss removing non-essential features from existing agents, such as email accessibility checkers or markdown scanners, to focus on practical application. They agree that a more modular tool, potentially incorporating configuration settings for the presence of an 8th Light designer, would be more beneficial.

- **Human-Centric Review Process**: Kelsey Roy and Daisy Mølving emphasize that the tool should function by surfacing issues for human validation rather than performing automatic, blanket changes. This approach allows for collaboration, such as discussing contrast issues with designers, and provides learning opportunities for the team. Celeste Aronow agrees, noting that this helps avoid friction in projects where designers may not be prioritizing accessibility.

- **Conclusion on Workflow Integration**: Celeste Aronow concludes by emphasizing the need for a practical approach that integrates seamlessly into the "common RPI" workflow used by 8th Light. The team remains focused on creating a solution that is usable for various clients while avoiding the over-automation risks identified in earlier experiments.

- **Forge and Light Factory Workflow Evaluation**: Celeste Aronow and Kelsey Roy discuss implementing a new skill in either Forge or Light Factory, noting that Forge requires familiarity with a custom codebase and would be labor-intensive. Both participants emphasize that they are limited in terms of manpower and must prioritize practicality.

- **Selection of Light Factory for Repository Focus**: Kelsey Roy suggests focusing development on Light Factory based on a recent poll in the AI Explorers Slack group, where at least four respondents indicated they are actively using Light Factory, while zero respondents indicated they are using Forge. Celeste Aronow agrees with this focus, noting that they will not be modifying Claude's Playwright, which five people reported using.

- **Incorporating Design Intent into Code Reviews**: Kelsey Roy proposes creating a code review skill in Light Factory that includes an accessibility step. Regarding the challenge of incorporating design intent, Daisy Mølving notes that Figma is an industry standard at their organization, but they are considering alternatives such as the developer acting as a conduit for design intent or exporting documentation like PDFs from various tools. Kelsey Roy suggests potentially passing prototypes into the review process as well.

- **Architecture of the Review Process**: Celeste Aronow argues that any additions to Light Factory should be self-contained and not depend on external Model Context Protocols (MCPs) unless necessary for retrieving intent. The proposed review process would begin by understanding requirements, which includes checking systems like Linear for tickets and potential links to Figma, without requiring specific setup expectations. Celeste Aronow outlines a multi-pass process involving shallow checks followed by specialized agents for security, database, and accessibility reviews.

- **Planning the Code Review Agent Pull Request**: Kelsey Roy suggests that the team collaborate on building the agent rather than Celeste Aronow working in isolation, noting that they can open a pull request (PR) to receive feedback from the community. The participants note that the repository's creator and previous maintainer is no longer with the team. Celeste Aronow commits to preparing a PR for Light Factory upon returning from a one-week break, copying and adapting existing thorough review processes to fit the team's needs.

- **Token Usage and Performance Concerns**: Celeste Aronow raises concerns about the token cost and performance of a thorough, all-encompassing review process, specifically regarding potential use in CI workflows. The participants discuss using existing frameworks, such as the [writing skills](https://github.com/obra/superpowers/blob/main/skills/writing-skills/SKILL.md) in the ["Superpowers" plugin library](https://github.com/obra/superpowers), to serve as a base and avoid unnecessary work.

- **Accessibility and Model Reliability**: Kelsey Roy and Celeste Aronow discuss utilizing existing skills, such as the ["requesting code review" skill](https://github.com/obra/superpowers/blob/main/skills/requesting-code-review/code-reviewer.md), as a foundation for their new agent. Celeste Aronow emphasizes that models cannot be trusted to perform accessibility checks without heavy, structured guidance, citing a study from late 2025 where models missed issues or invented them. The team agrees to implement a system that adheres to WCAG 2.2 guidelines, noting that these guidelines are expected to remain stable for several years.

- **Finalizing the Development Strategy**: Kelsey Roy shares a study on metrics for AI evaluation, which Celeste Aronow finds helpful for benchmarking. Celeste Aronow details the implementation plan: obtain local access to Light Factory, create a new branch, and integrate the paired-down review process. This process will include specialists for language and security, referencing original sources for copied code while minimizing dependencies on external plugins to ensure the review skill is accessible to anyone.

- **Future Design-Focused Problem Statements**: Daisy Mølving confirms they are gathering design-focused problem statements to add to the project, noting that these were developed during a recent team sync involving colleagues such as Chris Peak, Hugh Sato, Jon Wettersten, and Hani Kruger. Celeste Aronow encourages recruiting more participants to attend meetings and suggests that others contribute their own problem statements even if they cannot attend.

- **Closing and Team Logistics**: Celeste Aronow expresses gratitude for the team's contributions, specifically highlighting the efforts of Daisy Mølving, Kelsey Roy, Claire Nguyen, and Rachael Ludwick. The team concludes by noting that the next meeting will take place in two weeks, and Celeste Aronow plans to review the notes upon returning from a break to finalize the action plan.
