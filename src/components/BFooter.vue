<template>
  <footer class="site-footer">
    <div class="footer-inner">
      <p class="footer-brand">☀️ SunSafe</p>

      <p class="footer-text">
        Web application for UV index monitoring and personalized sun safety recommendations.
      </p>

      <p class="footer-note">
        UV awareness and protection.
      </p>
    </div>
  </footer>
</template>

<script setup>
</script>

<style scoped>
.site-footer {
  margin-top: 3rem;
  background: #111827;
  color: #f9fafb;
}

.footer-inner {
  width: min(1100px, 92%);
  margin: 0 auto;
  padding: 1.5rem 0;
  text-align: center;
}

.footer-brand {
  margin: 0 0 0.45rem;
  font-weight: 700;
  font-size: 1rem;
}

.footer-text,
.footer-note {
  margin: 0.2rem 0;
  color: #d1d5db;
  line-height: 1.6;
}
</style>