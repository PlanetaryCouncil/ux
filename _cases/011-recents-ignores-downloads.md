---
number: 11
title: "You just downloaded it — but \"Recents\" only counts what you've opened"
tagline: "On the Mac, Recents lists files you've opened, not files you saved or downloaded. So the file that arrived thirty seconds ago — the most recent thing you own — isn't in Recents. You go looking. It isn't there."
difficulty: easy
todo: "macOS indexing behaviour & frequency need checking"
platforms: [Apple]
lifetimes:
  low: 10
  headline: 80
  high: 350
facts:
  - label: "Apple active devices (Macs are a subset)"
    value: "2.2 billion"
    source: "Apple, 2024"
    url: "https://www.apple.com/newsroom/"
  - label: "Global life expectancy"
    value: "73 years"
    source: "World Bank, 2023"
    url: "https://data.worldbank.org/indicator/SP.DYN.LE00.IN"
assumptions:
  - label: "Active Mac users"
    low: "100M"
    headline: "200M"
    high: "250M"
    note: "The Mac slice of Apple's active-device base — an estimate."
  - label: "Times/year you expect a just-saved file in Recents and it's absent"
    low: "26"
    headline: "78"
    high: "156"
  - label: "Seconds lost hunting each time"
    low: "8s"
    headline: "12s"
    high: "20s"
owner: "Apple (Finder \"Recents\" smart folder · Spotlight metadata)"
channel: "Apple Feedback Assistant"
---

You save or download a file. You go to **Recents** to grab it — because what could be more recent than
the thing that just landed? It isn't there. Recents, it turns out, means "recently **opened**," not
"recently **arrived**." A file you created or downloaded but haven't opened doesn't count as recent to
the one folder whose entire job is recency. So you bounce to Downloads, or search by half-remembered name.

## The math

<p class="equation">200M Macs <span class="op">×</span> ~1.5 missed lookups/week <span class="op">×</span> 12s <span class="eq">=</span> <span class="out">~80 lifetimes / year</span></p>

Band **~10 to ~350 lifetimes/year** on the population and frequency estimates. Small, constant, and
paid by the person doing the most ordinary thing there is: getting a new file onto their computer.

## Why it happens

Recents is a smart folder sorted by **date last opened**. Downloading or saving *creates* a file — it
sets "date added" and "date modified" — but it never "opens" it, so the query that builds Recents
skips right past it. The definition of "recent" was written from the app's point of view (files I've
had open), not the human's (files that recently entered my life). Those diverge exactly at the moment
you most need them to agree: right after a download.

## The "where's my file?" family

This is the third face of one problem — **the system's model of your files doesn't match yours**:

- [Case 005](/cases/005-save-dialog-cant-delete/) — the Save dialog shows files but won't let you delete them.
- [Case 008](/cases/008-print-to-pdf-not-in-downloads/) — print-to-PDF skips Downloads and the download list.
- **This one** — Recents omits the file that's most recent of all.

Each is a small mismatch between where a file *is* and where your head says it should be.

## The fix

Index **date-added** and **date-modified**, not just date-opened, when building Recents — or add a
"Recently added" view alongside it. A downloaded file is a recent file; the smart folder should say so.
It's a query change, not an architecture change.

<div class="todo" markdown="1">
**macOS indexing behaviour varies by version and by how the file was written**, so the exact rule
("never shows" vs "shows only after opening") should be verified against current macOS before this is
quoted as settled. Population and frequency are estimates; only the Apple device count and life
expectancy are cited. The confident claim is the *mismatch* — "recent" defined as opened, not arrived.
</div>

## Difficulty to fix: easy

> The file landed on your Mac seconds ago. It is, by any human definition, your most recent file. The
> folder called Recents disagrees, because it only counts what you've opened. Count what arrived, too.
