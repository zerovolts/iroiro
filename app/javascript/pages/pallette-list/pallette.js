import React from "react"

import PalletteColor from "./pallette/pallette-color"

class Pallette extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      currentColor: null
    }

    this.focusColor = this.focusColor.bind(this)
    this.unfocusColor = this.unfocusColor.bind(this)
  }

  focusColor(hexValue) {
    //this.props.focusColor(hexValue)

    this.setState({
      currentColor: hexValue
    })
  }

  unfocusColor() {
    //this.props.unfocusColor()

    this.setState({
      currentColor: null
    })
  }

  render() {
    const palletteColors = this.props.pallette.colors.map(color =>
      <PalletteColor
        focusColor={this.focusColor}
        unfocusColor={this.unfocusColor}
        hexValue={color.hex}
        key={color.id} />
    )

    return (
      <div className="pallette-block">
        <div className="pallette-info">
          <div>{this.props.pallette.name}</div>
          <div>{this.state.currentColor}</div>
        </div>
        <div className="pallette">
          {palletteColors}
        </div>
      </div>
    )
  }
}

export default Pallette
