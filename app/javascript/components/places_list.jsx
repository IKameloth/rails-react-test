import React, { useEffect, useState } from 'react'

const PlaceLists = () => {
  const [isLoading, setIsLoading] = useState(true)
  const [places, setPlaces] = useState(false)

  useEffect(() => {
    const URL = "/api/places"

    fetch(URL)
      .then(response => response.json())
      .then(data => {
        setPlaces(data.places)
        setIsLoading(false)
      })
  }, [])

  if (isLoading) {
    return (<p>Loading...</p>)
  }

  return (
    <div>
      {places && places.map(item => {
        return (
          <p>{item.name}</p>
        )
      })}
    </div>
  )
}

export default PlaceLists
