---
number: 14
title: "Dictation eats the words you typed to fix dictation"
tagline: "The recogniser can't spell CrossFit. So you pause, type it by hand, and carry on — and the moment dictation resumes it overwrites the field and your typed words are gone. The workaround for the bug is destroyed by the bug."
difficulty: easy
todo: "Frequency & cross-app behaviour are estimates"
platforms: [OpenAI, Apps]
lifetimes:
  low: 2
  headline: 15
  high: 100
facts:
  - label: "People using ChatGPT voice & dictation weekly"
    value: "150 million+"
    source: "OpenAI / reported figures, 2026"
    url: "https://www.demandsage.com/chatgpt-statistics/"
  - label: "ChatGPT weekly active users"
    value: "~900 million"
    source: "reported, February 2026"
    url: "https://sqmagazine.co.uk/chatgpt-statistics/"
  - label: "Global life expectancy"
    value: "73 years"
    source: "World Bank, 2023"
    url: "https://data.worldbank.org/indicator/SP.DYN.LE00.IN"
assumptions:
  - label: "Dictation users who try the pause-and-type workaround"
    low: "10%"
    headline: "20%"
    high: "40%"
    note: "Anchored on the cited ChatGPT voice figure alone — a floor. The same pattern appears in system dictation on other platforms, which would push this up."
  - label: "Times per year their typed text gets clobbered"
    low: "12"
    headline: "52"
    high: "150"
  - label: "Seconds to notice, re-type and re-place the lost words"
    low: "10s"
    headline: "20s"
    high: "45s"
owner: "Dictation / speech-input teams (OpenAI voice input · OS-level dictation)"
channel: "In-app feedback · platform speech-input bug trackers"
---

Dictation mishears a word it was never going to get — a brand, a proper noun, jargon. **CrossFit.**
A technical term. Someone's surname. So you do the obvious thing: stop talking, type the word properly
with the keyboard, and resume speaking.

Then the recogniser finalises its transcript, rewrites the whole field, and **your typed text is gone.**

## The compounding failure

Two bugs stacked, and the second one eats the fix for the first:

1. **Speech recognition can't reliably handle proper nouns and jargon.** That's forgivable — it's a hard
   problem, and it will always be somewhat true.
2. **The system destroys the one obvious human remedy.** Typing the hard word by hand is exactly the
   right move. The interface punishes it.

A limitation you can work around is a nuisance. A limitation whose workaround is actively demolished is
a trap — and it teaches people not to try, which is the worst outcome an interface can produce.

## Why it happens

The dictation engine treats the text field as **exclusively its own**. It keeps a private buffer of the
current utterance, and when the recogniser revises its hypothesis (which it does constantly — that's why
words visibly change as you speak), it rewrites the field from that buffer. Anything a human inserted in
the meantime isn't in the buffer, so it gets overwritten. Classic **last-writer-wins clobbering**: an
asynchronous process assuming nothing else can touch the thing it's editing.

That assumption is false the entire time the user has a keyboard.

## The math

<p class="equation">150M weekly voice users <span class="op">×</span> 20% <span class="op">×</span> 52 clobbers/yr <span class="op">×</span> 20s <span class="eq">=</span> <span class="out">~15 lifetimes / year</span></p>

Anchored on the ChatGPT voice figure alone, so treat it as a **floor** — the same pattern shows up in
system-level dictation across platforms, which would push it higher.

## The fix

The robust version is a solved problem — text editors and collaborative editing worked this out decades
ago: **track the range you inserted, only rewrite within it, and reconcile rather than clobber.**

But you don't even need that. The cheap 80% fix: **when a keystroke arrives, commit the current
hypothesis and start a new segment.** The already-spoken text becomes final and untouchable, the typed
text sits safely after it, and dictation continues from there. That's a keystroke listener and a buffer
flush.

**The principle: one input method must never destroy another's input.** A keyboard and a microphone
aimed at the same field are two hands on the same page — the system's job is to let both write, not to
let the louder one erase the other.

<div class="todo" markdown="1">
**Estimates and scope.** The user and voice-usage counts are cited, but the share of people who attempt
the pause-and-type workaround, and how often they're clobbered, are reasoned figures. Exact behaviour
also varies by app and platform — some implementations commit on pause and don't exhibit this at all, so
the per-app behaviour should be checked before naming any specific product as the sole offender. The
confident claim is the *pattern*: a dictation buffer that owns the field and overwrites concurrent edits.
</div>

## Difficulty to fix: easy

> The machine mishears you, so you reach for the keyboard — the one tool that always works. And the
> machine deletes what you typed, because it assumed nothing else was allowed to write. Commit on
> keystroke. Two inputs, one field, nobody's words erased.
