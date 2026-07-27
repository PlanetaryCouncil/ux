---
number: 12
micro: true
micro_line: "≈0.02 lifetimes / year"
title: "A \"More\" menu with no more in it"
tagline: "You promote every item to your sidebar. The \"More\" expander stays anyway — a chevron promising things that no longer exist. You click it. Nothing."
difficulty: none
todo: "Empty-state behaviour unverified; user counts conflict wildly"
platforms: [Anthropic]
facts:
  - label: "Claude web app monthly active users"
    value: "~18.9 million"
    source: "third-party estimate, 2026 — see TODO, sources conflict"
    url: "https://backlinko.com/claude-users"
  - label: "Global life expectancy"
    value: "73 years"
    source: "World Bank, 2023"
    url: "https://data.worldbank.org/indicator/SP.DYN.LE00.IN"
owner: "Anthropic (Claude desktop & web app sidebar)"
channel: "In-app feedback · support.anthropic.com"
---

The Claude sidebar has a **More** section with a chevron. Customise the sidebar, promote every
available item up into view, and the chevron *stays* — a disclosure control with nothing left to
disclose. You click it out of habit, or because a chevron means "there is more here," and you get
nothing. Then you do it again next week, because a control that exists implies it does something.

## This is the smallest case on the site — deliberately published anyway

Run the napkin honestly and it comes to roughly **two hundredths of a lifetime per year.** Not
two. Not a fifth. About **0.02** — a few million seconds spread across everyone who ever fully
customised their sidebar. It does not move the total. It is, by the site's own metric, nearly nothing.

It's here for two reasons.

**One: the Ministry has to indict its own author.** This site is written with Claude, made by
Anthropic, and a catalogue of civilisation's interface failures that never names its own toolmaker
would be worth less. The metric has to apply to the people holding the pen, or it's advocacy
wearing a lab coat. So: Anthropic, this one's yours. It's four lines of code.

**Two: the size is the lesson.** Most paper-cuts really are this small. [Case 003](/cases/003-cookie-consent-banners/)
is ~4,800 lifetimes a year and this is ~0.02 — a factor of a quarter of a million between two
things that feel, in the moment, like the same species of annoyance. Irritation is a terrible guide
to impact. **That's the entire reason this site does arithmetic instead of just complaining.**

## The principle it illustrates

**A control must not promise what it cannot deliver.** A chevron, a "More", a disclosure triangle —
these are affordances: visual promises that something is behind them. When the thing behind them is
empty, the control has become a small lie the interface tells every time you look at it. The fix is
a conditional: *if the hidden set is empty, don't render the expander.* Zero items, zero control.

It belongs to the same family as [case 007](/cases/007-disconnect-blamed-on-server/) — interfaces
that say things which aren't true, not out of malice but because nobody wrote the empty case.

<div class="todo" markdown="1">
**Two things unverified.** (1) Whether **More** is genuinely empty once every item is promoted, or
merely near-empty — this rests on a single user report and one screenshot, not a tested empty state.
(2) The user counts for Claude conflict *wildly* between sources — from ~18.9M web MAU to claims of
245M+ across surfaces. The estimate above uses the conservative end. Given the figure is ~0.02
lifetimes either way, none of it changes the conclusion — but per
[the methodology](/methodology/), a number resting on contested sources gets said out loud.
</div>

## Difficulty to fix: none

> The sidebar already knows how many hidden items it has. When that number is zero, don't draw a
> door. It costs four lines and removes one small, daily lie from an interface that millions of
> people look at.
