---
number: 7
title: "You closed the lid; it says the server is broken"
tagline: "Sleep, a tunnel, a Wi-Fi blip — the connection drops and the app announces a Server Error and sends you to check the status page. The server was fine. Your device just went to sleep."
difficulty: easy
todo: "Frequency & population are estimates"
lifetimes:
  low: 5
  headline: 60
  high: 500
facts:
  - label: "Global internet users"
    value: "~5.5 billion"
    source: "ITU, 2026"
    url: "https://www.itu.int/en/ITU-D/Statistics/Pages/stat/default.aspx"
  - label: "Global life expectancy"
    value: "73 years"
    source: "World Bank, 2023"
    url: "https://data.worldbank.org/indicator/SP.DYN.LE00.IN"
assumptions:
  - label: "People using streaming/live apps on devices that sleep or roam"
    low: "500M"
    headline: "1B"
    high: "2B"
  - label: "Misattributed-disconnect events per person per year"
    low: "5"
    headline: "12"
    high: "40"
  - label: "Seconds lost to the wrong diagnosis each time"
    low: "5s"
    headline: "15s"
    high: "60s"
    note: "Reading the error, checking the (all-green) status page, wondering what's wrong — before realising it was just sleep."
owner: "Client / SDK error-handling teams (any app with a streaming or long-lived connection)"
channel: "Per-app issue trackers · client SDK repos"
---

You close the laptop lid. The machine sleeps, the connection carrying a live response is torn down,
and on wake the app greets you with **"Server error — something went wrong, check the status page."**
Every word points the wrong way. The server was fine. *You* went to sleep. And it sends you off to
debug a system that was never broken, past a status page that will (correctly) show all-green.

## The real failure

The client had everything it needed to know the truth — it just resumed from sleep, the socket
dropped locally, no HTTP status ever came back from the far end. It could have said *"Connection
lost — your device may have slept or dropped network. Reconnecting…"* Instead it defaulted to blaming
the server. That's the tell of a lazy error path: **"I don't know what happened" rendered as "the
other side is broken."** A local disconnect and a genuine outage are trivially distinguishable, and
the client conflated them.

Worse, it *dramatises the routine.* Disconnection isn't an exception — laptops sleep, trains hit
tunnels, Wi-Fi blips. It's one of the most ordinary events there is, and the app treats every
instance as a crisis worthy of an alarm and a support link.

## The math

<p class="equation">1B people <span class="op">×</span> 12 misread disconnects/yr <span class="op">×</span> 15s <span class="eq">=</span> <span class="out">~60 lifetimes / year</span></p>

Just the seconds spent chasing a phantom outage. The band runs **~5 to ~500 lifetimes/year** on the
population and frequency estimates.

## The fix: resume, don't dramatise

Two changes, both cheap:

1. **Diagnose honestly.** No server response code + a local network/sleep transition → say "connection
   lost," not "server error." Never send the user to a status page for their own sleeping laptop.
2. **Resume by default.** Treat a dropped stream as *resumable*, the way a phone call that blips for two
   seconds simply continues. Hold the state, notice the reconnect, pick up quietly — no alarm at all.

<div class="todo" markdown="1">
**Population and frequency are estimates — treat the headline as order-of-magnitude.** Only the
internet-user and life-expectancy figures are cited. The confident claim is the *pattern*: a client
that misattributes its own local disconnects to the server, and treats an ordinary event as an emergency.
</div>

## Difficulty to fix: easy

> The app knows you have permission to be disconnected — everyone does, constantly. It has the signal
> that this was local. It still blames the server and sends you hunting. Diagnose honestly, resume
> quietly, and stop dramatising the single most routine event on any network.
