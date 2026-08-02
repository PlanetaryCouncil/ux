---
layout: default
title: Methodology
---

<div class="prose">

# The napkin, and the rules it follows

Every case answers one question: **how many human lifetimes does this waste per year?**

The formula is deliberately simple enough to fit on a napkin:

> **lifetimes / year = (users × daily incidence × seconds wasted × 365) ÷ (73 years, in seconds)**

73 years is global life expectancy (World Bank). 73 years ≈ 2.3 billion seconds.

## Four rules keep it honest

**1. Facts at face value — cited, never sandbagged.**
If a number is knowable, we look it up and use the real value. Chrome has ~3.8 billion users; we write 3.8 billion, not "let's say 1 billion to be safe." Under-claiming a known fact is just as dishonest as over-claiming it, and it costs more credibility — a reader who knows the real number stops trusting the rest.

**2. Conservatism belongs only on the unknowns.**
Some numbers genuinely can't be measured — what fraction of people hit a bug daily, how many seconds each instance costs. There, we pick low, round, *imaginable* figures. Anyone can picture 1%. Anyone can picture once a day. The safety margin lives here, in the assumptions, where it's labelled — never smuggled into the facts.

**3. Every estimate carries a low and a high — and we publish the low.**
Unknowns aren't single numbers, they're ranges, so each case shows a **low → likely → high** band. The figure on the front of every case, and the total on the home page, is the **low** one: the smallest number the assumptions can support, added up.

That is the whole point of leading with it. A range invites an argument about which end is real, and a "best estimate" invites the accusation that we picked it to impress. A floor invites neither. Take any assumption on this site, push it to the most sceptical value we thought defensible, and the published number still stands — because that value is already the one printed. The likely and high figures are shown underneath, but they never carry the claim.

It costs us. The honest midpoint is roughly double the floor and the ceiling is several times it, so the site systematically understates what it believes. That is the correct trade: a number nobody can argue down is worth more than a bigger one that invites the argument.

**4. Second-order effects are directional, not precise.**
Frustration cascades, abandonment, defensive workarounds — these are real and they only ever push the number *up*. We list them as "this makes it worse," never as a fake decimal.

## Rule zero: unfinished work is marked, not hidden

Every case shows its open questions in an amber **TODO** box, and carries a warning badge at the
top and in the case list until they're closed. Unverified repro, a number resting on a single
source, an extrapolation doing more work than its evidence supports — these get stated plainly on
the page rather than quietly omitted.

This isn't an apology for incomplete work. It's the same rule as the rest: a reader should be able
to see exactly how much weight each number can bear. A case that hides its weak joint is worth less
than one that points at it.

## Sending your own

It takes about a minute. Say what went wrong in a sentence, add a screenshot if you have one, and send it — GitHub, Telegram, Twitter or email, whichever you are already logged into.

**You do not need the maths.** We work the numbers out. A real problem nobody has written down is worth more than a neat calculation of one already on the list.

## And one more column: difficulty to fix

A wasted-time number is only outrage. The metric becomes *action* when paired with how easy the fix is. Most of these are **difficulty: none** — a prefilled field, five lines of code, a pattern that a government design system already documented years ago. That gap — enormous harm, trivial fix — is the entire point of the Ministry.

## Why "lifetimes"

Because seconds don't move anyone, and "3.8 billion × 1%" is an abstraction. A *lifetime* is the most human unit there is. Steve Jobs made this exact argument to the Macintosh team in 1983: shave 10 seconds off boot time for millions of users and you save dozens of lifetimes a year. He was right. We're just applying it to everything.

The honest caveat, stated up front: nobody gets a saved 10 seconds back as usable life. We're aggregating slivers of attention, not literal years. Transport economics does exactly this — summing tiny per-trip time savings into billions — so the method is legitimate. But the unit is a rhetorical device pointing at a real cost, not a claim that fixing Chrome resurrects the dead. As the flamingo says: lives saved today — *emotionally, yes.*

</div>
