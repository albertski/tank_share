# frozen_string_literal: true

class EmailSignup < ApplicationRecord
  attr_accessor :phone_number

  validates :email, :first_name, :last_name, :agree, presence: true
  validates :email, uniqueness: true
  validates :phone_number, absence: true

  after_create :send_thank_you_email

  private

  def send_thank_you_email
    EmailSignupThankYouEmailJob.perform_later(self)
  end
end
