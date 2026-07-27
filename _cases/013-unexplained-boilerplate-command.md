---
number: 13
micro: true
micro_line: "≈0.05 lifetimes / year"
title: "A command you're told to run, with no hint why"
tagline: "GitHub's new-repo page tells you to run \"git branch -M main\". On most modern setups it does nothing at all. Six words would have said when you actually need it — instead you pause, or paste on faith."
difficulty: none
todo: "Path-mix & confusion rate are estimates"
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
  - label: "Git's built-in default branch (unconfigured)"
    value: "master"
    source: "Git 2.28 added init.defaultBranch without changing the fallback"
    url: "https://git-scm.com/docs/git-init"
  - label: "GitHub's default branch for new repos"
    value: "main"
    source: "GitHub, since October 2020"
    url: "https://github.blog/news-insights/company-news/renaming-the-default-branch-from-master/"
owner: "GitHub (empty-repository quick-setup page)"
channel: "GitHub Community / feedback"
---

Create an empty repo and GitHub hands you a block to paste, including:

<p class="equation">git branch <span class="op">-M</span> main</p>

If your Git is modern and configured, `init.defaultBranch` is already `main` — so this line renames
`main` to `main`. **It does nothing.** But nothing on the page says when it's needed, so you either
stop and work it out, or paste on faith and learn nothing.

## GitHub's side of it — which is good

This one deserves its steelman up front, because the obvious complaint is wrong. GitHub **cannot see
your local Git config.** Git's built-in default is still `master` (2.28 added `init.defaultBranch`
but kept the old fallback for compatibility), while GitHub names its own repos `main`. So a snippet
that omitted the rename would break for everyone on an unconfigured Git, and `-M` is harmless when
there's nothing to rename. The defensive line is *correct engineering*.

**The paper-cut isn't the command. It's the missing "why".**

## The principle

**When you instruct someone to run something whose necessity depends on state you can't see, say so.**
One clause — *"if your Git still defaults to `master`"* — converts an unexplained ritual into a
conditional the reader can evaluate. Without it you get two costs: the people who stop to reason it
out, and the people who paste blindly and never learn what their own tooling does.

There's a third, costlier path: someone skips the line, ends up with a local `master` pushed against a
GitHub `main`, and spends minutes untangling two branches that should have been one.

## The math

<p class="equation">~121M new repos/yr <span class="op">×</span> CLI paste path <span class="op">×</span> confusion &amp; mismatch <span class="eq">=</span> <span class="out">≈0.05 lifetimes / year</span></p>

The second **micro** case on this site, and deliberately so. Like
[case 012](/cases/012-empty-disclosure-control/), it's far too small to move the total — real cost,
negligible scale. Documenting it is only worth anything *because* the arithmetic says it's negligible:
that's the difference between a metric and a complaint.

<div class="todo" markdown="1">
**Estimates.** Repo counts and developer numbers are cited from GitHub's own Octoverse, but the share
of new repos created through the copy-paste CLI path (vs. a README, an import, or a clone), and how
many people actually pause or hit a branch mismatch, are reasoned figures. The confident claim is the
**principle**, not the decimal.
</div>

## Difficulty to fix: none

> The command is right. The silence around it isn't. Add the condition it depends on — six words —
> and the ritual becomes knowledge.
