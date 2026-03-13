<template>
  <section class="home-page">
    <div class="home-container">
      <header class="home-header">
        <h1 class="page-title">Live UV Alerts</h1>
        <p class="page-subtitle">
          Check the current UV level for your area and stay aware when you are outdoors.
        </p>
      </header>

      <section class="content-card">
        <p v-if="isLoading" class="status-text">
          Loading your current UV data...
        </p>

        <p v-else-if="errorMessage" class="status-text status-text--error">
          {{ errorMessage }}
        </p>

        <div v-if="uvData" class="uv-result">
          <h2 class="result-title">Current UV Result</h2>

          <p class="result-line">
            <strong>UV Index:</strong> {{ uvData.uvIndex }}
          </p>

          <p class="result-line">
            <strong>Location:</strong> {{ uvData.locationName }}
          </p>

          <p class="result-line" v-if="formattedTime">
            <strong>Updated:</strong> {{ formattedTime }}
          </p>

          <p class="result-line" v-if="uvData.timezone">
            <strong>Timezone:</strong> {{ uvData.timezone }}
          </p>

          <p class="result-line">
            <strong>Coordinates:</strong>
            {{ latitude }}, {{ longitude }}
          </p>

          <p class="refresh-note">
            This page refreshes automatically every 30 minutes.
          </p>
        </div>

        <LocationInput
          v-if="showManualLocation"
          @submit="handleManualLocationSubmit"
        />
      </section>
    </div>
  </section>
</template>

<script setup>
import { computed, onMounted, onUnmounted, ref } from 'vue'
import LocationInput from '../components/LocationInput.vue'
import { getCurrentUvByCoords, searchLocation } from '../services/uvService'

const isLoading = ref(false)
const errorMessage = ref('')
const uvData = ref(null)
const showManualLocation = ref(false)

const latitude = ref(null)
const longitude = ref(null)

let refreshTimer = null

const formattedTime = computed(() => {
  if (!uvData.value?.time) return ''

  const rawTime = uvData.value.time
  const date =
    typeof rawTime === 'number'
      ? new Date(rawTime * 1000)
      : new Date(rawTime)

  if (Number.isNaN(date.getTime())) return ''

  return new Intl.DateTimeFormat('en-AU', {
    dateStyle: 'medium',
    timeStyle: 'short',
  }).format(date)
})

async function fetchUvData() {
  if (latitude.value == null || longitude.value == null) return

  try {
    errorMessage.value = ''
    const data = await getCurrentUvByCoords(latitude.value, longitude.value)
    uvData.value = data
  } catch (error) {
    errorMessage.value = 'Could not load UV data right now.'
  }
}

function startAutoRefresh() {
  if (refreshTimer) {
    clearInterval(refreshTimer)
  }

  refreshTimer = setInterval(() => {
    fetchUvData()
  }, 30 * 60 * 1000)
}

function requestUserLocation() {
  isLoading.value = true
  errorMessage.value = ''
  uvData.value = null
  showManualLocation.value = false

  if (!navigator.geolocation) {
    isLoading.value = false
    errorMessage.value = 'Geolocation is not supported in this browser.'
    showManualLocation.value = true
    return
  }

  navigator.geolocation.getCurrentPosition(
    async (position) => {
      latitude.value = position.coords.latitude
      longitude.value = position.coords.longitude

      await fetchUvData()
      startAutoRefresh()
      isLoading.value = false
    },
    () => {
      isLoading.value = false
      errorMessage.value =
        'Location access was denied. Please enter your suburb or postcode.'
      showManualLocation.value = true
    },
    {
      enableHighAccuracy: true,
      timeout: 10000,
      maximumAge: 0,
    }
  )
}

async function handleManualLocationSubmit(value) {
  isLoading.value = true
  errorMessage.value = ''
  uvData.value = null

  try {
    const locationData = await searchLocation(value)

    latitude.value = locationData.latitude
    longitude.value = locationData.longitude

    await fetchUvData()
    startAutoRefresh()
    showManualLocation.value = false
  } catch (error) {
    errorMessage.value =
      'We could not find that suburb or postcode. Please try again.'
  } finally {
    isLoading.value = false
  }
}

onMounted(() => {
  requestUserLocation()
})

onUnmounted(() => {
  if (refreshTimer) {
    clearInterval(refreshTimer)
  }
})
</script>

<style scoped>
.home-page {
  width: 100%;
  padding: 2.5rem 0 3rem;
  background: #f8fafc;
}

.home-container {
  width: min(1100px, 92%);
  margin: 0 auto;
}

.home-header {
  margin-bottom: 1.5rem;
}

.page-title {
  margin: 0 0 0.5rem;
  font-size: 2rem;
  color: #111827;
}

.page-subtitle {
  margin: 0;
  color: #4b5563;
  line-height: 1.6;
}

.content-card {
  padding: 1.5rem;
  background: #ffffff;
  border: 1px solid #e5e7eb;
  border-radius: 16px;
  box-shadow: 0 10px 25px rgba(15, 23, 42, 0.05);
}

.status-text {
  margin: 0;
  color: #374151;
}

.status-text--error {
  color: #b91c1c;
}

.uv-result {
  display: grid;
  gap: 0.75rem;
}

.result-title {
  margin: 0 0 0.25rem;
  color: #111827;
}

.result-line {
  margin: 0;
  color: #374151;
  line-height: 1.5;
}

.refresh-note {
  margin-top: 0.5rem;
  color: #6b7280;
  font-size: 0.95rem;
}
</style>