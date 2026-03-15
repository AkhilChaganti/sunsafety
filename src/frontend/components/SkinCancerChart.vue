<template>
  <div class="chart-wrapper">
    <Line :data="chartData" :options="chartOptions" />
  </div>
</template>

<script setup>
import { computed } from 'vue'
import { Line } from 'vue-chartjs'
import {
  Chart as ChartJS,
  Title,
  Tooltip,
  Legend,
  LineElement,
  PointElement,
  CategoryScale,
  LinearScale
} from 'chart.js'

ChartJS.register(
  Title,
  Tooltip,
  Legend,
  LineElement,
  PointElement,
  CategoryScale,
  LinearScale
)

const props = defineProps({
  stats: {
    type: Array,
    required: true
  }
})

const chartData = computed(() => ({
  labels: props.stats.map(item => item.year),
  datasets: [
    {
      label: 'Melanoma incidence rate per 100,000',
      data: props.stats.map(item => item.age_standardised_rate),
      borderWidth: 2,
      tension: 0.3
    }
  ]
}))

const chartOptions = {
  responsive: true,
  maintainAspectRatio: false,
  plugins: {
    legend: {
      display: true
    },
    title: {
      display: true,
      text: 'Skin Cancer Statistics in Australia'
    }
  },
  scales: {
    x: {
      title: {
        display: true,
        text: 'Year'
      }
    },
    y: {
      beginAtZero: false,
      title: {
        display: true,
        text: 'Age-standardised rate per 100,000'
      }
    }
  }
}
</script>

<style scoped>
.chart-wrapper {
  width: 100%;
  height: 380px;
  background: white;
  border-radius: 12px;
  padding: 16px;
  box-sizing: border-box;
}
</style>