---
number: 15
micro: true
micro_line: "≈0.02 lifetimes / year"
title: "A settings page that commits to your default branch"
tagline: "Type a domain into GitHub Pages settings and it writes a CNAME file to main, authored as you. Put that file there yourself and the settings field fills in. Neither side is labelled as the one that wins."
difficulty: none
todo: "Custom-domain volume is an estimate; protected-branch behaviour unverified"
platforms: [GitHub]
facts:
  - label: "Developers on GitHub"
    value: "180 million+"
    source: "GitHub Octoverse, 2025"
    url: "https://github.blog/news-insights/octoverse/octoverse-a-new-developer-joins-github-every-second-as-ai-leads-typescript-to-1/"
  - label: "New repositories created"
    value: "230 per minute (~121M/yr)"
    source: "GitHub Octoverse, 2025"
    url: "https://github.blog/news-insights/octoverse/octoverse-a-new-developer-joins-github-every-second-as-ai-leads-typescript-to-1/"
  - label: "How a custom domain is stored"
    value: "A CNAME file in the published branch"
    source: "GitHub Pages documentation"
    url: "https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/managing-a-custom-domain-for-your-github-pages-site"
  - label: "This site's own history"
    value: "commit 8452723 — \"Update CNAME\", committed by GitHub itself"
    source: "PlanetaryCouncil/ux, 28 July 2026"
    url: "https://github.com/PlanetaryCouncil/ux/commit/8452723"
  - label: "Global life expectancy"
    value: "73 years"
    source: "World Bank, 2023"
    url: "https://data.worldbank.org/indicator/SP.DYN.LE00.IN"
assumptions:
  - label: "Custom domains set or changed per year"
    low: "300,000"
    headline: "1 million"
    high: "3 million"
    note: "No public figure for Pages sites on custom domains. Reasoned from repo volume."
  - label: "Share who lose time to the mystery commit"
    low: "8%"
    headline: "15%"
    high: "25%"
    note: "Reading docs or history to work out what wrote to their branch."
  - label: "Share who hit a real conflict or a blocked write"
    low: "0.5%"
    headline: "2%"
    high: "5%"
    note: "Branch protection, a long-lived branch touching the same file, or two writers."
owner: "GitHub (Pages settings, custom domain field)"
channel: "GitHub Community / feedback"
---

Setting a custom domain on GitHub Pages does something no other settings field does: it
**writes a commit to your default branch.** Not a config store, not repo metadata — a file,
in your tree, in your history, attributed to you.

This site's own history has one:

<p class="equation">Update CNAME <span class="op">·</span> author: you <span class="op">·</span> committer: <span class="out">GitHub</span></p>

It works in the other direction too. Commit a `CNAME` file yourself and the settings field
fills itself in. Two paths to one value, and **nothing on either screen says which one is
the source of truth.**

## The steelman, which is strong

Storing the domain as a file is *good design*, and the obvious complaint is wrong.

A file is portable. It survives a repo transfer, a fork, a rename, a migration to another
host. It can be reviewed, diffed, and set from a script without a token. Every other Pages
setting — the build source, HTTPS enforcement — is click-only state that exists nowhere in
your repository, so you cannot reproduce a working site from its own contents. The `CNAME`
file is the one part you *can*. It is the good half.

**The problem isn't the file. It's the undeclared direction.**

## The principle

**A two-way sync needs a stated winner.** Either the file is authoritative and the field
displays it, or the field is authoritative and the file is generated output. GitHub does
neither: both sides accept writes, both silently overwrite the other, and one of them is a
push to the branch your project protects most carefully.

Three costs follow, and only the first is small:

- **The mystery commit.** Someone reads `Update CNAME` in the log and goes looking for who
  ran it. Nobody ran it. A settings page did.
- **The conflict.** A long-lived branch that also carries `CNAME` now diverges from `main`
  because of a UI action nobody recorded in a ticket.
- **The protected branch.** A repository can require pull requests, linear history, or
  signed commits. A settings field that writes directly to that branch is either an
  exception to rules the team agreed on, or a failure with no obvious cause. GitHub's web
  commits carry its own signature, so a signing rule likely passes — which is its own
  oddity, since the *author* is you and the *signature* is GitHub's.

There is a fourth, and it is the one that produced this case. Two writers went for the same
value: a file was pushed over git, then the settings field was opened to set the same thing
by hand — because neither person involved could tell which one counted. That is not a
knowledge gap. **The screen does not say.**

## The fix

One sentence under the field:

> This is stored as the `CNAME` file in your default branch. Saving here commits to it.

That is the whole minimum. It converts an invisible write into an informed one, exactly as
[case 013](/cases/013-unexplained-boilerplate-command/) is fixed by naming the condition a
command depends on. A better version shows the diff before committing, the way GitHub's own
file editor already does for every other change to your tree — and the best version makes
the file authoritative and the field read-only, so there is one writer and no sync at all.

## The math

<p class="equation">~1M domains/yr <span class="op">×</span> confusion &amp; conflict <span class="eq">=</span> <span class="out">≈0.02 lifetimes / year</span></p>

The third **micro** case here, and it belongs with the others. Real cost, small population:
most people set a domain once, it works, and they never notice what it wrote. Documenting it
is worth something *because* the arithmetic says it is negligible — a metric that only ever
returns "outrageous" is a complaint with decimals.

The reason to keep it anyway is that the shape generalises far past one text box. Every
control that quietly edits state a user owns — a file, a branch, a history — is the same
problem. This one is just unusually easy to point at, because it leaves a commit with its
own name on it.

<div class="todo" markdown="1">
**Estimates and one unverified claim.** Repo and developer counts are GitHub's own
Octoverse figures. The number of custom domains set per year has no public source and is
reasoned from repo volume. The behaviour when the default branch requires pull requests was
**not tested** — the confident claim is that the write happens and is undisclosed, not what
it does when it collides with a ruleset.
</div>

## Difficulty to fix: none

> The file is right. The silence about it isn't. Say which side wins — one sentence — and a
> hidden write becomes a decision.
