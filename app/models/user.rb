# frozen_string_literal: true

class User < ApplicationRecord
  include Completable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  COMPLETABLE_ATTRIBUTES = %i[first_name last_name city province postal_code country years_tanking level].freeze

  enum level: {
    novice: 'Novice',
    intermediate: 'Intermediate',
    advanced: 'Advanced',
    expert: 'Expert',
    master: 'Master'
  }
end
