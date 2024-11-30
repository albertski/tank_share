FactoryBot.define do
  factory :light, class: 'Equipments::Light' do
    transient do
      tank { create(:tank) }
      manufacturer { 'Default Manufacturer' }
      title { 'Default Title' }
      model { 'Default Model' }
      quantity { 1 }
    end

    after(:build) do |light, evaluator|
      light.build_equipment(
        equipmentable: light,
        tank: evaluator.tank,
        manufacturer: evaluator.manufacturer,
        title: evaluator.title,
        model: evaluator.model,
        quantity: evaluator.quantity
      )
    end
  end
end
