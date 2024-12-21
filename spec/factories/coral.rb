FactoryBot.define do
  factory :coral, class: 'Livestocks::Coral' do
    transient do
      tank { create(:tank) }
      name { 'Default Title' }
      purchase_date { 1.year.ago }
      quantity { 1 }
      cooral_type { :star_coral }
    end

    after(:build) do |coral, evaluator|
      coral.build_livestock(
        livestockable: coral,
        tank: evaluator.tank,
        name: evaluator.name,
        purchase_date: evaluator.purchase_date,
        quantity: evaluator.quantity
      )
    end
  end
end
