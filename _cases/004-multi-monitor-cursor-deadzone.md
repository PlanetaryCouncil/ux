---
number: 4
title: "Your cursor hits an invisible wall between mismatched monitors"
tagline: "A big monitor above, a laptop below. Push the pointer down from the side and it stops dead — you can only cross where the two screens happen to line up."
difficulty: easy
todo: "Population & frequency need sourcing"
platforms: [Apple, Microsoft, Linux]
lifetimes:
  low: 100
  headline: 950
  high: 5000
facts:
  - label: "Office workers using two or more monitors"
    value: "~75%"
    source: "arXiv natural-experiment study, 2021"
    url: "https://arxiv.org/pdf/2103.13198"
  - label: "Global life expectancy"
    value: "73 years"
    source: "World Bank, 2023"
    url: "https://data.worldbank.org/indicator/SP.DYN.LE00.IN"
assumptions:
  - label: "People with a mismatched-resolution multi-monitor setup"
    low: "200M"
    headline: "400M"
    high: "700M"
    note: "A laptop plus an external monitor is mismatched by definition — the common case. Population is an estimate, not a measurement (see TODO)."
  - label: "Dead-zone wall-hits per person per day"
    low: "3"
    headline: "10"
    high: "25"
  - label: "Seconds lost re-routing each time"
    low: "1s"
    headline: "1.5s"
    high: "3s"
owner: "OS display / windowing teams (macOS WindowServer · Windows DWM · Linux compositors)"
channel: "Apple Feedback Assistant · Windows Feedback Hub · mutter / wlroots issue trackers"
---

You have a big monitor up top and a laptop screen below it. You go to move the pointer down
onto the laptop — and it stops dead against an invisible wall. It only crosses in the narrow
central band where the two screens' edges happen to overlap. Approach from the side, and the
cursor bumps a border that isn't visibly there.

<figure class="diagram">
<svg viewBox="0 0 640 540" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Diagram: a wide 4K monitor above a smaller laptop. The cursor crosses down to the laptop only through the central overlap band; on either side it hits an invisible wall along the monitor's bottom edge.">
  <defs>
    <marker id="arOk" markerWidth="9" markerHeight="9" refX="4.5" refY="7" orient="auto">
      <path d="M1,1 L4.5,7 L8,1" fill="none" stroke="currentColor" stroke-width="1.6" style="color: var(--ok)"/>
    </marker>
  </defs>

  <!-- 4K monitor -->
  <rect class="dg-screen" x="90" y="64" width="460" height="166" rx="10"/>
  <text class="dg-label" x="112" y="94" font-size="16">4K monitor</text>
  <text class="dg-mut" x="112" y="114" font-size="12.5">wide — overhangs the laptop on both sides</text>

  <!-- Laptop -->
  <rect class="dg-screen" x="240" y="312" width="160" height="104" rx="6"/>
  <polygon points="212,416 428,416 448,430 192,430" fill="rgba(128,128,128,.16)" stroke="currentColor" stroke-width="1.6"/>
  <text class="dg-label" x="320" y="370" font-size="15" text-anchor="middle">Laptop</text>

  <!-- crossing band (works) -->
  <rect class="dg-cross" x="240" y="230" width="160" height="82" rx="3"/>
  <line x1="320" y1="240" x2="320" y2="304" stroke="currentColor" stroke-width="3" style="color: var(--ok)" marker-end="url(#arOk)"/>
  <text class="dg-ok" x="412" y="268" font-size="14">✓ crossing works —</text>
  <text class="dg-ok" x="412" y="286" font-size="14">only in this band</text>

  <!-- dead-zone walls along the monitor's bottom edge -->
  <line class="dg-wall" x1="94" y1="230" x2="236" y2="230"/>
  <line class="dg-wall" x1="404" y1="230" x2="546" y2="230"/>

  <!-- left dead cursor bonking the wall -->
  <g transform="translate(150,150)">
    <polygon class="dg-cursor" points="0,0 0,22 6,16 10,25 13,23 9,15 17,15"/>
  </g>
  <line x1="158" y1="184" x2="158" y2="222" stroke="#e11d48" stroke-width="2.4" stroke-dasharray="4 3"/>
  <circle cx="158" cy="230" r="9" fill="#e11d48"/>
  <path d="M154,226 L162,234 M162,226 L154,234" stroke="#fff" stroke-width="1.8" stroke-linecap="round"/>
  <text class="dg-bad" x="128" y="132" font-size="14">✗ invisible wall</text>

  <!-- right dead marker -->
  <circle cx="474" cy="230" r="8" fill="#e11d48"/>
  <path d="M470.5,226.5 L477.5,233.5 M477.5,226.5 L470.5,233.5" stroke="#fff" stroke-width="1.6" stroke-linecap="round"/>
