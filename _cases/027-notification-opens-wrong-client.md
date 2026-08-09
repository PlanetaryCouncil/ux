---
number: 27
title: "The notification came from your browser. It opens an app."
tagline: "A task finishes in ChatGPT on the web. You click the notification and land in the Codex desktop app — not the tab you were working in. The notification knew where it came from and threw that away."
difficulty: easy
todo: "Population & frequency are estimates"
platforms: [OpenAI, Apps]
lifetimes:
  low: 8
  headline: 50
  high: 300
facts:
  - label: "ChatGPT weekly active users"
    value: "~900 million"
    source: "reported, February 2026"
    url: "https://sqmagazine.co.uk/chatgpt-statistics/"
  - label: "Mechanism"
    value: "desktop app registers the URL scheme"
    source: "the OS routes the link to the registered handler, not the originating surface"
  - label: "Global life expectancy"
    value: "73 years"
    source: "World Bank, 2023"
    url: "https://data.worldbank.org/indicator/SP.DYN.LE00.IN"
assumptions:
  - label: "People running both a web and a desktop client of the same service"
    low: "250M"
    headline: "500M"
    high: "1.2B"
    note: "Slack, Spotify, Teams, Discord, Notion, Zoom, ChatGPT — the pattern is industry-wide, not specific to one vendor."
  - label: "Misrouted notifications per person per year"
    low: "6"
    headline: "12"
    high: "50"
  - label: "Seconds lost each time"
    low: "8s"
    headline: "20s"
    high: "60s"
    note: "App launches or focuses, you realise it's the wrong surface, switch back, and hunt for the tab you were on."
owner: "Services shipping multiple clients (observed: OpenAI — ChatGPT web / Codex desktop)"
channel: "Per-app feedback · OS URL-handler settings"
---

Something finishes in **ChatGPT on the web**. A notification appears. You click it — and the **Codex
desktop app** takes focus. Not the tab. Not the conversation. A different program, which now has to load,
possibly authenticate, and show you something adjacent to what you asked about.

The tab you actually wanted is still open, somewhere behind everything, exactly where you left it.

## A notification is a bookmark

That's the whole contract. A notification says *"something happened over here"* — and clicking it is a
request to **go back to where that was.** Not to the vendor. Not to their preferred client. To the place
you were.

Here, the return trip goes somewhere you never were. The notification had the information — it was
raised by a specific surface, in a specific session — and it discarded that in favour of "open a link
for this service, whatever's registered to handle it."

## Why it happens

The desktop app registers itself as the handler for the service's URL scheme or universal links. From
then on the OS routes *every* such link to the app, regardless of where it originated. It's the same
mechanism that makes a Slack link open the Slack app instead of the tab you were reading, or a Spotify
link jump out of the browser mid-flow.

**The routing decision is made by installation, not by context.** Installing a desktop client silently
re-points every notification and link for that service, permanently, with no per-notification memory of
where things actually happened.

## The principle

**Return traffic should follow origin, not registration.** A notification raised by a browser session
belongs to that browser session. The service knows which client produced it — it has a session, a
device, a surface identifier — and none of that survives the round trip.

The general form: **hand-offs should preserve context, not reset it.** Any time a system moves you
between surfaces it should be taking you *closer* to what you were doing, and this one moves you sideways
into a different application.

## The math

<p class="equation">500M dual-client users <span class="op">×</span> 12 misroutes/yr <span class="op">×</span> 20s <span class="eq">=</span> <span class="out">~50 lifetimes / year</span></p>

The seconds undersell it slightly: the cost isn't only the switch, it's re-finding the tab and rebuilding
what you were thinking about. Interruption is expensive out of proportion to its duration.

## The fix

1. **Stamp notifications with their origin surface** and route back to it. If it came from a browser
   session, open the browser.
2. **Ask once when the desktop client registers as handler** — *"Open links in the app?"* — rather than
   claiming them silently at install time.
3. **Fall back to last-used**, not to whatever was installed most recently.

<div class="todo" markdown="1">
**Estimates.** The ChatGPT user figure is cited; the number of people running two clients of the same
service and how often they're misrouted are reasoned. The URL-handler mechanism is the standard
explanation for this behaviour and fits the symptom, but it hasn't been confirmed for this specific
product — a check of the notification payload and registered handlers would settle it. The confident
claim is the *pattern*: notifications routed by registration rather than origin.
</div>

## Difficulty to fix: easy

> The notification knew where it came from. Something between there and your click decided that didn't
> matter. Carry the origin, and send people back to the place they actually were.
