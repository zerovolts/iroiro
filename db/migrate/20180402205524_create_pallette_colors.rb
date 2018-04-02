class CreatePalletteColors < ActiveRecord::Migration[5.1]
  def change
    create_table :pallette_colors do |t|
      t.belongs_to :color
      t.belongs_to :pallette
      t.timestamps
    end
  end
end
