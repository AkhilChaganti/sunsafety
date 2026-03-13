<template>
  <div class="app-shell">
    <BHeader />

    <main class="main-content">
      <router-view />
    </main>

    <BFooter />
  </div>
</template>

<script setup>
import BHeader from './components/BHeader.vue'
import BFooter from './components/BFooter.vue'
</script>

<style scoped>
.app-shell {
  min-height: 100vh;
  display: flex;
  flex-direction: column;
  background: #f8fafc;
}

.main-content {
  flex: 1;
  width: 100%;
}
</style>