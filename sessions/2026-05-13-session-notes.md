---
date: 2026-05-13
contacts:
  - Celeste Aronow
  - Chris Peak
  - Claire Nguyen
  - Kelsey Roy
  - Rachael Ludwick
  - Tim Dorr
calendar_link: https://calendar.google.com/calendar/event?eid=NWw0M3VlYmQxamlucjU4cXNxNGFhMzBiN3RfMjAyNjA1MTNUMTQzMDAwWiBjYXJvbm93QDh0aGxpZ2h0LmNvbQ
transcript_link: https://docs.google.com/document/d/1_h6LIYC4mYeULUvAtxE_YTefUkuMncutdFrCC1AGgRI/edit?usp=drive_web&tab=t.dhw1uywqickr
---

# 📝 Notes

May 13, 2026

## A11y CoP Working Session

### Summary

The accessibility community of practice working session established charter goals and prioritized CI/CD automation artifact development.

**Charter and Goals Established**  
The group approved a charter focusing on accessibility integration, AI governance, and distributed workforce enablement. This document serves as a living foundation for future project quality measurements.

**CI/CD Automation Strategy**  
Members decided to utilize existing engine project scripts as a baseline to develop standardized CI/CD accessibility testing artifacts. This effort aims to simplify automated checks within current workflows.

**Future Workflow Improvements**  
The team aligned on creating repository folders for iterative artifact development and future training modules for accessibility identification skills. Participants will submit real-life problem examples for upcoming sessions.

### Next steps

- [ ] \[Claire Nguyen\] Perform Scribe Role: Review meeting transcript, replacing commonly misheard words. Identify all action items from the final transcript.

- [ ] \[Rachael Ludwick\] Investigate Axe Core: Run Axe code locally within the project repo to test the internal web component framework. Share all findings regarding tooling and implementation with the COP channel.

- [ ] \[Tim Dorr\] Integrate AI Plugin: Update Engine CI/CD script to incorporate the Community Access plugin into the AI code review process. Share the working artifact on the Community of Practice repo.

- [ ] \[Tim Dorr\] Get CI/CD Artifact: Acquire the CI/CD workflow artifact. Ensure documentation includes community access.

- [ ] \[Tim Dorr\] Discuss Community Access: Talk to the team about incorporating community access into the CI/CD workflow.

- [ ] \[Kelsey Roy\] Share Skills Repo: Share the link to the personal repository detailing accessibility skills used locally.

- [ ] \[Kelsey Roy\] Create Claude Skill Issue: Create a problem ticket detailing requirements for a robust accessibility checker skill built into Claude.

- [ ] \[Kelsey Roy\] Create Training Issue: Add an issue to the repo detailing the problem of improving personal ability to spot and capture accessibility issues.

- [ ] \[The group\] Submit Client Problems: Look for real-life accessibility issues found on current client work. Submit identified problems to the repo or Slack channel.

- [ ] \[Celeste Aronow\] Modify Issue Template: Adjust the existing issue submission template slightly within the repo.

- [ ] \[Celeste Aronow\] Send COP Reminder: Send a reminder ping to the channel on Monday before the Community of Practice meeting. Include the current agenda or request for contributions.

- [ ] \[Celeste Aronow\] Create Artifact Folder: Create a designated folder in the repository. Use this folder to hold artifacts that are not yet ready for general sharing.

### Details

* **Meeting Session Structure and Contribution**: Celeste Aronow outlined that these 90-minute sessions are working sessions intended for involved members of the accessibility community of practice to contribute to solving real-life problems encountered on their projects. The goal is for every meeting to produce an artifact, whether built during the session or assigned as a task to a volunteer for production, which will then be shared with the community of practice. They emphasized that "no stupid questions" and "I don't know" are valid answers, fostering an environment free of judgment.

* **Facilitation and Scribe Roles**: Celeste Aronow, the facilitator, plans to lead the meetings for the first year, after which a new volunteer will ideally take over. Because the meeting is being transcribed and notes are taken by Gemini, the volunteer scribe role involves reviewing the transcript post-meeting to correct misheard words and identify any assignments or commitments. Claire Nguyen volunteered to act as the scribe for the current session.

