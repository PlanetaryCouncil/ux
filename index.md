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
  <h2>Send us a paper-cut</h2>
  <p>You already know one. The dialog that loses your work, the toggle that does nothing,
  the field that clears itself. If it wastes ten seconds for ten million people, it belongs here.</p>
  <ol>
    <li><strong>Name the failure</strong> in one sentence a stranger would recognise.</li>
    <li><strong>Do the napkin</strong> — users × how often × seconds wasted. Cite what is
    knowable, guess low on what is not, and show your range.</li>
    <li><strong>Say who can fix it</strong>, and how hard it would be.</li>
  </ol>
  <p>A case is one markdown file. If the arithmetic defeats you, open an issue with the
  observation and someone will do the napkin — a good paper-cut nobody has counted is worth
  more than a tidy calculation of one we already have.</p>
  <p class="submit-actions">
    <a class="btn" href="{{ site.repo }}/issues/new" rel="noopener">Open an issue</a>
    <a class="btn btn-ghost" href="{{ site.repo }}/blob/main/README.md" rel="noopener">Read the format</a>
    <a class="btn btn-ghost" href="{{ '/methodology/' | relative_url }}">See the rules</a>
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
