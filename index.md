---
layout: default
title: Lifetimes saved
---

<section class="hero">
  <h1>Fixing civilisation,<br><span class="accent">one small problem at a time.</span></h1>
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
  <h2>It only takes one minute</h2>
  <p class="submit-lede">Something on a screen wasted your time today. A button that does
  nothing. A form that wipes what you typed. A warning you click every single time. If it
  does that to millions of people, we want to hear about it.</p>
  <p class="submit-actions">
    <a class="btn" href="{{ site.contact.github }}" rel="noopener">GitHub</a>
    {% if site.contact.telegram and site.contact.telegram != "" %}<a class="btn" href="{{ site.contact.telegram }}" rel="noopener">Telegram</a>{% endif %}
    {% if site.contact.twitter and site.contact.twitter != "" %}<a class="btn" href="{{ site.contact.twitter }}" rel="noopener">Twitter</a>{% endif %}
    {% if site.contact.email and site.contact.email != "" %}<a class="btn" href="mailto:{{ site.contact.email }}?subject=Wasted%20my%20time">Email</a>{% endif %}
  </p>
  <p class="submit-foot">Tell us what went wrong in a sentence or two. We work out the
  numbers.</p>
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