* **Charter Review and Approval**: Celeste Aronow presented the draft charter, which focuses on three themes: quality brand versus accessibility reality, AI governance, and standard workflow integration and distributed workforce enablement. They stated that the goal is to integrate accessibility as a default quality measurement in all aflight projects. Celeste Aronow proposed establishing the charter as approved, acknowledging that it would be a "living document" subject to future adjustments unless immediate blockers were raised.

* **Discussion on Accessibility Measurement**: Rachael Ludwick raised concerns about setting measurable objectives in the charter, noting that accessibility has not been a focus on their current projects and that necessary metrics (like specialist bottleneck or regression measurements) and baseline automation are not universally in place. Tim Dorr suggested that the charter's goals align with making accessibility first automatable and then measurable, comparing it to establishing design or product management as core pillars of the aflight package offered to clients.

* **Measurement of Accessibility and Standard Pillars**: Celeste Aronow agreed that accessibility measurement is multifaceted, requiring both automated checks and human audits using accessibility technology, such as screen readers. They indicated their work is focused on having accessibility baked into all three of the existing standard pillars (development, design, product), with the potential for an optional fourth pillar for clients seeking greater focus on accessibility.

* **Town Hall Framing for Community of Practice**: Celeste Aronow plans to present at a town hall to invite more people to the community of practice, encouraging them to get involved or submit problems. Key framing points for this presentation include presenting the group as a working group solving real client problems while building reusable artifacts, focusing on the domains of quality brand alignment, AI governance, and distributed workforce enablement. The goal is to reduce the "specialist bottleneck" so that most accessibility work can be done by any engineer with access to documentation.

* **Introducing the Problem: CI/CD Automation Artifacts**: Celeste Aronow introduced the first problem: developing artifacts for setting up continuous integration/continuous deployment (CI/CD) to simplify the inclusion of accessibility checks. The problem is framed around the Daimo phase two engagement, where accessibility is hoped to be a priority. Existing tools, such as axe-core in CI (which is prone to being disabled if always failing), Lighthouse CI (which lacks specific problem guidance), and the Community Access plugin (which is complex to set up due to hook configurations), were cited as needing better guidance and standardized configuration.

* **Leveraging Engine's Existing CI/CD Setup**: Celeste Aronow suggested using the CI setup currently running on the engine project as a starting point, even if it is imperfectly configured, because having a working workflow is better than starting from scratch. Tim Dorr confirmed the engine setup is boilerplate, using Playwright and axe-core to assert no violations on a list of pages. Celeste Aronow then asked Tim Dorr to share a version of the engine CI script, stripped of client-specific details, so that the group could figure out how to incorporate an accessibility plugin into the existing Claude code review workflow, acknowledging the concern about the agent being token-heavy.

* **Discussion on AI Code Review Limitations**: Rachael Ludwick shared that their client's internal code review bot, which addresses accessibility, is "wildly variable" and often contextually wrong, though it reliably catches simple issues like missing labels. Celeste Aronow noted that research indicates LLMs and automation generally only catch about 30% of real-life accessibility problems. Celeste Aronow suggested using or forking the Community Access plugin, which is built by disabled developers and is focused on producing meaningful AI output, as a potential solution to improve the efficacy of AI-based checks.

* **Commitment to CI/CD Artifact Development**: Tim Dorr committed to providing the engine CI script to the group, noting that they could potentially propose an addition to engine's CI to include the accessibility check, which would be invaluable for working out the logistical kinks of running expensive LLM checks on a live client. Tim Dorr also committed to trying to incorporate the Community Access plugin into the engine AI review script and sharing that resulting artifact.

* **Kelsey Roy's Interest in OP Process Implementation**: Kelsey Roy joined the meeting and expressed interest in implementing the CI/CD process into the OP process once the launch phase is complete.

* **Concerns with Engine's Current Accessibility Maintenance**: Tim Dorr stated that the engine project considers their accessibility work to be maintained but not a primary focus, noting that the end-to-end tests (including accessibility checks) do not run as often as unit tests. Celeste Aronow expressed concern that if the engine’s accessibility testing is finicky and does not run on all relevant pull requests, the project may struggle to maintain its accessibility claims, especially if a federal client were engaged.

