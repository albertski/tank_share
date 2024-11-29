class CreateLights < ActiveRecord::Migration[7.1]
  def change
    create_table :lights do |t|

      t.timestamps
    end
  end
end
