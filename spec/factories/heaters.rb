FactoryBot.define do
  factory :heater, class: 'Equipments::Heater' do
    transient do
      tank { create(:tank) }
      manufacturer { 'Default Manufacturer' }
      title { 'Default Title' }
      model { 'Default Model' }
      quantity { 1 }
    end

    after(:build) do |heater, evaluator|
      heater.build_equipment(
        equipmentable: heater,
        tank: evaluator.tank,
        manufacturer: evaluator.manufacturer,
        title: evaluator.title,
        model: evaluator.model,
        quantity: evaluator.quantity
      )
    end
  end
end
