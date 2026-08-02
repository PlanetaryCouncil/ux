---
layout: default
title: Lifetimes saved
---

<section class="hero">
  <h1>Fixing civilisation,<br><span class="accent">ten seconds at a time.</span></h1>
  <p class="lede">One number — <strong>lifetimes wasted</strong> — for the small everyday problems on our screens. A button that does nothing. A form that wipes what you typed. Ten seconds each, a few billion people, and it adds up to human lifetimes. Each one is easy to fix.</p>
</section>

{% assign total_lo = 0 %}
{% assign total_hi = 0 %}
{% assign total_mid = 0 %}
{% assign counted = 0 %}
{% for c in site.cases %}
  {% unless c.oneoff or c.micro %}
    {% assign total_lo = total_lo | plus: c.lifetimes.low %}
    {% assign total_hi = total_hi | plus: c.lifetimes.high %}
    {% assign total_mid = total_mid | plus: c.lifetimes.headline %}
    {% assign counted = counted | plus: 1 %}
  {% endunless %}
{% endfor %}

<div class="total-banner">
  <div class="floor-label">At least</div>
  <div class="big">{{ total_lo }}</div>
  <div class="cap">human lifetimes wasted every year — from {{ counted }} counted case{% if counted != 1 %}s{% endif %}</div>
  <div class="fine">Every case's <em>lowest</em> estimate, added up. Argue any assumption down and the number holds. Likely ~{{ total_mid }}; upper band {{ total_hi }}. {{ site.cases | size }} cases published in total — micro and proof cases are documented but too small to count.</div>
</div>

{% assign PLATFORMS = "Google,Apple,Microsoft,Meta,Anthropic,GitHub,Web,Linux,Apps,Government" | split: "," %}
<div class="filter-bar" aria-label="Filter cases by platform">
  <button class="pill active" data-filter="all">All <span>{{ site.cases | size }}</span></button>
  {% for p in PLATFORMS %}
    {% assign n = 0 %}
    {% for c in site.cases %}{% if c.platforms contains p %}{% assign n = n | plus: 1 %}{% endif %}{% endfor %}
    {% if n > 0 %}<button class="pill plat-{{ p | downcase }}" data-filter="{{ p }}">{{ p }} <span>{{ n }}</span></button>{% endif %}
  {% endfor %}
</div>

<div class="case-list">
  {% assign sorted = site.cases | sort: "number" %}
  {% for c in sorted %}
  <a class="case-card" href="{{ c.url | relative_url }}" data-platforms="{{ c.platforms | join: ' ' }}">
    <div class="row">
      <div>
        <div class="kicker">Case {{ c.number | prepend: '00' | slice: -3, 3 }} · fix difficulty: {{ c.difficulty }}{% if c.todo %}<span class="card-todo">TODO</span>{% endif %}</div>
        <h3>{{ c.title }}</h3>
      </div>
      {% if c.oneoff %}<div class="card-metric proof-metric">PROOF<small>the anchor case</small></div>{% elsif c.micro %}<div class="card-metric proof-metric">MICRO<small>{{ c.micro_line }}</small></div>{% else %}<div class="card-metric">{{ c.lifetimes.low }}<small>lifetimes / yr, at least</small></div>{% endif %}
    </div>
    <p class="tagline">{{ c.tagline }}</p>
    {% if c.platforms %}<div class="platform-tags">{% for p in c.platforms %}<span class="pill plat-{{ p | downcase }}">{{ p }}</span>{% endfor %}</div>{% endif %}
  </a>
  {% endfor %}
</div>

<section class="submit-cta">
  <h2>Send us your example</h2>
  <p>Something on a screen wasted your time today. A button that does nothing. A form that
  wipes what you typed. A warning you have to click every single time. If it does that to
  millions of people, it belongs here.</p>
  <ol>
    <li><strong>Say what went wrong</strong> — one sentence, the way you would tell a friend.</li>
    <li><strong>Guess the numbers</strong> — how many people, how often, how many seconds
    each time. Guess low. Round numbers are fine.</li>
    <li><strong>Say who could fix it</strong>, and whether it looks easy or hard.</li>
  </ol>
  <p>You do not need the maths. Send the example and someone else will work the numbers out.
  A real example nobody has written down is worth more than a neat sum for one we already have.</p>
  <p class="submit-actions">
    <a class="btn" href="{{ site.repo }}/issues/new" rel="noopener">Send your example</a>
    <a class="btn btn-ghost" href="{{ '/cases/013-unexplained-boilerplate-command/' | relative_url }}">See a finished one</a>
    <a class="btn btn-ghost" href="{{ '/methodology/' | relative_url }}">How we count</a>
  </p>
</section>

<script>
(function(){
  var bar=document.querySelector('.filter-bar');
  if(!bar)return;
  var cards=[].slice.call(document.querySelectorAll('.case-card'));
  bar.addEventListener('click',function(e){
    var btn=e.target.closest('[data-filter]');
    if(!btn)return;
    var f=btn.getAttribute('data-filter');
    [].slice.call(bar.querySelectorAll('[data-filter]')).forEach(function(b){b.classList.toggle('active',b===btn);});
    cards.forEach(function(c){
      var plats=(c.getAttribute('data-platforms')||'').split(' ');
      c.style.display=(f==='all'||plats.indexOf(f)>-1)?'':'none';
    });
  });
})();
</script>
