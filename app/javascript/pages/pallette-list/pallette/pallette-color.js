import React from "react"

const PalletteColor = ({hexValue, focusColor, unfocusColor}) => {
  const style = {
    background: hexValue
  }

  const copyHex = () => {
    const textarea = document.getElementById("clipboard")
    textarea.value = hexValue
    textarea.select()
    document.execCommand("copy")
  }

  return (
    <div
      className="pallette-color"
      style={style}
      onClick={copyHex}
      onMouseOver={() => focusColor(hexValue)}
      onMouseOut={unfocusColor}
    ><i className="fas fa-copy" opacity="0"></i></div>
  )
}

export default PalletteColor
