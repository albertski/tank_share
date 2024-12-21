FactoryBot.define do
  factory :fish, class: 'Livestocks::Fish' do
    transient do
      tank { create(:tank) }
      name { 'Default Title' }
      purchase_date { 1.year.ago }
      quantity { 1 }
    end

    after(:build) do |fish, evaluator|
      fish.build_livestock(
        livestockable: fish,
        tank: evaluator.tank,
        name: evaluator.name,
        purchase_date: evaluator.purchase_date,
        quantity: evaluator.quantity
      )
    end
  end
end
