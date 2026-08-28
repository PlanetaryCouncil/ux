---
number: 31
title: "Two screens on your desk, and no way for the pointer to get from one to the other"
tagline: "The laptop is bottom-left, the second monitor is up and to the right. Your hand makes one diagonal flick. The pointer can't — it has to be walked up through a third display and back down, because those two screens share no edge."
difficulty: easy
todo: "Corner-adjacency behaviour differs per OS — verify before quoting specifics"
platforms: [Apple, Microsoft, Linux]
lifetimes:
  low: 20
  headline: 150
  high: 1200
facts:
  - label: "Office workers using two or more monitors"
    value: "~75%"
    source: "arXiv natural-experiment study, 2021"
    url: "https://arxiv.org/pdf/2103.13198"
  - label: "How the pointer crosses displays"
    value: "only where two screens' pixel ranges intersect"
    source: "coordinate adjacency — the same mechanism behind case 004"
  - label: "Displays touching only at a corner"
    value: "zero shared edge, zero crossings"
    source: "an intersection of length 0 is not a doorway"
  - label: "Global life expectancy"
    value: "73 years"
    source: "World Bank, 2023"
    url: "https://data.worldbank.org/indicator/SP.DYN.LE00.IN"
assumptions:
  - label: "People whose layout contains a diagonal pair"
    low: "30M"
    headline: "80M"
    high: "200M"
    note: "Three or more displays, or two arranged with a vertical offset. Any staircase layout manufactures diagonal pairs — and mismatched panel sizes make the staircase the natural arrangement."
  - label: "Diagonal crossings attempted per person per day"
    low: "4"
    headline: "8"
    high: "20"
  - label: "Seconds lost per dogleg"
    low: "1s"
    headline: "1.5s"
    high: "3s"
    note: "Overshoot, correct, re-aim. The cost is small but it lands on the fastest, least deliberate movement you make all day."
owner: "OS display / windowing teams (macOS WindowServer · Windows DWM · Linux compositors)"
channel: "Apple Feedback Assistant · Windows Feedback Hub · mutter / wlroots issue trackers"
---

Three displays. The big one up top, the laptop tucked below it on the left, a second monitor
off to the right at mid-height. A completely ordinary desk.

You want the pointer on the right-hand monitor. Your hand makes the obvious movement: **one
diagonal flick, up and to the right.** The pointer doesn't go there. It can't — those two
screens do not touch anywhere, so no amount of pushing in their direction will cross the gap.
The only route is up onto the big display, across it, and back down.

<figure class="diagram">
<svg viewBox="0 0 640 420" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Diagram: a large display top-left, a laptop below it, and a second monitor to the right at mid height. A straight diagonal path from laptop to right monitor is blocked; the only route is up through the large display and across.">
  <defs>
    <marker id="dgArrOk" markerWidth="9" markerHeight="9" refX="7" refY="4.5" orient="auto">
      <path d="M1,1 L7,4.5 L1,8" fill="none" stroke="currentColor" stroke-width="1.6" style="color: var(--ok)"/>
    </marker>
  </defs>

  <!-- big display -->
  <rect class="dg-screen" x="70" y="60" width="290" height="180" rx="10"/>
  <text class="dg-label" x="92" y="90" font-size="15">Main display</text>

  <!-- laptop, below-left -->
  <rect class="dg-screen" x="70" y="240" width="170" height="112" rx="6"/>
  <polygon points="48,352 262,352 280,366 30,366" fill="rgba(128,128,128,.16)" stroke="currentColor" stroke-width="1.5"/>
  <text class="dg-label" x="155" y="302" font-size="14" text-anchor="middle">Laptop</text>

  <!-- right monitor, mid height -->
  <rect class="dg-screen" x="360" y="150" width="205" height="132" rx="10"/>
  <text class="dg-label" x="462" y="222" font-size="14" text-anchor="middle">Second monitor</text>

  <!-- the movement the hand actually made -->
  <line x1="196" y1="298" x2="440" y2="216" stroke="#e11d48" stroke-width="2.6" stroke-dasharray="6 4"/>
  <circle cx="243" cy="282" r="9" fill="#e11d48"/>
  <path d="M239,278 L247,286 M247,278 L239,286" stroke="#fff" stroke-width="1.8" stroke-linecap="round"/>
  <text class="dg-bad" x="262" y="318" font-size="14">✗ no shared edge — nothing to cross into</text>

  <!-- the route you are forced to take -->
  <line x1="150" y1="292" x2="150" y2="152" stroke="currentColor" stroke-width="3" style="color: var(--ok)"/>
  <line x1="150" y1="152" x2="448" y2="196" stroke="currentColor" stroke-width="3" style="color: var(--ok)" marker-end="url(#dgArrOk)"/>
  <text class="dg-ok" x="96" y="132" font-size="14">✓ the only route</text>
  <text class="dg-ok" x="96" y="150" font-size="14">two moves, one intent</text>

  <!-- cursor at origin -->
  <g transform="translate(190,286)">
    <polygon class="dg-cursor" points="0,0 0,22 6,16 10,25 13,23 9,15 17,15"/>
  </g>
