---
number: 2
title: "YouTube can't agree with itself on how long your video is"
tagline: "Upload a video. The upload dialog says 4:21. The watch page says 4:20. Encode it shorter and other surfaces say 4:19. There is no length you can encode that every surface displays the same way — and YouTube's own transcoder produces three different durations from one file."
quirk_line: "One file. Three durations in the metadata. No encode that displays consistently. QED."
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

## Bonus quirk, free with purchase

Write "Duration 4:20" in the description — a reasonable thing to note, under the circumstances —
and YouTube auto-linkifies the `4:20` into a **clickable seek timestamp**: a link that jumps to
the 260th second of a video that is 259.966 seconds long. The sentence about the duration is
hijacked by the duration, and points at a moment that does not exist.

![The watch page: the description's "Duration 4:20" auto-converted into a seek link](/images/quirks/002-youtube-round2-watch.png)

## Why it's a quirk, not a case

The seconds lost are real but tiny, and mostly paid by people chasing round numbers. What earns it
a spot is the contradiction: a platform this size showing **two different durations for one file**
— and, on inspection, *storing three* — because nobody decided, once, platform-wide, how to round
half a second. The fix is one line: pick a rounding rule. Any of them. Just once.
