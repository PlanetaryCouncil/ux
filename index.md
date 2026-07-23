---
layout: default
title: Lifetimes saved
---

<section class="hero">
  <h1>Fixing civilisation,<br><span class="accent">one paper-cut at a time.</span></h1>
  <p class="lede">A single metric — <strong>lifetimes saved</strong> — for the tiny UI/UX failures that waste humanity's time at planetary scale. Each one is a back-of-a-napkin calculation. Each one is trivial to fix.</p>
</section>

{% assign total_lo = 0 %}
{% assign total_hi = 0 %}
{% assign total_mid = 0 %}
{% assign counted = 0 %}
{% for c in site.cases %}
  {% unless c.oneoff %}
    {% assign total_lo = total_lo | plus: c.lifetimes.low %}
    {% assign total_hi = total_hi | plus: c.lifetimes.high %}
    {% assign total_mid = total_mid | plus: c.lifetimes.headline %}
    {% assign counted = counted | plus: 1 %}
  {% endunless %}
{% endfor %}

<div class="total-banner">
  <div class="big">{{ total_lo }}–{{ total_hi }}</div>
  <div class="cap">human lifetimes wasted every year — across {{ counted }} case{% if counted != 1 %}s{% endif %} so far</div>
  <div class="fine">Best single estimate: ~{{ total_mid }} lifetimes / year. And we've barely started counting.</div>
</div>

<div class="case-list">
  {% assign sorted = site.cases | sort: "number" %}
  {% for c in sorted %}
  <a class="case-card" href="{{ c.url | relative_url }}">
    <div class="row">
      <div>
        <div class="kicker">Case {{ c.number | prepend: '00' | slice: -3, 3 }} · fix difficulty: {{ c.difficulty }}{% if c.todo %}<span class="card-todo">TODO</span>{% endif %}</div>
        <h3>{{ c.title }}</h3>
      </div>
      {% if c.oneoff %}<div class="card-metric proof-metric">PROOF<small>the anchor case</small></div>{% else %}<div class="card-metric">{{ c.lifetimes.low }}–{{ c.lifetimes.high }}<small>lifetimes / yr</small></div>{% endif %}
    </div>
    <p class="tagline">{{ c.tagline }}</p>
  </a>
  {% endfor %}
</div>
