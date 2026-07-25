---
number: 5
title: "You can see the junk file in the Save dialog — you just can't delete it"
tagline: "The Save/Open dialog is a full file browser: navigate, search, New Folder. But it's crippled — no delete, no cleanup. Spot a file to bin while you're saving and you must remember to do it later in Finder. You won't."
difficulty: easy
todo: "Frequency & population are estimates"
platforms: [Apple, Microsoft]
lifetimes:
  low: 30
  headline: 350
  high: 4000
facts:
  - label: "Active Windows devices (same dialog, same limit)"
    value: "~1.5 billion"
    source: "Microsoft"
    url: "https://news.microsoft.com/"
  - label: "macOS Save/Open panel"
    value: "system-wide component"
    source: "AppKit NSSavePanel / NSOpenPanel — same limitation everywhere it appears"
    url: "https://developer.apple.com/documentation/appkit/nssavepanel"
  - label: "Global life expectancy"
    value: "73 years"
    source: "World Bank, 2023"
    url: "https://data.worldbank.org/indicator/SP.DYN.LE00.IN"
assumptions:
  - label: "People who regularly save via desktop file dialogs"
    low: "600M"
    headline: "1B"
    high: "1.8B"
  - label: "Blocked-cleanup moments per person per week"
    low: "0.5"
    headline: "1"
    high: "5"
    note: "A moment where you see a file you'd delete on the spot if the dialog let you."
  - label: "Seconds lost each time"
    low: "5s"
    headline: "15s"
    high: "40s"
    note: "The context-switch to go do it in Finder — or the amortised cost of the clutter you forgot to clear."
owner: "OS file-dialog teams (Apple AppKit NSSavePanel/NSOpenPanel · Windows common file dialog)"
channel: "Apple Feedback Assistant · Windows Feedback Hub"
---

The Save dialog is *almost* a file manager. It navigates folders, it searches, it sorts by size
and date, it makes New Folders. It shows you everything. It just won't let you **remove** anything.
So the instant you notice a stray file — a duplicate, a failed export, obvious junk — you're stuck:
act on it means quit the dialog, open Finder, re-navigate to the same folder, delete, come back.
Nobody does that mid-save. You tell yourself "later," and the junk quietly accumulates forever.

## Seen in the wild

A real Save panel: two near-identical 2.3 MB PDFs of the same document, one prefixed `Gmail -`
(the tell-tale print-to-PDF naming). Exactly the duplicate you'd bin without thinking — sitting
right there in the list, un-deletable. This case compounds the print-to-PDF one: that flow
*creates* the duplicate; this dialog *forbids* you cleaning it up in the one moment you see it.

## The math

<p class="equation">1B people <span class="op">×</span> ~1 blocked cleanup / week <span class="op">×</span> 15s <span class="eq">=</span> <span class="out">≈ 350 lifetimes / year</span></p>

Band: **~30 to ~4,000 lifetimes/year** — wide, because both the population and the frequency are
estimates (see TODO). And the true harm is partly *deferred*: much of the time you don't spend the
seconds, you just forget — and pay later in disk clutter and the nagging "I meant to delete that."

## Why it happens

**Asymmetric capability.** The dialog was built to *place* a file, so it got just enough
file-management to do that — navigation, New Folder — and no more. But "just enough" drew the line
in the wrong place: you can *create* a folder but not *delete* a file, even though you're looking
straight at it. The action is denied precisely where it's most natural — right place, wrong time.

## The fix

Let the Save/Open panel do what its own right-click menu nearly already does: **Move to Trash**
(and rename). It's the same file system, the same folder, the same user who has permission to
delete it one context-switch away. There is no safety argument — a Trash is undo-able. The only
reason it's absent is that nobody extended the dialog past its original job.

<div class="todo" markdown="1">
**Population and frequency are estimates, so treat the headline as order-of-magnitude.** Only the
device-count and life-expectancy figures are cited. The exact affordances also vary by OS and app
version (some panels allow rename or a limited right-click menu; none reliably offer delete/Trash) —
worth a per-platform check before quoting specifics. The confident claim is the **pattern and the
low end (~30 lifetimes/yr)**, not the headline.
</div>

## Difficulty to fix: easy

> You're staring at the file you want gone. You have permission to delete it. The dialog is a file
> browser in every respect but the one that would help. Add Move-to-Trash and let people clean up
> in the moment they notice — instead of remembering to, later, which they won't.
