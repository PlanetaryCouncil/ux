---
number: 32
title: "On a phone you swipe to the next reel. On a computer there is no next."
tagline: "Open a reel from someone's profile on your phone and you can keep going — swipe, swipe, swipe. Open the same reel on a desktop browser and it is a dead end: no next, no previous. To see the following one you go back to the grid, find your place again, and click."
difficulty: easy
todo: "Instagram's web player varies by entry point and rollout — verify current behaviour per surface before quoting as settled"
platforms: [Meta, Web]
lifetimes:
  low: 2
  headline: 26
  high: 700
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
  - label: "Gesture cost on mobile"
    value: "one swipe"
    source: "the same content, the same account, the same company"
  - label: "Global life expectancy"
    value: "73 years"
    source: "World Bank, 2023"
    url: "https://data.worldbank.org/indicator/SP.DYN.LE00.IN"
assumptions:
  - label: "People who browse reels from a profile or saved collection on a desktop browser"
    low: "80M"
    headline: "150M"
    high: "400M"
    note: "A slice of the desktop web audience — the people using Instagram as a reference library rather than a feed."
  - label: "Times a year you want the next reel and have to go back for it"
    low: "25"
    headline: "100"
    high: "400"
  - label: "Seconds lost per forced round trip"
    low: "2s"
    headline: "4s"
    high: "10s"
    note: "Close the reel, wait for the grid, find where you were, click the next one. Longer when the grid resets to the top."
owner: "Meta (Instagram web client)"
channel: "Instagram Help Centre · report a problem"
---

On a phone, a reel is a position in a stack. You open one from a profile and the rest are behind it —
swipe up, next, swipe up, next. The gesture is so cheap it disappears.

On a desktop browser, the same reel from the same profile is a **terminus**. There is no next. There
is no previous. The only way to the following reel is to leave: close it, land back on the grid,
find the thumbnail you just came from, and click the one beside it. Same account, same content, same
company — one client treats reels as a sequence, the other treats each one as an isolated page.

## Why this lands hardest on people doing work

Scrolling a feed is entertainment, and entertainment tolerates friction. But Instagram is also a
reference library: it's where the images are, where the footage is, where the thing a client
mentioned lives. When you're on a desktop it's because you're **working** — because the files, the
editor, and the screenshots are there, not on your phone.

That's exactly the surface where sequential navigation was removed. The phone, where you're most
likely to be idly browsing, keeps the fast path. The computer, where you're most likely to be
systematically going through someone's output, makes you re-enter through the front door every
single time.

## The math

<p class="equation">150M people <span class="op">×</span> 100 forced round trips/year <span class="op">×</span> 4s <span class="eq">=</span> <span class="out">~26 lifetimes / year</span></p>

Band **~2 to ~700 lifetimes/year**, and wide because both the population and the frequency are
estimates. The low end assumes only 80 million people ever do this and only twice a month. Even
then it's a human lifetime every year, spent pressing Back.

## Why it happens

Not a hard problem, and that's the frustrating part: the desktop client already knows which reel
you opened and already knows the list it came from — it just rendered that list. Everything needed
to build a next/previous control is on the page. What's missing is the decision to treat the
desktop client as a real client rather than a preview of the app.

## The fix

Next and previous. On the reel view, on the web, keyed to the arrow keys and to a scroll gesture,
walking the same list you opened the reel from. It is the single most obvious control in the entire
product — it exists on mobile, where the hardware makes it a swipe — and the web page has strictly
more room for it, not less.

<div class="todo" markdown="1">
**Instagram's web player changes often and behaves differently depending on where you opened the
reel from** (profile grid, saved collection, the reels tab, a direct link), so the exact shape of
this should be re-checked per surface before it's quoted as settled. The population figure is the
weakest number here: the ~42% desktop share is a share of *web visits to instagram.com*, not of
Instagram usage overall — most Instagram use is in the app, and the desktop slice is far smaller
than 42% of three billion. The estimates above deliberately assume a small fraction of it.

The confident claim is the asymmetry: **the cheaper the input device makes the gesture, the more
likely the client is to support it.**
</div>

## Difficulty to fix: easy

> The list is already loaded. The reel already knows its own position in it. Add the arrow.
