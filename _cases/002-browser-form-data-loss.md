---
number: 2
title: "An hour of form-filling, gone on one accidental refresh"
tagline: "You fill a giant browser form — say the 8-page IRS W-8BEN-E. One ⌘R, back-swipe, or tab close, and it's all erased. No warning. No draft. Start over."
difficulty: easy
todo: "Cross-browser check pending"
platforms: [Web, Google, Government]
lifetimes:
  low: 7
  headline: 52
  high: 175
facts:
  - label: Internet users worldwide
    value: "~5.5 billion"
    source: "ITU / analyst estimates, 2026"
    url: "https://www.itu.int/en/ITU-D/Statistics/Pages/stat/default.aspx"
  - label: Global life expectancy
    value: "73 years"
    source: "World Bank, 2023"
    url: "https://data.worldbank.org/indicator/SP.DYN.LE00.IN"
  - label: "IRS's own burden estimate (sibling form W-8BEN)"
    value: "7 hr 24 min"
    source: "Paperwork Reduction Act notice"
    url: "https://www.irs.gov/instructions/iw8ben"
  - label: "Withholding if the form is botched/unfiled"
    value: "30% of gross"
    source: "IRS foreign-payee rules"
    url: "https://www.irs.gov/instructions/iw8bene"
assumptions:
  - label: "Internet users filling a long browser form on a given day"
    low: "0.5%"
    headline: "1%"
    high: "1.5%"
  - label: "Of those, the share who suffer a loss event mid-fill"
    low: "0.5%"
    headline: "1%"
    high: "1.5%"
    note: "Refresh, back button, tab close, crash, or session timeout."
  - label: "Minutes to re-enter what was lost"
    low: "5 min"
    headline: "10 min"
    high: "15 min"
    note: "Conservative — a lost W-8BEN-E alone is the IRS's estimated hours, not minutes."
owner: "Form owners (web) · Chromium PDF team · IRS Office of Online Services"
channel: "Form libraries (default autosave) · issues.chromium.org (Internals > Plugins > PDF) · IRS digital-services feedback"
---

The poster child is the IRS **W-8BEN-E** — 8 pages, ~30 parts, filled by every non-US entity
that ever invoices a US company. But it's every long browser form: job applications, visa
paperwork, insurance claims, government portals. You pour in an hour. One accidental refresh,
and the browser pretends you never existed.

This one was reproduced by hand: typed a name into the fillable PDF, closed it — **everything
erased.** Bizarrely, insanely normal.

## The math

<p class="equation">5.5B users <span class="op">×</span> 1% <span class="op">×</span> 1% <span class="eq">=</span> <span class="out">550K loss events / day</span></p>

550,000 × 10 minutes = **330 million seconds / day** ≈ **3,800 human years / year**
≈ **~52 lifetimes / year.** The band runs from 7 (low) to ~175 (high) lifetimes.

## Second-order waste — directional, only pushes up

1. **Real money, not just time.** A botched or unfiled W-8BEN-E means the withholding agent
   keeps **30% of gross US-source payments.** This paper-cut costs foreign freelancers and
   small firms actual income.
2. **The defensive-typing tax.** Burned users now draft every form's answers in a separate
   doc and paste them in — a permanent overhead paid forever, caused by the *memory* of one loss.
3. **Support load.** "I lost my form" tickets, resent links, expired-session escalations.

## The fix has three layers

The floor is a dirty-state `beforeunload` guard — a handful of lines that pops "you have
unsaved changes." The real fix is **draft persistence** (autosave to localStorage or server),
which makes the loss impossible rather than merely warned-about.

| Layer | Fix | Owner |
|---|---|---|
| Web forms | Dirty-state guard **+** autosave. Register `beforeunload` only *while dirty* (it disables the back/forward cache otherwise) | Form libraries — fix the *default*, not one site |
| Browser PDF | Chrome already restores **HTML** form state on back/refresh. The **PDF viewer should do the same**, and warn on dirty unload | Chromium PDF team |
| The form itself | A fillable PDF is the wrong medium for a 30-part form. Web-native with saved state — the IRS already proved it can with Direct File | IRS Office of Online Services |

**The pattern is already solved:** the [GOV.UK Design System](https://design-system.service.gov.uk/patterns/save-and-come-back-later/)
mandates "save and come back later" for long government forms. It's just not deployed everywhere.

## Repro status

✅ **Confirmed by hand** — typed into the fillable PDF, closed it, data gone. No warning.

<div class="todo" markdown="1">
**Cross-browser comparison not yet done.** The "no warning on refresh" claim is confirmed
only for the case above. Chrome's PDF-viewer behaviour has shifted across versions, so before
this is cited anywhere it needs verifying against *current* Chrome, Firefox, Safari and Edge —
screen-recorded, as a comparison table, for the Chromium issue.

Until that's done, treat the browser-layer claim as **one reproduction, not a survey.**
The time math above doesn't depend on it: it rests on long web forms generally, not on any
one browser's PDF handling.
</div>

## Difficulty to fix: easy

> You typed for an hour. The browser watched every keystroke. One refresh and it acts like
> you were never there. A five-line dirty-state guard — or a browser that treats PDF forms
> the way it already treats HTML forms — saves **~50 lifetimes a year.** GOV.UK solved this
> pattern years ago.
