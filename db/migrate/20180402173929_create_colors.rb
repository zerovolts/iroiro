class CreateColors < ActiveRecord::Migration[5.1]
  def change
    create_table :colors do |t|
      t.integer :color_data, index: true, unique: true
    end
  end
end
