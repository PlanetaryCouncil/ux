---
number: 29
title: "Your backup doesn't include your phone number"
tagline: "eSIMs are in no iPhone backup — not iCloud, not Finder. Transferring one needs the old device working. So the single case where you most need it back, a lost or stolen phone, is the exact case where nothing has it."
difficulty: easy
todo: "One conflicting source about an iCloud eSIM toggle — unverified"
platforms: [Apple, Telecoms]
lifetimes:
  low: 3
  headline: 20
  high: 120
facts:
  - label: "eSIM in iCloud / Finder backups"
    value: "not included, cannot be restored"
    source: "consistent across Apple community and vendor documentation"
    url: "https://discussions.apple.com/thread/254198056"
  - label: "Supported route"
    value: "device-to-device transfer during setup"
    source: "Apple: transfer your SIM or eSIM before setting up the new device"
    url: "https://support.apple.com/ht201269"
  - label: "If the old device is gone"
    value: "carrier must re-issue the profile"
    source: "new QR code, identity verification"
  - label: "Why it's bound to the device"
    value: "profiles are tied to the eUICC hardware"
    source: "the same property that blocks casual SIM-swap cloning"
  - label: "Global life expectancy"
    value: "73 years"
    source: "World Bank, 2023"
    url: "https://data.worldbank.org/indicator/SP.DYN.LE00.IN"
assumptions:
  - label: "iPhone users on eSIM"
    low: "250M"
    headline: "450M"
    high: "700M"
    note: "eSIM-only hardware in some markets makes this rise every year."
  - label: "Share per year who lose the old device before transferring"
    low: "1%"
    headline: "2%"
    high: "4%"
    note: "Theft, loss, water, a dead board — any case where Quick Transfer isn't possible."
  - label: "Time to get a number back"
    low: "1800s"
    headline: "5400s"
    high: "14400s"
    note: "Identity verification, a new QR code, sometimes a store visit. Longer when the account's own 2FA goes to the number you've lost."
owner: "Apple (backup scope & disclosure) · carriers (re-issue speed)"
channel: "Apple Feedback Assistant · carrier support"
---

You back up your iPhone. Photos, messages, app data, settings, keychain — all of it. **Not your eSIM.**
It is in no backup, on any platform, and cannot be restored from one.

The supported way to move an eSIM is a **device-to-device transfer** during setup of the new phone. That
works beautifully for a planned upgrade, when both handsets are on the desk. It requires the old device.

Which means the one scenario where you'd actually reach for a backup — **the phone is gone** — is
precisely the scenario the mechanism doesn't cover.

## The steelman, and it's real

There's a genuine reason, and it isn't laziness. An eSIM profile is **cryptographically bound to the
device's eUICC hardware.** That binding is a security property: it's what stops a profile being copied
onto another handset. A freely backed-up, freely restorable eSIM is a **SIM-swap attack in a file** —
and SIM-swap is how people lose bank accounts.

So "just put it in the backup" is not the fix. The thing you'd be backing up is the thing whose
non-copyability protects you.

## But the disclosure failure is entirely real

Granting all of that, two things remain indefensible:

1. **"Back Up Now" implies completeness.** Nothing in the backup flow says *"your cellular plans are not
   included."* A user reasonably reads a backup as "if I lose this device, this is what I get back," and
   the omission is invisible until the worst possible moment.
2. **The instruction arrives too late to act on.** Apple's guidance is *transfer your eSIM before setting
   up the new device* — advice that only appears when you already have the new device, and is useless if
   the old one is at the bottom of a canal.

**The principle: if a backup is incomplete, it must say what it omits — at backup time, not at restore
time.** A gap you learn about while recovering is not a disclosure, it's a discovery.

## Why the harm compounds

Losing a number isn't losing a number. It's often losing the **second factor** for everything else —
banking, email, the carrier account itself. There's a nasty circularity: re-issuing the eSIM may require
verification sent to the number you can't receive.

And the timing is malicious in the theft case: you're locked out of SMS 2FA at exactly the moment someone
else has your device.

## The math

<p class="equation">450M eSIM users <span class="op">×</span> 2% lose the device <span class="op">×</span> 5,400s <span class="eq">=</span> <span class="out">~20 lifetimes / year</span></p>

Hours on the phone to a carrier, proving who you are without the thing that proves who you are.

## The fix

1. **Say it in the backup screen.** One line listing what a backup doesn't include. Difficulty: none.
2. **Prompt for a recovery route while the phone still works** — carrier account details captured now,
   when capturing them is trivial.
3. **Carriers: make self-service re-issue real**, verified by account credentials rather than by an SMS
   to the number in question.

## What to do meanwhile

Because the fix isn't shipping today: **write down, somewhere off the phone, for each eSIM** — the
carrier, the account number or ID, the phone number, and the carrier's re-issue procedure. That note is
the backup Apple isn't making. It takes five minutes now and replaces several hours later.

<div class="todo" markdown="1">
**One unresolved conflict.** Two eSIM-vendor blogs describe an iCloud "eSIM Backup" toggle and iOS 18
saving eSIM details to Keychain. **This could not be confirmed on Apple's own documentation**, and it
contradicts the hardware-binding explanation and every other source. It is *not* repeated as fact here.
If such a setting exists it would materially change this case, so it should be checked directly on a
current device before anything here is quoted.
</div>

## Difficulty to fix: easy

> The security argument for not backing up an eSIM is sound. The argument for not *mentioning* it is
> that nobody wrote the sentence. One line, on the screen that promises to save everything.
