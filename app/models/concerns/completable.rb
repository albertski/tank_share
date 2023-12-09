# frozen_string_literal: true

module Completable
  extend ActiveSupport::Concern

  DEFAULT_COMPLETE_PERCENTAGE = 10

  def complete?
    complete_percentage == 100
  end

  def complete_percentage
    fields_complete.zero? ? DEFAULT_COMPLETE_PERCENTAGE : percent_complete
  end

  def incomplete_completable_attributes
    self.class::COMPLETABLE_ATTRIBUTES.select { |f| __send__(f).blank? }
  end

  private

  def fields_complete
    Float(self.class::COMPLETABLE_ATTRIBUTES.count { |f| __send__(f).present? })
  end

  def total_fields
    self.class::COMPLETABLE_ATTRIBUTES.count
  end

  def percent_complete
    (fields_complete / total_fields) * 100
  end
end
