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

## Staging — the "every commit gets a URL" part

Use **Cloudflare Pages** (natural, since your DNS is already there). It builds *every branch
and every commit* and hands each its own preview URL — that IS your staging. Push `dev`, open
the preview link, look, then merge to `main` when it's right.

| | Setting |
|---|---|
| Production branch | `main` → custom domain `lifetimes.planetarycouncil.org` |
| Build command | `bundle exec jekyll build` |
| Output directory | `_site` |
| Preview branches | *all others* → automatic `<hash>.<project>.pages.dev` URLs |

**GitHub Pages alternative:** it only builds the one configured branch, so you get prod but
no per-branch previews. If you stay on Pages, `make serve` is your staging instead.

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