</svg>
<figcaption>The pointer only crosses where the two screens’ coordinate ranges overlap. Everywhere the monitor overhangs the laptop, moving down hits a wall that isn’t drawn anywhere.</figcaption>
</figure>

## Why it happens

The cursor crosses between displays using **literal coordinate geometry** — it can only step
onto a neighbour where the two screens' pixel ranges actually intersect. A 4K panel and a
laptop have different widths, so most of their shared border has no neighbour on the other
side, and the pointer treats that as a solid edge. The machine is doing arithmetic where it
should be reading intent: *"the user is pushing down, there is a display down there — take
them to the nearest point on it."*

## The math

<p class="equation">400M people <span class="op">×</span> 10 wall-hits/day <span class="op">×</span> 1.5s <span class="eq">=</span> <span class="out">~950 lifetimes / year</span></p>

The band is wide — anywhere from **~100 to ~5,000 lifetimes a year** — because both the affected
population and the daily frequency are estimates (see the TODO). But the *shape* is solid: it's
a tiny, constant tax on a huge, growing population.

<div class="todo" markdown="1">
**This is the least-sourced case on the site — treat the headline as order-of-magnitude.**

Only the 75% multi-monitor adoption figure is cited. The affected *population* (how many people
run a mismatched-resolution setup) and the *frequency* (wall-hits per day) are reasoned estimates,
not measurements, which is why the low→high band spans two orders of magnitude. To firm up: a real
figure for laptop-plus-external-monitor users worldwide, and any instrumentation of how often the
dead-zone is actually hit. Until then the confident claim is the **low end (~100 lifetimes/yr)** and
the *pattern*, not the headline.
</div>

## The fix: route by intent, not geometry

**Edge routing** (a.k.a. nearest-edge snapping): if the pointer is pushed against a display edge
that has *any* adjacent display along that axis, carry it to the nearest valid point on that
display instead of stopping. Third-party tools already do this; the OS should do it natively.
It's one behaviour, and it lands cross-platform — macOS, Windows and Linux all share the flaw.

## Companion bug — the layout reflow

The same setup hides a second problem: **changing one display's resolution silently rearranges
the whole multi-monitor layout** you deliberately set. One change cascades; the arrangement
doesn't hold its shape, so you re-drag windows you'd already placed. A setting should survive a
neighbour changing.

## It gets worse with every display you add

Two displays give you one shared border and two dead segments. Add a third — the common real setup:
a laptop below, two monitors above at different heights and resolutions — and it compounds
combinatorially. Now there are multiple boundaries, each still overlap-limited; **corner dead-zones**
where three displays almost-but-don't-quite meet; and journeys that force you to route A→B→C because
A and C share no edge at all. Worse, mismatched sizes *force* the offset "staircase" arrangement, and
every offset manufactures another stretch of wall.

So the tax scales faster than the monitor count — and it lands hardest on exactly the people who cross
displays most: the multi-monitor power users the whole setup exists to serve. Seen in the wild: a real
three-panel desk — laptop, a Philips monitor, a third display, all different sizes — arranged in precisely
that staircase, every seam between them a place the cursor can stick.

## Companion — when a display *fails*

The same setup hides a crueller catch-22. If a laptop's own screen breaks, its windows — **including
the Displays settings panel you need to fix the problem** — can open on the dead display, where you
can't see them to drag them anywhere. The one tool that recovers you is trapped behind the failure it's
meant to recover from. The fix is the same spirit as the dead-zone: **rescue UI must appear where the
user can actually see it** — mirror the Displays panel (and any window that lands on a non-responsive
display) onto every screen, or detect a dead display and reassign its windows to a live one.

## Difficulty to fix: easy

> The pointer stops against a wall that was never drawn, because the OS is matching pixel
> coordinates instead of reading the obvious intent — *down means the screen that's below.*
> Route to the nearest edge and hand a few hundred lifetimes a year back to everyone who's ever
> plugged a laptop into a monitor.
