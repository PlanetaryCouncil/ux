---
number: 35
title: "A setting you can't set: your default Google account is whichever one you signed in first"
tagline: "Every Google link you open resolves to one account — the one you happened to sign into first, possibly years ago. There is no control for it. To change the value you sign out of every account you have and sign back in, in the right order."
difficulty: moderate
todo: "Google hedges its own rule with \"in many cases\" — the exact conditions are undocumented"
platforms: [Google, Web]
lifetimes:
  low: 10
  headline: 347
  high: 2800
facts:
  - label: "Google's stated rule"
    value: "\"In many cases, your default account is the one you signed in with first.\""
    source: "Google Account Help — signing in to multiple accounts"
    url: "https://support.google.com/accounts/answer/1721977"
  - label: "Instructions on that page for changing the default"
    value: "none"
    source: "the page states the rule and stops"
    url: "https://support.google.com/accounts/answer/1721977"
  - label: "Gmail users worldwide"
    value: "~1.8 billion"
    source: "third-party aggregate of Statista data — sources vary, see TODO"
    url: "https://www.demandsage.com/gmail-statistics/"
  - label: "Average Gmail accounts per user"
    value: "~1.7"
    source: "third-party aggregate, 2026 — multiple accounts are the norm, not the edge case"
    url: "https://www.demandsage.com/gmail-statistics/"
  - label: "Global life expectancy"
    value: "73 years"
    source: "World Bank, 2023"
    url: "https://data.worldbank.org/indicator/SP.DYN.LE00.IN"
assumptions:
  - label: "People signed into two or more Google accounts at once"
    low: "400M"
    headline: "800M"
    high: "1.2B"
    note: "Work plus personal is the ordinary case for anyone employed at a company on Google Workspace."
  - label: "Times a year a link opens as the wrong account"
    low: "6"
    headline: "40"
    high: "120"
  - label: "Seconds lost each time"
    low: "10s"
    headline: "25s"
    high: "45s"
    note: "Realise, open the switcher, pick the account, wait for the reload, and often re-navigate — the switch frequently lands you somewhere other than the document you were trying to open."
owner: "Google (Accounts — multi-login / session management)"
channel: "Google Account Help Community · Workspace support"
---

Someone sends you a Google Doc. You click it. Google opens it as the **wrong account** — and
because that account doesn't have access, you get a page offering to *request* access to a
document you already have access to, from your other account, which is also signed in, in the same
browser, right now.

This happens because every bare Google URL resolves to your **default account**, and your default
account is the one you signed into first. Not the one you use most. Not the one that owns the link.
The one that happened to be first — a decision you may have made years ago, in a browser profile
you no longer think about.

## There is no control

That is the whole case. The default account is a real setting: it has a value, that value governs
where every link lands, and it is visible to you in the account switcher. It simply has no control
attached to it. There is no "Set as default" anywhere in Google's account settings, no right-click
in the switcher, no preference page.

The only way to write to it is to **destroy every session and replay them in the correct order**:
sign out of all accounts, sign in first with the one you want as default, then sign the others back
in. A settings change performed by logging out of your entire digital life and re-entering it in a
specific sequence.

That is not a workaround someone invented. It is the canonical remedy, because nothing else exists.

## Google's own documentation won't commit to the rule

The support page says: *"In many cases, your default account is the one you signed in with first."*

**In many cases.** The company that determines the value will not state the rule that determines
it. And the page that explains what the default account is contains no instruction for changing it
— it describes the behaviour and stops.

So the user is left in an unusually complete bind: a setting they cannot set, governed by a rule
the owner won't fully state, documented in a page that doesn't mention changing it.

## Why it costs so much

The cost isn't the switching. It's that the failure lands on **links from other people** — which
means it lands in the middle of someone else's request, at the moment you were trying to be
responsive. A calendar invite, a shared doc, a form, a video call. Each one opens as the wrong
identity and makes you look like you don't have access to your own work.

And the recovery is worse than one click. Switching accounts reloads, and frequently drops you on
a landing page rather than the document you were opening, so you go back to the original link and
start again. Some of those attempts generate **access requests** that email the document's owner —
so the bug propagates to other people's inboxes.

## The math

<p class="equation">800M people <span class="op">×</span> 40 wrong-account opens/year <span class="op">×</span> 25s <span class="eq">=</span> <span class="out">~347 lifetimes / year</span></p>

Band **~10 to ~2,800 lifetimes/year**. Among the largest on this site, for a reason that is worth
stating plainly: it is not a rare failure in a small product. It is a small failure in the default
path of a product that two billion people use for work.

## The workarounds, and what they cost

- **`/u/N/` URLs.** `mail.google.com/mail/u/1/` addresses the second signed-in account directly.
  Works, and requires you to know your own account's index number and hand-edit other people's
  links.
- **A separate browser profile per account.** The genuine fix, and the reason Chrome profiles
  exist — but it means running two browsers, and the profile's signed-in account is a *different
  thing* from the web default anyway, which is its own source of confusion.
- **Sign out of everything and back in.** The official answer. Minutes, plus every
  two-factor prompt you own.

## The fix

**Let the switcher set the default.** The account switcher already lists every signed-in account,
already knows which is index 0, and is already the place a person goes when this goes wrong. A
"Make default" item in that menu is the entire feature.

A cheaper partial fix, available immediately: when a Google link 404s or offers *Request access*,
and **another signed-in account in the same browser can open it**, say so. Google knows all the
signed-in accounts and can evaluate access for each. Instead of "you need permission," the page
could read "you have access to this as your other account — open it?" That turns the most common
and most embarrassing instance of this bug into one click, without touching the session model at
all.

<div class="todo" markdown="1">
**Google's own hedge is the unverified part.** "In many cases" implies conditions under which the
first-signed-in account is *not* the default, and those conditions are not documented anywhere.
The behaviour also differs on mobile operating systems, by Google's own admission, without
specifying how.

User counts are third-party aggregates and vary widely between sources — some report ~1.8 billion
Gmail users, others cite a Google claim of 3 billion. The lower figure is used here. The citations
that matter are Google's own help page, for the rule and for the absence of any way to change it.
</div>

## Difficulty to fix: moderate

> It is a setting. It has a value. It changes what every link does. The only way to edit it is to
> sign out of everything you own and come back in the right order.
