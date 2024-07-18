class CreateTankParameters < ActiveRecord::Migration[7.1]
  def change
    create_table :tank_parameters do |t|
      t.float :ph
      t.float :temp
      t.float :salinity
      t.float :alkalinity
      t.float :ammonia
      t.float :nitrite
      t.float :nitrate
      t.float :phosphate
      t.float :calcium
      t.float :magnesium
      t.date :date
      t.references :tank, null: false, foreign_key: true

      t.timestamps
    end

    add_index :tank_parameters, [:tank_id, :date], unique: true
    add_index :tank_parameters, :date
  end
end
