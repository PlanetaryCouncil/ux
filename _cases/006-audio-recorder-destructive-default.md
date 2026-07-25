---
number: 6
title: "The recording that deletes itself if you flinch"
tagline: "You dictate an idea. To keep it you must hit confirm — but the default, resting-finger action is discard, and the button moved since you last looked. One reflex and the only copy is gone."
difficulty: none
todo: "Population & frequency are estimates"
platforms: [Apps]
lifetimes:
  low: 5
  headline: 30
  high: 300
facts:
  - label: "Smartphone users worldwide"
    value: "~4.7 billion"
    source: "GSMA / analyst estimates, 2026"
    url: "https://www.gsma.com/r/somic/"
  - label: "Global life expectancy"
    value: "73 years"
    source: "World Bank, 2023"
    url: "https://data.worldbank.org/indicator/SP.DYN.LE00.IN"
assumptions:
  - label: "People who capture voice notes / dictate"
    low: "150M"
    headline: "300M"
    high: "600M"
  - label: "Recordings lost to the trap per person per year"
    low: "1"
    headline: "2"
    high: "6"
  - label: "Cost each — as re-record seconds (undersells it)"
    low: "60s"
    headline: "120s"
    high: "300s"
    note: "A price on the time only. The real loss — a unique spoken idea, unrecoverable — has no honest seconds figure."
owner: "Recorder-app teams (OS voice memo apps, dictation tools, meeting recorders)"
channel: "Per-app feedback · OS voice-memo bug trackers"
---

You speak an idea into a recorder. To keep it, you have to hit **confirm** — and three things
conspire against you: the discard action is the *default* your finger rests on, the confirm button
has **moved** since the last screen so your muscle memory is void, and the stakes are inverted —
the reflex saves nothing and the effort saves everything. One tired tap and the recording is gone.

## Why it's the nastiest of the small ones

It fuses two failures this site catalogues separately:

- **Wrong default** (see [case 001](/cases/001-chrome-password-empty-username/)): the pre-selected,
  least-effort action is the destructive one.
- **Data loss** (see [case 002](/cases/002-browser-form-data-loss/)): the content is *unique*. Unlike
  a form you can re-type, a spoken thought existed for thirty seconds in your voice and nowhere else.

The victim is precisely the person with the most to lose: someone capturing an idea they haven't
written down. The recording *is* the only copy, and the default button's job is to erase it.

## The math

<p class="equation">300M people <span class="op">×</span> 2 lost recordings/yr <span class="op">×</span> 120s <span class="eq">=</span> <span class="out">~30 lifetimes / year</span></p>

That number counts only *seconds re-recorded* — and it undersells the harm badly, because the worst
losses are ideas that never come back at all. Lost work isn't fungible with time; treat the ~30 as a
floor on a harm whose real size is unmeasurable.

## The fix: durable-by-default

Capture tools should never hold the recording in volatile state awaiting a save a flinch can destroy.
Stream it to storage **as it records**; "Stop" merely finalises a file that's already safe; and
**"Discard" becomes the effortful, undo-able action** — dropped to a short-lived trash, never the void.
The reflex should preserve; only deliberate intent should destroy. Storage is ~free; a unique idea is
priceless. Every incentive points at persist-by-default, and the app does the opposite.

<div class="todo" markdown="1">
**Population and frequency are estimates — treat the headline as order-of-magnitude.** Only smartphone
penetration and life expectancy are cited. The honest, confident claim is the *pattern* and the fact
that the harm is **lost work, not lost time** — which the napkin can't fully price.
</div>

## Difficulty to fix: none

> You spoke it once. The device recorded every word. Then it arranged the buttons so that the
> tired, obvious tap throws your idea into the void. Persist by default; make destruction the
> deliberate act. This is a few lines of code standing between a thought and its only copy.
