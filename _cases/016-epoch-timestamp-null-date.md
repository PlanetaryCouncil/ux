---
number: 16
title: "Every file says 1 January 1970"
tagline: "Drag an image out of an app and it lands with a timestamp of 1 Jan 1970, 01:00 — the Unix epoch. It isn't a date, it's \"no value\" wearing a costume. Sort by date and the whole pile is unsortable."
difficulty: easy
todo: "Source-app vs Finder split & frequency unverified"
platforms: [Apple]
lifetimes:
  low: 1
  headline: 12
  high: 80
facts:
  - label: "Unix epoch"
    value: "1 Jan 1970, 00:00 UTC"
    source: "timestamp zero — shown as 01:00 in UTC+1"
    url: "https://en.wikipedia.org/wiki/Unix_time"
  - label: "Apple active devices"
    value: "2.2 billion"
    source: "Apple, 2024 — Macs are a subset"
    url: "https://www.apple.com/newsroom/"
  - label: "Global life expectancy"
    value: "73 years"
    source: "World Bank, 2023"
    url: "https://data.worldbank.org/indicator/SP.DYN.LE00.IN"
assumptions:
  - label: "Mac users who hit epoch-dated files"
    low: "10M"
    headline: "30M"
    high: "80M"
    note: "Anyone who regularly drags images out of apps onto the Desktop or into folders."
  - label: "Times per year it costs them something"
    low: "6"
    headline: "24"
    high: "60"
  - label: "Seconds lost each time"
    low: "15s"
    headline: "40s"
    high: "120s"
    note: "Not just the confusion — sorting by date is dead for that whole class of file, so finding the one you just made means scanning names instead."
owner: "Apple (Finder date display) + whichever app writes the file without a timestamp"
channel: "Apple Feedback Assistant"
---

A folder of images, every single one stamped **1 Jan 1970 at 01:00.** That's not a date the files
acquired — it's **timestamp zero**, the Unix epoch, displayed literally. The file has no valid
modification time, and instead of saying so, the interface renders the null as a real-looking date.

## Why it's worse than cosmetic

If it were only strange-looking you'd shrug. But a date is a **sorting key**, and this destroys it:

- **Sort by Date Modified** and every affected file collapses into one indistinguishable clump. The
  file you made ten seconds ago sorts identically to one from last year.
- **Newest-first stops working**, which is how most people find the thing they just made.
- It poisons anything downstream that trusts dates — smart folders, date-filtered search, and
  [Recents](/cases/011-recents-ignores-downloads/), which is already bad at noticing new files.

So the harm isn't one moment of confusion; it's a **permanent loss of chronology** for that whole class
of file. You're reduced to hunting by name.

## Why it happens

Two failures meet:

1. **The source app writes no timestamp** when handing over a dragged file, so the field is left at 0.
2. **Finder renders 0 as a date** instead of recognising it as "unset."

Zero is a legitimate instant in the Unix representation — midnight, 1 Jan 1970 — so a naïve formatter
converts it happily and produces something that *looks* like data. That's what makes it dangerous: a
missing value disguised as a present one. An empty cell you'd notice; a plausible wrong date you won't.

## The math

<p class="equation">30M Mac users <span class="op">×</span> 24 times/yr <span class="op">×</span> 40s <span class="eq">=</span> <span class="out">~12 lifetimes / year</span></p>

## The fix

**Never render a null as a value.** Either show it as absent — an em-dash, "—", "Unknown" — or fall
back to something true, like the moment the file was actually written to disk. Both are more useful
than a fictional 1970, and both preserve sortability instead of destroying it.

The deeper rule, and it's a load-bearing one across software: **a sentinel value is not data.** Zero,
`-1`, `9999`, the empty string — they mean "we don't know," and the moment they reach a formatter that
treats them as real, the interface starts lying with a straight face.

<div class="todo" markdown="1">
**Unverified split.** Which side is at fault — the app writing the file, or Finder formatting the zero —
depends on the source app, and the fix is genuinely cheaper on whichever side is closer. Reproducing
across several source apps would settle it. Frequency and affected-population figures are estimates;
only the epoch definition and Apple's device count are cited.
</div>

## Difficulty to fix: easy

> The file was made moments ago. The computer knows this — it wrote the bytes. Yet it displays a date
> from before most of its users were born, because nobody taught the formatter what "no value" looks
> like. Show a dash. Or show the truth.
