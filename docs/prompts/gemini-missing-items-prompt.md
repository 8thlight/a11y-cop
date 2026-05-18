# Gemini Missing Items Detection Prompt

Copy/paste this entire prompt into Gemini in Google Docs **after** running both the mishears and redaction prompts. This prompt helps find items not covered by the standard tables.

---

## Potential Mishears Not Yet Caught

Look for words or phrases that seem unusual or out of context for an accessibility-focused technical discussion:

1. **Technical jargon that sounds slightly wrong**
   - Framework names (React, Vue, Angular, Svelte)
   - Testing tool names (Jest, Cypress, Selenium, TestCafe)
   - Browser names (Chrome, Firefox, Safari, Edge)
   - Programming languages (JavaScript, TypeScript, Python, Java)

2. **Acronyms that might be malformed**
   - Look for patterns like "double-u CAG" instead of "WCAG"
   - Single letters where acronyms should be ("W C A G" → "WCAG")
   - Common words that might be accessibility acronyms misheard

3. **Company or product names**
   - Accessibility tool vendors (beyond the standard list)
   - Technology companies mentioned in context
   - Product names that sound close to common words

4. **Names of people mentioned**
   - Screen reader users referenced in examples
   - Authors of accessibility resources cited
   - Accessibility experts or advocates mentioned

## Potential Confidential Content Not Yet Caught

Look for content that might be sensitive even if not explicitly named:

1. **Implicit client references**
   - Project descriptions that could identify unnamed clients
   - Industry-specific details that narrow to one company
   - Timeline details tied to public events that reveal clients

2. **Internal process details that shouldn't be public**
   - Specific pricing models or rate structures
   - Internal tool names not meant for external use
   - Proprietary methodology details

3. **People information**
   - Job titles combined with first names (even without last names)
   - Team size details that could identify small clients
   - Personal anecdotes that include identifying details

## Instructions

1. Read through the document completely first
2. Flag anything that seems unusual, out of place, or potentially sensitive
3. For each item flagged, provide:
   - The exact text
   - Why it seems suspicious (sounds wrong? could be confidential?)
   - A suggested correction OR a recommendation to review with team
4. Prioritize accuracy - flag anything uncertain rather than missing something

**Note:** Many of your suggestions may turn out to be correct as written. That's expected and helpful - the scribe will review each one to determine if it actually needs correction or redaction.

After you provide suggestions, I will review each one and decide whether to:
- Apply the correction (if it's a mishear)
- Redact or anonymize (if it's confidential)
- Keep as-is (if it's actually correct)

**Your job is to flag possibilities, not to make final decisions.**
