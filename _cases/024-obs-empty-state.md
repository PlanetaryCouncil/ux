---
number: 24
title: "A blank canvas, and your camera is called \"Video Capture Device\""
tagline: "You open OBS to record yourself. You get an empty black rectangle and no instructions. The thing you want is five steps away, filed under a name nobody searching for \"camera\" would ever type."
difficulty: none
todo: "No citable user count exists — population is unsourced"
platforms: [Apps]
lifetimes:
  low: 1
  headline: 3
  high: 20
facts:
  - label: "What the camera source is called"
    value: "\"Video Capture Device\""
    source: "not Camera, not Webcam — observed, OBS 32.2.1"
  - label: "Steps from launch to seeing yourself"
    value: "5"
    source: "find Sources → + → pick from a jargon list → name it → properties dialog"
  - label: "OBS has a first-run wizard"
    value: "yes — for encoder settings"
    source: "Auto-Configuration Wizard tunes bitrate and resolution, not sources"
  - label: "Global life expectancy"
    value: "73 years"
    source: "World Bank, 2023"
    url: "https://data.worldbank.org/indicator/SP.DYN.LE00.IN"
assumptions:
  - label: "People newly setting up OBS each year"
    low: "3M"
    headline: "10M"
    high: "30M"
    note: "OBS is open source and publishes no user figures. This is an unsourced estimate — see the TODO."
  - label: "Times they hunt before it's second nature"
    low: "1"
    headline: "2"
    high: "5"
  - label: "Seconds lost per hunt"
    low: "120s"
    headline: "400s"
    high: "1200s"
    note: "Includes the very common step of leaving the app entirely to watch a tutorial."
owner: "OBS Project (first-run experience, source naming)"
channel: "OBS Studio GitHub · OBS forums"
---

You install OBS for the obvious reason: you want to record or stream yourself. It opens on a **black
rectangle** with empty panels and no suggestion of what to do. Somewhere in there is your webcam. It is
five steps away and it is not called a webcam.

## The path

1. Work out that **Sources** is the panel that matters — not Scenes, which is listed first and sounds
   more like where you'd begin.
2. Click **+**.
3. Choose from a list of technical names. Your camera is **"Video Capture Device."**
4. Name the source — a dialog asking you to name a thing you haven't configured yet.
5. *Then* the properties dialog appears, and you finally see your face.

Step 3 is the wall. Someone hunting for their camera scans that list for **Camera** or **Webcam**, finds
neither, and either guesses or leaves to watch a tutorial. Same failure as
[case 020](/cases/020-terminal-not-discoverable/): the feature is present, correctly built, and filed
under a word the newcomer doesn't have. Recognition beats recall, and a jargon list defeats both.

## The empty state is the best teaching moment, and it's blank

A first launch is the one instant when you have the user's full attention and they *know* they don't
know anything. That's not a gap to leave empty — it's the cheapest possible place to teach.

OBS spends it on a black rectangle.

**The principle: the most common first action should be the easiest one, and an empty state should
propose it.** Not a manual, not a tour — one row of buttons where the void is:

> *Record my camera · Capture my screen · Start from scratch*

Two of those cover almost everyone. The third preserves everything OBS is for.

## The steelman

OBS is a professional compositing tool, and its source-agnosticism is a genuine design position: a camera
is just one input among display captures, windows, images, browser sources, media files. "Video Capture
Device" is *technically precise* and consistent with the rest. It's also free, volunteer-built software
that owes nobody a concierge.

But the project clearly accepts guided setup in principle — it ships an **Auto-Configuration Wizard** on
first run. That wizard tunes bitrate and encoder settings, which almost no beginner has an opinion about,
while leaving unguided the one thing every single user needs: *put a picture on the screen.* The
guidance exists; it's aimed at the wrong problem.

## The math

<p class="equation">10M new setups/yr <span class="op">×</span> 2 hunts <span class="op">×</span> 400s <span class="eq">=</span> <span class="out">~3 lifetimes / year</span></p>

## The fix

1. **An empty-state prompt** offering camera and screen capture directly.
2. **Alias the source names.** "Camera" and "Webcam" should find "Video Capture Device" — a synonym list,
   the same one-line fix as the desktop-file keywords in case 020.

<div class="todo" markdown="1">
**The population figure has no source.** OBS is open source and publishes no user or download statistics,
and the third-party numbers available are about corporate adoption, not individuals. The 10M estimate is
reasoned from OBS's position as the default streaming and recording tool — it is **not cited**, and the
band is wide because of it. The confident claims here are the step count and the source naming, both
observable in the screenshot; the headline figure is the softest on the site.
</div>

## Difficulty to fix: none

> Every person who opens this program wants to see something on the screen. Offer that on the first
> screen, and call the camera a camera.
