---
number: 28
title: "Pinch to zoom works everywhere except the one window full of pictures"
tagline: "Preview, Photos, Safari, Maps, Quick Look — pinch zooms. Finder's icon view, a grid of thumbnails, ignores it. It used to work. Apple took it out."
difficulty: none
todo: "Behaviour varies by macOS version — confirm the removal point"
platforms: [Apple]
lifetimes:
  low: 1
  headline: 3
  high: 20
facts:
  - label: "Pinch-to-zoom in Finder icon view"
    value: "removed in recent macOS"
    source: "previously worked; alternatives are the slider or ⌘= / ⌘−"
    url: "https://mnsoft.org/add-pinch-in-and-pinch-out-icon-zoom-back-into-apples-finder/"
  - label: "Where pinch still works"
    value: "Preview · Photos · Safari · Maps · Quick Look · PDFs"
    source: "the platform-wide convention"
  - label: "Apple active devices"
    value: "2.2 billion"
    source: "Apple, 2024 — Macs are a subset"
    url: "https://www.apple.com/newsroom/"
  - label: "Global life expectancy"
    value: "73 years"
    source: "World Bank, 2023"
    url: "https://data.worldbank.org/indicator/SP.DYN.LE00.IN"
assumptions:
  - label: "Mac users who reach for pinch in Finder"
    low: "30M"
    headline: "60M"
    high: "120M"
  - label: "Times per year"
    low: "6"
    headline: "12"
    high: "40"
  - label: "Seconds lost each time"
    low: "4s"
    headline: "8s"
    high: "20s"
    note: "Pinch, nothing, pinch again harder, then go find the slider or remember the keyboard shortcut."
owner: "Apple (Finder icon view)"
channel: "Apple Feedback Assistant"
---

A Finder window in icon view is a grid of thumbnails — the most zoom-shaped content on the machine. You
pinch. Nothing happens.

Pinch works in Preview. In Photos. In Safari. In Maps. In Quick Look — which is *the same thumbnails*,
one keypress away. It works on the desktop with a modifier. It does not work here.

## A removed gesture is worse than an absent one

This isn't an oversight; the gesture **used to work** and was taken out. That changes the character of
the failure:

- **Learned behaviour gets invalidated.** Everyone who built the habit now has a reflex that silently
  fails in one place. They didn't get it wrong — the ground moved.
- **A dead gesture gives no feedback.** A button that does nothing is at least visibly a button. A pinch
  that does nothing is indistinguishable from a broken trackpad, a frozen window, or your own bad
  technique. You try again, harder, before concluding anything.

That ambiguity is the real cost. The user can't tell a *deliberate omission* from a *fault*, so they
debug instead of adapting.

## The principle

**A gesture that means one thing everywhere must mean it everywhere.** Platform conventions are a
contract: the OS teaches pinch = zoom across a dozen apps, and every exception is a small tax charged to
everyone who believed the lesson. Consistency is worth more than any local justification for breaking it
— and there's no obvious local justification here, since resizing icons is exactly what pinch would mean.

## The math

<p class="equation">60M Mac users <span class="op">×</span> 12 attempts/yr <span class="op">×</span> 8s <span class="eq">=</span> <span class="out">~3 lifetimes / year</span></p>

## Meanwhile, what does work

- **⌘=** and **⌘−** resize icons in Finder.
- The **slider in the bottom-right** of the window in icon view.
- **⌘J** opens View Options with an icon-size slider, per folder.
- On the **desktop**, holding right-click while sliding two fingers resizes icons.

Four separate mechanisms for the thing one universal gesture would have covered — which is itself the
tell that the gesture belongs here.

<div class="todo" markdown="1">
**Version-dependent.** Pinch-to-zoom in Finder has come and gone across macOS releases, and some sources
describe a trackpad or Finder setting that re-enables it. The exact removal point and whether any
official toggle survives should be confirmed against current macOS before this is quoted. The stable
observation is the inconsistency: pinch zooms in Apple's own image-viewing apps and not in Apple's own
image-grid view.
</div>

## Difficulty to fix: none

> The gesture handler exists throughout the operating system. The content is thumbnails. The intent is
> unambiguous. Reconnect the wire.
