---
number: 2
title: "YouTube can't agree with itself on how long your video is"
tagline: "Upload a video. The upload dialog says 4:21. The watch page says 4:20. Same file, same platform, two durations — because two surfaces round the same number in opposite directions."
quirk_line: "One file, one platform, two durations: 4:21 in the studio, 4:20 on the watch page."
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

## The workaround

Encode strictly **under** the target — the last frame at 4:19;29 (30fps) rather than 4:20;00 — so
that even after audio padding, every rounding mode lands on 4:20. Which is an absurd sentence to
have to write: the way to make a video display as four-twenty is to make it *not* four minutes
twenty seconds long.

## Why it's a quirk, not a case

The seconds lost are real but tiny, and mostly paid by people chasing round numbers. What earns it
a spot is the contradiction: a platform this size showing **two different durations for one file**,
because nobody decided, once, platform-wide, how to round half a second.
