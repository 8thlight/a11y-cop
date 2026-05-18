# Gemini Redaction Prompt

Copy/paste this entire prompt into Gemini in Google Docs to identify content that needs redaction before committing to the public repository.

---

Please scan this document for confidential information that should be redacted or removed before publishing. Flag any instances of the following:

## Client Names & Projects

**Note:** CoP sessions may reference client work. These names should be replaced with generic placeholders (e.g., "the project") unless the client relationship is already public.

| Client/Project Name | Common Mishears | Redaction Strategy |
|---------------------|-----------------|-------------------|
| EnGen | Engine, Engen, N-Gen, in gen, NEN | Replace with "the education client" |
| DYMO | Daimo, DAO, Dinamo, Dynamo | Replace with "the printer client" |
| New Brands | new brands, NewBrands | Replace with "the printer client's parent company" |
| Other People's Pixels (OPP) | OP | Replace with "the artist CMS client" |

**Add other clients here as they come up in sessions.**

## Personal Identifiable Information (PII)

Look for and flag:
- Email addresses (except public-facing practice lead email)
- Phone numbers
- Home addresses
- Employee ID numbers
- Financial account numbers

## Internal Business Information

Look for and flag:
- Confidential business metrics
- Internal code names for projects not listed above
- Strategic plans not yet public

## Sensitive Project Details

Look for and flag:
- Detailed security vulnerabilities in client systems
- Proprietary client technology stack details
- Client roadmap information not yet public
- Specific accessibility violation counts tied to client names
- Internal client communications or quotes

## Instructions

1. Search for the client names and mishears listed in the table above
2. Search for patterns matching PII, internal business info, and sensitive project details
3. For each match found, provide:
   - The exact text that needs redaction
   - The line or paragraph where it appears
   - A suggested replacement (generic placeholder or removal)
4. Prioritize accuracy - flag anything that might be confidential
5. Do not auto-apply redactions - present them for review first

After you provide suggestions, I will review each redaction and decide whether to:
- Replace with a generic placeholder
- Remove the sentence/paragraph entirely
- Keep as-is (if it turns out to be acceptable)

**False positives are okay** - it's better to flag something unnecessarily than to miss confidential content that gets published.
