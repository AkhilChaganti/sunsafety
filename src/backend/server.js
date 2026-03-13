import 'dotenv/config'
import express from 'express'
import cors from 'cors'

const app = express()
const PORT = process.env.PORT || 5000
const API_KEY = process.env.OPENWEATHER_API_KEY

app.use(cors())
app.use(express.json())

app.get('/', (req, res) => {
  res.send('SunSafe backend is running')
})

app.get('/api/uv/current', async (req, res) => {
  const { lat, lng } = req.query

  if (!lat || !lng) {
    return res.status(400).json({
      message: 'Latitude and longitude are required.',
    })
  }

  if (!API_KEY) {
    return res.status(500).json({
      message: 'Missing OpenWeather API key.',
    })
  }

  try {
    const oneCallUrl =
      `https://api.openweathermap.org/data/3.0/onecall` +
      `?lat=${lat}` +
      `&lon=${lng}` +
      `&exclude=minutely,hourly,daily,alerts` +
      `&appid=${API_KEY}`

    const reverseGeoUrl =
      `http://api.openweathermap.org/geo/1.0/reverse` +
      `?lat=${lat}` +
      `&lon=${lng}` +
      `&limit=1` +
      `&appid=${API_KEY}`

    const [weatherResponse, reverseGeoResponse] = await Promise.all([
      fetch(oneCallUrl),
      fetch(reverseGeoUrl),
    ])

    if (!weatherResponse.ok) {
      const errorText = await weatherResponse.text()
      return res.status(weatherResponse.status).json({
        message: 'OpenWeather One Call request failed.',
        details: errorText,
      })
    }

    if (!reverseGeoResponse.ok) {
      const errorText = await reverseGeoResponse.text()
      return res.status(reverseGeoResponse.status).json({
        message: 'OpenWeather reverse geocoding failed.',
        details: errorText,
      })
    }

    const weatherData = await weatherResponse.json()
    const reverseGeoData = await reverseGeoResponse.json()

    const firstLocation = reverseGeoData?.[0] || {}

    return res.json({
      uvIndex: weatherData?.current?.uvi ?? 0,
      locationName: firstLocation.name || 'Current location',
      latitude: Number(lat),
      longitude: Number(lng),
      timezone: weatherData?.timezone ?? null,
      sunrise: weatherData?.current?.sunrise ?? null,
      sunset: weatherData?.current?.sunset ?? null,
      time: weatherData?.current?.dt ?? null,
    })
  } catch (error) {
    return res.status(500).json({
      message: 'Failed to fetch live UV data from OpenWeather.',
    })
  }
})

app.get('/api/location/search', async (req, res) => {
  const { query } = req.query

  if (!query) {
    return res.status(400).json({
      message: 'Location query is required.',
    })
  }

  if (!API_KEY) {
    return res.status(500).json({
      message: 'Missing OpenWeather API key.',
    })
  }

  try {
    const trimmedQuery = String(query).trim()
    const isPostcode = /^\d{4}$/.test(trimmedQuery)

    const geocodeUrl = isPostcode
      ? `http://api.openweathermap.org/geo/1.0/zip?zip=${encodeURIComponent(trimmedQuery)},AU&appid=${API_KEY}`
      : `http://api.openweathermap.org/geo/1.0/direct?q=${encodeURIComponent(trimmedQuery)},AU&limit=1&appid=${API_KEY}`

    const response = await fetch(geocodeUrl)

    if (!response.ok) {
      const errorText = await response.text()
      return res.status(response.status).json({
        message: 'OpenWeather geocoding request failed.',
        details: errorText,
      })
    }

    const data = await response.json()

    if (isPostcode) {
      return res.json({
        name: data?.name || trimmedQuery,
        latitude: data?.lat,
        longitude: data?.lon,
        country: data?.country || 'AU',
      })
    }

    const firstResult = data?.[0]

    if (!firstResult) {
      return res.status(404).json({
        message: 'No matching location found.',
      })
    }

    return res.json({
      name: firstResult.name,
      latitude: firstResult.lat,
      longitude: firstResult.lon,
      country: firstResult.country,
      state: firstResult.state || null,
    })
  } catch (error) {
    return res.status(500).json({
      message: 'Failed to search location.',
    })
  }
})

app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`)
})