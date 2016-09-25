# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
    street "MyString"
    city "MyString"
    state "MyString"
    zipcode "MyString"
    country "MyString"
  end
end
