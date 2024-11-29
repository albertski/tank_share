class CreateEquipment < ActiveRecord::Migration[7.1]
  def change
    create_table :equipment do |t|
      t.string :title
      t.string :manufacturer
      t.string :model
      t.integer :quantity
      t.references :equipmentable, polymorphic: true, null: false
      t.references :tank, null: false, foreign_key: true

      t.timestamps
    end
  end
end
