class CreateHeaters < ActiveRecord::Migration[7.1]
  def change
    create_table :heaters do |t|

      t.timestamps
    end
  end
end
