---
number: 23
micro: true
micro_line: "≈0.9 lifetimes / year"
title: "A footnote explaining a marker that isn't on the page"
tagline: "Two prices, both marked with a single asterisk. Below them, two footnotes — one for the asterisk, and one for a double asterisk that appears nowhere in the dialog. You scan the screen twice looking for something that was never there."
difficulty: none
todo: "Reproduce across the booking flow"
platforms: [Web]
facts:
  - label: "Air passengers worldwide"
    value: "~5.2 billion (2026 forecast)"
    source: "IATA"
    url: "https://www.iata.org/en/pressroom/2026-releases/2026-01-29-02/"
  - label: "Markers used on screen"
    value: "single asterisk only — on both prices"
    source: "observed: Icelandair fare-upgrade dialog"
  - label: "Markers explained below"
    value: "single and double"
    source: "the double-asterisk footnote has no referent in the dialog"
  - label: "Global life expectancy"
    value: "73 years"
    source: "World Bank, 2023"
    url: "https://data.worldbank.org/indicator/SP.DYN.LE00.IN"
owner: "Airline booking flows (observed: Icelandair) — and disclosure boilerplate generally"
channel: "Airline web feedback · consumer protection authorities"
---

An upgrade dialog shows two fares: **GBP 319.91** and **GBP 399.91**, each carrying a single asterisk.
Underneath sit two footnotes — one for the asterisk, explaining that these are average per-passenger
prices, and then this:

> **Using a round-trip fare as a one-way is permitted only for return flights, subject to a conversion
> fee and any fare difference.**

…introduced by a **double asterisk that appears nowhere on the screen.** You read it, look up, scan both
columns, find no second marker, and eventually conclude the sentence isn't about anything you can see.

## Why this is more than a typo

A footnote marker is a **promise of a referent.** It's a pointer: *"this specific thing has a
condition."* An unanchored footnote breaks that in both directions:

- **You can't tell what it modifies.** Does the conversion fee apply to one of these fares? Both?
  Something on the previous screen? The sentence is precise and its scope is unknowable.
- **It signals the disclosures aren't maintained.** A block of legal text pasted wholesale, markers and
  all, without checking which apply here. Once you notice that, you stop trusting the rest of the small
  print — and the small print is where the fees live.

There's an irony worth naming: disclosure text exists to inform the buyer *and* to protect the seller
legally. Pasting it as boilerplate undermines both. A condition disclosed against a marker that doesn't
exist has arguably not been disclosed at all.

## Why it happens

Almost certainly reuse: one footnote block shared across several screens of the booking flow. Somewhere
there *is* a page with a double asterisk — a one-way/round-trip toggle, most likely — and this dialog
inherited the entire block rather than the applicable half.

That's the general shape: **shared boilerplate rendered unconditionally.** The same instinct that puts
"Terms apply" on a page with no terms, or a required-field asterisk on a form where nothing is required.

## The fix

**Render only the footnotes whose markers actually appear on the page.** If a template can emit the
marker, it should emit the note; if it can't, it shouldn't. That's a conditional, not a redesign.

**The principle: never print a reference to something that isn't there.** It costs the reader real
attention — they *will* look — and it costs you the credibility of everything else in the same block.

## Filed as a micro case

Only a minority of people read footnotes at all, so the aggregate lands under a lifetime a year. It's
published because it's a clean, checkable specimen of a very common failure — and because it takes about
four seconds to verify from a screenshot, making it the cheapest fact-check on this entire site.

<div class="todo" markdown="1">
**Needs reproducing.** This is one dialog, one booking, one airline. To be quoted it should be re-checked
against the current flow, and the screen that *does* carry the double asterisk located — which would
confirm the shared-boilerplate theory rather than leaving it an inference. Booking flows also vary by
route, currency and fare type.
</div>

## Difficulty to fix: none

> The page tells you to look for something. There is nothing to look for. One conditional in a template,
> and the sentence either finds its anchor or stops being printed.
