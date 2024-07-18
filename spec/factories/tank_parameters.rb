FactoryBot.define do
  factory :tank_parameter do
    ph { 1.5 }
    temp { 1.5 }
    salinity { 1.5 }
    alkalinity { 1.5 }
    ammonia { 1.5 }
    nitrite { 1.5 }
    nitrate { 1.5 }
    phosphate { 1.5 }
    calcium { 1.5 }
    magnesium { 1.5 }
    date { "2024-07-18" }
    tank { nil }
  end
end
