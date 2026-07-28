# Development & deploy

The whole loop in one line:

> **edit on `dev` → check it (local or preview URL) → merge to `main` → it's live.**

## Local preview

```bash
make install   # first time only — installs Ruby gems
make serve     # http://127.0.0.1:4000, rebuilds as you edit
make build     # one-off build into _site/
make clean     # remove build output
```

`make` bakes in a UTF-8 locale, so Jekyll never hits the Ruby US-ASCII read error and you
never prefix commands with `LANG=...` again.

## Branch workflow — dev → prod

- **`main` → PRODUCTION.** Every push to `main` rebuilds and deploys to
  `lifetimes.planetarycouncil.org`. Nothing lands here until you're happy with it.
- **`dev` → your workbench.** Write cases, tweak styles, experiment. Break things freely.
- **Releasing is one act — merging `dev` into `main`:**

  ```bash
  git checkout main
  git merge dev
  git push            # → production rebuilds and goes live
  git checkout dev    # back to the workbench
  ```

Prefer a branch per case (`case-012-foo`)? Anything that isn't `main` behaves like `dev`
below — pick whichever suits your mood; the rule is only "`main` is sacred, everything else
is a draft."

## Staging: deploying `dev` somewhere you can look at it

**The constraint:** GitHub Pages builds **one branch per repository**. There is no such thing
as a per-branch preview URL on Pages. So staging needs one of the following.

### CI runs on every branch regardless

`.github/workflows/build.yml` builds **every branch and every PR** with `jekyll build --safe`
(the same mode GitHub Pages uses) and smoke-tests the output — index page, stylesheet, CNAME,
at least one case, and the home-page total. It deploys **only** from `main`.

So `dev` always gets a green check or a red X before you merge. That's not a URL, but it
catches every build break, which is most of what staging is for.

### Option A — Cloudflare Pages (a real URL per branch)

The only option that gives `dev` its own live URL with no extra repo. Natural fit since DNS is
already at Cloudflare.

| | Setting |
|---|---|
| Build command | `bundle exec jekyll build` |
| Output directory | `_site` |
| Env var | `RUBY_VERSION` = `3.3` (Jekyll needs it pinned) |
| Production branch | `main` → `lifetimes.planetarycouncil.org` |
| Every other branch | automatic `<branch>.<project>.pages.dev` preview |

You can also alias the `dev` branch to a stable **`dev.lifetimes.planetarycouncil.org`** in
Pages → Custom domains, so staging has a fixed address instead of a changing hash.

Note this means Cloudflare hosts production too — you'd turn GitHub Pages off. Running both
is possible but pointless, and two hosts serving one domain is a good way to confuse yourself.

### Option B — a second repo, staying GitHub-only

Create `ux-staging`, push `dev` to its `main`, enable Pages on it, and point it at
`dev.lifetimes.planetarycouncil.org`. Free and GitHub-native, but you now maintain two remotes
and have to remember to push both. Only worth it if you want to stay entirely on GitHub.

### Option C — local (what you already have)

```bash
make serve   # http://127.0.0.1:4000
```

Instant, no deploy, no waiting on CI. For a static site with no backend this genuinely covers
most of what staging is for — the CI check above covers the rest. Reach for A or B when you
need to *show someone else* a link.

## Everyday rhythm

```bash
git checkout dev
# ... write a case, run `make serve`, eyeball it ...
git add -A && git commit -m "Add case 0XX: ..."
git push                     # → Cloudflare preview URL to review
# happy?
git checkout main && git merge dev && git push   # → live
git checkout dev
```
