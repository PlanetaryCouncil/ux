---
number: 10
oneoff: true
title: "Hawaii, 2018: the proof that the pattern kills"
tagline: "For 38 minutes, a whole state believed a ballistic missile was inbound — because a high-stakes, irreversible alert had no confirmation step and no way to take it back."
difficulty: moderate
proof_line: "38 minutes · ~1.4M people · no confirmation · no undo"
facts:
  - label: "Date"
    value: "13 January 2018, 8:07 AM"
    source: "FCC preliminary report"
    url: "https://docs.fcc.gov/public/attachments/DOC-348923A1.pdf"
  - label: "Duration of the false alert"
    value: "38 minutes"
    source: "FCC report"
    url: "https://docs.fcc.gov/public/attachments/DOC-348923A1.pdf"
  - label: "People who received it"
    value: "~1.4 million (statewide)"
    source: "Hawaii population, US Census"
    url: "https://www.census.gov/quickfacts/HI"
owner: "Emergency-alert software + agency process (HI-EMA; alert-origination vendors)"
channel: "Historical — remediated after the incident (a confirmation step was added)"
---

At 8:07 AM on 13 January 2018, every phone in Hawaii lit up: **"BALLISTIC MISSILE THREAT INBOUND TO
HAWAII. SEEK IMMEDIATE SHELTER. THIS IS NOT A DRILL."** For **38 minutes** it stood uncorrected. People
said goodbye to their families. Children were lowered into storm drains. It was false.

This case has no per-year napkin — it happened once. Its value is different: it is the **already-agreed
proof** that the pattern the rest of this site catalogues is real, and lethal at the limit. Everything
else here is this same shape, dialled down.

## Correcting the myth

The popular story — *an operator picked the wrong item from a drop-down menu* — is **wrong**, and the
[FCC's report](https://docs.fcc.gov/public/attachments/DOC-348923A1.pdf) says so. The worker genuinely
believed a real attack was imminent; it was not a mis-click. That correction matters, because the true
failures are more damning than a fat finger:

- **No confirmation** before transmitting a live, statewide, irreversible alert. One action, no "are you
  sure," no second person, no gate proportional to the stakes.
- **Test and live commingled** in the same interface, so the boundary between a drill and the real thing
  was a matter of attention, not architecture.
- **No way to take it back.** There was no pre-drafted correction and no rollback path — which is the
  entire reason it took 38 minutes to say "never mind."

## The lesson the whole site runs on

When an action is **irreversible** and the stakes are **high**, three things are non-negotiable:
confirmation proportional to consequence, hard separation of test from live, and a rollback path built
*before* it's needed. Hawaii is the case where all three were missing at once, at maximum stakes.

It's also the case that got fixed — a confirmation step was added afterward. Which is exactly the
Ministry's question: **why did it take a near-mass-panic to earn a confirmation dialog, when the same
pattern, dialled down, quietly costs lifetimes everywhere else every day?**

## Not counted in the yearly total

This is a one-off event, so adding a "lifetimes per year" figure would be dishonest. It sits here as the
anchor — the proof — not as a line in the napkin sum.
