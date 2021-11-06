import React from 'react'
import { Route, Routes } from 'react-router-dom'
import Series from './Series/Series' // series#index = Serie.all
import Serie from './Serie/Serie' // series#show = Serie.find_by(slug: params[:slug])

const App = () => {
  return (
    <Routes>
      <Route path="/" element={<Series />} />
      <Route path="/series/:slug" element={<Serie />} />
    </Routes >
  )
}

export default App