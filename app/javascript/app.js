import React from "react"

import NavBar from "./components/nav-bar"
import PalletteList from "./pages/pallette-list"

const App = props => {
  return (
    <div>
      <NavBar />
      <PalletteList />
    </div>
  )
}

export default App
