---
number: 32
title: "A video player with the seek bar taken out — you can't rewind a reel on a computer"
tagline: "Something went past three seconds ago and you want it again. On a phone you press and drag back to it. In a desktop browser there is nothing to drag: no scrubber, no seek, no arrow keys. The only way back is to let the entire thing play again from the beginning."
difficulty: easy
todo: "Instagram's web player varies by entry point and rollout — verify current behaviour per surface before quoting as settled"
platforms: [Meta, Web]
lifetimes:
  low: 9
  headline: 163
  high: 3100
facts:
  - label: "Instagram monthly active users"
    value: "~3 billion"
    source: "Statista, 2025"
    url: "https://www.statista.com/topics/1882/instagram/"
  - label: "Visits to instagram.com per month"
    value: "~7.4 billion"
    source: "Business of Apps, 2026"
    url: "https://www.businessofapps.com/data/instagram-statistics/"
  - label: "Desktop share of instagram.com web visits"
    value: "~42%"
    source: "Business of Apps, 2026"
    url: "https://www.businessofapps.com/data/instagram-statistics/"
  - label: "Seeking support in the underlying element"
    value: "built in since 2010"
    source: "HTML5 <video> — currentTime is writable, and browsers ship a seek bar by default"
    url: "https://developer.mozilla.org/en-US/docs/Web/API/HTMLMediaElement/currentTime"
  - label: "Global life expectancy"
    value: "73 years"
    source: "World Bank, 2023"
    url: "https://data.worldbank.org/indicator/SP.DYN.LE00.IN"
assumptions:
  - label: "People watching reels in a desktop browser"
    low: "80M"
    headline: "150M"
    high: "400M"
    note: "A slice of the desktop web audience — weighted toward people using Instagram as a source of material rather than a feed."
  - label: "Times a year you want to go back a few seconds"
    low: "25"
    headline: "100"
    high: "300"
  - label: "Seconds lost per replay"
    low: "10s"
    headline: "25s"
    high: "60s"
    note: "You cannot jump to the moment, so you pay for the footage before it — often more than once, because the second attempt overshoots too."
owner: "Meta (Instagram web client)"
channel: "Instagram Help Centre · report a problem"
---

You're watching a reel on a computer. A frame goes past that you actually wanted — a detail, a
caption, a shot you meant to screenshot. You reach for the progress bar to drag back three seconds.

There isn't one.

No scrubber. No seek. Arrow keys do nothing. The video is playing in a browser, in an element
whose entire purpose is to let you move around inside a video, and every control for doing so has
been taken away. Your only route back to a moment you just watched is to **watch everything before
it again**, in real time, and try to catch it live.

## What it costs is the footage before the moment

This is why the loss is measured in tens of seconds rather than the half-second a drag would take.
Seeking is not a convenience on top of playback — it's the thing that makes a recording different
from a broadcast. Remove it and a 40-second reel stops being a file you can inspect and becomes a
performance you have to attend.

And it gets worse with repetition. You restart, you wait, you miss it again by a beat because you
were reaching for the keyboard, and you pay the full toll a second time. Anyone who has tried to
pull one clean frame out of a reel has done this three times in a row.

## Why it's specifically anti-work

Instagram is a library as much as a feed: it's where the footage is, where the reference is, where
the thing a client mentioned lives. Using it on a desktop is a strong signal that you are
**working** — the editor, the files and the screenshot tools are there.

That's the surface where the seek bar is missing. The phone, where you are most likely to be
grazing, has press-and-drag scrubbing. The computer, where you are most likely to be examining
something frame by frame, gets a player you cannot navigate. The affordance is best exactly where
it matters least.

## The math

<p class="equation">150M people <span class="op">×</span> 100 replays/year <span class="op">×</span> 25s <span class="eq">=</span> <span class="out">~163 lifetimes / year</span></p>

Band **~9 to ~3,100 lifetimes/year**. Wide, because both the population and the frequency are
estimates — but note what the low end assumes: only 80 million people, only twice a month, only ten
seconds each. That floor is still nine human lifetimes a year spent re-watching footage someone
already watched.

## Why it happens

This is the part that's hard to be calm about. A reel on the web plays in an HTML5 `<video>`
element. That element has been seekable since 2010: `currentTime` is writable, and **every browser
ships a progress bar for free**. You don't build seeking — you build the thing that hides it.

So the control wasn't overlooked, and it isn't missing for want of engineering. It was
deliberately suppressed, along with the right-click menu that would otherwise offer the native
controls back. Somewhere this was a decision: watch-time is the metric, and a person who can skip
is a person who watches less. The interface is optimised against the person using it.

(Navigating from one reel to the next is absent on the same surface, for what is presumably the
same reason.)

## The fix

Show the progress bar. Make it draggable. Map ← and → to five seconds. This is not a feature —
it is un-hiding the default behaviour of the element already on the page, and it would be a
smaller diff than the code currently suppressing it.

<div class="todo" markdown="1">
**Instagram's web player changes often and behaves differently depending on where the reel was
opened from** (profile grid, saved collection, reels tab, direct link), so the exact shape of this
should be re-checked per surface before it's quoted as settled — including whether a thin
non-interactive progress line is drawn.

The population figure is the weakest number: the ~42% desktop share is a share of *web visits to
instagram.com*, not of Instagram usage overall. Most Instagram use is in the app, and the desktop
slice is far smaller than 42% of three billion — the estimates above assume a small fraction of it.

The confident claim is the asymmetry: **the surface with a keyboard, a mouse and a scroll wheel has
fewer playback controls than the surface with neither.**
</div>

## Difficulty to fix: easy

> The video element on the page can already seek. A browser would give you the bar for nothing.
> Stop hiding it.
