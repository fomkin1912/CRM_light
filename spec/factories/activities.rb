# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :activity do
    info              { Faker::Lorem.sentence }
    subject           { Faker::Lorem.paragraph }
    activity_type
    user
    contact
  end
end
