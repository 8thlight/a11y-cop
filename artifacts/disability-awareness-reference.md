---
title: Disability Awareness Reference
created: 2026-06-23
last_updated: 2026-07-02
problem_addressed: >
  Teams need a shared, cited reference for disability categories, the functional
  needs within each, the tools people actually use, and how common each is, so
  accessibility decisions come from understanding rather than guesswork.
status: draft
---

# Disability Awareness Reference

A starting reference for teams at 8th Light. For each disability category it
gives an overview of how many people are affected, then maps the functional
needs within that category to the tools people use and what we can do about
them. Every figure is cited.

The central idea: **solutions map to functional needs, not to diagnoses.** Many
different conditions converge on the same need, and one condition can create
several needs. ADHD and autism both sit under "cognitive and learning," but a
person with ADHD needs help staying focused while a person on the autism
spectrum needs predictability and control over sensory input. The mapping
tables below are organized around those needs.

The **References** column links each "what we can do" entry to the WCAG 2.2
success criterion (SC) that covers it, via the W3C's Understanding documents.
Unmarked criteria are Level A or AA, within the CoP's WCAG 2.2 AA target.
Criteria marked **(AAA)** go beyond that target: treat them as good practice,
not a compliance requirement. Where WCAG has no criterion for a need, the
column links W3C guidance instead ([COGA](https://www.w3.org/TR/coga-usable/)
for cognitive needs, [WAI](https://www.w3.org/WAI/people-use-web/abilities-barriers/speech/)
for speech).

## How to read the prevalence figures

Read these numbers carefully. They are not directly comparable across regions.

- **Counts vs percentages.** Public health agencies often publish a count
  (for example "7 million people") rather than a percentage of adults. Where a
  source gives only a count, this doc reports the count, not an inferred
  percentage.
- **US and global figures differ in method.** US figures come mainly from the
  CDC and NIH and measure specific conditions in specific age ranges. Global
  figures come mainly from the WHO and sometimes report all disabilities
  together rather than one category. Treat the two as separate pictures, not as
  a like-for-like comparison.
- **Categories and conditions overlap.** A person can belong to more than one
  category, and sub-figures within a category count overlapping groups. Do not
  add figures together.

> **Human review required before external use.** These figures were gathered
> with AI assistance and verified against live source URLs at the dates noted.
> Confirm each figure against its source before using this reference in a
> public talk, client material, or the planned announcement. Statistics age,
> and source pages change.

## How to contribute

This is a working artifact, opened as a PR so the community can add to it
asynchronously. To contribute:

- Add a functional need, condition, tool, or figure with a direct,
  authoritative source (WHO, CDC, NIH, W3C WAI, or a comparable body). Quote a
  figure as the source states it and link the URL.
- If you cannot cite it, do not add it. Mark gaps as "not available" rather
  than estimating.
- Keep the framing plain and non-clinical.

Categories follow the W3C WAI [Diverse Abilities and
Barriers](https://www.w3.org/WAI/people-use-web/abilities-barriers/) model and
are listed alphabetically.

---

## Auditory

People who are deaf or hard of hearing miss information carried by sound alone.
Audio without a text or visual equivalent is a closed door.

**How many people:**

| Region | Figure | Source |
| --- | --- | --- |
| US | About 15% of adults 18+ (37.5 million) report some trouble hearing (2012 data) | [NIDCD](https://www.nidcd.nih.gov/health/statistics/quick-statistics-hearing) |
| Global | Over 5% of the world's population (430 million people) have disabling hearing loss | [WHO](https://www.who.int/news-room/fact-sheets/detail/deafness-and-hearing-loss) |

**Functional needs:**

| Functional need | Conditions (examples) | Tools they use | What we can do | References |
| --- | --- | --- | --- | --- |
| Cannot hear audio content | deafness, hard of hearing | captions, transcripts, CART | caption every video, transcribe audio, never make sound the only signal | [SC 1.2.1](https://www.w3.org/WAI/WCAG22/Understanding/audio-only-and-video-only-prerecorded.html), [SC 1.2.2](https://www.w3.org/WAI/WCAG22/Understanding/captions-prerecorded.html), [SC 1.2.4](https://www.w3.org/WAI/WCAG22/Understanding/captions-live.html) |
| Hard to separate speech from background | hard of hearing | hearing aids, volume controls | keep foreground audio clear, give volume and pause controls | [SC 1.4.2](https://www.w3.org/WAI/WCAG22/Understanding/audio-control.html), [SC 1.4.7 (AAA)](https://www.w3.org/WAI/WCAG22/Understanding/low-or-no-background-audio.html) |
| Sign language is the primary language | deafness (sign-first users) | sign language interpretation | provide signed video for key content, supplement text with images | [SC 1.2.6 (AAA)](https://www.w3.org/WAI/WCAG22/Understanding/sign-language-prerecorded.html) |
| No sight and no hearing | deaf-blindness | refreshable braille display | ensure braille and screen-reader compatibility, give text alternatives | [SC 1.1.1](https://www.w3.org/WAI/WCAG22/Understanding/non-text-content.html), [SC 1.3.1](https://www.w3.org/WAI/WCAG22/Understanding/info-and-relationships.html) |

---

## Cognitive and learning

This is the broadest category. It covers attention, memory, reading, language,
and processing. These needs diverge sharply, which is why one set of solutions
does not fit the whole category.

**How many people:**

| Region | Figure | Source |
| --- | --- | --- |
| US, cognition disability overall | 13.9% of adults (serious difficulty concentrating, remembering, or deciding; 2022 data) | [CDC](https://www.cdc.gov/disability-and-health/articles-documents/disability-impacts-all-of-us-infographic.html) |
| US, ADHD (adults) | 6.0% (about 15.5 million), 2023 | [CDC MMWR](https://www.cdc.gov/mmwr/volumes/73/wr/mm7340a1.htm) |
| US, autism (children aged 8) | 3.2% (1 in 31), 2022 surveillance | [CDC](https://www.cdc.gov/autism/data-research/index.html) |
| US, intellectual disability (children) | 2% to 3% | [NIH NICHD](https://www.nichd.nih.gov/health/topics/idds/conditioninfo/risk) |
| Global, autism | About 1 in 127 people, 2021 | [WHO](https://www.who.int/news-room/fact-sheets/detail/autism-spectrum-disorders) |
| Global, dementia | 57 million people, 2021 | [WHO](https://www.who.int/news-room/fact-sheets/detail/dementia) |

Authoritative US dyslexia and dyscalculia figures, and a global ADHD figure,
were not available from WHO, CDC, or NIH at the time of writing.

**Functional needs:**

| Functional need | Conditions (examples) | Tools they use | What we can do | References |
| --- | --- | --- | --- | --- |
| Difficulty reading text | dyslexia, learning disabilities, low literacy | text-to-speech with synced highlighting, adjustable fonts and spacing | plain language, readable fonts, adjustable text spacing | [SC 1.4.12](https://www.w3.org/WAI/WCAG22/Understanding/text-spacing.html), [SC 3.1.5 (AAA)](https://www.w3.org/WAI/WCAG22/Understanding/reading-level.html), [COGA](https://www.w3.org/TR/coga-usable/) |
| Difficulty staying focused | ADHD | focus and reminder aids | minimize distractions, no autoplay or auto-advancing content, one clear task at a time | [SC 2.2.2](https://www.w3.org/WAI/WCAG22/Understanding/pause-stop-hide.html), [SC 2.2.4 (AAA)](https://www.w3.org/WAI/WCAG22/Understanding/interruptions.html) |
| Difficulty with memory | dementia, mild cognitive impairment, brain injury, age-related forgetfulness | password managers, reminders | do not rely on recall, keep context visible, show progress, save state | [SC 3.3.7](https://www.w3.org/WAI/WCAG22/Understanding/redundant-entry.html), [SC 3.3.8](https://www.w3.org/WAI/WCAG22/Understanding/accessible-authentication-minimum.html), [SC 2.2.1](https://www.w3.org/WAI/WCAG22/Understanding/timing-adjustable.html) |
| Difficulty with unpredictable or sensory-heavy interfaces | autism spectrum | customizable colors, reduce-motion settings | predictable and consistent layout, literal language, user control over sound and motion | [SC 3.2.3](https://www.w3.org/WAI/WCAG22/Understanding/consistent-navigation.html), [SC 3.2.4](https://www.w3.org/WAI/WCAG22/Understanding/consistent-identification.html), [SC 2.3.3 (AAA)](https://www.w3.org/WAI/WCAG22/Understanding/animation-from-interactions.html) |
| Difficulty processing complex information | intellectual disabilities | text-to-speech, plain-language content | simple words, short steps, images that support the text | [SC 3.1.5 (AAA)](https://www.w3.org/WAI/WCAG22/Understanding/reading-level.html), [COGA](https://www.w3.org/TR/coga-usable/) |
| Difficulty with numbers | dyscalculia | calculators, clear number formatting | avoid forcing mental math, format numbers and dates clearly | [COGA](https://www.w3.org/TR/coga-usable/) |

---

## Physical

Physical and motor disabilities affect movement, dexterity, and stamina. They
range from amputation to seizure disorders, and the solutions differ just as
widely.

**How many people:**

| Region | Figure | Source |
| --- | --- | --- |
| US, mobility disability | 12.2% of adults (serious difficulty walking or climbing stairs; 2022 data). More than 1 in 4 US adults have some type of disability. | [CDC](https://www.cdc.gov/disability-and-health/articles-documents/disability-impacts-all-of-us-infographic.html) |
| Global | 16% (1.3 billion people) experience a significant disability of any type, 2023 | [WHO](https://www.who.int/news-room/fact-sheets/detail/disability-and-health) |

The WHO 16% figure covers all disabilities, not motor disability specifically.
WHO does not publish a motor-only global figure. Treat it as context, not a
direct match to the US mobility figure.

**Functional needs:**

| Functional need | Conditions (examples) | Tools they use | What we can do | References |
| --- | --- | --- | --- | --- |
| Imprecise pointing, no fine motor control | tremor, arthritis, repetitive stress injury, reduced dexterity | voice control (for example Dragon), large pointing aids | large click targets, no drag-only or precise-gesture actions | [SC 2.5.8](https://www.w3.org/WAI/WCAG22/Understanding/target-size-minimum.html), [SC 2.5.7](https://www.w3.org/WAI/WCAG22/Understanding/dragging-movements.html), [SC 2.5.1](https://www.w3.org/WAI/WCAG22/Understanding/pointer-gestures.html) |
| No hand use at all | quadriplegia, advanced multiple sclerosis, amputation | switches, sip-and-puff, eye tracking (for example Tobii) | full keyboard and switch operability, no mouse-only interactions | [SC 2.1.1](https://www.w3.org/WAI/WCAG22/Understanding/keyboard.html), [SC 2.1.3 (AAA)](https://www.w3.org/WAI/WCAG22/Understanding/keyboard-no-exception.html) |
| Low stamina or chronic pain | fibromyalgia, multiple sclerosis | speech recognition, save-progress features | minimize steps, generous or adjustable timeouts, autosave | [SC 2.2.1](https://www.w3.org/WAI/WCAG22/Understanding/timing-adjustable.html), [SC 2.2.6 (AAA)](https://www.w3.org/WAI/WCAG22/Understanding/timeouts.html) |
| Photosensitivity | seizure disorders | reduce-motion settings | no flashing more than 3 times per second, honor prefers-reduced-motion | [SC 2.3.1](https://www.w3.org/WAI/WCAG22/Understanding/three-flashes-or-below-threshold.html), [SC 2.3.3 (AAA)](https://www.w3.org/WAI/WCAG22/Understanding/animation-from-interactions.html) |

---

## Speech

People with speech disabilities may be unable to use voice reliably, or at all.
Any product that requires speech as the only input shuts them out.

**How many people:**

| Region | Figure | Source |
| --- | --- | --- |
| US, voice problems | 17.9 million adults (7.6%) reported a voice problem in the past 12 months (2012 data) | [NIDCD](https://www.nidcd.nih.gov/health/statistics/quick-statistics-voice-speech-language) |
| US, stuttering | More than 3 million people (about 1%) | [NIDCD](https://www.nidcd.nih.gov/health/statistics/quick-statistics-voice-speech-language) |
| Global | Not available | WHO publishes no speech-specific global figure |

The voice-problems and stuttering figures count different, overlapping groups.
Do not add them.

**Functional needs:**

| Functional need | Conditions (examples) | Tools they use | What we can do | References |
| --- | --- | --- | --- | --- |
| Cannot use voice reliably or at all | muteness, severe dysarthria, apraxia of speech | speech-generating devices, AAC, text input | never require voice as the only input, give text alternatives to voice commands | [WAI: Speech](https://www.w3.org/WAI/people-use-web/abilities-barriers/speech/) |
| Speech understood by people but not by voice recognition | dysarthria, cluttering | typed and text-based input | do not gate features on voice recognition, always offer typed input | [WAI: Speech](https://www.w3.org/WAI/people-use-web/abilities-barriers/speech/) |
| Needs more time, no time pressure to speak | stuttering | text chat | offer text support channels, avoid timed voice prompts | [WAI: Speech](https://www.w3.org/WAI/people-use-web/abilities-barriers/speech/), [SC 2.2.1](https://www.w3.org/WAI/WCAG22/Understanding/timing-adjustable.html) |

---

## Visual

Visual disabilities range from total blindness to low vision, color vision
deficiency, and sensitivity to light. Interfaces that rely on sight alone, or on
color alone to carry meaning, create barriers here.

**How many people:**

| Region | Figure | Source |
| --- | --- | --- |
| US | About 7 million people have vision impairment, including 1 million with blindness (2012 base data). An estimated 93 million adults are at high risk for serious vision loss. | [CDC](https://www.cdc.gov/vision-health/data-research/vision-loss-facts/index.html) |
| Global | At least 2.2 billion people have a near or distance vision impairment, 2026 | [WHO](https://www.who.int/news-room/fact-sheets/detail/blindness-and-visual-impairment) |
| Global, color vision deficiency | About 300 million people; roughly 1 in 12 men (8%) and 1 in 200 women | [Colour Blind Awareness](https://www.colourblindawareness.org/colour-blindness/) |

**Functional needs:**

| Functional need | Conditions (examples) | Tools they use | What we can do | References |
| --- | --- | --- | --- | --- |
| No usable sight | blindness | screen readers (JAWS, NVDA, VoiceOver, TalkBack, Narrator), braille displays | semantic markup, alt text, full keyboard operation, screen-reader testing | [SC 1.1.1](https://www.w3.org/WAI/WCAG22/Understanding/non-text-content.html), [SC 1.3.1](https://www.w3.org/WAI/WCAG22/Understanding/info-and-relationships.html), [SC 2.1.1](https://www.w3.org/WAI/WCAG22/Understanding/keyboard.html), [SC 4.1.2](https://www.w3.org/WAI/WCAG22/Understanding/name-role-value.html) |
| Reduced acuity, needs magnification | low vision | screen magnification (ZoomText, built-in OS zoom) | text resizable to 200% without loss, reflow, scalable layout | [SC 1.4.4](https://www.w3.org/WAI/WCAG22/Understanding/resize-text.html), [SC 1.4.10](https://www.w3.org/WAI/WCAG22/Understanding/reflow.html) |
| Light or contrast sensitivity | low vision (photophobia), contrast sensitivity loss | high-contrast and dark modes | meet contrast ratios, offer dark mode, adjustable brightness | [SC 1.4.3](https://www.w3.org/WAI/WCAG22/Understanding/contrast-minimum.html), [SC 1.4.11](https://www.w3.org/WAI/WCAG22/Understanding/non-text-contrast.html) |
| Cannot distinguish some colors | color vision deficiency | browser and OS color adjustments | never use color as the only signal, pair color with icon and label | [SC 1.4.1](https://www.w3.org/WAI/WCAG22/Understanding/use-of-color.html) |
| No sight and no hearing | deaf-blindness | refreshable braille display | braille and screen-reader support, text alternatives for all media | [SC 1.1.1](https://www.w3.org/WAI/WCAG22/Understanding/non-text-content.html), [SC 1.2.1](https://www.w3.org/WAI/WCAG22/Understanding/audio-only-and-video-only-prerecorded.html) |

---

## Sources

All URLs were fetched and confirmed to load on 2026-06-23. Figures are quoted as
each source states them. The WCAG and W3C guidance links in the References
columns were added and confirmed to load on 2026-07-02.

- W3C WAI, Diverse Abilities and Barriers: https://www.w3.org/WAI/people-use-web/abilities-barriers/
- W3C WAI, WCAG 2.2 Understanding documents (linked per success criterion in the tables): https://www.w3.org/WAI/WCAG22/Understanding/
- W3C, Making Content Usable for People with Cognitive and Learning Disabilities (COGA): https://www.w3.org/TR/coga-usable/
- W3C WAI, How People with Disabilities Use the Web, Speech: https://www.w3.org/WAI/people-use-web/abilities-barriers/speech/
- WHO, Deafness and hearing loss: https://www.who.int/news-room/fact-sheets/detail/deafness-and-hearing-loss
- WHO, Disability and health: https://www.who.int/news-room/fact-sheets/detail/disability-and-health
- WHO, Autism spectrum disorders: https://www.who.int/news-room/fact-sheets/detail/autism-spectrum-disorders
- WHO, Dementia: https://www.who.int/news-room/fact-sheets/detail/dementia
- WHO, Blindness and vision impairment: https://www.who.int/news-room/fact-sheets/detail/blindness-and-visual-impairment
- CDC, Disability Impacts All of Us: https://www.cdc.gov/disability-and-health/articles-documents/disability-impacts-all-of-us-infographic.html
- CDC, Vision loss facts: https://www.cdc.gov/vision-health/data-research/vision-loss-facts/index.html
- CDC MMWR, ADHD in US adults (2024): https://www.cdc.gov/mmwr/volumes/73/wr/mm7340a1.htm
- CDC, Autism data and research: https://www.cdc.gov/autism/data-research/index.html
- NIDCD, Quick statistics about hearing: https://www.nidcd.nih.gov/health/statistics/quick-statistics-hearing
- NIDCD, Quick statistics about voice, speech, language: https://www.nidcd.nih.gov/health/statistics/quick-statistics-voice-speech-language
- NIH NICHD, Intellectual and developmental disabilities, risk: https://www.nichd.nih.gov/health/topics/idds/conditioninfo/risk
- Colour Blind Awareness: https://www.colourblindawareness.org/colour-blindness/
