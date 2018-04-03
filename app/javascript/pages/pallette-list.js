import React from "react"

import Pallette from "./pallette-list/pallette"

class PalletteList extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      pallettes: [],
      currentColor: null
    }

    this.focusColor = this.focusColor.bind(this)
    this.unfocusColor = this.unfocusColor.bind(this)
  }

  componentDidMount() {
    this.fetchPallettes()
  }

  fetchPallettes() {
    fetch("/api/v1/pallettes")
      .then(res => res.json())
      .then(data => {
        this.setState({
          pallettes: data
        })
      })
  }

  focusColor(hexValue) {
    this.setState({
      currentColor: hexValue
    })
  }

  unfocusColor() {
    this.setState({
      currentColor: null
    })
  }

  render() {
    const pallettes = this.state.pallettes.sort((a, b) =>
      a.average_hsl.sat - b.average_hsl.sat
    )

    const palletteBlocks = pallettes.map(pallette => {
      return (
        <Pallette
          focusColor={this.focusColor}
          unfocusColor={this.unfocusColor}
          pallette={pallette}
          key={pallette.id} />
      )
    })

    return (
      <div className="pallette-page">
        <div className="pallette-page-info">
          <div>Pallettes: {palletteBlocks.length}</div>
          <div>Color: {this.state.currentColor}</div>
        </div>
        <div className="pallette-list">
          {palletteBlocks}
        </div>
      </div>
    )
  }
}

export default PalletteList
