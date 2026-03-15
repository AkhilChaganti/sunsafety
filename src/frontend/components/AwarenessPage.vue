<template>
  <section class="awareness-page">
    <h1 class="page-title">Sun Safety Awareness</h1>

    <p class="page-description">
      This section shows skin cancer statistics in Australia and explains why UV exposure should be taken seriously.
    </p>

    <div v-if="loading" class="status-box">
      Loading skin cancer statistics...
    </div>

    <div v-else-if="error" class="status-box error">
      {{ error }}
    </div>

    <div v-else class="content-block">
      <SkinCancerChart :stats="skinCancerStats" />

      <div class="insight-box">
        <h2>Why this matters</h2>
        <p>
          Australia has very high UV exposure, and repeated overexposure can damage skin cells over time.
          This increases the risk of skin cancer, including melanoma. These statistics show why regular
          sun protection is important, especially when UV levels are high.
        </p>
      </div>
    </div>
  </section>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import SkinCancerChart from './SkinCancerChart.vue'

const skinCancerStats = ref([])
const loading = ref(true)
const error = ref('')

onMounted(async () => {
  try {
    const response = await fetch('/api/awareness/skin-cancer')

    if (!response.ok) {
      throw new Error('Failed to load skin cancer statistics')
    }

    skinCancerStats.value = await response.json()
  } catch (err) {
    error.value = err.message || 'Something went wrong while loading the chart data.'
  } finally {
    loading.value = false
  }
})
</script>

<style scoped>
.awareness-page {
  max-width: 1100px;
  margin: 0 auto;
  padding: 24px 16px;
}

.page-title {
  margin-bottom: 12px;
}

.page-description {
  margin-bottom: 24px;
  line-height: 1.6;
}

.content-block {
  display: flex;
  flex-direction: column;
  gap: 24px;
}

.status-box {
  padding: 16px;
  border-radius: 12px;
  background: #f4f4f4;
}

.status-box.error {
  background: #ffe5e5;
  color: #a40000;
}

.insight-box {
  background: white;
  border-radius: 12px;
  padding: 20px;
  line-height: 1.6;
}
</style>