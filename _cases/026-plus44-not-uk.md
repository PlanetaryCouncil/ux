---
number: 26
title: "+44, but not the UK, and nothing tells you until the bill"
tagline: "Jersey, Guernsey and the Isle of Man share the UK's +44 code and even its 07 mobile format — while sitting outside UK call allowances. The number looks domestic, dials domestic, and charges international."
difficulty: easy
todo: "Operator-by-operator status changes — verify before quoting"
platforms: [Telecoms]
lifetimes:
  low: 1
  headline: 2
  high: 15
facts:
  - label: "Shared country code"
    value: "+44 — UK, Jersey, Guernsey, Isle of Man"
    source: "separate jurisdictions, one numbering code"
    url: "https://en.wikipedia.org/wiki/Telecommunications_in_Guernsey"
  - label: "Inclusive allowances"
    value: "island numbers usually excluded"
    source: "treated as international by UK operators"
    url: "https://ee.co.uk/help/mobile/roaming/call-abroad/countries/jersey"
  - label: "Island mobiles"
    value: "also start 07 — indistinguishable"
    source: "same format as UK mobiles"
    url: "https://help.giffgaff.com/en/articles/242448-special-charges-code-of-practice"
  - label: "Some operators have dropped the surcharge"
    value: "e.g. Sky Mobile, 2023"
    source: "regulators still pushing others"
    url: "https://www.itv.com/news/channel/2023-01-11/sky-scraps-extra-charges-for-calls-and-texts-to-the-channel-islands"
  - label: "Global life expectancy"
    value: "73 years"
    source: "World Bank, 2023"
    url: "https://data.worldbank.org/indicator/SP.DYN.LE00.IN"
assumptions:
  - label: "UK mobile users who call an island number unknowingly"
    low: "1M"
    headline: "3M"
    high: "10M"
  - label: "Times per year"
    low: "1"
    headline: "2"
    high: "6"
  - label: "Seconds lost noticing, researching and disputing"
    low: "180s"
    headline: "600s"
    high: "1800s"
    note: "Time only. The actual harm is the charge, which this site has no unit for."
owner: "UK mobile operators · Ofcom · handset dialler makers"
channel: "Ofcom · operator complaints · Apple/Google dialler feedback"
---

The UK's country code is **+44**. So are Jersey's, Guernsey's and the Isle of Man's — three separate
jurisdictions that are **not** the UK, and whose numbers most UK operators exclude from inclusive
allowances and bill as international.

Landlines at least have a tell if you know it: `01534` Jersey, `01481` Guernsey, `01624` Isle of Man.
Mobiles have none. **Island mobiles are `07` numbers**, formatted exactly like every UK mobile. You
cannot distinguish them by looking, because there is nothing to look at.

## The system knows. It just doesn't say.

This is the part that turns bad luck into a design failure.

Your operator holds the number-range database. At the instant you press call, it knows which range that
number sits in, whether it's inclusive, and what it costs. **Every fact needed to warn you exists,
resolved, before the call connects.** The information appears later — itemised, on a bill, weeks after
the decision it should have informed.

That's the whole case: not that the pricing is complex, but that the party who knows keeps quiet until
the money is spent.

## The principle

**Identical identifiers must behave identically — or the difference must be visible at the point of
decision.** A phone number is a promise about cost. When two numbers are indistinguishable and priced
differently, the format has stopped carrying information, and the only remedy left is disclosure.

Note how far this sits from an honest mistake: you cannot learn your way out of it. You can't develop a
habit, spot a pattern, or check a prefix. The only defence is a lookup you'd have to perform before
every call you make.

## The math

<p class="equation">3M callers <span class="op">×</span> 2 times/yr <span class="op">×</span> 600s <span class="eq">=</span> <span class="out">~2 lifetimes / year</span></p>

Time only, and it badly undersells this one. The real cost is the charge — sometimes several pounds a
minute — and money isn't a unit this site measures.

## The fix

**Warn at dial time.** *"This number isn't in your allowance — 40p/min. Continue?"* One prompt, using
data the network already resolved. Everything else follows from there:

- Show the destination in the dialler when it isn't your home tariff.
- Flag it in Contacts, once, when the number is saved.
- Or do what some operators already did and **include the islands** — Sky dropped the surcharge in 2023,
  which proves it's a commercial choice, not a technical constraint.

<div class="todo" markdown="1">
**Operator status is a moving target.** Some UK providers have removed Channel Islands surcharges and
regulators are pushing the rest, so any specific claim about a specific network must be checked against
current tariffs before being quoted. The stable facts are structural: shared +44, separate jurisdictions,
`07` mobiles indistinguishable by format. Population and frequency are estimates.
</div>

## Difficulty to fix: easy

> The network resolves the cost before it rings. Say it out loud, at the moment someone can still hang
> up, instead of on a bill four weeks later.
