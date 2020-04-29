FactoryBot.define do
  factory :seat do
    seat_id { "MyString" }
    row { "MyString" }
    column { 1 }
    status { "MyString" }
    closest { 2 }
    association :venue 
  end
end
