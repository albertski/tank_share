FactoryBot.define do
  factory :pump, class: 'Equipments::Pump' do
    transient do
      tank { create(:tank) }
      manufacturer { 'Default Manufacturer' }
      title { 'Default Title' }
      model { 'Default Model' }
      quantity { 1 }
    end

    after(:build) do |pump, evaluator|
      pump.build_equipment(
        equipmentable: pump,
        tank: evaluator.tank,
        manufacturer: evaluator.manufacturer,
        title: evaluator.title,
        model: evaluator.model,
        quantity: evaluator.quantity
      )
    end
  end
end
