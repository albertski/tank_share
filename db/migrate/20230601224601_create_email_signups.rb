# frozen_string_literal: true

class CreateEmailSignups < ActiveRecord::Migration[7.0]
  def change
    create_table :email_signups do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.boolean :agree

      t.timestamps
    end

    add_index :email_signups, :email, unique: true
  end
end