</svg>
<figcaption>Laptop and second monitor share no border. The straight line your hand drew has no path; the pointer must be walked up and across.</figcaption>
</figure>

## The vector is thrown away

A mouse movement is a **vector** — it has a direction, and that direction is the clearest
statement of intent the input system will ever receive. Up-and-right means *the screen that is
up and to the right.*

What the OS keeps is the crossing test: at each border, does a neighbouring display's pixel
range intersect this one's? Direction of travel is never consulted. So the richest signal in the
gesture is discarded at exactly the moment it would resolve the ambiguity, and what's left is
arithmetic on rectangles.

This is [case 004](/cases/004-multi-monitor-cursor-deadzone/) taken to its limit. There, the
neighbour existed and the crossing point was too narrow. Here **there is no crossing point at
all** — the intersection of the two screens' edges is empty, so the pointer isn't hitting a wall
so much as discovering the room has no door.

## Corners are worse than walls

Two displays meeting at a single corner is the degenerate case: the shared edge has **length
zero**. They look adjacent on the arrangement screen — they're literally touching — and are
completely unreachable from each other.

Where three displays nearly meet, it inverts into the opposite problem: a point where a degree
or two of approach angle decides which of three screens you end up on. Maximum precision demanded
at the one place you're moving fastest and least deliberately. Either way the geometry, not the
gesture, is in charge.

## Why the layout can't just be fixed

The obvious retort is *arrange your displays better.* But the staircase isn't a preference —
it's forced. Panels are different heights, they sit on different stands, and the arrangement is
supposed to mirror where the glass actually is on your desk, because that's what makes the
crossings feel physical in the first place. Every vertical offset you introduce for accuracy's
sake manufactures another diagonal pair.

So the two goals are in direct conflict: **arrange it truthfully and the pointer gets stuck;
arrange it as a neat row and every crossing lies about where the screen is.** No arrangement
wins, which is a strong hint the arrangement isn't where the bug lives.

## The math

<p class="equation">80M people <span class="op">×</span> 8 diagonal crossings/day <span class="op">×</span> 1.5s <span class="eq">=</span> <span class="out">~150 lifetimes / year</span></p>

Smaller than case 004 because it needs a diagonal pair to exist — but it grows with every display
added, and multi-display desks are not getting rarer.

<div class="todo" markdown="1">
**Per-OS specifics unverified.** The arrangement editors differ in whether they permit displays to
sit corner-to-corner or with a gap, and in how they snap. Whether an OS *forbids* the zero-length
adjacency, or merely permits it and then can't traverse it, changes the shape of the fix — worth
checking on macOS, Windows and each Linux compositor before quoting any of it as behaviour.

Population and frequency are reasoned estimates, not measurements, exactly as in case 004. The
confident claim is the mechanism: **traversal is decided by edge intersection, and edge
intersection cannot express "over there."**
</div>

## The fix: nearest display in the direction of travel

When the pointer is pushed against an edge, don't just test for an intersecting neighbour — take
the **motion vector** and ask which display it points at. Carry the pointer to the nearest point
on that display. A diagonal flick toward a screen that's up and to the right lands on it, whether
or not any pixels happen to line up.

This is the same fix as case 004, generalised from one axis to two, and it subsumes it: nearest-edge
snapping is the special case where the vector happens to be vertical. One behaviour, both bugs, all
three operating systems.

Worth adding alongside it: **a keyboard or gesture command to send the pointer to a named display.**
Direction-free, unambiguous, and useful even after the geometry is fixed.

## Difficulty to fix: easy

> The hand drew a straight line at a screen it can see. Everything needed to honour that is already
> in the event — an origin, a direction, and a list of displays. Read the vector instead of
> intersecting rectangles.
