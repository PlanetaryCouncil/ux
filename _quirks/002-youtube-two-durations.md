---
number: 2
title: "YouTube can't agree with itself on how long your video is"
tagline: "One video. One page in YouTube Studio. The list thumbnail says 4:20 and the preview player beside it says 4:21 — at the same moment, about the same file. There is no length you can encode that makes every surface agree, and now you don't even need two screenshots to prove it."
quirk_line: "4:20 and 4:21, same page, same file, same second."
vendor: "YouTube"
---

You encode a video aiming for a displayed length of exactly **4:20** — a number people care about,
as numbers go. You even *expect* YouTube to fumble it, so you upload an unlisted test. And it
fumbles it in the best possible way: YouTube Studio's upload dialog shows **4:21**, while the
public watch page for the *same file* shows **4:20**.

![YouTube Studio upload dialog showing the video's duration as 4:21](/images/quirks/002-youtube-duration-studio.png)

![The watch page for the same video showing 4:20](/images/quirks/002-youtube-duration-watch.png)

## What's actually happening

The file's true duration is almost never a round number. AAC audio is packed in 1024-sample frames
and encoders pad the final frame, so a "4:20" export typically lands at 260.02–260.05 seconds in
the container. Then two YouTube surfaces disagree on what to do with the fraction: one **rounds
up** (260.03 → 4:21), the other **truncates** (→ 4:20). Neither is wrong about the number. They're
wrong about each other.

## The workaround — round one

Encode strictly **under** the target — the last frame at 4:19;29 (30fps) rather than 4:20;00 — so
the surfaces that round up land on 4:20. An absurd sentence to have to write: the way to make a
video display as four-twenty is to make it *not* four minutes twenty seconds long.

## Round two: the workaround is also wrong

So the test was run properly: re-encode the real video to end at 4:19;29 — a true duration of
**259.966 seconds** — and upload. The surfaces that round up now agree on 4:20:

![Round two: YouTube Studio's share card now showing 0:00 / 4:20 for the re-encoded video](/images/quirks/002-youtube-round2-studio.png)

But surfaces that **truncate** now compute floor(259.966) = 259 seconds — and display **4:19**.
Going short fixed the round-up surfaces and broke the round-down ones. The two failure modes
trade places.

Which closes the trap. To satisfy every surface at once:

- surfaces that **round up** need the true duration ≤ 260.000
- surfaces that **round down** need it ≥ 260.000
- so the only universally correct encode is **exactly 260.000000 seconds**

— which AAC frame arithmetic (1024-sample frames; 260s is not a whole number of them at 44.1 or
48 kHz) makes effectively impossible to author. And even if you authored it, it wouldn't survive:
pull the actual metadata for this upload and YouTube's *own transcoder* reports **three different
durations for the same video** — `259.966s`, `259.981s`, and `260.017s` across the streams it
generated. YouTube's encoder lands on both sides of the 260-second line *from a single input
file*. Which side of the line a given surface displays depends on which stream it consults and
which direction it rounds.

There is no correct way to encode this video. Not "hard to get right" — **mathematically closed**.
The uploader who tests first, finds the bug, and applies the exactly-correct workaround is rewarded
with the same bug wearing a different number.

## Round three: both numbers, one screen

The final form arrived when the real video went public. No second screenshot, no switching tabs,
no “trust me, the other surface said something different.” **One page of YouTube Studio**, and
the contradiction is sitting in it twice:

![YouTube Studio Video details page: the channel-content thumbnail on the left is badged 4:20 while the preview player on the right reads 0:00 / 4:21 — same video, same page](/images/quirks/002-youtube-round3-one-screen.png)

The list thumbnail in the left rail and the preview player in the right rail, side by side, on
the same screen, about the same upload:

![Detail: the thumbnail badge reads 4:20; the player readout beside it reads 0:00 / 4:21](/images/quirks/002-youtube-round3-detail.png)

And the metadata behind that page finishes the argument. Pulling the durations YouTube stores for
[this upload](https://youtu.be/MGgz4cKPHp8):

| What | Value |
|---|---|
| canonical `lengthSeconds` | `260` |
| stream A `approxDurationMs` | `259999` |
| stream B | `260000` |
| stream C | `260041` |
| stream D | `260063` |

Look at stream B. It is **exactly 260000 ms** — precisely the 4:20.000 that round two identified
as the only value that could satisfy every rounding rule at once. The impossible target was hit.
And it changed nothing, because YouTube does not store *one* duration: the sibling streams of that
same upload are one millisecond **short** (259999, which truncates to 4:19) and sixty-three
milliseconds **long** (260063, which rounds up to 4:21). Whichever stream a surface consults, and
whichever direction it rounds, is what you get.

So round two was too kind. The conclusion isn’t just that the correct encode is unreachable —
it’s that **the correct encode does not help**. There is no single number to be right about,
because the platform keeps four of them.

## Bonus quirk, free with purchase

Write "Duration 4:20" in the description — a reasonable thing to note, under the circumstances —
and YouTube auto-linkifies the `4:20` into a **clickable seek timestamp**: a link that jumps to
the 260th second of a video that is 259.966 seconds long. The sentence about the duration is
hijacked by the duration, and points at a moment that does not exist.

![The watch page: the description's "Duration 4:20" auto-converted into a seek link](/images/quirks/002-youtube-round2-watch.png)

## Why it's a quirk, not a case

The seconds lost are real but tiny, and mostly paid by people chasing round numbers. What earns it
a spot is the contradiction: a platform this size showing **two different durations for one file,
simultaneously, on a single screen** — and, on inspection, *storing four* — because nobody decided,
once, platform-wide, how to round a fraction of a second. The fix is one line: pick a rounding
rule, apply it to the canonical duration, and let every surface read that. Any rule. Just once.
