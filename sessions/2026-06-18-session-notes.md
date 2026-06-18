---
date: 2026-06-18
contacts:
  - Tim Door
  - Celeste Aronow
  - Kelsey Roy
  - Claire Nguyen
  - Rachael Ludwick
calendar_link: https://calendar.google.com/calendar/event?eid=dGE2aDhmNHFtdXNzbGMyZzNqbDY2ZzgyNnVfMjAyNjA2MThUMTUzMDAwWiA4dGhsaWdodC5jb21fbm83NXNoY2tkZjI2ZWgwMXB1czUyYWk4N2tAZw)
transcript_link: https://docs.google.com/document/d/16hDINQO2NsAYljzMxFj4CW_AGkLi8i3B5oBk-7ACZaY/edit?usp=drive_web&tab=t.3obxvkrksfpl
---
June 18, 2025

## A11y CoP Working Session

### Summary

The team discussed establishing a centralized accessibility knowledge hub and strategies to better engage crafters and others towards education on accessibility.

**Accessibility Improvement Strategies**  
The team discussed how automated tooling can help but quickly moved onto how to move beyond automated testing towards manual verification using simulation tooling and directly using assistive technology (e.g. screenm readers). Automated tooling can provide a solid baseline but robust accessibility practice should include manual approaches to build empathy and understanding.

**Education and Testing Tactics**  
The team discussed a variety of practical testing methods like using a screen reader, keyboard navigation or performance throttling to detect possible accessibility issues. Developers are encouraged to prioritize these manual verification processes alongside standard tooling.

**Education & Engagement**  
The group decided to establish a dedicated, centralized resource home base in the a11y cop channel to provide accessibility guides and resources. The team discussed various ways to encourage more engagement using workshops, presentations at wider meetings, and regular reminders in shared company channels.

### Decisions

* **Screen reader testing standard adoption** The team agreed developers and others should do screen reader testing as a core method for building empathy and discovering accessibility issues that screen readers uncover including for users that do not use screen readers.

* **Accessibility training session venue** The team will conduct accessibility training sessions during practice meetings to refine the process before potential wider implementation.

* **Flexible meeting attendance policy adopted** The team adopts a communication strategy for Community of Practice meetings, informing attendees that they are not required to be present for the full 90-minute duration.

* **Communication plan** The team will create a communication plan to be included in the repository, ensuring standardized outreach via water cooler and town hall channels.

* **Live session postponed pending content** The team decides to postpone scheduling the live accessibility tools exploration session until the resource list of tools and disabilities is finalized and merged.

### Next steps

- [ ] \[Celeste Aronow\] Send Meeting Notes: Check if the AI generated notes are attached to the calendar entry and distribute them if missing.

- [ ] \[The group\] Create Accessibility Checklist: Compile a list of accessibility tools and utilities to assist with manual development review and testing.

- [ ] \[Tim Dorr\] Evaluate Cypress Accessibility Tools: Investigate and verify available accessibility features in the open-source version of Cypress versus the paid cloud solution.

- [ ] \[Celeste Aronow\] Draft communication plan: Create a formal strategy for publicizing working sessions and training events. Submit a pull request to the repository and invite the team for review.

- [ ] \[Celeste Aronow\] Review plan: Present the finalized communications document to Shawn for executive input and feedback.

- [ ] \[Kelsey Roy\] Build accessibility resource: Compile a list of tools for identifying accessibility issues and map them to specific disability categories. Open a pull request in the repository to crowdsource additional resources from the team.

- [ ] \[Rachael Ludwick\] Finalize notes: Complete the meeting summary and upload it to the shared drive.

- [ ] \[The group\] Submit problem statements: Contribute accessibility issues or topics for training sessions by submitting pull requests or messaging the Slack channel.

### Details

* **Meeting Commencement and Logistics**: The meeting began with discussions regarding scheduling difficulties and the late arrival of some participants. Attendees noted that the current meeting time was selected as the best possible option, and they acknowledged that participants may have forgotten the session despite it being on the calendar.

* **Scribe Role and Documentation Tools**: Celeste Aronow requested a volunteer for the scribe role. The group discussed utilizing artificial intelligence tools like Gemini or Cloud AI for note-taking, though they noted limitations regarding external accessibility, the size of meeting transcripts, and internal company policies on installing software. Claire Nguyen clarified that the current documentation process involves basic text replacement and does not require complex installations.

