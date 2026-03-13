<template>
  <header class="site-header">
    <div class="header-inner">
      <RouterLink to="/home" class="brand">
        <span class="brand-icon">☀️</span>
        <span class="brand-text">SunSafe</span>
      </RouterLink>

      <nav class="nav">
        <RouterLink to="/home" class="nav-link">
          Home
        </RouterLink>
      </nav>
    </div>
  </header>
</template>

<script setup>
</script>

<style scoped>
.site-header {
  width: 100%;
  background: #ffffff;
  border-bottom: 1px solid #e5e7eb;
}

.header-inner {
  width: min(1100px, 92%);
  margin: 0 auto;
  min-height: 74px;
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.brand {
  display: inline-flex;
  align-items: center;
  gap: 0.65rem;
  text-decoration: none;
  color: #111827;
  font-weight: 700;
  font-size: 1.1rem;
}

.brand-icon {
  font-size: 1.4rem;
}

.nav {
  display: flex;
  gap: 0.75rem;
}

.nav-link {
  text-decoration: none;
  color: #374151;
  font-weight: 600;
  padding: 0.65rem 0.9rem;
  border-radius: 10px;
}

.nav-link:hover,
.nav-link.router-link-active {
  background: #fff7ed;
  color: #c2410c;
}
</style>