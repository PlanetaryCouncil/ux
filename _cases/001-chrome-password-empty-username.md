---
number: 1
title: "Chrome asks which email to save — right after you typed it"
tagline: "You reset your password from inside your email. Chrome offers to save it, with the username field blank — the one thing it just watched you type."
difficulty: none
platforms: [Google]
lifetimes:
  low: 8
  headline: 30
  high: 60
facts:
  - label: Chrome users worldwide
    value: "3.8 billion"
    source: "DemandSage / Backlinko, 2026"
    url: "https://backlinko.com/chrome-users"
  - label: Global life expectancy
    value: "73 years"
    source: "World Bank, 2023"
    url: "https://data.worldbank.org/indicator/SP.DYN.LE00.IN"
assumptions:
  - label: "Users who hit this on a given day"
    low: "0.5%"
    headline: "1%"
    high: "2%"
  - label: "Times per day it happens"
    low: "1×"
    headline: "1×"
    high: "1×"
  - label: "Seconds wasted each time"
    low: "5s"
    headline: "10s"
    high: "20s"
    note: "Low = the physical click. High = the interruption / context-switch cost."
  - label: "Share where Chrome can't infer it"
    low: "50%"
    headline: "50%"
    high: "50%"
    note: "A charity toward Chrome — it watched the username get typed anyway."
owner: "Chromium password manager team (components/password_manager/)"
channel: "issues.chromium.org — Chrome > Autofill > Passwords"
---

![The original napkin poster: Chrome's Save password dialog with an empty username field, and the calculation behind it](/images/password-reset-username.png)

We live in 2026, post-singularity AI — and Chrome still opens a **Save password?** dialog
with the username field empty, moments after you typed that exact username into the login
form. It saw it. It just doesn't offer it back.

## The math

<p class="equation">3.8B users <span class="op">×</span> 1% <span class="op">×</span> 50% <span class="eq">=</span> <span class="out">19M pointless prompts / day</span></p>

19 million × 10 seconds = **190 million seconds wasted per day** ≈ **2,200 human years / year**
≈ **~30 lifetimes / year** — from this one blank field. The low estimate still costs
8 lifetimes; the high, 60.

## Second-order waste — the frustration cascade

The first-order number ignores what a *frustrated* user does, and every branch pushes it up:

1. Annoyed, they hit **No Thanks** / **Never** → the password never gets saved.
2. Next login: no autofill → they retype email + password (20–30s, not 10).
3. And the save-prompt **fires again**, because Chrome still doesn't have it.
4. Repeat until they capitulate or memorise the password.

Even a modest model — one extra retype cycle for half of dismissals — roughly doubles the
waste and restores everything the 50% cut removed.

## The rebuttal, pre-empted

> "Chrome *does* prefill the username when the site marks its form with
> `autocomplete="username"`. The blank field is bad site markup, not Chrome's fault."

True, and beside the point. Users don't control site markup. Chrome's heuristics can
compensate — and in the empty-field case, Chrome watched the value get typed into a field
on the same origin, this session. The fix: when the save-prompt username is empty, backfill
from (a) the credential submitted on this origin this session, or (b) the account the
password-reset email was addressed to.

## Difficulty to fix: none

You just typed it. Chrome has it in the field. It knows the origin (a password-reset flow).
It's already offering to save. Pre-fill the username — one tiny change, billions of minutes
saved, every day.
