<template>
  <section class="info-page">
    <div class="info-page__inner">
      <div class="info-page__hero">
        <span class="info-page__eyebrow">Awareness</span>
        <h1 class="info-page__title">Know when UV becomes a real risk</h1>
        <p class="info-page__intro">
          UV can still be strong even when the day feels cool or cloudy. This page gives
          people simple reminders about when sun protection matters most.
        </p>
      </div>

      <div class="info-grid">
        <article class="info-card">
          <h2 class="info-card__title">When protection starts</h2>
          <p class="info-card__text">
            Sun protection is recommended once the UV Index reaches 3 or higher.
          </p>
        </article>

        <article class="info-card">
          <h2 class="info-card__title">Best daily habit</h2>
          <p class="info-card__text">
            Check the UV level before going out and plan shade, clothing, sunscreen, and
            sunglasses early.
          </p>
        </article>

        <article class="info-card">
          <h2 class="info-card__title">Why it matters</h2>
          <p class="info-card__text">
            Repeated UV exposure increases the risk of sunburn, early skin aging, and skin
            cancer.
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

.info-grid {
  display: grid;
  grid-template-columns: repeat(3, minmax(0, 1fr));
  gap: 1.2rem;
}

.info-card {
  padding: 1.4rem;
  border: 1px solid #e1d7c5;
  border-radius: 22px;
  background: #f5efe2;
  box-shadow: 0 12px 24px rgba(15, 23, 42, 0.06);
}

.info-card__title {
  margin: 0 0 0.7rem;
  color: #1f1f1f;
  font-size: 1.35rem;
}

.info-card__text {
  margin: 0;
  color: #4b5563;
  line-height: 1.7;
}

@media (max-width: 850px) {
  .info-grid {
    grid-template-columns: 1fr;
  }
}
</style>
