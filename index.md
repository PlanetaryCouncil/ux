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
  <div class="big">~{% include num.html n=total_mid %}</div>
  <div class="cap">human lifetimes wasted every year — across {{ counted }} case{% if counted != 1 %}s{% endif %} so far</div>
  <div class="fine">Middle estimate. Full range {% include num.html n=total_lo %}–{% include num.html n=total_hi %}, because every case carries a low and a high. And we've barely started counting.</div>
</div>

{% assign PLATFORMS = "Google,Apple,Microsoft,Meta,Anthropic,OpenAI,Adobe,GitHub,Web,Linux,Apps,Telecoms,Government" | split: "," %}
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
      {% if c.oneoff %}<div class="card-metric proof-metric">PROOF<small>the anchor case</small></div>{% elsif c.micro %}<div class="card-metric proof-metric">MICRO<small>{{ c.micro_line }}</small></div>{% else %}<div class="card-metric">~{% include num.html n=c.lifetimes.headline %}<small>lifetimes / yr</small></div>{% endif %}
    </div>
    <p class="tagline">{{ c.tagline }}</p>
    {% if c.platforms %}<div class="platform-tags">{% for p in c.platforms %}<span class="pill plat-{{ p | downcase }}">{{ p }}</span>{% endfor %}</div>{% endif %}
  </a>
  {% endfor %}
</div>

{% if site.quirks.size > 0 %}
<section class="quirks-section" id="quirks">
  <h2 class="section-head">Quirks</h2>
  <p class="section-lede">Contradictions and small absurdities that don't warrant lifetime math — a page that says open <em>and</em> closed, a platform that can't agree with itself. No napkins here, just field notes. This is the backlog, built in public.</p>
  <div class="case-list">
    {% assign qsorted = site.quirks | sort: "number" %}
    {% for q in qsorted %}
    <a class="case-card quirk-card" href="{{ q.url | relative_url }}">
      <div class="row">
        <div>
          <div class="kicker">Quirk {{ q.number | prepend: '00' | slice: -3, 3 }}{% if q.vendor %} · {{ q.vendor }}{% endif %}</div>
          <h3>{{ q.title }}</h3>
        </div>
        <div class="card-metric proof-metric">QUIRK<small>no math, just facepalm</small></div>
      </div>
      <p class="tagline">{{ q.tagline }}</p>
    </a>
    {% endfor %}
  </div>
</section>
{% endif %}

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
