class Pallette < ApplicationRecord
  has_many :pallette_colors
  has_many :colors, through: :pallette_colors
  belongs_to :owner, class_name: "User"
  paginates_per 50

  def self.create_from_array(user, name, color_list)
    pallette = Pallette.create(owner: user, name: name)

    color_list.each do |color_data|
      color = Color.create(color_data: color_data)
      PalletteColor.create(pallette: pallette, color: color)
    end
  end

  def average_hsl
    hsl_list = self.colors.map {|color| color.hsl}

    {
      hue: hsl_list.reduce(0) {|acc, cur| acc + cur[:hue]},
      sat: hsl_list.reduce(0) {|acc, cur| acc + cur[:sat]},
      lum: hsl_list.reduce(0) {|acc, cur| acc + cur[:lum]}
    }
  end

  def as_json(options = {})
    super(methods: [
      :colors,
      :average_hsl
    ])
  end
end
