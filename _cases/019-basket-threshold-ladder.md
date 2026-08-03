---
number: 19
title: "Spend £30.50 more to save £8.50"
tagline: "A progress bar shows how close you are to a discount. It never shows the arithmetic: reaching the next tier costs far more than the tier is worth. And the moment you clear one threshold, a new one appears."
difficulty: none
todo: "Population & frequency are estimates"
platforms: [Web]
lifetimes:
  low: 20
  headline: 150
  high: 600
facts:
  - label: "Online shoppers worldwide"
    value: "2.86 billion"
    source: "e-commerce statistics, 2026"
    url: "https://www.sellerscommerce.com/blog/ecommerce-statistics/"
  - label: "Global e-commerce retail sales"
    value: "~$6.9 trillion/yr"
    source: "2026 estimate — 21% of all retail"
    url: "https://capitaloneshopping.com/research/ecommerce-statistics"
  - label: "Global life expectancy"
    value: "73 years"
    source: "World Bank, 2023"
    url: "https://data.worldbank.org/indicator/SP.DYN.LE00.IN"
assumptions:
  - label: "Shoppers who act on a threshold nudge"
    low: "10%"
    headline: "20%"
    high: "35%"
  - label: "Times per year they hunt for filler items"
    low: "2"
    headline: "4"
    high: "10"
  - label: "Seconds spent browsing for something to close the gap"
    low: "60s"
    headline: "150s"
    high: "400s"
    note: "Time only. The larger harm — money spent on things you didn't want — isn't a unit this site measures."
owner: "E-commerce platforms & retailers (basket/checkout upsell modules)"
channel: "Consumer protection regulators · retailer feedback"
---

*"Get 10% off when you spend £30.50 more."* A tidy green progress bar, a celebratory party emoji, and
two neat milestones. What it never shows you is the sum.

## The arithmetic it declines to do

The basket is at **£54.50**. The 10% tier unlocks at **£85**.

| | |
|---|---|
| Extra spend required | **£30.50** |
| Discount earned (10% of £85) | **£8.50** |
| **Net change to your wallet** | **−£22.00** |

You spend **£22 more** than you otherwise would, in order to "save" £8.50.

And this isn't a quirk of these particular numbers — it's structural. Closing a gap of **ΔS** to reach
threshold **T** at discount rate **d** only pays if **d × T ≥ ΔS**. Here that means £8.50 ≥ £30.50,
which is false by a factor of nearly four. For a 10% tier, the offer is only neutral once you're already
within 10% of the threshold — a basket of £76.50 or more. At £54.50 you are nowhere near it, and the
interface presents this as an opportunity.

The one case where it *is* a genuine saving: **you were going to buy those items anyway.** Then the
discount is free money. The design's job is to blur the line between that case and the other one.

## The ladder never ends

Look at the top of the screenshot: *"Your order qualifies for FREE delivery"* — already achieved. A goal
met. And instead of a completion state, the bar immediately renders **the next target**.

That's the mechanic. There is never a "done." Clear a tier and a further one appears, so the bar is
permanently partly-empty and you are permanently almost-there. It's the same near-miss psychology as a
loyalty card that adds a stamp box when you fill the last one.

## The principle

**A progress bar should measure your goal, not the seller's.** This one looks like it's tracking your
progress toward something you want. It is tracking your progress toward a target basket value someone
else picked. Same visual grammar as a download bar or a fitness ring — borrowed to make a spending
target feel like an achievement.

Note the vocabulary too: your order *"qualifies."* You aren't qualifying for anything. You're being sold
to, in the language of prizes.

## The honest steelman

Delivery thresholds are not a scam. Shipping has real fixed costs, larger baskets genuinely amortise
them, and passing some of that back is legitimate. Volume discounts are ordinary commerce.

The objection is narrower, and it's about disclosure:

1. **The net is never shown.** It would take one line — *"spend £30.50, save £8.50"* — and it is
   conspicuously absent.
2. **The ladder has no completion state**, which converts a discount into a treadmill.
3. **It's framed as a reward** for something that is, arithmetically, a cost.

## The math

<p class="equation">2.86B shoppers <span class="op">×</span> 20% <span class="op">×</span> 4 hunts/yr <span class="op">×</span> 150s <span class="eq">=</span> <span class="out">~150 lifetimes / year</span></p>

Time only — the minutes spent scrolling a catalogue for something, anything, worth £30.50. The money is
the bigger harm and this site has no unit for it.

## The second case where "difficulty: none" is a lie

Like [case 018](/cases/018-obstructed-cancellation/), the fix is one line of text and will not be
shipped, because the omission is the mechanism. Most of this site documents accidents — nobody *wanted*
Finder to say 1970. This is designed, tested, and measured by the people who built it.

<div class="todo" markdown="1">
**Estimates.** Shopper counts and e-commerce totals are cited; the share who act on threshold nudges and
how long they spend hunting for filler are reasoned figures. The retailer in the screenshot isn't named
because the pattern is near-universal, not because it's in doubt. The confident claim is the
**arithmetic**, which is exact and holds for any tier where d × T < ΔS.
</div>

## Difficulty to fix: none

> Show the net. *"Spend £30.50 to save £8.50."* One sentence, no redesign, no engineering. The reason
> it isn't there is the entire reason the bar works.
