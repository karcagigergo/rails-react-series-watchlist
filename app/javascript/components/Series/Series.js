import React, { useState, useEffect } from 'react'
import axios from 'axios'

const Series = () => {
  const [series, setSeries] = useState([])

  useEffect(() => {
    //Get all of our airlines from api
    //Update airlines in our state
    axios.get('/api/v1/series')
      .then(resp => console.log(resp))
      .catch(resp => console.log(resp))
  }, [series.lenght])

  return (
    <div>This is the Series#index view for our app!</div>
  )
}

export default Series
