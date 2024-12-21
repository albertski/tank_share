# frozen_string_literal: true

class User < ApplicationRecord
  include Completable

  has_one_attached :avatar

  has_many :follower_relationships, class_name: 'Follow', foreign_key: 'followed_id', dependent: :destroy
  has_many :followers, through: :follower_relationships, source: :follower
  has_many :followee_relationships, class_name: 'Follow', foreign_key: 'follower_id', dependent: :destroy
  has_many :followees, through: :followee_relationships, source: :followed

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  COMPLETABLE_ATTRIBUTES = %i[first_name last_name city province postal_code country years_tanking level avatar].freeze

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

  def following?(user)
    followees.include?(user)
  end
end
