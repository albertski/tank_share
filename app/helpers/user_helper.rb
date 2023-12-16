# frozen_string_literal: true

module UserHelper
  def country_options
    ISO3166::Country.all.first
    countries = ISO3166::Country.all.map { |country| [country.common_name, country.common_name] }
    countries.unshift(['Select a Country', nil])
    countries
  end

  def level_options
    levels = User.levels.map { |key, _| [key.titleize, key] }
    levels.unshift(['Select a level', nil])
    levels
  end
end
