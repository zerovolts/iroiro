class CreatePallettes < ActiveRecord::Migration[5.1]
  def change
    create_table :pallettes do |t|
      t.string :name

      t.references :owner #user
      t.timestamps
    end
  end
end
