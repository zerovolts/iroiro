class CreateColors < ActiveRecord::Migration[5.1]
  def change
    create_table :colors do |t|
      t.integer :color_data, index: true, unique: true, null: false

      #auto-generated
      t.float :hue
      t.float :sat
      t.float :lum
    end
  end
end
