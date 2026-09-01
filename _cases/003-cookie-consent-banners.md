---
number: 3
title: "Cookie banners: click the same box on every site, forever"
tagline: "Shut up and give me the cookie. Whether you want to accept or reject, you're forced to decide again on every site you've ever visited — a choice a browser could make once."
difficulty: moderate
todo: "Source & extrapolation to firm up"
platforms: [Web, Government]
lifetimes:
  low: 3000
  headline: 4800
  high: 9000
facts:
  - label: "Time EU spends clicking cookie banners"
    value: "575 million hr / year"
    source: "Legiscope, 2023 (widely cited)"
    url: "https://www.legiscope.com/blog/hidden-productivity-drain-cookie-banners.html"
  - label: "…in full-time-worker terms"
    value: "≈ 275,000 FTEs"
    source: "same analysis"
    url: "https://www.simpleanalytics.com/blog/europeans-spend-575-million-hours-clicking-cookie-banners-every-year"
  - label: "Websites showing a banner"
    value: "~85%"
    source: "avg user sees ~1,020 / year"
    url: "https://anythingcounter.com/cookie-banners-per-day"
  - label: "Cookie banners that FAIL GDPR anyway"
    value: "80–90%"
    source: "compliance studies"
    url: "https://www.ignite.video/en/articles/basics/cookie-consent-studies"
  - label: "Internet users worldwide"
    value: "~5.5 billion"
    source: "ITU, 2026"
    url: "https://www.itu.int/en/ITU-D/Statistics/Pages/stat/default.aspx"
assumptions:
  - label: "EU: hours per user per year (this one is measured, not guessed)"
    low: "1.0 hr"
    headline: "1.4 hr"
    high: "2.2 hr"
    note: "The 575M-hour figure ÷ ~410M EU internet users. Shown as a band for the seconds-per-banner uncertainty."
  - label: "Rest of world: hours per user per year"
    low: "0.3 hr"
    headline: "0.5 hr"
    high: "1.0 hr"
    note: "Banners are near-universal, but enforcement is lighter outside the EU. Deliberately kept below the EU rate."
owner: "Browser makers · W3C (Global Privacy Control) · EU (ePrivacy Regulation)"
channel: "globalprivacycontrol.org · browser issue trackers · EU ePrivacy consultation"
---

The web's most-clicked button isn't Buy, or Like. It's **Accept**. Every site, every device,
every time your cookies clear — the same box, the same shrug, the same ten seconds gone. And
here's the kicker: **80–90% of these banners don't even comply with the law they exist for.**
Maximum friction, near-zero privacy. The worst of both worlds.

## The math

The EU part isn't even an estimate on my side — it's a measured, cited figure:

<p class="equation">575M hours / year (EU) <span class="eq">=</span> <span class="out">~900 lifetimes / year</span> <span class="op">— just the EU</span></p>

