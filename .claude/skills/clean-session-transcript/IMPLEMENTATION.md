# Clean Session Transcript - Implementation Guide

## Full Gemini Prompts (Path B)

### Prompt 1 - Terminology Corrections

```
In this document only, please find and replace these auto-transcription errors with the correct terms:

- "a flight", "aflight", "aphite", "eighth alight", "A-flight" → "8th Light"
- "W CAG", "WAG", "wicked", "WKed", "WKEG" → "WCAG"
- "C-PAC", "cpac" → "CPACC"
- "C-PWA", "cpwa" → "CPWA"
- "playright" → "Playwright"
- "access", "ax", "acts" → "axe" (only when referring to the accessibility testing tool)
- "Daimo", "DAO", "Dinamo", "Dynamo" → "DYMO"
- "DQ" → "Deque"
- "mpm" → "npm"

Only make changes when context clearly indicates the intended meaning. If uncertain, leave the original text.

Return the corrected document.
```

**After scribe runs Prompt 1:** Confirm with "Did the corrections look good?" (don't ask for details)

### Prompt 2 - Participant Name Review

```
Review all participant names in this document. For each person who spoke:

1. List their name exactly as it appears
2. Check for variations (e.g., "Tim" vs "Tim Dorr", "Chris" vs "Christopher Peak")
3. Suggest the most appropriate full name format based on context

Do NOT make changes yet - just provide the list for review.
```

**After Gemini provides list:** Create custom follow-up prompt for scribe:

```
In this document, standardize these participant names:
- "Tim", "Tim D" → "Tim Dorr"
- "Chris", "Christopher" → "Chris Peak"
- [add other variations as identified]

Keep the ** formatting around names (e.g., **Tim Dorr:**).
```

## Complete ASR Mishear Reference

| Spoken Term | Common Mishears | Context Clues |
|-------------|-----------------|---------------|
| 8th Light | a flight, aflight, aphite, eighth alight, A-flight | Company name, always capitalized |
| WCAG | W CAG, WAG, wicked, WKed, WKEG, WAGG | Web accessibility guidelines, all caps |
| CPACC | cpac, C-PAC | Accessibility certification, all caps |
| CPWA | cpwa, C-PWA | Combined certification, all caps |
| Playwright | playright | Testing framework, capitalized |
| axe | access, ax, acts | Accessibility testing tool, lowercase |
| DYMO | Daimo, DAO, Dinamo, Dynamo | Printer company, all caps |
| Deque | DQ | Accessibility company, capitalized |
| npm | mpm | Package manager, lowercase |
| EnGen | engine, NGEN, M Gen, Engem | Client name (if mentioned), mixed case |
| Yanis | Giannis, Janice, Yannis | Person name (context dependent) |
| Shawn | Sean, Shop | Person name (context dependent) |

## Path A - Export as Markdown (Detailed)

### Step 1: Export

**Guide scribe:**
```
In Google Drive, with the transcript open:
1. Click File (top left menu)
2. Hover over Download
3. Click "Markdown (.md)"

The file will download to your Downloads folder (usually named something like "CoP Session 2026-05-13.md").

What's the file path where it downloaded? (Or you can copy it to the a11y-cop repo directory if that's easier)
```

### Step 2: Import

**Try direct read first:**
```bash
Read file_path: <user-provided-path>
```

**If access fails (permission error, file not found):**

**Option A - Copy to repo:**
```
It looks like I can't access that file directly. Can you copy it to the a11y-cop repo directory?

You can run:
cp "<download-path>" .

Then I'll read it from there.
```

**Option B - Paste contents:**
```
Alternatively, you can open the file and paste the contents directly here, and I'll save it to the repo.
```

### Step 3: Clean

Use Edit tool to apply corrections:

**ASR mishear corrections** (replace all instances):
- "a flight", "aflight", etc. → "8th Light"
- "W CAG", "WAG", etc. → "WCAG"
- (etc., from ASR mishear table)

**Name normalization:**
- Scan transcript for speaker names
- Identify variations (e.g., "Tim" vs "Tim Dorr")
- Ask scribe: "I see these name variations: [list]. Should I standardize to: [suggestions]?"
- Apply approved standardizations

### Step 4: Review

Present checklist to scribe:
```
Review checklist:
- [ ] Speaker names consistent throughout
- [ ] Speaker names match known CoP members (check charter/README)
- [ ] Common ASR mishears corrected (8th Light, WCAG, axe, etc.)
- [ ] No sensitive information exposed (addresses, phone, financial details)
- [ ] File naming correct: <YYYY-MM-DD>-session-transcript.md
- [ ] Markdown formatting clean (no HTML tags, reasonable line breaks)

Does this look good to save to sessions/?
```

## Path B - Gemini Find/Replace (Detailed)

### Step 1: Prompt Sequence

**Provide Prompt 1 to scribe:**
```
Copy this prompt and paste it into Gemini in your Google Doc:

[Full Prompt 1 text from above]

After Gemini finishes, let me know: Did the corrections look good?
```

**After confirmation, provide Prompt 2:**
```
Now run this second prompt:

[Full Prompt 2 text from above]

Gemini will list name variations — paste that list here so we can create a standardization prompt.
```

**After scribe pastes list, create custom prompt:**
```
Great! Now run this final prompt:

In this document, standardize these participant names:
- [variation 1] → [standard name 1]
- [variation 2] → [standard name 2]
- ...

Keep the ** formatting around names (e.g., **Tim Dorr:**).
```

### Step 2: Export

**After all Gemini prompts complete:**
```
Perfect! Now export the cleaned transcript:
File → Download → Markdown (.md)

What's the file path where it downloaded?
```

### Step 3: Import

Same as Path A Step 2 (try direct read, fallback to copy or paste)

### Step 4: Review

Same checklist as Path A Step 4

## Troubleshooting

### Issue: Gemini Changes Wrong Instances

**Symptom:** Gemini replaces "access" with "axe" when speaker was discussing access control

**Solution:** Add more context to prompt:
```
- "access", "ax", "acts" → "axe" (ONLY when clearly referring to the Deque axe accessibility testing tool/library, NOT when discussing access control, database access, or API access)
```

### Issue: Markdown Export Has Extra Formatting

**Symptom:** Downloaded markdown has HTML tags, extra line breaks, or formatting codes

**Solution:** After import, use Edit tool to clean:
- Remove HTML tags: `<div>`, `<span>`, etc.
- Collapse multiple blank lines (3+ consecutive) to 2
- Remove trailing spaces

**Commands:**
```bash
# Preview formatting issues:
grep -n '<[^>]*>' <file-path>  # Find HTML tags
grep -n '   ' <file-path>      # Find trailing spaces
```

### Issue: Participant Names Inconsistent

**Symptom:** Same person appears as "Tim", "Tim D", "Tim Dorr" throughout

**Solution:** After Prompt 2 review, create custom Gemini prompt (see Prompt 2 workflow above)

### Issue: File Already Exists

**Symptom:** Target file `sessions/<date>-session-transcript.md` already exists

**Solution:**
1. Ask scribe: "A transcript for this date already exists. Did you mean a different date?"
2. If same date: "This might be a revision. Should I create a `-revised` version or overwrite?"
3. If different session: Use `-session-2` suffix

**File naming options:**
- Overwrite: Use same name (scribe confirms)
- Revision: `<date>-session-transcript-revised.md`
- Multiple sessions: `<date>-session-1-transcript.md`, `<date>-session-2-transcript.md`

### Issue: Scribe Unsure Which Path

**Recommendation by experience level:**
- First-time scribe → Path B (more guided, prompts provided)
- Experienced scribe → Path A (faster, more control)

**Recommendation by transcript complexity:**
- Simple transcript (1 tab, mostly text) → Path B
- Complex transcript (multiple tabs, heavy formatting) → Path A

**Response template:**
```
Both paths work great! I'd recommend:
- Path B if this is your first time (I'll give you step-by-step prompts)
- Path A if you're comfortable with markdown export (faster)

Which would you prefer?
```

### Issue: Can't Access Downloaded File

**Symptom:** Read tool fails with permission error or file not found

**Solution:** Offer two options:

**Option 1 - Copy to repo:**
```
Can you copy the file to the a11y-cop repo directory?

cp "<download-path>" .

Then I'll read it from there.
```

**Option 2 - Paste contents:**
```
Or you can open the file in a text editor, copy the contents, and paste them here. I'll save it directly to sessions/.
```

### Issue: sessions/ Directory Doesn't Exist

**Symptom:** Can't save file because target directory doesn't exist

**Solution:** Create directory first:
```bash
mkdir -p sessions
```

**Inform scribe:**
```
I'll create the sessions/ directory first, then save the transcript there.
```

## Path Comparison Table

| Aspect | Path A: Export | Path B: Gemini |
|--------|----------------|----------------|
| **Best for** | Complex transcripts, multiple tabs | Simple transcripts, text-heavy |
| **Time** | 5-10 min | 3-5 min |
| **Control** | Full control via Edit tool | Guided via prompts |
| **Learning curve** | Steeper (need to know Edit tool) | Gentler (follow prompts) |
| **Error handling** | Manual review after export | Gemini flags uncertainties |
| **Recommended for** | Experienced scribes | First-time scribes |
| **Scribe workload** | Lighter (Claude does cleaning) | Heavier (scribe runs prompts) |

## File Naming Conventions

**Standard format:** `<YYYY-MM-DD>-session-transcript.md`

**Examples:**
- `2026-05-13-session-transcript.md`
- `2026-05-20-session-transcript.md`

**If multiple sessions same day:**
- `2026-05-13-session-1-transcript.md`
- `2026-05-13-session-2-transcript.md`

**If revision:**
- `2026-05-13-session-transcript-revised.md`

## Review Checklist Details

### Speaker Names Consistent

**Check:** Same person has same name format throughout
- ❌ "Tim" in beginning, "Tim Dorr" at end
- ✅ "Tim Dorr" throughout

### Speaker Names Match Known CoP Members

**Check:** Names match charter/README member list
- Cross-reference with `charter/8L-A11y-CoP-Charter.md`
- Look for: Celeste Aronow, [other CoP members]

### ASR Mishears Corrected

**Check:** All instances of common mishears replaced
- ❌ "a flight" still present
- ✅ "8th Light" throughout

### No Sensitive Information

**Check:** No PII or confidential data
- ❌ Phone numbers, addresses, financial details
- ❌ Client confidential information (unless already public)
- ✅ Generic discussion, public references only

### File Naming Correct

**Check:** Matches `<YYYY-MM-DD>-session-transcript.md` format
- ❌ `cop-session-5-13.md`
- ✅ `2026-05-13-session-transcript.md`

### Markdown Formatting Clean

**Check:** No HTML artifacts, reasonable whitespace
- ❌ `<div>`, `<span>`, `&nbsp;` present
- ❌ 10 consecutive blank lines
- ✅ Clean markdown, 1-2 blank lines between sections
