# frozen_string_literal: true

class User < ApplicationRecord
  include Completable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  COMPLETABLE_ATTRIBUTES = %i[first_name last_name city province postal_code country years_tanking level].freeze

  enum level: {
    novice: 0,
    intermediate: 1,
    advanced: 2,
    expert: 3,
    master: 4
  }

  enum role: {
    member: 0,
    admin: 1
  }

  has_many :tanks
end
