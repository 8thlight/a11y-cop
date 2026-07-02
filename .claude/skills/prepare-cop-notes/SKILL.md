---
name: prepare-cop-notes
version: 1.10.0
description: >
  Use when a CoP scribe has exported the Notes tab from Google Docs as markdown 
  and needs to add frontmatter and save it to the sessions/ directory.
---

# Prepare CoP Notes

**Usage:** `/prepare-cop-notes ~/Downloads/exported-notes.md`

## User Input

```text
$ARGUMENTS
```

The argument is the file path to the exported Notes tab markdown. If empty, prompt:

> "Please provide the path to the exported Notes markdown file."

## Workflow

### 1. Read the exported file

Use absolute path. Verify file exists before proceeding.

### 2. Remove transcript section (if accidentally included)

**Purpose:** The Notes tab should not contain the transcript section, but if a scribe accidentally exports the wrong content, this step catches it. This is a safety check, not a primary function.

**Detection pattern:**
- Use regex: `^#+\s+.*Transcript.*$` (one or more `#` characters, followed by whitespace, followed by any text containing "Transcript")
- This matches: `# Transcript`, `## Transcript`, `# 📖 Transcript`, `### Transcript`, etc.

**Removal logic:**
1. Search for transcript heading pattern in the file content using the regex
2. If found, remove everything from that heading to the end of file
3. Keep only the curated Notes tab content (everything before transcript section)
4. If no transcript heading found, proceed with file as-is (silent cleanup, no error)

### 3. Remove timestamp references

The exported Google Doc may contain two types of timestamp links that reference times in the original meeting recording. Both should be removed.

- **Simple format:** ` ([00:05:12](#00:05:12))`
- **Google Docs deep-link format:** ` ([00:05:12](?tab=t.xxxxx#heading=h.xxxxx))` — links to a specific heading in the transcript doc

Create a working copy of the file in `/tmp/`, then call the timestamp removal script. The script lives at the **repository root** (`<repo-root>/scripts/remove-timestamps.sh`), not inside the skill directory:
```bash
cp <original-path> /tmp/a11y-cop-notes-working.md
<repo-root>/scripts/remove-timestamps.sh /tmp/a11y-cop-notes-working.md
```

The script handles both formats and modifies the file in place.

**Implementation:**
- Create a working copy to preserve the original export until validation is complete
- Run the script against the working copy after transcript removal
- The script modifies the file in place (no need to capture output)
- If the script fails, report the error and halt processing
- Continue all remaining steps with the working copy
- Only save to `sessions/` after all validation is complete

### 4. Extract and verify metadata, then remove metadata lines

**Extract date from first line:**
- Gemini Notes export always starts with the date in readable format (e.g., "May 13, 2026")
- Read the first line of the cleaned file content
- Parse date format: "Month Day, Year" or other readable formats
- Convert to YYYY-MM-DD format for frontmatter
- If first line doesn't match date pattern: show error with expected format

**Extract attendees from "Invited" line:**
- Format: `Invited [Name](mailto:email) [Name](mailto:email) ~~[Name](mailto:email)~~`
- Regular links: people who were invited and didn't decline — **not a guarantee of attendance**
- Strikethrough links: people who declined — exclude from extraction
- Parse the line:
  1. Find line starting with "Invited" in the current file content
  2. Extract all `[Name](mailto:...)` patterns using regex: `\[([^\]]+)\]\(mailto:[^\)]+\)`
  3. Filter out any names where the markdown link is preceded/followed by `~~` (strikethrough wrapper)
  4. Clean up mailto links from extracted names
  5. Build list of non-declined invitees as a starting point
- Present this list to the user as "Attendees" and ask: *"Should anyone be removed from the attendee list?"*
- If "Invited" line not found: fall back to searching for "Attendees", "Participants", or "Present" sections (case-insensitive)

**Extract URLs from metadata lines:**
1. **"Attachments" line:** Extract calendar event URL
   - Pattern: `Attachments [Link Text](URL)`
   - Extract URL → store for frontmatter as `calendar_link: <url>`
   - Regex: `\[([^\]]+)\]\(([^\)]+)\)` (use second capture group)

