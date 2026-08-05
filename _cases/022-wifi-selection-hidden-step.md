---
number: 22
micro: true
micro_line: "≈0.8 lifetimes / year"
title: "You clicked the network. Nothing asked for the password."
tagline: "During install you click your Wi-Fi. No password field appears — because clicking only highlighted it, and you must confirm the selection first. Nothing on screen says which step you're on."
difficulty: none
todo: "Reproduce across installer versions"
platforms: [Linux]
facts:
  - label: "Linux desktop share, global"
    value: "~4.4%"
    source: "StatCounter, June 2026"
    url: "https://itsfoss.com/linux-market-share/"
  - label: "Where it happens"
    value: "OS installation — before any help is available"
    source: "no browser, no docs, no second device assumed"
  - label: "Global life expectancy"
    value: "73 years"
    source: "World Bank, 2023"
    url: "https://data.worldbank.org/indicator/SP.DYN.LE00.IN"
owner: "Canonical (Ubuntu installer network step)"
channel: "Ubuntu Launchpad · installer (Subiquity/Ubiquity) issues"
---

Installing Ubuntu. You reach the network step, click your Wi-Fi network, and wait for the password box.
It doesn't come. The click only *highlighted* the row — you have to confirm the selection separately
before the password field appears. Nothing on screen makes that clear, so you sit there wondering
whether the click registered, whether the network is broken, or whether you missed something.

## Two small failures, stacked

1. **Selection state is not legible.** After clicking, it isn't obvious the row is now selected — so the
   click reads as "nothing happened" rather than "step one of two complete."
2. **The next step is hidden.** The password field doesn't exist until you confirm, so the thing you
   were looking for is absent, and its absence looks like a fault rather than a sequence.

Either alone is survivable. Together they produce a dead end: no visible change, and no visible next
action.

## Why it lands harder than it looks

It happens **during installation** — the one moment when you have no browser, no documentation, no
working system, and possibly no second device. Every other paper-cut on this site can be googled. This
one can't, because you're stuck at the step that would give you internet.

That's a general principle worth stating: **friction in a setup flow costs more than identical friction
anywhere else**, because the user has no escape hatch and no accumulated knowledge of the system. Setup
is where the least-experienced user meets the fewest available tools.

## The fix

Show the selection clearly, or skip the step entirely: **clicking a network should present the password
field immediately.** That's what every phone does, and it's what the muscle memory expects. If a
confirm step must exist, the button for it needs to be obvious and the selected row unmistakable.

## Filed as a micro case

Sized on new Linux desktop installs, this is under a lifetime a year — small, because the population is
small. It's here because the *rate* is high among people meeting the system for the first time, and
because it belongs with [case 020](/cases/020-terminal-not-discoverable/) and
[case 021](/cases/021-terminal-copy-paste-shortcut/) as part of one first-run experience.

<div class="todo" markdown="1">
**Needs reproducing.** Ubuntu has shipped several installers (Ubiquity, then Subiquity/Flutter) and this
step has changed between them. The observation is one user's, on one recent install — before it's cited
anywhere it should be reproduced against current ISOs, and the exact version noted.
</div>

## Difficulty to fix: none

> Clicking a network is unambiguous — nobody clicks their own Wi-Fi by accident. Show the password field
> right there, at the moment when the user has no other way to ask for help.
