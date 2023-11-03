FactoryBot.define do
  factory :recipe do
    name { 'French fries' }
    preparation_time { 60 }
    cooking_time { 30 }
    description { 'Just do it' }
    public { true }
  end
end