2. **"Meeting records" line:** Extract transcript URL
   - Pattern: `Meeting records [Transcript](URL)`
   - Extract Transcript URL → store for frontmatter as `transcript_link: <url>`
   - Regex: `\[([^\]]+)\]\(([^\)]+)\)` (use second capture group)

**Show all extracted data for verification:**
```
Extracted metadata:
- Date: 2026-05-13
- Attendees: Chris Peak, Rachael Ludwick, Celeste Aronow, Claire Nguyen
- Calendar: https://calendar.google.com/calendar/event?eid=...
- Transcript: https://docs.google.com/document/...

Should anyone be removed from the attendee list?
```

Wait for the user to confirm or correct before proceeding. Do not guess from transcript content.

**After verification, remove all Gemini metadata lines:**
- Line starting with "Invited" followed by markdown links: `^Invited\s+\[.*`
- Line starting with "Attachments" followed by markdown links: `^Attachments\s+\[.*`
- Line starting with "Meeting records" followed by markdown links: `^Meeting records\s+\[.*`

Remove all three lines from the file content. Keep all other content including the date, meeting title, Summary, Next steps, and Details sections.

### 5. Review content

Before saving, scan the full file content. This step has two parts: auto-cleanup and user validation. Do not save until both are complete.

**Part A: Auto-remove Gemini UI artifacts**

Remove the following without asking — they are never real content:
- Lines matching `*Rate this Summary:*` or `*Rate this Decisions:*` (Gemini feedback prompts)
- Lines matching `We've updated the ... section using your feedback` (Gemini edit notifications)
- `## ALIGNED` or similar Gemini section labels appearing inside `### Decisions`
- Italic footer lines at end of file: Gemini review prompt (`You should review Gemini's notes...`) and survey link (`How is the quality of these specific notes?...`)

Tell the user exactly what was removed, listing each item:
```
Auto-removed Gemini artifacts:
- "Rate this Summary" feedback prompt (after Summary section)
- "## ALIGNED" section label (inside Decisions)
- "We've updated the Decisions section" notification
- Gemini footer (review reminder + survey link)
```

If nothing was found to remove, say so briefly.

**Part B: Validate uncertain items**

Scan for the following and build a list of items needing a decision. Do not auto-correct any of these.

**Technical terms and ASR mishears:**

Check for garbled forms of technical terms. Unambiguous corrections (e.g., "a flight" → "8th Light") can be auto-applied; flag ambiguous ones (e.g., "access" where "axe" is also possible) for the scribe to confirm from context.

| Correct Term | Common Mishears |
|---|---|
| 8th Light | a flight, aflight, aphite, eighth alight, 8 light, A-Flight |
| WCAG | W CAG, WAG, wicked, WKed, WKEG, we CAG |
| CPACC | cpac, C-PAC, CPAC |
| CoP | COP, cop, coop |
| Playwright | playright, play right |
| axe | access, ax, acts (when referring to the testing tool) |
| npm | mpm |
| ARIA | area, Arya, aria |
| Pa11y | pally, palley, PA11Y |
| NVDA | in VDA |
| JAWS | jaws, Jaws |
| VoiceOver | voice over, voiceover |

**Names to check:**

1. **Spelling variants of the same name** — the same person referred to differently across the document (e.g., "Rachel" vs "Rachael", "Jon" vs "John"). Cross-reference every first name in the body against the attendee list and flag any that differ.

2. **Phonetically similar names** — if both spellings of a pair appear anywhere in the document, flag it. Do not reason from context about whether they're the same person — the scribe must confirm. No exceptions.

   | Pair | Note |
   |---|---|
   | Sean / Shawn | **Both are real people at 8th Light.** They can appear in the same document referring to different people. Flag every time both spellings appear. |
   | Jon / John | **Both are real people at 8th Light.** Flag every time both spellings appear — do not assume they refer to different people even if context suggests it. |
   | Rachael / Rachel | Common ASR variation |
   | Chris / Kris | Less common but possible |
   | Claire / Clare | Less common but possible |