Extended worldwide at a deliberately conservative rate (the rest of the world kept *below* the
EU's per-capita clicking), the napkin lands at:

<p class="equation">EU 575M hr <span class="op">+</span> 5.1B users <span class="op">×</span> 0.5 hr <span class="eq">=</span> <span class="out">~4,800 lifetimes / year</span></p>

Even the low end — **~3,000 lifetimes a year** — is **fifty times** cases 001 and 002 combined.
This is the monster. Cookie banners are the single largest waste of everyone's time we have done to ourselves.

<div class="todo" markdown="1">
**Two things to firm up before this number is quoted as settled.**

1. The 575M-hour figure is widely repeated but traces back to a **single analysis**
   ([Legiscope](https://www.legiscope.com/blog/hidden-productivity-drain-cookie-banners.html)),
   not a peer-reviewed study. Its own assumptions (banners per user, seconds each) need reading
   before we lean on it — repetition across blogs is not independent confirmation.
2. The **worldwide** extension is our extrapolation, not anyone's measurement. The EU portion
   (~900 lifetimes/yr) is the only part with a cited source behind it.

Per [the methodology](/methodology/), the honest floor here is the EU figure. The global number
is a labelled estimate, and it is doing the heavy lifting in the headline.
</div>

## The aggravated form — the blocking consent wall

The polite banner sits at the edge of the screen and lets you read. Its nastier cousin **greys
out the entire page and blocks it** until you engage. This crosses a line: the content is already
loaded — it *exists* behind the dimming — and it's being deliberately withheld until you comply.
That's not a request, it's **hostage-taking.** "Please consent" becomes "consent or you get nothing."

It almost always ships with the reject-parity violation: **Accept all** is one bright button, while
**Reject** is buried behind "Manage preferences → toggle everything off → confirm." GDPR explicitly
requires reject to be as easy as accept — so the wall is usually *illegal as well as gross*, and
doubly pointless, because no one cornered into clicking has meaningfully consented to anything.

Same through-line as the rest of this site: the system refuses to let **no** be easy, and makes the
adverse action the path of least resistance.

## Why "give me the cookie" is the *right* instinct

The banner pretends to be a choice. In practice it's a reflex — everyone clicks the biggest
button to make it go away, which is exactly why 80–90% of implementations quietly violate
GDPR's "reject must be as easy as accept" rule. Nobody is meaningfully consenting. The time is
pure deadweight loss: no privacy delivered, hours destroyed.

The honest reframing: **consent shouldn't be a per-site interruption — it should be a setting
you choose once.** That serves *everyone*:

- People who don't care (accept-all) never see a banner again.
- People who do care (reject-all) get it enforced everywhere, automatically — stronger privacy
  than clicking "reject" on 1,020 sites a year and missing some.

Either way, **nobody clicks.** The friction, not the privacy, is the enemy.

<div class="info" markdown="1">
**[killthecookiebanner.eu](https://killthecookiebanner.eu/)** — a coalition of seven civil-society
organisations including **noyb**, **EDRi**, the **EFF** and **BEUC** — is campaigning for exactly the
fix described below: browser-level automated signals that carry your privacy preference, so you set it
once instead of clicking a box on every site. They're backing the European Commission's autumn 2025
proposal and asking people to contact their MEP or national representative.

Their sharpest number, and it demolishes the consent fiction: **up to 90% of users click "yes" — while
only about 3% actually want tracking.** (Figures as cited by the campaign; we haven't traced them to
the underlying study.)

Worth repeating their own caveat, because it's careful: they explicitly **do not** endorse the rest of
the Digital Omnibus reform package, which they consider likely to weaken people's rights. Supporting
the browser-signal fix isn't the same as supporting everything it's bundled with.
</div>

## The fix already exists — it just isn't mandated

- **Global Privacy Control (GPC)** is a browser-level "here's my standing preference" signal.
  California's CCPA *legally requires* businesses to honour it. It works. It's just not
  mandatory in the EU, so sites ignore it and show the banner anyway.
- The dead **Do Not Track** header was this idea a decade early; industry killed it by choosing
  not to honour it. The lesson: the signal needs legal teeth, not goodwill.
- The EU's own **ePrivacy Regulation** has been trying to move consent to the browser for years.

So the fix is **difficulty: moderate** — not one line of code, but not moonshot either. It's a
browser default plus a regulation that says "honour the browser signal, banner forbidden." The
technology is shipping today.

## Second-order waste — directional, only pushes up

1. **Consent fatigue bleeds into everything.** Trained to reflexively click the big button,
   users click through *real* security and permission prompts the same way.
2. **The banner-industrial complex.** An entire consent-management SaaS industry now bills
   businesses to generate the friction. Money and engineering spent manufacturing the annoyance.
3. **Page-load and layout-shift tax.** Consent scripts are among the heaviest third-party
   blockers on the web — slower pages for 5.5 billion people, on top of the click.

## Difficulty to fix: moderate

> The web's most-clicked button is "Accept." Not because anyone consents — because it's the
> fastest way to make the box disappear. Move the choice into the browser, make it once, and
> hand **~4,800 lifetimes a year** back to humanity. Just give me the cookie.
