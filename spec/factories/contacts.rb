# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact do
    first_name { generate(:first_name) }
    last_name  { generate(:last_name) }
    mid_name   { generate(:mid_name) }
    alt_email  { generate(:email) }
    email      { generate(:email) }
    user_id 1
    company_id 4
  end
end
