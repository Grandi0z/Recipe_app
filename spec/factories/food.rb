FactoryBot.define do
  factory :food do
    name { 'Beans' }
    measurement_unit { 'Kg' }
    price { 3 }
    quantity { 3 }
  end
end
