class CreateCoral < ActiveRecord::Migration[7.2]
  def change
    create_table :corals do |t|
      t.integer :coral_type

      t.timestamps
    end
  end
end
