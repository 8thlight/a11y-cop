---
name: prepare-cop-notes
version: 1.8.0
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

The exported Google Doc may contain timestamp links in the format ` ([HH:MM:SS](#HH:MM:SS))` that reference times in the original meeting recording. These should be removed from the notes.

Call the timestamp removal script:
```bash
scripts/remove-timestamps.sh <path-to-file>
```

This script removes all timestamp patterns like ` ([00:05:12](#00:05:12))` from the document.

**Implementation:**
- Run the script against the file after transcript removal
- The script modifies the file in place (no need to capture output)
- If the script fails, report the error and halt processing

### 4. Extract and verify metadata, then remove metadata lines

**Extract date from first line:**
- Gemini Notes export always starts with the date in readable format (e.g., "May 13, 2026")
- Read the first line of the cleaned file content
- Parse date format: "Month Day, Year" or other readable formats
- Convert to YYYY-MM-DD format for frontmatter
- If first line doesn't match date pattern: show error with expected format

**Extract attendees from "Invited" line:**
- Format: `Invited [Name](mailto:email) [Name](mailto:email) ~~[Name](mailto:email)~~`
- Regular links: people who attended
- Strikethrough links: people invited but didn't attend (exclude from extraction)
- Parse the line:
  1. Find line starting with "Invited" in the current file content
  2. Extract all `[Name](mailto:...)` patterns using regex: `\[([^\]]+)\]\(mailto:[^\)]+\)`
  3. Filter out any names where the markdown link is preceded/followed by `~~` (strikethrough wrapper)
  4. Clean up mailto links from extracted names
  5. Build list of only attendees (people who actually attended)
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
Found:
- Date: 2026-05-13
- Attendees: Celeste Aronow, Claire Nguyen, Chris Peak
- Calendar: https://calendar.google.com/calendar/event?eid=...
- Transcript: https://docs.google.com/document/...

Is this correct? (yes/no)
```

If "no" or data seems incorrect, fall back to manual prompts.

**After verification, remove all Gemini metadata lines:**
- Line starting with "Invited" followed by markdown links: `^Invited\s+\[.*`
- Line starting with "Attachments" followed by markdown links: `^Attachments\s+\[.*`
- Line starting with "Meeting records" followed by markdown links: `^Meeting records\s+\[.*`

Remove all three lines from the file content. Keep all other content including the date, meeting title, Summary, Next steps, and Details sections.

### 5. Transform attendee list

Convert to plain name format (no mailto links):
- "Celeste Aronow, Claire Smith" → `- Celeste Aronow\n  - Claire Smith`

### 6. Add frontmatter

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

### 7. Save to sessions/

- Construct filename: `YYYY-MM-DD-session-notes.md`
- Create `sessions/` directory if needed
- Write file to sessions directory
- Confirm to user with full path to saved file

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
