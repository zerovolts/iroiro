class Color < ApplicationRecord

  def self.to_rgb(data)
    {
      red: (data >> 16) & 255,
      green: (data >> 8) & 255,
      blue: data & 255
    }
  end

  def self.to_data(red, green, blue)
    ((red & 255) << 16) + ((green & 255) << 8) + (blue & 255)
  end

  def self.create_rgb(red, green, blue)
    Color.create(color_data: Color.to_data(red, green, blue))
  end

  def normalized
    colors = self.rgb

    {
      red: colors[:red] / 255.0,
      green: colors[:green] / 255.0,
      blue: colors[:blue] / 255.0
    }
  end

  def rgb
    Color.to_rgb(self.color_data)
  end

  def ratio
    colors = self.rgb
    total = (colors[:red] + colors[:green] + colors[:blue]).to_f

    {
      red: colors[:red] / total,
      green: colors[:green] / total,
      blue: colors[:blue] / total
    }
  end

  def hex
    "#" + self.color_data.to_s(16)
  end

  def hsl
    colors = self.normalized
    color_array = [colors[:red], colors[:green], colors[:blue]]
    max = color_array.max
    min = color_array.min
    delta = max - min

    lum = (max + min) / 2.0

    if (delta == 0) # the color is some shade of pure gray (white/black)
      hue = 0
      sat = 0
    else
      sat = (lum < 0.5) ? delta / (max + min) : delta / (2 - max - min)

      hue = case delta
      when colors[:red]
        (colors[:green] - colors[:blue]) / delta + (colors[:green] < colors[:blue] ? 6 : 0)
      when colors[:green]
        (colors[:blue] - colors[:red]) / delta + 2
      when colors[:blue]
        (colors[:red] - colors[:green]) / delta + 4
      end

      if (hue < 0) then hue += 1 end
      if (hue > 1) then hue -= 1 end
    end

    {hue: hue, sat: sat, lum: lum}
  end

  def as_json(options = {})
    super(methods: [
      :hex,
      :rgb,
      :hsl,
      :ratio
    ])
  end
end