3. **Partial name references** — "Jon W", "John W", or first-name-only references that may or may not match a full name elsewhere in the document.

**Other items to check:**

- **Client or project names** — check the table below first, then flag anything not listed that looks like a company name, project codename, or client-identifiable detail. This is a public repo.

  | Client/Project | Common Mishears | Replace With |
  |---|---|---|
  | EnGen | Engine, Engen, N-Gen, in gen, NEN | `[Education Client]` |
  | DYMO | Daimo, DAO, Dinamo, Dynamo | `[Printer Client]` |
  | New Brands | new brands, NewBrands | `[Printer Client's Parent Company]` |
  | Other People's Pixels (OPP) | OP | `[Artist CMS Client]` |
  | Cars.com | Cars project, cars.com | `[Automotive Client]` |

  For clients not in the table, suggest replacing with `[Client Name]` or `[Project Name]` and prompt the scribe to confirm.

- **Reference links** — the notes often mention repositories, GitHub issues, tools, or skills by name. Ask the scribe once, upfront: *"Do you have URLs for any repos, issues, or tools mentioned in the notes? Paste them all and I'll link the first mention of each."* Collecting them in one pass avoids drip-fed link additions after the file is saved.

- **PII** — email addresses, phone numbers

- **Open-ended scan** — look for content not covered by the tables above:
  - Implicit client references (project descriptions or industry details that narrow to one company)
  - Internal process details not meant to be public (pricing models, internal tool names, proprietary methodology)
  - People information that could identify someone (job title + first name, team size details for small clients)
  - Accessibility violation counts tied to client names (e.g., "client X had 47 critical errors")
  - Internal client communications or direct quotes from client stakeholders
  - Security vulnerabilities in client systems

If there are items to validate, present them one at a time and wait for a response before moving to the next:
```
[1/3] "Rachel" (Details section) — attendee list has "Rachael Ludwick". Correct to "Rachael"?
```
After the user responds, move to the next unresolved item:
```
[2/3] "Jon W" (Leadership Advocacy section) and "John" (Next steps) — are these the same person? If so, which spelling is correct?
```
```
[3/3] "Sean" (multiple places) and "Shawn" (Next steps) — are these the same person? If so, which spelling is correct?
```

If there are no items to validate, say so and proceed.

Only move to step 6 once all flagged items have a response.

### 6. Transform attendee list

Convert to plain name format (no mailto links):
- "Celeste Aronow, Claire Smith" → `- Celeste Aronow\n  - Claire Smith`

### 7. Add frontmatter

Prepend to file content with extracted metadata:

```yaml
---
date: YYYY-MM-DD
contacts:
  - Attendee One
  - Attendee Two
calendar_link: https://calendar.google.com/calendar/event?eid=...
transcript_link: https://docs.google.com/document/...
---
```

**Note:** If any URL was not found during extraction (step 4), omit that field from frontmatter.

### 8. Save to sessions/

- Construct filename: `YYYY-MM-DD-session-notes.md`
- Create `sessions/` directory if needed
- Write file to sessions directory
- Confirm to user with full path to saved file and prompt for next step:

```
Saved to sessions/YYYY-MM-DD-session-notes.md.

Next: commit and open a PR. Run the Claude skill:
  `/using-git`
  
or branch manually:
  git checkout -b transcript/YYYY-MM-DD-cop-session
```

## Error Handling

- **File not found:** Report error, ask for correct path
- **Date extraction failed:** 
  ```
  Error: Could not find date in document.
  
  Expected format: YYYY-MM-DD in title or first heading
  Example: "# 2026-05-13 — A11y CoP Working Session"
  
  Please check the document format or provide the date manually.
  ```
- **Attendees extraction failed:**
  ```
  Error: Could not find attendees list in document.
  
  Expected: Section labeled "Attendees:", "Participants:", or "Present:"
  Followed by: Bulleted list or comma-separated names
  Example:
  Attendees:
  - Celeste Aronow
  - Claire Smith
  
  Please check the document format or provide attendees manually.
  ```
- **Empty attendee list:** Accept but warn ("No attendees specified")
- **Write failure:** Report error with full path
