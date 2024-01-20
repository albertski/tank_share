class CreateTanks < ActiveRecord::Migration[7.1]
  def change
    create_table :tanks do |t|
      t.string :name
      t.string :description
      t.decimal :total_volume_value, precision: 10, scale: 2
      t.string :total_volume_unit
      t.decimal :display_volume_value, precision: 10, scale: 2
      t.string :display_volume_unit
      t.decimal :sub_volume_value, precision: 10, scale: 2
      t.string :sub_volume_unit
      t.decimal :glass_thickness_value, precision: 10, scale: 2
      t.string :glass_thickness_unit
      t.timestamps
    end

    add_reference :tanks, :user, foreign_key: true
  end
end
