---
number: 14
micro: true
micro_line: "≈0.2 lifetimes / year"
title: "Dictation eats the words you typed to fix dictation"
tagline: "The recogniser can't spell CrossFit. So you pause, type it by hand, and carry on — and the live transcript overwrites the field, taking your typed words with it. The workaround for the bug is destroyed by the bug."
difficulty: none
todo: "Scope beyond Claude unverified — see note"
platforms: [Anthropic]
facts:
  - label: "Claude web app monthly active users"
    value: "~18.9 million"
    source: "third-party estimate, 2026 — sources conflict, see case 012"
    url: "https://backlinko.com/claude-users"
  - label: "Reproduced"
    value: "Claude desktop app, 38s screen recording"
    source: "live interim transcript visibly streaming into the composer"
  - label: "Global life expectancy"
    value: "73 years"
    source: "World Bank, 2023"
    url: "https://data.worldbank.org/indicator/SP.DYN.LE00.IN"
owner: "Anthropic (Claude desktop & web dictation)"
channel: "In-app feedback · support.anthropic.com"
---

Dictation mishears a word it was never going to get — a brand, a surname, jargon. **CrossFit.** So you
do the obvious thing: stop talking, type the word properly with the keyboard, resume speaking.

Then the live transcript updates, rewrites the field, and **your typed text is gone.**

## The compounding failure

Two bugs stacked, and the second one eats the fix for the first:

1. **Speech recognition can't reliably handle proper nouns and jargon.** Forgivable — a genuinely hard
   problem that will always be somewhat true.
2. **The system destroys the one obvious human remedy.** Typing the hard word by hand is exactly the
   right move. The interface punishes it.

A limitation you can work around is a nuisance. A limitation whose workaround is demolished is a trap —
and it teaches people to stop trying, the worst outcome an interface can produce.

## Why it happens — and why the competitor doesn't have it

This is a consequence of one design choice: **when does the transcript enter the field?**

| | Behaviour | Conflict window |
|---|---|---|
| **Claude** | Streams the *interim* hypothesis live into the composer, revising it as you speak | **The whole time you're dictating** |
| **ChatGPT** | Shows a waveform while recording, inserts the final transcript once at the end | **None** |

Live streaming is nicer to watch — you see it working. But it means the engine is continuously
rewriting the field from its own private buffer, and anything a human typed in the meantime isn't in
that buffer. Classic **last-writer-wins clobbering**: an asynchronous process assuming nothing else can
touch what it's editing. That assumption is false the entire time the user has a keyboard.

**The fix already ships in a competing product.** You don't have to imagine the solution — you can go
look at it. That's the strongest possible case for *difficulty: none*.

## Keeping the live transcript *and* fixing it

Deferring insertion isn't the only option; live streaming can be kept. The cheap fix: **when a keystroke
arrives, commit the current hypothesis and start a new segment.** The already-spoken text becomes final
and untouchable, the typed text sits safely after it, dictation continues from there. That's a keystroke
listener and a buffer flush.

The robust version is a solved problem — text editors and collaborative editing worked this out decades
ago: track the range you inserted, only rewrite within it, reconcile rather than clobber.

**The principle: one input method must never destroy another's input.** A keyboard and a microphone
aimed at the same field are two hands on the same page. The system's job is to let both write.

## Why this is filed as a micro case

Sized on Claude's own user base — a fraction of whom dictate, a fraction of *those* who attempt the
pause-and-type workaround — it lands around **0.2 lifetimes a year.** Real, small, and the
[third self-indictment-or-near-it](/cases/012-empty-disclosure-control/) on this site.

<div class="todo" markdown="1">
**Scope is the open question, and it's worth two orders of magnitude.** This is confirmed in Claude
(screen-recorded) and reported *absent* in ChatGPT. What's **not** verified is whether OS-level
dictation — macOS, Windows voice typing, Android — shares the flaw. Those also stream interim results
live, so they're architecturally exposed to it, but "exposed" isn't "confirmed" and this site doesn't
publish inferred numbers.

If it turns out the pattern holds across system dictation, the honest figure is **tens of lifetimes a
year, not tenths.** Testing four dictation implementations for the pause-and-type clobber is an
afternoon's work and would settle it. Until then: micro.
</div>

## Difficulty to fix: none

> The machine mishears you, so you reach for the keyboard — the one tool that always works. And the
> machine deletes what you typed, because it assumed nothing else was allowed to write. Commit on
> keystroke. Two inputs, one field, nobody's words erased.
