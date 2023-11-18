# frozen_string_literal: true

require 'rails_helper'

shared_examples_for 'completable' do
  let(:model) { build(described_class.to_s.underscore.to_sym) }

  before { stub_const("#{described_class}::COMPLETABLE_ATTRIBUTES", model.attributes.keys.first(3)) }

  describe '#complete?' do
    subject { model.complete? }

    context 'when all attributes have a value' do
      before { model.class::COMPLETABLE_ATTRIBUTES.each { |attribute| model.send("#{attribute}=", Faker::Lorem.word) } }

      it { expect(subject).to be_truthy }
    end

    context 'when not all attributes have a value' do
      before { model.class::COMPLETABLE_ATTRIBUTES.each { |attribute| model.send("#{attribute}=", nil) } }

      it { expect(subject).to be_falsey }
    end
  end

  describe '#complete_percentage' do
    subject { model.complete_percentage }

    context 'when all completable attributes have no values' do
      before { model.class::COMPLETABLE_ATTRIBUTES.first(2).each { |attribute| model.send("#{attribute}=", nil) } }

      it 'returns the default value of 10' do
        expect(subject).to eq(10)
      end
    end

    context 'when 2 out of 3 attributes have a value' do
      before do
        model.class::COMPLETABLE_ATTRIBUTES.first(2).each { |attribute| model.send("#{attribute}=", Faker::Lorem.word) }
      end

      it 'returns the correct percent complete' do
        expect(subject).to eq(66.66666666666666)
      end
    end

    context 'when all attributes have a value' do
      before { model.class::COMPLETABLE_ATTRIBUTES.each { |attribute| model.send("#{attribute}=", Faker::Lorem.word) } }

      it 'returns the correct percent complete' do
        expect(subject).to eq(100)
      end
    end
  end
end
