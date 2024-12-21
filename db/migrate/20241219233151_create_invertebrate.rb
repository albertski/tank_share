class CreateInvertebrate < ActiveRecord::Migration[7.2]
  def change
    create_table :invertebrates do |t|
      t.timestamps
    end
  end
end
