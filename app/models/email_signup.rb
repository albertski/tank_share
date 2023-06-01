# frozen_string_literal: true

class EmailSignup < ApplicationRecord
  attr_accessor :phone_number

  validates :email, :first_name, :last_name, presence: true
  validates :phone_number, absence: true
end
