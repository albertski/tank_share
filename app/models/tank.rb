# frozen_string_literal: true

class Tank < ApplicationRecord
  has_many_attached :images
  belongs_to :user
  has_many :tank_parameters

  measured Measured::Volume, :total_volume
  measured Measured::Volume, :display_volume
  measured Measured::Volume, :sub_volume
  measured Measured::Length, :glass_thickness

  validates :name, :description, presence: true
end
