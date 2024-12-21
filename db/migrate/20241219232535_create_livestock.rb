class CreateLivestock < ActiveRecord::Migration[7.2]
  def change
    create_table :livestocks do |t|
      t.string :name
      t.date :purchase_date
      t.integer :quantity
      t.references :livestockable, polymorphic: true, null: false
      t.references :tank, null: false, foreign_key: true

      t.timestamps
    end
  end
end