* **Accessibility Problem Statement**: Celeste Aronow introduced the problem statement submitted by Kelsey Roy, which focuses on identifying ways to improve the team's ability to spot accessibility issues and provide education for the broader community of practice. The group aims to create a plan to uplift accessibility standards and gather resources for individual upskilling.

* **Tooling and Testing Libraries**: Rachael Ludwick emphasized the importance of using testing libraries, such as those used in front-end development, which encourage developers to select elements by role rather than using workarounds. This practice is cited as a baseline for better accessibility.

* **Limitations of Automated Testing**: The group discussed the use of large language models and automated testing tools, such as the Cypress accessibility plugin which utilizes Axe Core. Rachael Ludwick and Tim Dorr noted that while these tools provide value, they can be contextually unaware, and there is a debate regarding the cost and utility of cloud-based accessibility solutions versus standard npm packages.

* **Importance of Manual Screen Reader Testing**: Celeste Aronow and Kelsey Roy argued that relying solely on automated theory is insufficient. They suggested that developers gain a visceral, intuitive understanding of accessibility issues by manually navigating applications with a screen reader, a method Kelsey Roy found particularly insightful after observing the poor accessibility of the Libby app.

* **Broadening the Scope of Accessibility**: Rachael Ludwick pointed out that accessibility needs extend far beyond screen readers to include users with vision impairments who rely on zoom, color contrast, or keyboard-only navigation, as well as users with motor control issues. The group discussed the risk of focusing exclusively on screen reader compatibility while neglecting other critical accessibility standards.

