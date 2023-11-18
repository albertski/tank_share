# frozen_string_literal: true

class AddProfileInfoToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :first_name, :text
    add_column :users, :last_name, :text
    add_column :users, :city, :text
    add_column :users, :province, :text
    add_column :users, :postal_code, :text
    add_column :users, :country, :text
    add_column :users, :years_tanking, :integer
    add_column :users, :level, :integer
    add_column :users, :role, :integer
  end
end
