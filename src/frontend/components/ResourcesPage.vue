<template>
  <section class="info-page">
    <div class="info-page__inner">
      <div class="info-page__hero">
        <span class="info-page__eyebrow">Resources</span>
        <h1 class="info-page__title">Useful sun safety resources in one place</h1>
        <p class="info-page__intro">
          This page can hold trusted links, official guidance, and practical tips that help
          people make safer choices outdoors.
        </p>
      </div>

      <div class="resource-list">
        <article class="resource-card">
          <h2 class="resource-card__title">UV guidance</h2>
          <p class="resource-card__text">
            Add official information about UV levels, daily protection windows, and how to
            read the index.
          </p>
        </article>

        <article class="resource-card">
          <h2 class="resource-card__title">Sun protection checklist</h2>
          <p class="resource-card__text">
            Add reminders for sunscreen, protective clothing, hats, sunglasses, shade, and
            hydration.
          </p>
        </article>

        <article class="resource-card">
          <h2 class="resource-card__title">Emergency or care advice</h2>
          <p class="resource-card__text">
            Add steps for mild sunburn care and links to professional medical guidance when
            symptoms become serious.
          </p>
        </article>
      </div>
    </div>
  </section>
</template>

<style scoped>
.info-page {
  width: 100%;
  padding: 2.5rem 0 3rem;
  background: linear-gradient(180deg, #f8f4e8 0%, #f6f0de 100%);
}

.info-page__inner {
  width: min(1100px, 92%);
  margin: 0 auto;
}

.info-page__hero {
  margin-bottom: 1.5rem;
}

.info-page__eyebrow {
  display: inline-block;
  margin-bottom: 0.7rem;
  padding: 0.35rem 0.75rem;
  border-radius: 999px;
  background: #fff7ed;
  color: #c2410c;
  font-size: 0.85rem;
  font-weight: 700;
  letter-spacing: 0.04em;
  text-transform: uppercase;
}

.info-page__title {
  margin: 0;
  color: #1f1f1f;
  font-size: clamp(2rem, 4vw, 3rem);
  line-height: 1.05;
}

.info-page__intro {
  max-width: 60ch;
  margin: 0.8rem 0 0;
  color: #5b6170;
  line-height: 1.7;
  font-size: 1.05rem;
}

.resource-list {
  display: grid;
  gap: 1rem;
}

.resource-card {
  padding: 1.4rem;
  border: 1px solid #e1d7c5;
  border-radius: 22px;
  background: #f5efe2;
  box-shadow: 0 12px 24px rgba(15, 23, 42, 0.06);
}

.resource-card__title {
  margin: 0 0 0.7rem;
  color: #1f1f1f;
  font-size: 1.35rem;
}

.resource-card__text {
  margin: 0;
  color: #4b5563;
  line-height: 1.7;
}
</style>
