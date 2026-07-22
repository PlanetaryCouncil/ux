# Case backlog — specimens caught, not yet published

Candidate cases collected from lived use. These are **not on the site yet**: none has
its cited facts or low→high napkin, and per the methodology we don't publish a number
until it's grounded. This file is the holding pen — the pattern and the principle are
captured so the observation isn't lost; the research is the work still to do.

## Two axes we keep rediscovering

The published cases (001–003) are all one flavour. These new ones force two distinctions:

**Cause — accident vs. intent.**
Chrome's blank username is an accident; nobody wanted it. Adobe's "unlimited" banner is
*designed* — the friction earns money, so "difficulty to fix: none" is a lie. Intent cases
need a different verdict column, and they're the more damning half.

**Harm — what actually gets destroyed.** Not all paper-cuts cost the same *kind* of thing:
- **wasted time** (001, 003) — the original metric
- **lost work** (002, audio recorder) — unique content, unrecoverable
- **misdirected diagnosis** (disconnect→"server error") — sent to debug the wrong system
- **catastrophe** (Hawaii) — mass-scale, life-stakes

---

## Candidates

### Multi-monitor cursor dead-zone
Cursor crosses between displays only where their coordinate ranges literally overlap. With
mismatched resolutions (4K panel above, laptop below), the shared edge is short; pushing
toward the other screen anywhere else hits an invisible wall.
**Principle:** route by intent, not geometry — nearest-edge snapping, not strict overlap.
**Harm:** wasted time · **Cause:** accident · **Fix difficulty:** easy · cross-platform (mac/Win/Linux).
**To research:** multi-monitor user counts; per-crossing seconds; whether any OS already does edge-routing.

### Rescue UI lands on the broken/dead screen
When a laptop's own screen is broken, its windows — including the **Displays settings panel you
need to fix the problem** — can open on the dead display, where you can't see them to move them.
A catch-22: the tool to recover is trapped behind the failure it's meant to recover from.
**Principle:** recovery/rescue UI must appear where the user can actually see it — mirror the
Displays panel (and misplaced windows) onto *all* screens, or detect a non-responsive display and
reassign to a live one. **Harm:** lost access / wasted time · **Cause:** accident (no failure-mode
design). Pairs naturally with case 004 as the "when a display fails" half.

### Display settings reflow on one change
Changing one monitor's resolution silently rearranges the whole multi-display layout the
user had deliberately set. One change cascades; the layout doesn't hold its shape.
**Principle:** a setting should survive a neighbour changing. **Harm:** wasted time · **Cause:** accident.

### Local disconnect reported as "server error"
Close the lid → sleep → streaming connection drops → client shows "Server error, check
status page." The server was fine; the device slept. The client had the signal (resume from
sleep, no HTTP status) and still blamed the far end.
**Principle:** "I don't know what happened" must not render as "the other side is broken."
**Harm:** misdirected diagnosis · **Cause:** accident (lazy error path) · **Fix difficulty:** easy.

### Disconnection dramatised instead of resumed
Broader form of the above: dropped connections are treated as exceptions, not the ordinary,
guaranteed event they are (laptops sleep, trains hit tunnels). A dropped phone call resumes
silently; a dropped stream throws an alarm.
**Principle:** disconnect is normal → resumable-by-default, hold state, reconnect quietly.
**Harm:** wasted time + misdirection · **Cause:** happy-path-only design.

### Audio recorder: destructive default that moves
Stop/record and confirm/cancel occupy different positions, so muscle memory is invalidated
(can't re-click the same spot). Worse, the *default/reflex* action is discard, and the
recording is the only copy of a spoken idea.
**Principle:** when an action is irreversible and the content unique, the SAFE choice must be
the default AND sit still. Breaks both at once. **Harm:** lost work · **Cause:** accident ·
**Fix difficulty:** none. (Fuses 001's wrong-default with 002's data-loss.)

### Hawaii false missile alert — the proof case
13 Jan 2018: statewide "ballistic missile inbound, THIS IS NOT A DRILL" for 38 minutes,
because an operator picked the wrong item from a menu listing the real and test alerts with
near-identical wording. FCC report faulted the interface; a confirmation step was added after.
**Why it's the hero case:** not the biggest napkin number — the *already-agreed* proof that
the category is real and dangerous at the limit. Everything else is this pattern dialled down.
**Harm:** catastrophe · **Cause:** accident (design negligence) · **Note:** the red/green
buttons are the meme; the real UI was a plain dropdown of text links — blander, arguably worse.
**To source carefully:** exact wording, the FCC report, what the redesign changed. (Accuracy matters — this one gets scrutiny.)

### Adobe "unlimited generations" — the first intent case
A banner reading "Get unlimited generations" that means unlimited-on-select-models-in-one-app-
for-one-year. Two product lines fused on one page; "Recommended" points at a tier 3× pricier
than the one that serves the common case identically; credits denominated in an invented unit
so they can't be compared to money.
**Principle:** a word must not do work it can't support; a default must not be adverse to the user.
**Harm:** wasted time + overpayment · **Cause:** INTENT — friction is load-bearing revenue ·
**Fix difficulty:** trivial technically, "never" commercially. Forces the accident/intent axis.
