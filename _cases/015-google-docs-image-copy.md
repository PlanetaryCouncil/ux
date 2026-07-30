---
number: 15
title: "You can't copy an image out of Google Docs"
tagline: "Copy the image. Paste it into chat, into Miro, into a tweet. Nothing arrives. So you paste it into Notes, drag that to the Desktop, find the file, and upload it — four steps to move a picture two centimetres."
difficulty: easy
todo: "Frequency & share of users are estimates"
platforms: [Google]
lifetimes:
  low: 3
  headline: 20
  high: 150
facts:
  - label: "Google Docs monthly users"
    value: "1 billion"
    source: "Workspace statistics, 2026"
    url: "https://aispreadsheetgenerator.com/google-docs-statistics/"
  - label: "Google Workspace users overall"
    value: "3 billion+"
    source: "Google, 2025"
    url: "https://sqmagazine.co.uk/google-workspace-statistics/"
  - label: "Global life expectancy"
    value: "73 years"
    source: "World Bank, 2023"
    url: "https://data.worldbank.org/indicator/SP.DYN.LE00.IN"
assumptions:
  - label: "Docs users who ever try to copy an image out"
    low: "10%"
    headline: "20%"
    high: "40%"
  - label: "Times per year they do it"
    low: "3"
    headline: "6"
    high: "20"
  - label: "Seconds lost to the workaround ritual"
    low: "20s"
    headline: "40s"
    high: "90s"
    note: "Copy → paste into a second app → drag out as a file → locate it → upload. Against ~3s for a copy-paste that worked."
owner: "Google (Docs clipboard / editor)"
channel: "Google Docs Help Community · Workspace feedback"
---

There's an image in a Google Doc. You want it in a chat message. The obvious move — **copy, paste** —
produces nothing useful at the other end. So you perform the ritual instead:

1. Copy the image in Docs
2. Paste it into some *other* app that will accept it — Notes, Preview, a scratch document
3. Drag it from there onto the Desktop to get a real file
4. Find that file and upload it

Four steps, two intermediary apps, and a stray file left on your Desktop — to move a picture from one
window to another.

## Why it happens

The clipboard is **multi-format by design.** When you copy, an app can publish the same content in
several representations at once — rich text *and* plain text, or an internal object *and* a plain
`image/png` bitmap — and each receiving app takes whichever flavour it understands. That's how
copy-paste manages to work at all between unrelated programs.

Google Docs publishes its own internal representation, which only Docs and a few Google surfaces know
how to read. Anything else — Slack, a chat box, Miro, a tweet — looks at the clipboard, finds no format
it recognises, and gets nothing. **Docs already has the image bytes.** It simply doesn't offer them in a
form the rest of the computer speaks.

## The math

<p class="equation">1B Docs users <span class="op">×</span> 20% <span class="op">×</span> 6 times/yr <span class="op">×</span> 40s <span class="eq">=</span> <span class="out">~20 lifetimes / year</span></p>

## The fix

**Put a standard bitmap on the clipboard alongside the private format.** One extra flavour, published
at copy time, and every one of those four steps collapses back into paste. The receiving app doesn't
need to know anything about Google Docs — that's exactly the point of a multi-format clipboard.

**The principle: the clipboard is an interop surface, not a private channel.** If you put something on
it, include at least one representation the rest of the world can read. An app that only speaks to
itself on a shared bus is a walled garden inside a system designed for exchange.

<div class="todo" markdown="1">
**Estimates.** The Docs and Workspace user counts are cited; the share of users who attempt an image
copy and how often are reasoned figures. Behaviour also varies by browser, OS and destination app — some
combinations do carry the image through — so the per-target matrix should be tested before naming any
specific pairing as broken. The confident claim is the *pattern*: an internal-only clipboard format.

Also worth noting Docs offers escape hatches (right-click → save to Keep, or File → Download as a web
page to extract images). They confirm the bytes are right there; they just aren't on the clipboard.
</div>

## Difficulty to fix: easy

> The image is on your screen. You pressed copy. The bytes exist. Everything needed for this to work is
> already in memory — the only thing missing is a format anyone else can read.
