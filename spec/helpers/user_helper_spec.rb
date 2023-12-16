# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserHelper, type: :helper do
  describe '#country_options' do
    subject(:countries) { helper.country_options }

    it 'returns a list of countries with full names' do
      expect(countries).to be_an(Array)
      expect(countries).not_to be_empty
      expect(countries.first).to eq(['Select a Country', nil])

      countries[1..].each do |country|
        expect(country).to be_an(Array)
        expect(country.size).to eq(2)
        expect(country[0]).to be_a(String)
        expect(country[1]).to be_a(String)
      end
    end
  end
end
