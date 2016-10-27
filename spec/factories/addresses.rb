# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
    street 'My street'
    city 'My city'
    state 'State of mine'
    zipcode 'zip of code'
    country "That's my country"
    addressable_id 5
    addressable_type 'user'
    user
    contact
    company
  end
end
