class CreatePalletteColors < ActiveRecord::Migration[5.1]
  def change
    create_table :pallette_colors do |t|
      t.belongs_to :color, index: true
      t.belongs_to :pallette, index: true
    end
  end
end
