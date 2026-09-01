---
number: 3
title: "\"Works best with the latest app\" — meaning: doesn't work at all"
tagline: "The banner says the new model works best with the latest desktop app — implying it works, just less well, on yours. Scroll down: the model picker has it greyed out entirely. It doesn't work best. It doesn't work."
quirk_line: "\"Works best with\" is load-bearing corporate for \"requires.\""
vendor: "Anthropic"
---

A banner in the Claude desktop app: *"Claude Fable 5.1 works best with the latest desktop app."*
Read that as a user. **Works best with** means it works everywhere and works *better* there —
that's the only thing the phrase can mean. So you might reasonably carry on without updating,
expecting the merely-normal experience.

Then you open the model picker. Fable 5.1 is greyed out: *"Update Claude to use this model on
this computer."* It doesn't work best with the latest app. It works **only** with the latest app.
The picker knows. The banner won't say it.

![Top: banner claiming the model 'works best with' the latest app. Bottom: the model picker showing the same model greyed out and unusable without updating.](/images/quirks/003-works-best-doesnt-work.png)

## The one-word fix

*"Claude Fable 5.1 **requires** the latest desktop app."* Same length. Same banner. True. The
soft phrasing isn't kindness — it's a sentence engineered to sound like good news, and it costs
the user exactly one confused trip to the model picker to discover what it was hiding. Two
components again, too: the banner team shipped optimism, the picker team shipped the facts, and
the screen where they meet is the user's problem.

This one's logged with particular pleasure, because this site is built *with* Claude — and the
whole point of the quirks page is that nobody's screens are exempt, including the ones belonging
to the tools we like.
