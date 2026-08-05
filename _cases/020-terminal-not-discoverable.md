---
number: 20
title: "The OS you installed for the terminal hides the terminal"
tagline: "Fresh Ubuntu. No terminal on the desktop, none in the dock, no menu to browse. There's a keyboard shortcut — invisible — and a search box that only helps if you already know the word to type."
difficulty: none
todo: "Install volume & hunt duration are estimates"
platforms: [Linux]
lifetimes:
  low: 1
  headline: 4
  high: 30
facts:
  - label: "Linux desktop share, global"
    value: "~4.4%"
    source: "StatCounter, June 2026"
    url: "https://itsfoss.com/linux-market-share/"
  - label: "Linux desktop share, North America"
    value: "10.65%"
    source: "StatCounter, July 2026"
    url: "https://linuxiac.com/linux-desktop-market-share-surpasses-10-in-north-america/"
  - label: "Ubuntu's terminal shortcut"
    value: "Ctrl+Alt+T"
    source: "works out of the box — and is displayed nowhere"
  - label: "Global life expectancy"
    value: "73 years"
    source: "World Bank, 2023"
    url: "https://data.worldbank.org/indicator/SP.DYN.LE00.IN"
assumptions:
  - label: "People newly meeting a Linux desktop each year"
    low: "5M"
    headline: "15M"
    high: "40M"
  - label: "Times they hunt for the terminal before it sticks"
    low: "1"
    headline: "3"
    high: "8"
  - label: "Seconds lost per hunt"
    low: "60s"
    headline: "180s"
    high: "600s"
owner: "Canonical (Ubuntu default dock/favourites) · GNOME (shell discoverability)"
channel: "Ubuntu Launchpad · GNOME GitLab"
---

You install Ubuntu. Largely, let's be honest, **because you want a terminal.** And then there isn't one:
nothing on the desktop, nothing pinned in the dock, and no browsable application menu of the old kind.
There is a shortcut — **Ctrl+Alt+T** — which works perfectly and is advertised nowhere. And there's a
search box, which works perfectly too, provided you already know the word.

## Search is only as good as your vocabulary

This is the part that turns an annoyance into a design failure. A search-first launcher assumes you know
the **name** of the thing you want. For this particular thing, the name is different almost everywhere:

| You came from | You'd type | Result |
|---|---|---|
| macOS | "terminal" | ✅ works |
| Windows | "command prompt" / "powershell" | ❌ nothing |
| KDE | "konsole" | ❌ nothing |
| Nowhere — you just want to type commands | "command line" / "shell" / "console" | ❌ mostly nothing |

A browsable menu lets you find things you can't name — you scan a list and recognise it. Search only
retrieves things you can already name. **Replacing browse with search silently converts "I don't know
where it is" into "I don't know what it's called,"** which is a much worse place to be stuck.

And the irony compounds: Ubuntu's own documentation opens roughly every instruction with *"open a
terminal."* The system treats it as the universal starting point while giving it no visible door.

## Why it survives: obvious once you know it

Ctrl+Alt+T is a *good* shortcut. It's memorable, it's fast, and the moment you learn it the whole
complaint evaporates — it feels obvious, and you stop being able to imagine not knowing it.

That's the trap. **Everyone with the power to fix this already knows the shortcut.** Every maintainer,
every packager, every long-time user filing bugs — for all of them the terminal is one reflex away, so
the missing door isn't visible. The only people who experience the problem are the ones with no standing
to report it, and they stop experiencing it about ten minutes after they'd have written the bug.

This is the curse of knowledge doing structural damage: a defect that deletes its own witnesses. It
explains a lot of what's on this site — these aren't hard problems, they're problems that become
invisible to anyone qualified to solve them.

## The steelman

GNOME's search-first design is genuinely fast once the vocabulary is in your head, and a deliberately
sparse desktop is a defensible aesthetic — not every OS should ship a dock crammed with icons. There's
also a real argument that Ubuntu now targets people who should *never* need a terminal, and that putting
a root-capable command line on the default desktop is a footgun for them.

But Canonical clearly knows people need it — **they bound a dedicated shortcut to it.** The decision
wasn't "users don't need the terminal." It was "users who need the terminal will already know." That's
an assumption about prior knowledge, and it fails precisely on first contact, which is the only moment
it matters.

## The math

<p class="equation">15M new Linux desktops/yr <span class="op">×</span> 3 hunts <span class="op">×</span> 180s <span class="eq">=</span> <span class="out">~4 lifetimes / year</span></p>

Small, because the population is small. The *rate* is brutal — near-universal among newcomers to a
platform whose entire proposition is the command line.

## The fix

**Pin it to the dock by default.** That's the whole change: one entry in the default favourites list.
Failing that, show the shortcut somewhere a new user will actually look — the welcome screen that already
appears on first boot would do.

**The principle: a shortcut is not discoverability.** A keyboard binding is an accelerator for people who
already know the feature exists. It can make a known path faster; it can never be how someone *finds* the
path. Every feature needs at least one visible affordance, and "you can search for it" only counts when
the user knows what it's called.

<div class="todo" markdown="1">
**Estimates.** The market-share figures are cited; annual new-install volume and how long the hunt takes
are reasoned. Behaviour also varies by flavour — Kubuntu, Mint and others ship visible menus and don't
have this problem — so this is specifically about GNOME-default Ubuntu as observed, not "Linux" as a
whole. The Linux tag is broader than the finding.
</div>

## Difficulty to fix: none

> One line in the default favourites. The operating system whose great advantage is the command line
> should not require you to already know the command line's name in order to find it.
