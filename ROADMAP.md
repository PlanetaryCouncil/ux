# Roadmap: Fix the Chrome "Save password?" empty-username prompt

**The metric:** lifetimes saved = (users × incidence × seconds × 365) ÷ (73 years in seconds)
**This case:** ~30 lifetimes/year first-order, 60+ with the frustration cascade. See `images/`.

---

## Who owns this

| Layer | Who | Why they matter |
|---|---|---|
| The code | **Chromium password manager team** (`components/password_manager/`) | Chromium is open source — the fix is a reviewable patch, not a petition |
| The product | **Google Password Manager / Chrome Autofill PMs** | They prioritize the backlog; a bug with traction gets staffed |
| The org | **Parisa Tabriz** — VP & GM, Chrome | Sets Chrome priorities; publicly engaged on security/UX |
| The bridge | **Chrome DevRel** — Addy Osmani (Chrome DX lead), Paul Kinlan (DevRel lead) | Publicly reachable (X/Bluesky/blogs), historically responsive to well-argued UX cases, and they route things internally |
| The forum | **issues.chromium.org** (component: Chrome > Autofill > Passwords) | The canonical intake. Stars + comments = the team's demand signal |

## The escalation ladder (in order — each step strengthens the next)

### 1. Reproduce & dupe-check (this week)
- Screen-record the exact flow: password reset from inbox → new password typed → prompt appears with **empty username field**.
- Note the honest complication: Chrome *does* prefill the username when the site uses
  `autocomplete="username"` / `autocomplete="email"` markup. The empty-field case is
  Chrome's heuristics failing on unmarked forms — which is precisely the case where
  "Chrome watched you type it" applies. Anticipate "fix your form markup" as the
  first rebuttal; the answer is: users don't control site markup, Chrome's heuristics can.
- Search issues.chromium.org for existing reports (terms: "save password username empty",
  "password prompt prefill"). If one exists, **star it and add the napkin math** instead
  of filing a duplicate — duplicates get closed, stars get counted.

### 2. File the issue properly
- Component: Chrome > Autofill > Passwords. Attach: repro video, the infographic, the math.
- Frame as a concrete heuristic proposal, not a rant: "when the save-prompt username is
  empty, backfill from (a) the email/username field submitted on the same origin this
  session, (b) the account the reset email was addressed to."
- Optional power move: locate the prompt-population code in `components/password_manager/`
  and reference it. Arriving with "the fix is roughly here" changes the conversation.

### 3. Publish (the poster is built for this)
- Repo / one-page site: methodology, this case study, the calculator.
- Hacker News ("Show HN: Lifetimes saved — a metric for civilisation's UI paper-cuts").
  Chrome engineers reliably show up in HN threads about Chrome UX.
- X/Bluesky thread with the flamingo, tagging the issue link — not the people (yet).

### 4. Direct outreach (only after 1–3 exist)
- DevRel first (Osmani, Kinlan): "filed + repro + patch sketch + public interest" is
  exactly what they can forward internally. Cold outreach without an issue number is noise.
- Press as amplifier if traction stalls: The Verge / Ars Technica cover small-UX stories well.

### 5. The bigger machine (Ministry of Fixing Civilisation)
- Every case study follows the same template: **facts cited at face value, assumptions
  explicit and round, cuts where honest, second-order effects directional.**
- Leaderboard of paper-cuts by lifetimes/year. Candidates: cookie banners (EU-scale,
  dwarfs this case), unsubscribe flows, date pickers, 2FA re-prompts on trusted devices.
- Each entry ships with: repro, math, the named owner, and the issue/ticket link.
  The metric is the headline; the routing to a decision maker is the product.

## Fact-check corrections to carry into v3 of the poster
- "Billions of minutes. Every day" → **~3.2M minutes/day; ~1.2B minutes/year.** Per-year is the honest "billions."
- "MILLIONS OF LIVES" → **"dozens of lifetimes, every year"** (own math: 30–60).
- User-count citation: Statcounter is market share; 3.8B is analyst estimates (DemandSage/Backlinko 2026).
