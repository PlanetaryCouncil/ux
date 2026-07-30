---
number: 17
title: "\"This content isn't available\" — which means four different things"
tagline: "Blocked, deleted, privacy-changed, or removed by moderators: one identical message for all four. You can tell them apart by opening an incognito window — which means the vagueness only fools the people who weren't a threat."
difficulty: moderate
todo: "Frequency & share of users are estimates"
platforms: [Meta]
lifetimes:
  low: 8
  headline: 60
  high: 300
facts:
  - label: "Facebook monthly active users"
    value: "3.07 billion"
    source: "Meta investor report, Q4 2025"
    url: "https://backlinko.com/facebook-users"
  - label: "Distinct situations sharing one message"
    value: "4"
    source: "blocked · deleted · audience-restricted · policy-removed"
    url: "https://www.guidingtech.com/solve-facebooks-content-is-not-available-error/"
  - label: "Global life expectancy"
    value: "73 years"
    source: "World Bank, 2023"
    url: "https://data.worldbank.org/indicator/SP.DYN.LE00.IN"
assumptions:
  - label: "Facebook users who hit this message"
    low: "10%"
    headline: "20%"
    high: "40%"
  - label: "Times per year"
    low: "2"
    headline: "4"
    high: "12"
  - label: "Seconds spent working out which of the four it was"
    low: "20s"
    headline: "60s"
    high: "180s"
    note: "Re-checking the link, searching the name, asking a mutual friend, opening a private window."
owner: "Meta (Facebook error states)"
channel: "In-app feedback · Meta Help Centre"
---

**"This content isn't available at the moment."** It could mean the person blocked you. Or deleted the
post. Or narrowed who can see it. Or Facebook removed it for a policy violation. Four unrelated
situations, one identical screen — and no way to tell from the message which one you're looking at.

## The steelman, and it's a real one

This is **not** primarily condescension, and it's worth saying so clearly, because the obvious reading
is wrong. Platforms deliberately refuse to confirm blocks **to protect the person who blocked.**

Telling someone "X blocked you" hands actionable information to the exact people it's most dangerous to
inform. For a stalker or an abusive ex, confirmation that they've been noticed and cut off is a
documented escalation trigger — new accounts, other platforms, real-world retaliation. Quiet blocking is
a genuine safety feature, and the ambiguity is doing real work for real people in real danger.

So the vagueness isn't stupid. **The problem is that it doesn't work, and it over-applies.**

## It fails against exactly the threat it's for

You can distinguish the four cases in about five seconds by opening a private window. That's not an
exploit — it's the standard advice in every help article on the subject.

Which inverts the whole design:

- The **determined bad actor** — the stalker, the person the safety feature exists to stop — absolutely
  will check, and learns the truth immediately.
- The **ordinary confused person** — who wasn't a threat to anyone — doesn't think to, and is left
  guessing about a relationship, a deleted post, or their own account.

Protection defeated by a five-second workaround only stops the people who weren't dangerous. That's the
textbook shape of **security theatre**: the appearance of protection, borne entirely by the harmless.

## And three of the four cases need no protection at all

Only *blocked* is sensitive. The rest are safe to state plainly:

| Situation | Safe to say? | What it could say |
|---|---|---|
| Post deleted | ✅ yes | "This post was deleted." |
| Audience restricted | ✅ yes | "You don't have access to this post." |
| Removed by moderators | ✅ mostly | "This post was removed." |
| **You've been blocked** | ⚠️ genuinely sensitive | keep it vague — but *only* this one |

One message covering all four means a safety mechanism designed for a rare, serious case has been
applied to three common, harmless ones — where its only effect is to leave ordinary people confused.
**Narrow the vagueness to the case that needs it.**

## The math

<p class="equation">3.07B users <span class="op">×</span> 20% <span class="op">×</span> 4 times/yr <span class="op">×</span> 60s <span class="eq">=</span> <span class="out">~60 lifetimes / year</span></p>

## Is treating people like idiots good business?

It's cheap in the short run — vague errors mean fewer support tickets, fewer arguments about moderation,
less to be held to. But it has a compounding cost this site keeps running into: **an interface that is
routinely unreliable trains people to disregard everything it says.** Once you learn that "isn't
available at the moment" means nothing in particular, you stop reading the messages that *do* matter.

That's the same failure as [case 007](/cases/007-disconnect-blamed-on-server/), where a local disconnect
is blamed on the server, and the same fatigue that makes [cookie consent](/cases/003-cookie-consent-banners/)
meaningless. Every message that doesn't mean what it says devalues the whole channel.

<div class="todo" markdown="1">
**Estimates.** The user count and the four-situation collapse are cited; how often people encounter the
message and how long they spend resolving it are reasoned figures. Behaviour also varies by surface
(profile vs post vs link) and changes over time, so the specific wording should be re-checked before
being quoted. The confident claim is the *pattern*: one message for four states, defeated by a private
window.
</div>

## Difficulty to fix: moderate

> Say what happened when saying it is safe — deleted, restricted, removed. Keep the quiet only for the
> one case that genuinely needs protecting. Right now the safety design for a rare, serious situation is
> being paid for by everyone else's confusion, while the people it guards against just open a private
> window.
