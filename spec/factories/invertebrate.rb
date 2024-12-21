FactoryBot.define do
  factory :invertebrate, class: 'Livestocks::Invertebrate' do
    transient do
      tank { create(:tank) }
      name { 'Default Title' }
      purchase_date { 1.year.ago }
      quantity { 1 }
    end

    after(:build) do |invertebrate, evaluator|
      invertebrate.build_livestock(
        livestockable: invertebrate,
        tank: evaluator.tank,
        name: evaluator.name,
        purchase_date: evaluator.purchase_date,
        quantity: evaluator.quantity
      )
    end
  end
end
