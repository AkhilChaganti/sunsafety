const API_BASE_URL = 'http://localhost:5000/api'

export async function getCurrentUvByCoords(latitude, longitude) {
  const response = await fetch(
    `${API_BASE_URL}/uv/current?lat=${latitude}&lng=${longitude}`
  )

  if (!response.ok) {
    throw new Error('Failed to fetch UV data')
  }

  return response.json()
}

export async function searchLocation(query) {
  const response = await fetch(
    `${API_BASE_URL}/location/search?query=${encodeURIComponent(query)}`
  )

  if (!response.ok) {
    throw new Error('Failed to search location')
  }

  return response.json()
}