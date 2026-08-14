---
number: 30
title: "\"A file with that name already exists\" — and only you can fix it"
tagline: "You type a name, hit Save, and get a modal asking whether to overwrite. Meanwhile your browser has been silently saving file (1), file (2) for twenty years. Same computer, same problem, one of them asks."
difficulty: none
todo: "Exact button sets vary by OS and app — verify before quoting"
platforms: [Apple, Microsoft]
lifetimes:
  low: 5
  headline: 30
  high: 200
facts:
  - label: "What browsers do on a name clash"
    value: "silently append (1), (2)…"
    source: "no prompt, no decision, no data lost"
  - label: "What Save dialogs do"
    value: "block with a replace-or-cancel modal"
    source: "same OS, same filesystem, same conflict"
  - label: "What Finder does when copying"
    value: "offers Keep Both"
    source: "a third answer to the same question, in the same OS"
  - label: "Global life expectancy"
    value: "73 years"
    source: "World Bank, 2023"
    url: "https://data.worldbank.org/indicator/SP.DYN.LE00.IN"
assumptions:
  - label: "People saving files on a desktop OS"
    low: "600M"
    headline: "1B"
    high: "1.8B"
  - label: "Name collisions per person per year"
    low: "4"
    headline: "8"
    high: "30"
  - label: "Seconds lost each time"
    low: "4s"
    headline: "8s"
    high: "25s"
    note: "Read the modal, decide, and often retype the filename with a suffix you invented yourself."
owner: "Apple · Microsoft (save panel behaviour)"
channel: "Apple Feedback Assistant · Windows Feedback Hub"
---

You type a filename. You press Save. A modal stops everything to tell you that name is taken, and asks
whether to **replace** the existing file.

Your browser has been quietly handling this exact situation since forever. Download something twice and
you get `report.pdf` and `report (1).pdf`. No prompt. No decision. Nothing lost. You've probably never
once been annoyed by it, which is the point — a solved problem stays invisible.

## One operating system, three different answers

The same conflict — *this name is taken* — is resolved three separate ways on the same machine:

| Flow | Behaviour |
|---|---|
| Browser download | **Appends a suffix silently.** No interruption. |
| Finder copy | **Offers "Keep Both."** The safe option exists as a button. |
| Save dialog | **Blocks.** Replace or cancel; you invent the new name yourself. |

Nobody chose this. Three teams solved the same problem at different times and the results were never
reconciled. But the consequence is that the *worst* of the three sits in the flow you use most, and the
best one is the flow nobody ever thinks about.

## Why the modal is the wrong shape

**It offers a destructive option and no safe one.** Replace overwrites a file — irreversible, and
possibly something you'd rather have kept. Cancel throws away the save you were trying to perform. The
option a person actually wants — *keep both, sort it out later* — is the one that isn't there, even
though Finder has that exact button a few menus away.

**And it makes you do the work.** Declining to overwrite means going back and inventing a name:
`report-2`, `report-final`, `report-new`. That's the machine delegating a naming problem it could solve
in one line, and the names people invent under pressure are worse than `(1)` — they don't sort, don't
group, and don't tell you which came first.

## The principle

**When a safe default exists, take it — don't hold a meeting about it.** A prompt is only justified when
the system genuinely can't infer the better outcome. Here it plainly can: keep both, disambiguate,
proceed. The one case that warrants asking — *you actually meant to overwrite* — is rarer than the case
being interrupted, and an undo covers it.

This is [case 005](/cases/005-save-dialog-cant-delete/)'s dialog again, failing differently. That one
couldn't delete a file you were looking at; this one can't rename a file it's about to create.

## The math

<p class="equation">1B people <span class="op">×</span> 8 collisions/yr <span class="op">×</span> 8s <span class="eq">=</span> <span class="out">~30 lifetimes / year</span></p>

## The fix

**Save as `name (1)` and say so quietly.** A brief, dismissible note — *"Saved as report (1).pdf"* —
with an inline option to replace instead. Nothing blocks, nothing is lost, and the rare overwrite case
is one click away rather than the default.

At minimum: **add "Keep Both" to the modal**, exactly as Finder already has it. Same OS, same phrase,
same behaviour. It has already been designed, written, tested and shipped — just not here.

<div class="todo" markdown="1">
**Button sets vary.** Exact wording and options differ across macOS and Windows, across app frameworks,
and between native and Electron save panels — some apps do offer a keep-both path. The table above
describes the common default behaviours and should be checked per-platform before being quoted. The
stable claim is the *inconsistency*: one OS, one conflict, several unreconciled answers.
</div>

## Difficulty to fix: none

> The good behaviour already ships on the same computer, in the flow you use least. Move it to the one
> you use most.