* **Empathy Tools and Simulators**: The participants shared positive feedback regarding web accessibility simulators, such as those found on the Google Chrome plugin [Web Disability Simulator](https://chromewebstore.google.com/detail/web-disability-simulator/olioanlbgbpmdlgjnnampnnlohigkjla) or [Disabilities Simulator](https://disabilities-simulator.vercel.app/resources), which can simulate color blindness, cognitive load (like ADHD), or motor issues. These tools were highlighted as effective ways to build developer empathy.

* **Challenges with Automated Testing Limitations**: Celeste Aronow and Kelsey Roy noted that while automated testing is improving, it cannot catch all accessibility issues. They agreed that while some items like color contrast are easily automated, many others require manual verification.

* **Education Strategy Through Tooling**: The participants discussed that rather than relying solely on quick fixes, they should encourage team members to engage with documentation and learn the standard roles. Rachael Ludwick suggested that utilizing development tools to prompt these learnings serves as an ongoing education strategy.

* **Business Context and User Base Awareness**: Rachael Ludwick noted that team members should be aware of their specific user base to justify accessibility priorities, particularly when faced with budget and time constraints. Understanding the user demographic helps in advocating for accessibility features, such as larger fonts or higher contrast, which benefit a wide range of users.

* **Practical Accessibility Quick Wins**: The group identified simple, immediate actions to improve accessibility, such as verifying that a page is navigable via keyboard-only input. Celeste Aronow and Rachael Ludwick confirmed that they frequently find bugs in their own software by testing tabbing sequences.

* **Raising Awareness with Statistics**: Claire Nguyen proposed that sharing statistics regarding the prevalence of different disabilities could help team members better understand their user base and prioritize accessibility work beyond their personal experiences.

* **Performance Testing as Accessibility**: Rachael Ludwick and Tim Dorr discussed using browser developer tools to throttle CPU and network speeds. They explained that slow, laggy applications present significant accessibility barriers for users on older hardware or poor network connections, mirroring experiences of users with certain disabilities.

* **Responsive Design and Zoom**: Celeste Aronow and Rachael Ludwick discussed the importance of zooming into pages (up to 200 percent) to test for layout breakage. They noted that unexpected responsiveness issues are common, even in large platforms like Google, and serve as an important manual testing step.

* **Knowledge Sharing and Repository Planning**: The group discussed the need for centralized resources, potentially reviving a [learning trail](https://github.com/8thlight/learning-trails) repository to store accessibility guides. Kelsey Roy suggested that this could serve as a hub for beginner, intermediate, and advanced accessibility content.

* **Training and Live Demo Proposals**: Celeste Aronow proposed hosting live training sessions where the team demonstrates accessibility testing by screen sharing their use of screen readers, tab navigation, and contrast filters. The group agreed this would be an impactful way to give others a visceral experience of accessibility barriers, though they debated whether town hall meetings or smaller practice sessions were the appropriate venue.

* **Logistics and Participation Strategies**: The group addressed challenges in getting attendance at practice meetings. Claire Nguyen and Celeste Aronow agreed that direct calendar invitations and ensuring meetings are on the global calendar would improve participation.

* **Gamification and Resource Hub**: Rachael Ludwick and Celeste Aronow explored using gamification, such as leaderboards, to encourage developers to complete accessibility tasks like manual testing exercises. They concluded that creating a dedicated, centralized resource "home base" in the team's Slack channel would be the most effective way to provide ongoing support and information to the organization.

* **Leaderboard and Reward System**: Celeste Aronow expresses concern regarding the [current leaderboard Slack integration](https://8thlight.slack.com/marketplace/A7PM5AZ33-leaderboard), describing it as overly focused on person-versus-person competition. To shift this dynamic, Celeste suggests implementing a reward system. Celeste plans to compile a list of actionable items that can be treated as "easy wins" to improve the system.

* **Accessibility Mapping and Educational Strategy**: Celeste Aronow proposes developing a mapping mechanism to connect specific accessibility issues with the disabilities they affect. The strategy involves creating a repository of examples showcasing both high-quality and poor implementations to help team members visualize these concepts. Celeste offers to lead a training session to share this information and invites others to participate.

* **Training Session Format**: Celeste Aronow suggests that the training should begin as an opt-in, time-boxed exploration session to encourage engagement. Feedback and findings from these initial sessions will be used to create a condensed presentation version suitable for inclusion in regular practice meetings, ensuring the information reaches a wider audience who might otherwise miss it.

* **Addressing Engagement Barriers**: The team discusses the difficulty of securing attendance, with Claire Nguyen noting that the 1.5-hour meeting duration is a deterrent for staff who are already heavily scheduled. Celeste Aronow and Claire Nguyen agree that future communications should emphasize that attendees are not required to commit to the full duration and are welcome to join for only partial segments of the meeting.

* **Communication Strategy and Reminders**: To improve meeting attendance, Claire Nguyen and Kelsey Roy suggest using 24-hour Slack reminders. Celeste Aronow agrees to coordinate these, noting that communications for work sessions should be posted in the Water Cooler channel. The team discusses the logistics of these reminders, deciding that a notification sent the day before the meeting is more effective than a same-day reminder, and Celeste will instruct participants to turn on notifications for specific threads to stay informed.

* **Developing a Communication Plan**: Celeste Aronow identifies a need for a discrete, written communication plan to support the initiative. Kelsey Roy notes that encouraging team members to request invites directly is an effective way to drive engagement. Celeste commits to drafting this plan as a pull request for the team to review and provide input on before the next meeting.

* **Driving Participation and Problem Submission**: Claire Nguyen recommends using brief, one-line reminders in Slack to increase visibility. Celeste Aronow encourages team members to submit problem statements to the repository, noting that this is an effective way to contribute even if one cannot attend a meeting. Rachael Ludwick suggests using the Water Cooler channel to explicitly invite the team to submit accessibility questions as pull requests.

* **Meeting Scheduling and Executive Sponsorship**: Celeste Aronow clarifies that the current meeting time was specifically selected to accommodate the executive sponsor, Shawn, whose presence is prioritized. While Shawn was unable to attend this specific session due to a conflict, the team expects their presence in future meetings.

* **Tooling Resources and Accessibility List**: Kelsey Roy offers to compile a list of tools and the disabilities they help assess, intending to crowdsource additional details from the team. Celeste Aronow agrees that this list should be finalized before scheduling a live exploration session. The group plans to utilize shared resources, such as the accessibility simulator hosted on Vercel, to aid in these assessments.

* **Administration and Scribing**: Rachael Ludwick is designated as the scribe and will follow established instructions to manage meeting notes. Celeste Aronow summarizes the remaining assignments: Kelsey Roy will develop the tool and disability list, and Celeste will formalize the communication plan. The team concludes that scheduling a live exploration session will occur only after the initial resource list is complete and merged.

