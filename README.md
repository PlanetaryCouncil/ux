# Ministry of Fixing Civilisation

A GitHub Pages (Jekyll) site for one metric: **lifetimes saved** — how many human
lifetimes each tiny UI/UX paper-cut wastes per year, and how trivial it is to fix.

Every case is **one markdown file** in [`_cases/`](_cases/) with a structured napkin in
its front matter: facts (cited), assumptions (low → likely → high), a difficulty-to-fix
rating, and the owner + channel who can actually fix it. The site totals every case's
range automatically on the home page.

## Add a case

Drop a file in `_cases/NNN-slug.md`:

```yaml
---
number: 3
title: "Short, punchy problem statement"
tagline: "One sentence a stranger instantly recognises."
difficulty: none        # none | trivial | easy | moderate | hard
lifetimes:
  low: 8                 # low estimate  (integer lifetimes/year)
  headline: 30           # best single estimate
  high: 60               # high estimate
facts:                   # knowable numbers — cited at face value, never sandbagged
  - label: Users
    value: "3.8 billion"
    source: "Source name, year"
    url: "https://…"
assumptions:             # unknowables — always a low/likely/high band
  - label: "What we can't measure"
    low: "0.5%"
    headline: "1%"
    high: "2%"
    note: "Optional caveat."
owner: "Who owns the code/product"
channel: "Where to file it"
---

Markdown body: the math, second-order effects, the fix, rebuttals pre-empted.
Use <p class="equation">A <span class="op">×</span> B <span class="eq">=</span>
<span class="out">result</span></p> for the napkin line (no MathJax on the site).
```

The metric formula (see [methodology](methodology.md)):
**lifetimes/year = (users × incidence × seconds × 365) ÷ (73 years in seconds)**.
73 years ≈ 2.3 billion seconds.

## Run locally

```bash
bundle install
LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8 bundle exec jekyll serve
# → http://127.0.0.1:4000/lifetimes/
```

The `LANG` export avoids a Ruby US-ASCII encoding error when Jekyll reads UTF-8 files;
GitHub Pages' own build environment already runs UTF-8, so it isn't needed there.

## Deploy on GitHub Pages

1. Push to a repo named `lifetimes` (the `baseurl: "/lifetimes"` in `_config.yml` assumes
   `username.github.io/lifetimes`). For a root/user site, set `baseurl: ""`.
2. Repo → Settings → Pages → Build from branch → `main` / root.

## Repo map

- `_cases/` — the case studies (one file each). This is the content.
- `_layouts/` — `default.html` (chrome) and `case.html` (renders the napkin).
- `assets/style.css` — all styling, light/dark aware. Static file, not SCSS.
- `methodology.md` — the four rules the napkins follow.
- `ROADMAP.md` — how a case gets escalated to a real decision-maker (not on the site).
- `images/` — source posters.
