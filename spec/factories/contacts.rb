# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact do
    first_name "Ivan"
    last_name "Sergeevich"
    mid_name "Pupkin"
    email "MyString"
    alt_email "MyString"
    phone "MyString"
    mobile "MyString"
    user_id 1
  end
end
