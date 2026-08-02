---
number: 18
title: "Three steps, two interstitials, and a button that isn't the one you want"
tagline: "Subscribing took one click. Cancelling is \"Step 2 of 3\", interrupted by a modal asking if you'd rather change plans — where the retention button is styled and \"No thanks\" is not. Adobe paid $150M over this exact flow."
difficulty: none
todo: "Population sizing is an extrapolation — see note"
platforms: [Adobe, Web]
lifetimes:
  low: 30
  headline: 300
  high: 1200
facts:
  - label: "DOJ/FTC settlement with Adobe"
    value: "$150 million"
    source: "$75M civil penalty + $75M in free services"
    url: "https://www.engadget.com/big-tech/adobe-agrees-to-pay-settlement-for-making-its-subscriptions-hard-to-cancel-210336635.html"
  - label: "Complaint filed"
    value: "June 2024"
    source: "DOJ on referral from the FTC"
    url: "https://www.gtlaw.com/en/insights/2024/7/ftc-targets-adobe-for-hidden-fees-and-deceptive-subscription-practices"
  - label: "What was alleged"
    value: "hidden early-termination fees + obstructed cancellation"
    source: "on the \"annual, paid monthly\" plan specifically"
    url: "https://www.hunton.com/hunton-retail-law-resource/ftc-sues-adobe-and-execs-for-illegal-hidden-fees"
  - label: "Global life expectancy"
    value: "73 years"
    source: "World Bank, 2023"
    url: "https://data.worldbank.org/indicator/SP.DYN.LE00.IN"
assumptions:
  - label: "People holding at least one paid subscription"
    low: "800M"
    headline: "1.5B"
    high: "2.5B"
    note: "Streaming, software, news, gyms, storage. An extrapolation, not a measurement."
  - label: "Cancellation attempts per person per year"
    low: "1"
    headline: "2"
    high: "4"
  - label: "Seconds lost versus a one-click cancel"
    low: "60s"
    headline: "180s"
    high: "420s"
    note: "Multi-step wizards, retention interstitials, mandatory surveys, and re-reading which button actually cancels."
owner: "Adobe (worked example) — and effectively every subscription business"
channel: "Consumer protection regulators · FTC/DOJ · national consumer authorities"
---

Signing up took one click and a stored payment method. Cancelling looks like this:

- **"Step 2 of 3"** — a wizard, for the act of stopping
- **A mandatory feedback survey** before you're allowed to proceed
- **An interstitial modal** — *"Can we help you switch products?"* — injected mid-flow
- **Asymmetric buttons**: "Change my plan" gets a border and visual weight; **"No thanks" gets none**
- **"Keep your plan"** parked in the corner throughout, in case you waver
- And at the bottom, **"Continue"** — where continuing means continuing *to cancel*, which is momentarily ambiguous by design

Every one of those is individually defensible. Together they're a maze, and the maze is the point.

## This one has a court record

Most cases on this site are arguments. This one has a settlement.

In **June 2024** the DOJ, on referral from the FTC, sued Adobe over precisely this: obscured
early-termination fees and a cancellation process requiring *"multiple steps online or repeated
interactions with customer service representatives."* Adobe agreed to a **$150 million** settlement —
$75M civil penalty plus $75M in services. Adobe denied wrongdoing.

The complaint singled out the **"annual plan, paid monthly"** structure — which is exactly the plan in
this screenshot, at £32.66/mo, with one day of trial left. Miss the window and you're not on a monthly
plan you can leave; you're in an annual commitment with a fee to escape it.

## The principle: symmetry of effort

**Leaving should cost what joining cost.** If subscribing is one click from a logged-in state, then
cancelling is one click from a logged-in state. Any gap between those two numbers is deliberate — nobody
accidentally builds a three-step wizard — and the size of the gap is a fair measure of how much a
company is willing to inconvenience you to keep your money.

Everything in the flow above exploits the same three levers:

1. **Steps** — each one is another chance to give up.
2. **Interruption** — a retention offer placed where you expected a confirm button.
3. **Visual hierarchy** — the button they want is styled; the button you want is plain text. Your eye
   finds the emphasised one, and emphasis is doing the work a lock isn't allowed to do.

## The math

<p class="equation">1.5B subscribers <span class="op">×</span> 2 cancellations/yr <span class="op">×</span> 180s <span class="eq">=</span> <span class="out">~300 lifetimes / year</span></p>

And unlike most cases here, the time is the *smaller* harm. The real cost is the subscriptions people
fail to cancel — the charge that lands because the maze outlasted their patience. That's what $150M was
about, and money isn't a unit this site measures.

## The first case where "difficulty: none" is a lie

A cancel button is trivial to build. Technically this is the easiest fix on the site.

But every other case here is an **accident** — nobody wanted Chrome's blank username field or Finder's
1970 timestamps; they're just nobody's job to fix. This one is **designed**. The friction is the product
working as intended, which is why it took a federal lawsuit rather than a bug report. So "difficulty:
none" is true of the code and false of the organisation, and that gap is the whole story of this case.

<div class="todo" markdown="1">
**The Adobe specifics are court-documented; the global sizing is not.** The settlement, the filing date,
the allegations and the plan structure are all cited. The number of people holding subscriptions and how
often they cancel are extrapolations — hence the band spanning a factor of forty. The confident claims
are the **pattern** and the **legal record**, not the headline figure.

Adobe's current flow may also differ from the one described in the complaint, since the settlement
requires changes. This case documents the screenshot as observed.
</div>

## Difficulty to fix: none

> One click in. Three steps, two interstitials and a survey out. The asymmetry isn't an oversight — it
> is the feature, and it cost $150 million to be told so.