* **Accessibility Audits and Playwright Testing**: The discussion began with a review of an end-to-end accessibility audit, which appears to be a Playwright test. Tim Dorr noted that their existing accessibility test cases used Vitest and 'axe' and were more component-oriented than full end-to-end testing. A key issue raised by Celeste Aronow was that incorporating API calls into Playwright tests introduces many points of failure unrelated to the intended accessibility resolution, making the tests non-deterministic and adding significant run time.

* **CI/CD Workflow and Community Access Artifact**: Celeste Aronow asked Tim Dorr to provide the CI/CD workflow with community access as an artifact to add to the repository. Tim Dorr noted they would need to pitch the introduction of community access to their client, as it was not currently in use. Celeste Aronow expressed concern about using third-party accessibility services that charge money but may not offer significant value, preferring to focus on skills that can be added to Claude within the CI process.

* **Utilizing Playwright Testing Artifact and Adjustments**: Celeste Aronow confirmed that they had received the Playwright testing artifact and believed it could be tightened up to improve performance, potentially into four loops. This artifact is seen as a useful starting point for incorporating Playwright tests, and the working session aims to generate two artifacts in total. A folder will be created in the repository to hold artifacts that are not yet ready to be shared externally, allowing the team to iterate on them as needed.

* **Integrating Accessibility Checks into Claude's Code Review**: Kelsey Roy suggested integrating an accessibility skill into Claude as part of the existing code review process. Celeste Aronow agreed that identifying specific requirements for such a skill would be a good topic for a future working session and invited Kelsey Roy to create a problem on the issue tracker. The goal is to determine which skills would empower a CI/CD agent code reviewer and how to include them.

* **Transcript Review and Summary Generation**: Claire Nguyen volunteered to review the meeting transcript for misheard words and potential action items. Claire Nguyen also suggested that a summary page or one-pager would be useful in addition to the full transcript. Celeste Aronow confirmed that Gemini should automatically provide both a summary/notes document and the transcript itself, though they noted common transcription errors, such as "engine" being used instead of "the client".

* **Next Meeting Date and Problem Submission**: The next meeting is scheduled for Wednesday, the 27th, in two weeks, at 9:30 Central/10:30 Eastern time. Participants were asked to look for real-life accessibility problems on their clients and submit them as issues to the cooperative repository, using the provided problem submission template. Submission of these issues before the end of next week was requested so that a problem could be selected for group discussion during the following working session.

* **Working Session Feedback and Process Adjustments**: During a round robin, participants provided feedback on the working session, with Rachael Ludwick noting that they need a reminder to prepare in advance. Celeste Aronow offered to send a reminder on Monday before the Community of Practice session to prompt preparation and problem submission. Claire Nguyen appreciated Celeste Aronow's preparedness but mentioned difficulty finding time to prepare, noting that they are currently working on AI evaluations without a public-facing front end, which limits bringing real-client accessibility examples.

* **Improving Personal Accessibility Testing Skills**: Kelsey Roy expressed a desire to improve their personal ability to identify and capture accessibility issues during QA and suggested that developing guidance on spotting issues could be a valuable topic. Celeste Aronow agreed this is a critical skill that many could benefit from and suggested that a working session dedicated to this problem could result in a presentation that could be used for company-wide training on incorporating accessibility testing into regular workflow.

* **Expectations for Participation and Commitment**: Celeste Aronow emphasized that they do not expect a large time investment from participants, acknowledging that everyone's time is valuable. They indicated that they would dedicate the most time to community of practice tasks, seeking guidance and expertise from others, with the goal that individual work aligns with participants' current client assignments. They reiterated the low barrier to entry for participation, noting that the expectation is that everyone is there to learn, and no one is expected to be an expert in accessibility.

*You should review Gemini's notes to make sure they're accurate. [Get tips and learn how Gemini takes notes](https://support.google.com/meet/answer/14754931)*

*How is the quality of **these specific notes?** [Take a short survey](https://google.qualtrics.com/jfe/form/SV_9vK3UZEaIQKKE7A?confid=NeAS72nO_QyzE4GUGS3UDxITOAIIigIgABgBCA&detailid=standard&screenshot=false) to let us know your feedback, including how helpful the notes were for your needs.*

