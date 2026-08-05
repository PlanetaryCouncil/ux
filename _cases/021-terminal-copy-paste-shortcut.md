---
number: 21
title: "The one window where Ctrl+C doesn't copy"
tagline: "Twenty years of muscle memory says Ctrl+C copies. In a terminal it kills the running process. Copy is Ctrl+Shift+C — an exception you must learn by being burned, in the one app where the mistake is destructive."
difficulty: moderate
todo: "Terminal-user population & mis-fire rate are estimates"
platforms: [Linux, Microsoft]
lifetimes:
  low: 1
  headline: 5
  high: 40
facts:
  - label: "Ctrl+C in a terminal"
    value: "SIGINT — interrupts the running process"
    source: "POSIX terminal convention, predates GUI copy-paste"
    url: "https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap11.html"
  - label: "Copy in most Linux terminals"
    value: "Ctrl+Shift+C"
    source: "GNOME Terminal, Konsole and others"
  - label: "Copy in macOS Terminal"
    value: "Cmd+C — no collision"
    source: "Cmd is a separate modifier from Ctrl"
  - label: "Global life expectancy"
    value: "73 years"
    source: "World Bank, 2023"
    url: "https://data.worldbank.org/indicator/SP.DYN.LE00.IN"
assumptions:
  - label: "People using a Linux or Windows terminal regularly"
    low: "15M"
    headline: "30M"
    high: "60M"
  - label: "Mis-fires per person per year"
    low: "6"
    headline: "20"
    high: "60"
    note: "Pressing Ctrl+C for copy and getting an interrupt, or Ctrl+V and getting nothing."
  - label: "Seconds lost each time"
    low: "5s"
    headline: "15s"
    high: "60s"
    note: "Higher when the interrupt kills something long-running that has to be restarted."
owner: "Terminal emulator maintainers (GNOME Terminal, Konsole, Windows Terminal)"
channel: "GNOME GitLab · KDE Bugzilla · Windows Terminal GitHub"
---

Every application on the machine agrees: **Ctrl+C copies.** Except one. In a terminal, Ctrl+C sends
**SIGINT** — it interrupts whatever is running. Copy is **Ctrl+Shift+C**, paste is **Ctrl+Shift+V**, and
you learn this by pressing Ctrl+C out of habit and killing something.

## Why it's genuinely hard, not just careless

This is a **collision between two conventions, both older than the argument.**

Ctrl+C as "interrupt" comes from terminal control codes and long predates GUI copy-paste. It is
load-bearing: it's how you stop a runaway process, and rebinding it would break decades of practice,
scripts and reflexes. Ctrl+C as "copy" arrived later and became universal everywhere else. Two
non-negotiable meanings, one keystroke.

**macOS dodged this entirely — by having more keys.** Copy is Cmd+C, interrupt is Ctrl+C, and because
Cmd and Ctrl are different physical modifiers, both conventions coexist with no conflict at all. PC
keyboards overloaded Ctrl for application shortcuts *and* terminal control codes, so the collision was
structural from the start. The Mac isn't better designed here so much as better *supplied*.

That's why this is rated **moderate**: there's no free fix, only trade-offs.

## But there is a fix, and some terminals already ship it

**Make Ctrl+C context-sensitive: copy when there's an active selection, send SIGINT when there isn't.**

It resolves cleanly in practice — you only have text selected when you meant to copy it, and you almost
never have a selection active at the moment you need to kill a process. Several terminals already offer
this behaviour as an option. It just isn't the default, so the reflex keeps costing people.

Failing that, the cheap version: **say so on screen.** A first-run hint in the terminal window — *"Copy:
Ctrl+Shift+C"* — costs one line and removes the learn-by-injury step entirely. Same lesson as
[case 020](/cases/020-terminal-not-discoverable/): a shortcut nobody tells you about isn't a feature yet.

## The math

<p class="equation">30M terminal users <span class="op">×</span> 20 mis-fires/yr <span class="op">×</span> 15s <span class="eq">=</span> <span class="out">~5 lifetimes / year</span></p>

The seconds understate it. Ctrl+C doesn't just *fail* to copy — it **does something else, destructively**.
A mistyped copy can end a long build, a download, or a running server. That's the real cost, and it
doesn't fit in a per-event stopwatch.

<div class="todo" markdown="1">
**Estimates.** The key bindings and the SIGINT convention are documented; the number of regular terminal
users and how often they mis-fire are reasoned figures. Behaviour also varies by emulator — some already
offer context-sensitive Ctrl+C or alternative bindings — so the claim is about defaults as commonly
shipped, not about every terminal.
</div>

## Difficulty to fix: moderate

> The most universal shortcut in computing means something else in the one window where getting it wrong
> destroys work. Copy on selection, interrupt otherwise — and tell people, once, on first run.
