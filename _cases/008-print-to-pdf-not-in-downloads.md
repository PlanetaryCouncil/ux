---
number: 8
title: "You printed to PDF — now go and find where it went"
tagline: "Print a page to PDF and your brain files it under \"downloaded a file → it's in Downloads.\" It isn't, and it never shows in the download list. So you hunt."
difficulty: easy
todo: "Frequency & population are estimates"
platforms: [Web, Google]
lifetimes:
  low: 10
  headline: 30
  high: 200
facts:
  - label: "Global internet users"
    value: "~5.5 billion"
    source: "ITU, 2026"
    url: "https://www.itu.int/en/ITU-D/Statistics/Pages/stat/default.aspx"
  - label: "Global life expectancy"
    value: "73 years"
    source: "World Bank, 2023"
    url: "https://data.worldbank.org/indicator/SP.DYN.LE00.IN"
assumptions:
  - label: "People who print-to-PDF (receipts, tickets, emails, pages)"
    low: "200M"
    headline: "300M"
    high: "500M"
  - label: "Confused hunts per person per year"
    low: "4"
    headline: "10"
    high: "25"
    note: "Partly self-limiting — people eventually learn where it lands, so the harm front-loads onto new and infrequent users."
  - label: "Seconds lost hunting each time"
    low: "8s"
    headline: "15s"
    high: "30s"
owner: "Browser teams (Chrome / Edge / Safari / Firefox print-to-PDF)"
channel: "issues.chromium.org · Mozilla Bugzilla · Apple Feedback"
---

The browser has two doors that both produce a file, and they open into different rooms. A **download**
lands in Downloads and appears in the download list. **Print → Save as PDF** goes through a separate
Save-As path — often Documents, or wherever you last saved — and never shows in the download history at
all. But your head holds only one model: *"I made a file in the browser, it's in Downloads."* You look
there, it's absent, and you go hunting.

## The math

<p class="equation">300M people <span class="op">×</span> 10 confused hunts/yr <span class="op">×</span> 15s <span class="eq">=</span> <span class="out">~30 lifetimes / year</span></p>

Modest next to the monsters, and honest about it: the harm is **partly self-limiting** — once you learn
where print-to-PDF lands, you stop hunting. So the cost front-loads onto every new and infrequent user
rather than recurring forever, which is why the headline stays small.

## Why it happens

Two mechanisms that produce the *same outcome* — a saved file — were built by different teams to behave
differently. Download is a first-class flow with a folder and a history entry. Print-to-PDF was bolted
onto the print pipeline and inherits a plain Save dialog. Same result, two destinations, one of them
invisible to the tool that's supposed to track "files I saved."

## The fix

**One outcome, one model.** Route print-to-PDF to Downloads by default, *and/or* register it in the
download list with a "Saved to… — show in folder" confirmation. Either makes the file findable where the
user already expects it. (See also [case 005](/cases/005-save-dialog-cant-delete/) — the same print-to-PDF
flow spawns the duplicates the Save dialog then won't let you delete.)

<div class="todo" markdown="1">
**Population and frequency are estimates.** Only internet-user and life-expectancy figures are cited.
Exact behaviour also varies by browser and version — worth a per-browser check before quoting specifics.
</div>

## Difficulty to fix: easy

> You did the most ordinary thing — saved a page as PDF — and the browser hid it somewhere its own
> download list doesn't even mention. Put it in Downloads, or at least tell the user where it went.
