<template>
  <section class="home-page">
    <div class="home-page__inner">
      <div class="home-hero">
        <span class="home-hero__eyebrow">Welcome</span>
        <h1 class="home-hero__title">Welcome to SunSafe</h1>
        <p class="home-hero__text">
          Use SunSafe to check the current UV level, learn more about sun awareness,
          and find useful safety resources before you head outside.
        </p>

        <p class="home-hero__note">
          Choose a page below to get started.
        </p>

        <div class="home-hero__actions">
          <RouterLink to="/uv-now" class="home-button home-button--primary">
            UV Now
          </RouterLink>

          <RouterLink to="/awareness" class="home-button home-button--secondary">
            Awareness
          </RouterLink>

          <RouterLink to="/resources" class="home-button home-button--secondary">
            Resources
          </RouterLink>
        </div>
      </div>
    </div>
  </section>
</template>

<style scoped>
.home-page {
  width: 100%;
  padding: 2.5rem 0 3rem;
  background: linear-gradient(180deg, #f8f4e8 0%, #f6f0de 100%);
}

.home-page__inner {
  width: min(960px, 92%);
  margin: 0 auto;
}

.home-hero {
  padding: 2.4rem;
  border: 1px solid #e1d7c5;
  border-radius: 26px;
  background: #f5efe2;
  box-shadow: 0 14px 30px rgba(15, 23, 42, 0.07);
  text-align: center;
}

.home-hero__eyebrow {
  display: inline-block;
  margin-bottom: 0.8rem;
  padding: 0.35rem 0.75rem;
  border-radius: 999px;
  background: #fff7ed;
  color: #c2410c;
  font-size: 0.85rem;
  font-weight: 700;
  letter-spacing: 0.04em;
  text-transform: uppercase;
}

.home-hero__title {
  margin: 0;
  color: #1f1f1f;
  font-size: clamp(2.4rem, 5vw, 4.2rem);
  line-height: 1;
}

.home-hero__text {
  max-width: 56ch;
  margin: 1rem auto 0;
  color: #5b6170;
  line-height: 1.7;
  font-size: 1.05rem;
}

.home-hero__note {
  margin: 1rem 0 0;
  color: #7a6f63;
  font-size: 0.98rem;
  font-weight: 600;
}

.home-hero__actions {
  display: flex;
  gap: 0.9rem;
  justify-content: center;
  flex-wrap: wrap;
  margin-top: 1.4rem;
}

.home-button {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  min-height: 48px;
  padding: 0.8rem 1.2rem;
  border-radius: 14px;
  text-decoration: none;
  font-weight: 700;
}

.home-button--primary {
  background: #f59e0b;
  color: #ffffff;
}

.home-button--secondary {
  background: #ffffff;
  color: #374151;
  border: 1px solid #d7d7d7;
}

@media (max-width: 700px) {
  .home-hero {
    padding: 1.8rem 1.25rem;
  }
}
</style>
