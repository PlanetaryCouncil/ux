---
number: 33
title: "\"Save password?\" — asked over the words \"the password you've entered is incorrect\""
tagline: "The site has just rejected your password. The browser, on top of that very screen, offers to save it. Say yes and you've written a password you know is wrong over the one that worked."
difficulty: easy
todo: "Confirmed in Chrome / Google Password Manager; Safari and Edge behaviour unverified"
platforms: [Google, Web]
lifetimes:
  low: 4
  headline: 78
  high: 1200
facts:
  - label: "Chrome users worldwide"
    value: "3.8 billion"
    source: "DemandSage / Backlinko, 2026"
    url: "https://backlinko.com/chrome-users"
  - label: "What the page says"
    value: "\"The password you've entered is incorrect.\""
    source: "visible on screen, underneath the prompt"
  - label: "What the browser asks at the same moment"
    value: "\"Save password?\""
    source: "same screen, same second"
  - label: "A way for the site to say \"this login worked\""
    value: "navigator.credentials.store()"
    source: "Credential Management API — shipped in Chrome since 2016"
    url: "https://developer.mozilla.org/en-US/docs/Web/API/CredentialsContainer/store"
  - label: "Global life expectancy"
    value: "73 years"
    source: "World Bank, 2023"
    url: "https://data.worldbank.org/indicator/SP.DYN.LE00.IN"
assumptions:
  - label: "People using a browser password manager"
    low: "800M"
    headline: "1.5B"
    high: "2.5B"
  - label: "Rejected logins offered for saving, per person per year"
    low: "3"
    headline: "8"
    high: "25"
    note: "Typos, caps lock, an old password, the wrong one of two accounts. Every one of them gets the same offer."
  - label: "Seconds lost per prompt, including the cost of the ones you accept"
    low: "4s"
    headline: "15s"
    high: "45s"
    note: "Four seconds is reading it and dismissing it. The rest is amortised: some fraction of these prompts gets an absent-minded Save, and a wrong password written over a working one costs minutes later — sometimes a full reset."
owner: "Chromium password manager team (components/password_manager/)"
channel: "issues.chromium.org — Chrome > Autofill > Passwords"
---

You type a password. The site rejects it: **"The password you've entered is incorrect."** The
message is right there, in red, under the field.

And on top of it — covering the form you now need to correct — the browser asks whether you'd
like to **save** that password.

![A browser's "Save password?" prompt sitting on top of a login page whose error message reads "The password you've entered is incorrect"](/images/033-save-password-after-failure.png)

Both statements are on screen simultaneously. One of them says the credential is wrong. The other
offers to keep it.

## This one actually destroys data

Most paper-cuts cost seconds. This one can cost you the password.

If you hit **Save** — and people do, because that dialog has trained everyone to dismiss it on
reflex, and *Save* is the highlighted button — the browser overwrites the working credential it
already had with the one that was just refused. Nothing warns you. The damage shows up weeks
later, when autofill confidently enters a password that doesn't work, on a site you were certain
you knew the password to, and you end up in a reset flow blaming your own memory.

That inverts the entire purpose of the feature. A password manager exists to be more reliable
than you are. This is the one moment where it is **guaranteed** to be storing something false,
and it's also the moment it asks hardest.

## The modal is in the way of the fix

Look at where the prompt sits: directly over the login form. The next thing you have to do is
retype the password — and the thing blocking it is a dialog asking about the password you're
trying to replace. The interruption arrives at the exact instant it is most expensive, which is
also the instant it is most certainly wrong.

## Why it happens

The save prompt fires on **form submission**, not on **successful authentication**. The browser
sees a password field, sees it submitted, and raises the dialog — without waiting to learn
whether the far end accepted it. For a login that navigates to a new page, the browser could
infer success. For a login that answers in place over XHR, it doesn't bother to look.

The information is not hidden. The error text is in the DOM. The same login form is still on the
page, now with an error state attached — a form that has reappeared with a validation message is
about the strongest possible signal that the submission failed. And there is a formal channel for
sites to say so outright: `navigator.credentials.store()` has been in Chrome since 2016 and exists
precisely so a site can say *this one worked, keep it.*

So the browser is not missing a signal. It's declining to wait for one.

## The fix

**Don't ask on submit. Ask on success.**

1. If the site calls `navigator.credentials.store()`, trust it. That's the API saying so.
2. Otherwise, hold the prompt for a moment. If the page navigates away, offer to save. If the same
   login form is still sitting there — especially carrying an error — throw the prompt away.
3. Never silently overwrite an existing stored password with one that has not been seen to work.
   An overwrite is a destructive write, and it deserves at minimum a different dialog from a
   first-time save.

Point 3 alone removes the data loss, and it requires no knowledge of whether the login succeeded.

## The password family

This is the third case about the same thing — **the password manager not using what it can plainly see**:

- [Case 001](/cases/001-chrome-password-empty-username/) — offers to save, with the username field blank, right after watching you type it.
- [Case 002](/cases/002-browser-form-data-loss/) — the form that throws away what you typed.
- **This one** — offers to save a password the page has just said is wrong.

Each is a refusal to read the screen the browser itself rendered.

<div class="todo" markdown="1">
**Verified in Chrome with Google Password Manager** (pictured). Safari/iCloud Keychain and Edge
are believed to behave similarly on in-page logins, but that has not been checked and the case is
tagged accordingly. Chrome does suppress the prompt in some flows, so the precise trigger
conditions deserve a proper look before this is quoted as universal.

Population and frequency are estimates; only the Chrome user count, the Credential Management API
and life expectancy are cited. The confident claim is the contradiction on screen: **"incorrect"
and "save?" in the same frame.**
</div>

## Difficulty to fix: easy

> The page says the password is wrong. The browser rendered that sentence. It asks anyway — and
> if you agree, it overwrites the one that worked.
