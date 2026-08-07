---
number: 25
title: "The file is on your Desktop. The file is not on your computer."
tagline: "macOS quietly evicts your local files to iCloud when space runs low — on by default, no warning, no say in which ones. The fix exists in two places, and neither is where you'd look."
difficulty: easy
todo: "Adoption share & eviction frequency are estimates"
platforms: [Apple]
lifetimes:
  low: 2
  headline: 12
  high: 80
facts:
  - label: "\"Optimise Mac Storage\""
    value: "on by default"
    source: "evicts local copies when space is needed"
    url: "https://www.macworld.com/article/231888/how-to-disable-optimized-icloud-drive-storage-with-a-single-click.html"
  - label: "Where the global switch lives"
    value: "System Settings → Apple ID → iCloud → iCloud Drive"
    source: "four levels deep, not in Storage"
  - label: "Per-file pin"
    value: "right-click → Keep Downloaded"
    source: "context menu only — no visible affordance"
    url: "https://tomsguide.com/computing/macos/how-to-keep-to-keep-icloud-drive-files-downloaded-on-your-mac"
  - label: "Global life expectancy"
    value: "73 years"
    source: "World Bank, 2023"
    url: "https://data.worldbank.org/indicator/SP.DYN.LE00.IN"
assumptions:
  - label: "Mac users with Desktop & Documents synced to iCloud"
    low: "40M"
    headline: "80M"
    high: "150M"
  - label: "Times per year a needed file has been evicted"
    low: "2"
    headline: "6"
    high: "20"
  - label: "Seconds lost each time"
    low: "20s"
    headline: "60s"
    high: "600s"
    note: "Waiting for a re-download on a good connection. On a plane or a bad line the file is simply unavailable, and the cost isn't seconds at all."
owner: "Apple (iCloud Drive / Optimise Mac Storage)"
channel: "Apple Feedback Assistant"
---

Your Desktop shows a folder. Next to it, a small cloud with a downward arrow. The folder is *listed* on
your machine but its contents aren't *on* your machine — macOS evicted them to iCloud to reclaim space,
without asking, and left a stub behind so the layout looks unchanged.

Most of the time this is invisible and harmless. It stops being either the moment you're offline.

## What's actually wrong

The eviction itself is defensible (see below). Three things around it are not:

1. **It's on by default.** "Optimise Mac Storage" ships enabled, so the behaviour that quietly removes
   your local data is the one you get without choosing it.
2. **The switch is four levels deep** — System Settings → Apple ID → iCloud → iCloud Drive. Not under
   Storage, where someone thinking about disk space would look.
3. **The per-file pin is invisible.** Right-click → **Keep Downloaded** is exactly the feature this case
   asks for, and it exists only in a context menu. Nothing on the cloud badge suggests you can pin the
   file, even though the badge is the moment you're thinking about it. Same failure as
   [case 020](/cases/020-terminal-not-discoverable/): the feature is built, and hidden from the person
   who needs it.

## The steelman

When a disk fills, something must give, and evicting a file that exists in the cloud is the gentlest
available move — the data isn't destroyed, just relocated. Compared to refusing to save, or nagging you
weekly, silent eviction is genuinely considerate engineering.

**But "not lost" quietly assumes connectivity.** On a plane, a train, a bad hotel line, or a rural
signal, an evicted file is functionally gone — and those are precisely the moments people reach for
files they saved for exactly this reason. The optimisation converts a *guaranteed* local resource into
a *conditional* one, by default, without saying so.

That's the real objection: not that it evicts, but that it silently downgrades a guarantee.

## The principle

**Don't silently revoke something the user already has.** Storage optimisation is a bargain — space now
in exchange for availability later — and bargains need consent. Either ask, or expose the pin where the
user can see it, or both.

There's a sharper version: **the file the user put on the Desktop is a statement of intent.** Desktop is
where people put things they need at hand. Evicting from there first is optimising against the one
signal the user actually gave you.

## The math

<p class="equation">80M synced Macs <span class="op">×</span> 6 evictions/yr <span class="op">×</span> 60s <span class="eq">=</span> <span class="out">~12 lifetimes / year</span></p>

Seconds only, and only for the online case. The offline case doesn't cost seconds — it costs the file.

## The fix

1. **Make the pin visible.** The cloud badge should be clickable, offering *Keep Downloaded* right there.
2. **Say what happened.** A once-per-session notice — *"12 GB moved to iCloud to free space"* — with an
   undo. Silent is the problem, not the eviction.
3. **Respect the location.** Don't evict from Desktop before evicting from everywhere else.

## Meanwhile, if you just want it off

- **Everything local, permanently:** System Settings → Apple ID → iCloud → iCloud Drive → turn off
  **Optimise Mac Storage**. Requires enough disk for the full contents.
- **Specific things local:** right-click the file or folder → **Keep Downloaded**. Survives optimisation.

<div class="todo" markdown="1">
**Estimates.** The default state, the settings path and the Keep Downloaded pin are documented and
linked; how many Macs sync Desktop & Documents, and how often a needed file turns out to be evicted, are
reasoned figures. Exact menu wording varies across macOS versions and should be checked before quoting.
</div>

## Difficulty to fix: easy

> The badge that tells you the file is gone is the perfect place to offer to keep it. It says nothing.
> Make it clickable, and tell people once when their data leaves the building.
